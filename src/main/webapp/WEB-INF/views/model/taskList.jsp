<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path1 = request.getContextPath();
	String basePath1 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path1 + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>模型主作业列表</title>
<base href="<%=basePath1%>" />
<!--[if lt IE 9]>
<script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
<![endif]-->
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/general.css">
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/core.css">
<link rel="stylesheet" href="js/jbox/jbox.css">
<link rel="stylesheet" href="js/kkpager/kkpager_blue.css">
<script type="text/javascript" src="js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="js/validate/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/validate/additional-methods.min.js"></script>
<script type="text/javascript" src="js/validate/messages_zh.js"></script>
<script type="text/javascript" src="js/modal/bootstrap-modal.js"></script>
<script type="text/javascript" src="js/modal/bootstrap-modalmanager.js"></script>
<script type="text/javascript" src="js/jbox/jquery.jBox-2.3.min.js"></script>
<script type="text/javascript" src="js/jbox/jquery.jbox-zh-cn.js"></script>
<script type="text/javascript" src="js/jquery.form.js"></script>
<script type="text/javascript" src="js/kkpager/kkpager.min.js"></script>


<!--[if IE 6]>
<script type="text/javascript" src="Lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('.pngfix,.icon');</script>
<![endif]-->
<script type="text/javascript">
var totalPage;
var totalRecords;
var pageNo = 1;
$(function(){
	getTaskList();
});
function getTaskList() {
	var modelId=$.trim($("#id").val());
	var status=$.trim($("#status").val());
	var isChildFlag= "1";
	$.ajax({
        url : "model/getTaskList.do",
        type : 'post',
        data :{"modelId" : modelId,
                "status" : status,
                "isChildFlag" : isChildFlag,
                "isProvinceFlag" : "1",
                "pageNo" : pageNo},
        success :function (data) {
            var html ="";
            var list=data.objects;
            for(var i in list){
                html += "<tr>";
                html += "<td>"+list[i].modelId+"</td>";
                html += "<td>"+list[i].taskId+"</td>";
                var temp = FormatDate(list[i].createTime);
                var yearMon = (temp.substring(0,7)).replace('-','');
                var taskName = list[i].modelName+yearMon;
                html += "<td>"+taskName+"下发主作业</td>";
                html += "<td>"+temp+"</td>";
                if (list[i].province == '001'){
                	html += "<td>全国</td>";
                }else{
                	html += "<td>分省</td>";
                }
                if (list[i].sendNum == null){
                	html += "<td>--</td>";
                }else{
                	html += "<td>"+list[i].sendNum+"</td>";
                }
                html += "<td>"+list[i].sendMonth+"月</td>";
                html += "<td>"+status+"</td>";
                html += '<td>'+
              	'<a class="btn btn-op" href="model/toTaskDetailList.do?type=1&taskId='+list[i].taskId+'+&id='+list[i].id+'" title="查看">查看</a>'+
              	//'<a class="btn btn-op" href="model/toTaskEdit1.do?id='+list[i].id+'&province='+list[i].province+'&modelId='+list[i].modelId+'&parentId='+list[i].parentId+'" title="修改">修改</a>'+
              	//'<a class="btn btn-op" onclick="del('+list[i].parentId+','+list[i].id+')" title="删除">删除</a>'+
              	'</td>';
                html += "</tr>";
            }
            $("#taskList").html(html);
            totalPage = data.totalPage;
            totalRecords = data.totalNumber;
            pageNo = data.currentPage;
            toPage();
        },
        error : function () {
        	$.jBox.error("查询出现错误","提示");
        }
    });
}

function del(parentId,id){
	var modelId=modelId;
	var id = id;
	//var taskId=$.trim($("#id").val());
	var type = "1";
	//主作业删除 0-子作业删除
	if(confirm("确定要删除全部主作业和子作业记录吗？")){
		$.ajax({
	        url : "model/delTask.do",
	        type : "post",
	        data : {
	        	 "parentId":parentId,
	        	 "id":id,
	        	 "type":"1"
	        	},
	        dataType : 'json',
	        success :function (data) {
	        	if(data){
	        		getTaskList();
	        	}
	        }
	    });
	}
}

