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
<title>模型列表查看</title>
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
<link rel="stylesheet" href="js/select2.css">
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
<script type="text/javascript" src="js/select2.js"></script>


<!--[if IE 6]>
<script type="text/javascript" src="Lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('.pngfix,.icon');</script>
<![endif]-->
<script type="text/javascript">
var totalPage;
var totalRecords;
var pageNo = 1;
var tagMember = null; 
$(function(){
	getSelect();
	setSelect2();
	getModelList();
});
function getSelect(){
	$.ajax({
        url : "model/getSelect.do",
        type : "post",
        success :function (data) {
        	tagMember=data.items;
        }
    });
}
function setSelect2(){
	function formatRepo(repo) {    
        if (repo.loading) return repo.text;    
        var markup = "<div>" + repo.name + "</div>";    
        return markup;    
    } 
	$("#tag").select2({
		data : {},
			ajax: {    
                url : "model/getSelect.do",    
                dataType : 'json',
                delay : 250,    
                data : function (params) {    
                    return {    
                    	keyword : params.term
                    };    
                },    
                processResults : function (data, params) {
                    return {    
                        results : data.items
                    };    
                },    
                cache : true
            },
	        escapeMarkup : function (markup) { return markup; },   
	        minimumInputLength: 0,
	        maximumInputLength:100,
	        templateResult: formatRepo,    
	        templateSelection: formatRepo
        });
}
function getModelList() {
	var name=$.trim($("#name").val());
	var status=$.trim($("#status").val());
	var state=$.trim($("#state").val());
	var draft=$.trim($("#draft").val());
	var tagKeys = $("#tag").select2("data");
    var tagList = "";
    
    for (var i in tagKeys) {
    	tagList+=tagKeys[i].id;
    	tagList+=",";
	}
    if(tagList.substr(tagList.length-1,1)==","){
    	tagList=tagList.substr(0,tagList.length-1);
	}
	$.ajax({
        url : "model/getModelList.do",
        type : 'post',
        data :{"name" : name,
                "status" : status,
                "draft" : draft,
              	"tagList" : tagList,
              	"state" : state,
                "pageNo" : pageNo},
        success :function (data) {
            var html ="";
            var list=data.objects;
            for(var i in list){
                html += "<tr>";
                html += "<td>"+list[i].id+"</td>";
                html += "<td>"+list[i].name+"</td>";
                html += "<td>"+list[i].author+"</td>";
//                 var time=FormatDate(list[i].createDate);
//                 html += "<td>"+list[i].date+"</td>";
				var tagList="";
				var arr = list[i].tag.split(",");
				for(var j = 0; j < arr.length; j++) {
					for(var a = 0; a < tagMember.length; a++) {
						if(arr[j]==tagMember[a].id){
							tagList+=tagMember[a].name;
						}
					} 
					if(j!=arr.length-1){
						tagList+=",";
					}
				} 
				html += "<td>"+tagList+"</td>";
//                 var period="";
//                 if(list[i].period==1){
//                 	period="一周";
//                 }else if(list[i].period==2){
//                 	period="一月";
//                 }else if(list[i].period==3){
//                 	period="一年";
//                 }
//                 html += "<td>"+period+"</td>";
                var state="";
                if(list[i].state==1){
                	state="开发中";
                }else if(list[i].state==2){
                	state="模型验证未投产";
                }else if(list[i].state==3){
                	state="已投产,模型数据集中生产中";
                }else if(list[i].state==4){
                	state="已投产,模型下发省分自行生产";
                }else if(list[i].state==5){
                	state="模型静默中";
                }
                html += "<td>"+state+"</td>";
                var status="";
                if(list[i].status==1){
                	status="已发布";
                }else if(list[i].status==2){
                	status="反馈完成";
                }
                html += "<td>"+status+"</td>";
                var draft="";
                if(list[i].draft==0){
                	draft="草稿";
                }else if(list[i].draft==1){
                	draft="提交完成";
                }
                html += "<td>"+draft+"</td>";
                html += '<td>'+
              	'<a class="btn btn-op" href="model/toModelCheck.do?id='+list[i].id+'" title="查看">查看</a>'+
              	//'<a class="btn btn-op" href="model/toTaskList.do?id='+list[i].id+'" title="查看进度">查看进度</a>'+
                '</td>';
                html += "</tr>";
            }
            $("#modelList").html(html);
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
function changPage(){
    pageNo = $(".curr").text()==undefined||$(".curr").text()==""?1:$(".curr").text();
    getModelList();
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
function del(id){
	if(confirm("确定要删除这条记录吗？")){
		$.ajax({
	        url : "model/del.do",
	        type : "post",
	        data : {"id":id},
	        dataType : 'json',
	        success :function (data) {
	        	if(data){
	        		getModelList();
	        	}
	        }
	    });
	}
}
//格式化时间
function FormatDate (strTime) {
    var date = new Date(strTime);
    var mon;var day;var hour;var min;
    var  temp=date.getMonth()+1;
    if(temp<10){mon="0"+temp;}else {mon=temp;}
    if(date.getDate()<10){day="0"+date.getDate();}else {day=date.getDate();}
    if(date.getHours()<10){hour="0"+date.getHours();}else {hour=date.getHours();}
    if(date.getMinutes()<10){min="0"+date.getMinutes();}else {min=date.getMinutes();}
    return date.getFullYear()+"-"+mon+"-"+day;
}
</script>

</head>

<body style="width:100%;height:100%;overflow:auto">
<div class="u-body">
	<div class="u-title">
		<span>模型列表</span>
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
		<div class="search-f">
			<div class="z-search">
				<div class="search s2">
					<label class="name n2" for="">模型名称：</label>
					<input type="text" class="u-input-text search-box box-input" name="name" id="name">
				</div>
				<div class="search s2">
					<label class="name n2" for="">反馈状态：</label>
					<select class="u-input-text search-box" name="status" id="status">
						<option value="">全部</option>
						<option value="1">已发布</option>
						<option value="2">反馈完成</option>
					</select>
				</div>
			</div>
			<div class="z-search z-top">
				<div class="search s2">
					<label class="name n2" for="">提交状态：</label>
					<select class="u-input-text search-box" name="draft" id="draft">
						<option value="">全部</option>
						<option value="0">查看草稿</option>
						<option value="1">正式提交</option>
					</select>
			</div>
				<div class="search s2">
					<label class="name n2" for="">模型状态：</label>
					<select class="u-input-text search-box" name="state" id="state">
						<option value="">请选择</option>
						<option value="1">开发中</option>
						<option value="2">模型验证未投产</option>
						<option value="3">已投产,模型数据集中生产中</option>
						<option value="4">已投产,模型下发省分自行生产</option>
						<option value="5">模型静默中</option>
					</select>
				</div>
				<div class="search s2">
					<label class="name n2" for="">模型标签：</label>
					<select class="u-input-text  search-box" name="states[]" id="tag" multiple="multiple" style="height:60px;background:#93a0b2">
					</select>
				</div>
			</div>
		</div>
		<div class="button-box-h">
			<a class="button chaxun" style="margin-top:0" onclick="getModelList()">查询</a>
		</div>
	</div>
	<div class="data d2">
		<table class="table table-bordered">
		<thead>
		<tr>
			<th>模型ID</th>
			<th>模型名称</th>
			<th>负责人</th>
			<th>模型标签</th>
			<th>模型状态</th>
			<th>反馈状态</th>
			<th>提交状态</th>
			<th colspan="3">操作</th>
		</tr>
		</thead>
		<tbody id="modelList">
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