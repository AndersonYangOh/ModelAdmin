<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
    String path1 = request.getContextPath();
    String basePath1 = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort() + path1 + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>模型信息查看</title>
<base href="<%=basePath1 %>" />
<!--[if lt IE 9]>
<script src="http://apps.bdimg.com/libs/html5shiv/3.7/html5shiv.min.js"></script>
<![endif]-->
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/general.css">
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/core.css">
    <link rel="stylesheet" href="js/kkpager/kkpager_blue.css">
    <link rel="stylesheet" href="js/zTree_v3/css/zTreeStyle/zTreeStyle.css">
    <link rel="stylesheet" href="js/jbox/jbox.css">
    <link rel="stylesheet" href="js/jquery-ui-1.12.1.custom/jquery-ui.css">
    <link rel="stylesheet" href="js/select2.css">
    <script type="text/javascript" src="js/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="js/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
    <script type="text/javascript" src="js/validate/jquery.validate.min.js"></script>
    <script type="text/javascript" src="js/validate/additional-methods.min.js"></script>
    <script type="text/javascript" src="js/validate/messages_zh.js"></script>
    <script type="text/javascript" src="js/kkpager/kkpager.min.js"></script>
    <script type="text/javascript" src="js/modal/bootstrap-modal.js"></script>
    <script type="text/javascript" src="js/modal/bootstrap-modalmanager.js"></script>
    <script type="text/javascript" src="js/zTree_v3/js/jquery.ztree.core-3.5.js"></script>
    <script type="text/javascript" src="resources/js/organize/managerOrganize.js"></script>
    <script type="text/javascript" src="resources/easyui13/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="resources/easyui13/locale/easyui-lang-en.js"></script>
    <script type="text/javascript" src="resources/artDialog4.1.7/jquery.artDialog.js?skin=chrome"></script>
    <script type="text/javascript" src="js/jbox/jquery.jBox-2.3.min.js"></script>
    <script type="text/javascript" src="js/jbox/jquery.jbox-zh-cn.js"></script>
    <script type="text/javascript" src="js/select2.js"></script>

    <!--[if IE 6]>