function changPage(){
    pageNo = $(".curr").text()==undefined||$(".curr").text()==""?1:$(".curr").text();
    getTaskList();
}
//分页
function toPage(){
    //alert("总页数"+totalPage+"-总数据"+totalRecords+"-当前页"+pageNo);
    kkpager.total = totalPage;
    kkpager.totalRecords = totalRecords;
    kkpager.pno = pageNo;
    kkpager.hasPrv = (kkpager.pno > 1)
    kkpager.hasNext = (kkpager.pno < kkpager.total);
    kkpager.generPageHtml({
        pno : pageNo,
        mode : 'click',
        total : totalPage,
        totalRecords : totalRecords,
        click : function(n){
            this.selectPage(n);
            changPage();
            return false;
        },
        getHref : function(n){
            return "javascript:void(0)";
        }
    },true);
}
//格式化时间
function FormatDate (strTime) {
    var date = new Date(strTime);
    var mon;var day;var hour;var min;var sec;
    var  temp=date.getMonth()+1;
    if(temp<10){mon="0"+temp;}else {mon=temp;}
    if(date.getDate()<10){day="0"+date.getDate();}else {day=date.getDate();}
    if(date.getHours()<10){hour="0"+date.getHours();}else {hour=date.getHours();}
    if(date.getMinutes()<10){min="0"+date.getMinutes();}else {min=date.getMinutes();}
    if(date.getSeconds()<10){sec="0"+date.getSeconds();}else {sec=date.getSeconds();}
    return date.getFullYear()+"-"+mon+"-"+day+" "+hour+":"+min+":"+sec;
}
</script>

</head>

<body style="width:100%;height:100%;overflow:auto">
<div class="u-body">
	<div class="u-title">
		<span>模型主作业管理</span>
		<div class="button-up">
		</div>
		<script>
		$(document).ready(function(){
	     // 搜索收缩
	    $(".button-up").click(function(){
	        $('.u-search').toggleClass('u-search-close');
	        $('.button-up').toggleClass('button-down');
	    });  
	  });
		</script>
	</div>
	<div class="u-search">
		<div class="search-f f-one">
			<div class="z-search">
				<div class="search">
					<label class="name n2" for="">模型id：</label>
					<input type="text" class="u-input-text search-box box-input" name="id" id="id" value="${modelId}">
				</div>
			</div>
			<!--<div class="z-search z-top">
				<div class="search">
					<label class="name n2" for="">工作状态：</label>
					<select class="u-input-text  search-box" name="status" id="status">
						<option value="">全部</option>
						<option value="0">未反馈</option>
						<option value="1">反馈完成</option>
					</select>
				</div>
			</div>  -->
		</div>
		<div class="button-box-h">
			<a class="button chaxun" style="margin-top:0" onclick="getTaskList()">查询</a>
			<!--<a class="button daochu" href="model/toTaskAdd.do">新增作业</a>  -->
		</div>
	</div>
		<div class="data d2">
			<table class="table table-bordered">
			<thead>
			<tr>
			    <th>模型ID</th>
				<th>作业ID</th>
				<th>主作业名称</th>
				<th>创建时间</th>
				<th>下发省分</th>
				<th width="300">下发数量</th>
				<th>下发月份</th>
				<!--<th>工作状态</th>-->
				<th colspan="3">操作</th>
			</tr>
			</thead>
			<tbody id="taskList">
			</tbody>
			</table>
			<div id="kkpager" class="kkpager"></div>
	</div>
</div> 
<div class="index-footer">
	<p>Copyright &copy;2018&nbsp;ChinaUnicom中国联通&nbsp;版权所有&nbsp;&nbsp;&nbsp;技术支持：中国联通研究院-大数据研究中心&nbsp;&nbsp;&nbsp;</br>
	当前在线人数：<span id="lineCount"></span>&nbsp;人&nbsp;&nbsp;&nbsp;本月总点击数：<span id="monthCount"></span>&nbsp;️次</p>
</div>   
<script>
	//统计点击数
	 getLineCount();
	  setInterval("getLineCount()", 60000);
	  function getLineCount(){
		$.ajax({
	        url : "sysLogin/lineCount.do",
	        type : 'get',
	        async:false, 
	        data :{},
	        dataType:"json",
	        success :function (result) {
	        	document.getElementById("lineCount").innerHTML = result.lineCount;
	        	document.getElementById("monthCount").innerHTML = result.monthCount;
	        },error : function () {
	        }
		});
	}
</script> 
</body>
</html>