<script type="text/javascript" src="Lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('.pngfix,.icon');</script>
<![endif]-->
<script type="text/javascript">
$(function() {
	$("#tag").select2({	
		
	});
	getSelect();
	$("#tag").attr("disabled","disabled");
	$("#state").attr("disabled","disabled");
	$("#province").attr("disabled","disabled");
	$("#period").attr("disabled","disabled");
});
function getSelect(){
	$.ajax({
        url : "model/getSelect.do",
        type : "post",
        success :function (data) {
        	setSelect(data);
        }
    });
}
function setSelect(data){
	$("#tag").empty();
	for(var i=0;i<data.items.length;i++){
		$("#tag").append("<option value=" + data.items[i].id + ">" + data.items[i].name + "</option>"); 
	}
	getModelInfo();
}
function getModelInfo() {
	var modelId=$.trim($("#id").val());
	$.ajax({
        url : "model/getModelProvinceInfo.do",
        type : 'post',
        data :{"modelId" : modelId},
        success :function (data) {
            var html ="";
            var list=data.result;
            $("#name").val(list.modelInfo.name);
            $("#scene").val(list.modelInfo.scene);
            $("#thinking").val(list.modelInfo.thinking);
            $("#input").val(list.modelInfo.input);
            $("#output").val(list.modelInfo.output);
            $("#advice").val(list.modelInfo.advice);
            $("#province").val(list.modelInfo.province);
            $("#period").val(list.modelInfo.period);
            $("#datepicker").val(list.modelInfo.date);
            $("#author").val(list.modelInfo.author);
            $("#contact").val(list.modelInfo.contact);
            $("#state").val(list.modelInfo.state);
            var arr = list.modelInfo.tag.split(",");
            $("#tag").val(arr).trigger("change");
        },
        error : function () {
        	$.jBox.error("查询出现错误","提示");
        }
    });
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
<body style="width:100%;height:100%;overflow-y:auto">

	<div class="u-body u-body-phone">
		<div class="u-title">
			<span>模型详情</span>
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
		<div class="data d2">
			<form>
				<div class="biaodan">
					<label class="name n1" for="">模型id：</label>
					<input type="text" class="b-input-text" id="id" name="id" readonly="readonly" value="${modelId}"/> 
				</div>
				<div class="biaodan">
					<label class="name n1" for="">省分：</label>
					<select class="u-input-text" name="province" id="province"  style="width:150px">
						<option value="001">总部</option>
						<option value="010">内蒙古</option>
						<option value="011">北京</option>
						<option value="013">天津</option>
						<option value="017">山东</option>
						<option value="018">河北</option>
						<option value="019">山西</option>
						<option value="030">安徽</option>
						<option value="031">上海</option>
						<option value="034">江苏</option>
						<option value="036">浙江</option>
						<option value="038">福建</option>
						<option value="050">海南</option>
						<option value="051">广东</option>
						<option value="059">广西</option>
						<option value="070">青海</option>
						<option value="071">湖北</option>
						<option value="074">湖南</option>
						<option value="075">江西</option>
						<option value="076">河南</option>
						<option value="079">西藏</option>
						<option value="081">四川</option>
						<option value="083">重庆</option>
						<option value="084">陕西</option>
						<option value="085">贵州</option>
						<option value="086">云南</option>
						<option value="087">甘肃</option>
						<option value="088">宁夏</option>
						<option value="089">新疆</option>
						<option value="090">吉林</option>
						<option value="091">辽宁</option>
						<option value="097">黑龙江</option>
					</select>
				</div>
				<div class="biaodan">
					<label class="name n1" for="">模型名称：</label>
					<input type="text" class="b-input-text" id="name" name="name" readonly="readonly"/> 
					<span id="nameTip" style="color: red; display: none">模型名称不能为空</span>
				</div>
				<div class="biaodan">
					<label class="name n2 n1" for="">模型场景：</label>
					<div class="b-input-text b2">
						<textarea class="form-control" name="scene" id="scene" readonly="readonly"></textarea>
					</div>
				</div>
				<div class="biaodan">
					<label class="name n2 n1" for="">模型思路：</label>
					<div class="b-input-text b2">
						<textarea class="form-control" name="thinking" id="thinking" readonly="readonly"></textarea>
					</div>
				</div>
				<div class="biaodan">
					<label class="name n2 n1" for="">模型输入：</label>
					<div class="b-input-text b2">
						<textarea class="form-control" name="input" id="input" readonly="readonly"></textarea>
					</div>
				</div>
				<div class="biaodan">
					<label class="name n2 n1" for="">模型输出：</label>
					<div class="b-input-text b2">
						<textarea class="form-control" name="output" id="output" readonly="readonly"></textarea>
					</div>
				</div>
				<div class="biaodan">
					<label class="name n1" for="">模型状态：</label>
					<select class="b-input-text" name="state" id="state" >
						<option value="1">开发中</option>
						<option value="2">模型验证未投产</option>
						<option value="3">已投产,模型数据集中生产中</option>
						<option value="4">已投产,模型下发省分自行生产</option>
						<option value="5">模型静默中</option>
					</select>
				</div>
				<div class="biaodan">
					<label class="name n1" for="">模型标签：</label>
					<select class="b-input-text" name="states[]" id="tag" multiple="multiple" style="height:60px;background:#93a0b2">
					</select>
				</div>
				<div class="biaodan">
					<label class="name n2 n1" for="">营销建议：</label>
					<div class="b-input-text b2">
						<textarea class="form-control" name="advice" id="advice" readonly="readonly"></textarea>
					</div>
				</div>
				<div class="biaodan">
					<label class="name n1" for="">下发周期：</label>
					<select class="b-input-text" name="period" id="period" style="width:150px">
						<option value="1">一周</option>
						<option value="2">一月</option>
					</select>
				</div>
				<div class="biaodan">
					<label class="name n1" for="">下发日期：</label>
					<input type="text" class="b-input-text" id="datepicker" name="datepicker" readonly="readonly" style="width:142px"/>
				</div>
				<div class="button-box-v">
					<a class="button quxiao quxiao-3" onclick="javascript:history.go(-1);">返回</a>
				</div>
			</form>
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