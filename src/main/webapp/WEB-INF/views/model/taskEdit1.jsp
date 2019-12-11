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
<title>主作业修改</title>
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
    <link rel="stylesheet" href="js/jiedianjindu/css/ystep.css">
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
    <script type="text/javascript" src="js/jiedianjindu/js/setStep.js"></script>

    <!--[if IE 6]>
<script type="text/javascript" src="Lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('.pngfix,.icon');</script>
<![endif]-->
<script type="text/javascript">
var sendPro;
var id = ${id};
var province ="001";
var modelId = ${modelId};

$(function() {
	getTaskInfo(id,province,modelId);
});

function checkboxOnclick(checkbox){
	//var value = $("#inlineCheckbox0").val();
	//var value99 = $("#inlineCheckbox99").val();
	if ($("#inlineCheckbox0").prop("checked")){
		document.getElementById("otherPro").style.display="none";//隐藏
		document.getElementById("checkboxP2").style.display="none";
		sendPro = "001";
	}else if($("#inlineCheckbox99").prop("checked")){
		document.getElementById("checkboxP1").style.display="none";
		document.getElementById("otherPro").style.display="";//显示
	}else{
		document.getElementById("checkboxP1").style.display="";
		document.getElementById("checkboxP2").style.display="";
		document.getElementById("otherPro").style.display="none";//隐藏
	}
	 
}

function getTaskInfo(id,province,modelId) {
	$.ajax({
        url : "model/getTaskInfo.do",
        type : 'post',
        data :{"id" : id,"province":province,"modelId" : modelId},
        success :function (data) {
        	//debugger;
            var html ="";
            var list=data.result;
            $("#name").val(list.modelInfo.name);
            $("#modelId").val(list.modelInfo.id);
            $("#id").val(list.taskInfo.id);
            $("#taskId").val(list.taskInfo.taskId);
            $("#sendMonth").val(list.taskInfo.sendMonth+'月');
            if (list.taskInfo.province=='001'){
            	$('#inlineCheckbox0').attr('checked', true);
            	$("#001").val(list.taskInfo.sendNum);
            }else{
            	$('#inlineCheckbox99').attr('checked', true);
            	checkboxOnclick();
            	var val = list.taskInfo.province.split("|");
            	var sendNum = list.taskInfo.sendNum.split("|");
                var boxes = document.getElementsByName("checkbox");
                for(i=0;i<boxes.length;i++){
                    for(j=0;j<val.length;j++){
                        if((boxes[i].value == val[j])&&sendNum[j]!=0){
                            boxes[i].checked = true;
                            $("#"+val[j]).val(sendNum[j]);
                        }
                    }
                }
            }
           // $("#province").val(list.taskInfo.result);
          
        },
        error : function () {
        	$.jBox.error("查询出现错误","提示");
        }
    });
}
//保存用户
function save(type) {
	debugger;
	/* var options=$("#name option:selected"); 
	var modelId = options.val(); */
    var sendMonth=$("#sendMonth").val();
    var id=$("#id").val();
    var taskId=$("#taskId").val();
    var province='';
    var temp = '';
    var sendNum='';
    var a = '';
    if ($("#inlineCheckbox0").prop("checked")){
    	province = '001';
  		sendNum = document.getElementById("001").value;
	}else{
		$.each($('input:checkbox:checked'),function(){
			if ($(this).val() != '000'&&$(this).val() != '001'){
				if(typeof province == "undefined" || province == null 
				    	|| province == ""){
					 province = $(this).val();
				}else{
				     province = province + '|' +$(this).val();
				}
		 		
		   		a = document.getElementById($(this).val()).value;
	  		    if(typeof sendNum == "undefined" || sendNum == null 
	  		    		|| sendNum == ""){
	  			   sendNum = a;
	   		    }else{
	   		    	sendNum = sendNum + '|' + a;
	   		    }
		    		  
	   		 }
		   });
		  //add
		    $.each($('input:checkbox:unchecked'),function(){
		    	if ($(this).val() != '000'){
		   		    if(typeof province != "undefined" || province != null 
		   		    		|| province != ""){
		   		    	province = province + '|' +$(this).val();
		   		    }
	   		
	   		    if(typeof sendNum != "undefined" || sendNum != null 
	   		    		|| sendNum != ""){
	   			   sendNum = sendNum + '|' + 0;
	    		    }
		    		  
	   		 }
		   });
		    //end add
	}
    
    $.ajax({
        url : "model/saveTask.do",
        type : "post",
        data : {"modelId": modelId,
                "province" : province,
                "id" : id,
                "sendNum":sendNum,
                "sendMonth":sendMonth,
                "taskId" : taskId,
                "type" : "update"
            },
        success : function (data) {
            if(data.flag==true){
            	$.jBox.tip("修改作业成功","success");
                setTimeout("window.location.href='model/toTaskListC.do'",3000);
            }else {
                $.jBox.error("修改作业失败", '提示');
                return false;
            }
        },
        error : function () {
            return false;
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
			<span>修改作业</span>
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
					<label class="name">模型名称：</label> 
					<input  class="b-input-text" type="text"  name="name" readonly id="name" style="width:392px"/>
				</div>
				<div class="biaodan">
					<label class="name">模型id：</label>
					<input  class="b-input-text" type="text"  name="modelId" readonly id="modelId" style="width:392px"/>
					<input  class="b-input-text" type="hidden"  name="taskId" readonly id="taskId" style="width:392px"/>
					<input  class="b-input-text" type="hidden"  name="id" readonly id="id" style="width:392px"/>
				</div>
				<div class="biaodan">
					<label class="name">下发月份：</label> 
					<input  class="b-input-text" type="text"  name="sendMonth" readonly id="sendMonth" style="width:392px"/>
				</div>
				<style>
					.box10{margin-left:50px;width:calc(100% - 130px) ! important;width:-webkit-calc(100% - 130px) ! important;width:-moz-calc(100% - 130px) ! important;}
					.checkbox-inline{float:left;width:150px;height:30px;line-height:30px;margin:5px 0}
					.m-number input{float:left;height:30px;line-height:30px}
					.m-number .checkbox-inline p{float:left;margin-left:10px;height:30px;line-height:30px}
					.m-number{width:100%}
					.m-number li{width:100%;margin:5px 0}
					.m-number li p{display:inline-block;color:#647497}
					.text-box{background:#1d2642;width:80px;height:30px;border:1px solid #32416c;border-radius:3px}
					.m-number .text-box:nth-child(2n){margin-left:5px;}
					.m-number .text-box:nth-child(2n-1){margin-left:5px;}
					.m-number .text-box:nth-child(1){margin-left:0;}
					.checkbox-inline:nth-child(2n){margin-left:10px;}
					.checkbox-inline:nth-child(2n-1){margin-left:10px;}
				</style>
				<div class="biaodan">
					<label class="name" for="">下发省份：</label>
					<div>
						<div name="checkboxP1" id="checkboxP1" style="float:left">
							<input type="checkbox"  id="inlineCheckbox0" value="001"  onclick="checkboxOnclick(this)">
							<label class="name" for="" style="width:40px;">全国&nbsp;&nbsp;</label>
							<input class="text-box" type="text" id="001" value="" style="height:30px;width:100px;margin-right:30px;">
						</div>
						<div name="checkboxP2" id="checkboxP2" style="float:left">
							<input type="checkbox" name="checkbox" id="inlineCheckbox99" value="000"  onclick="checkboxOnclick(this)" style="height:30px">
							<label class="name" for="" style="width:40px;">分省&nbsp;&nbsp;</label>
						</div>
					</div>
				</div>
				<div name="otherPro" id="otherPro"  class="box box10" style="float:left;padding:10px;display:none">
					<ul class="m-number">
						<li>
							<label class="checkbox-inline">
								<input type="checkbox" name="checkbox" id="inlineCheckbox1" value="010">
								<p>内蒙</p>
								<input class="text-box" type="text" id="010">
							</label>
							<label class="checkbox-inline">
								<input type="checkbox"  name="checkbox" id="inlineCheckbox2" value="011">
								<p>北京</p>
								<input class="text-box" type="text" id="011">
							</label>
							<label class="checkbox-inline">
								<input type="checkbox"  name="checkbox" id="inlineCheckbox3" value="013">
								<p>天津</p>
								<input class="text-box" type="text" id="013">
							</label>
							<label class="checkbox-inline">
								<input type="checkbox" name="checkbox" id="inlineCheckbox4" value="017">
								<p>山东</p>
								<input class="text-box" type="text" id="017">
							</label>
							<label class="checkbox-inline">
								<input type="checkbox" name="checkbox" id="inlineCheckbox5" value="018">
								<p>河北</p>
								<input class="text-box" type="text" id="018">
							</label>
							<label class="checkbox-inline">
								<input type="checkbox" name="checkbox" id="inlineCheckbox6" value="019">
								<p>山西</p>
								<input class="text-box" type="text" id="019">
							</label>
							<label class="checkbox-inline">
								<input type="checkbox" name="checkbox" id="inlineCheckbox7" value="030">
								<p>安徽</p>
								<input class="text-box" type="text" id="030">
							</label>
							<label class="checkbox-inline">
								<input type="checkbox" name="checkbox" id="inlineCheckbox8" value="031">
								<p>上海</p>
								<input class="text-box" type="text" id="031">
							</label>
							<label class="checkbox-inline">
								<input type="checkbox" name="checkbox" id="inlineCheckbox9" value="034">
								<p>江苏</p>
								<input class="text-box" type="text" id="034">
							</label>
							<label class="checkbox-inline">
								<input type="checkbox" name="checkbox" id="inlineCheckbox10" value="036">
								<p>浙江</p>
								<input class="text-box" type="text" id="036">
							</label>
							<label class="checkbox-inline">
								<input type="checkbox" name="checkbox" id="inlineCheckbox11" value="038">
								<p>福建</p>
								<input class="text-box" type="text" id="038">
							</label>
							<label class="checkbox-inline">
								<input type="checkbox" name="checkbox" id="inlineCheckbox12" value="050">
								<p>海南</p>
								<input class="text-box" type="text" id="050">
							</label>
							<label class="checkbox-inline">
								<input type="checkbox" name="checkbox" id="inlineCheckbox13" value="051">
								<p>广东</p>
								<input class="text-box" type="text" id="051">
							</label>
							<label class="checkbox-inline">
								<input type="checkbox" name="checkbox" id="inlineCheckbox14" value="059">
								<p>广西</p>
								<input class="text-box" type="text" id="059">
							</label>
							<label class="checkbox-inline">
								<input type="checkbox" name="checkbox" id="inlineCheckbox15" value="070">
								<p>青海</p>
								<input class="text-box" type="text" id="070">
							</label>
							<label class="checkbox-inline">
								<input type="checkbox" name="checkbox" id="inlineCheckbox16" value="071">
								<p>湖北</p>
								<input class="text-box" type="text" id="071">
							</label>
							<label class="checkbox-inline">
								<input type="checkbox" name="checkbox" id="inlineCheckbox17" value="086">
								<p>云南</p>
								<input class="text-box" type="text" id="086">
							</label>
							<label class="checkbox-inline">
								<input type="checkbox" name="checkbox" id="inlineCheckbox18" value="075">
								<p>江西</p>
								<input class="text-box" type="text" id="075">
							</label>
							<label class="checkbox-inline">
								<input type="checkbox" name="checkbox" id="inlineCheckbox19" value="074">
								<p>湖南</p>
								<input class="text-box" type="text" id="074">
							</label>
							<label class="checkbox-inline">
								<input type="checkbox" name="checkbox" id="inlineCheckbox20" value="076">
								<p>河南</p>
								<input class="text-box" type="text" id="076">
							</label>
							<label class="checkbox-inline">
								<input type="checkbox" name="checkbox" id="inlineCheckbox21" value="085">
								<p>贵州</p>
								<input class="text-box" type="text" id="085">
							</label>
							<label class="checkbox-inline">
								<input type="checkbox" name="checkbox" id="inlineCheckbox22" value="079">
								<p>西藏</p>
								<input class="text-box" type="text" id="079">
							</label>
							<label class="checkbox-inline">
								<input type="checkbox" name="checkbox" id="inlineCheckbox23" value="081">
								<p>四川</p>
								<input class="text-box" type="text" id="081">
							</label>
							<label class="checkbox-inline">
								<input type="checkbox" name="checkbox" id="inlineCheckbox24" value="083">
								<p>重庆</p>
								<input class="text-box" type="text" id="083">
							</label>
							<label class="checkbox-inline">
								<input type="checkbox" name="checkbox" id="inlineCheckbox25" value="084">
								<p>陕西</p>
								<input class="text-box" type="text" id="084">
							</label>
							<label class="checkbox-inline">
								<input type="checkbox" name="checkbox" id="inlineCheckbox26" value="087">
								<p>甘肃</p>
								<input class="text-box" type="text" id="087">
							</label>
							<label class="checkbox-inline">
								<input type="checkbox" name="checkbox" id="inlineCheckbox27" value="088">
								<p>宁夏</p>
								<input class="text-box" type="text" id="088">
							</label>
							<label class="checkbox-inline">
								<input type="checkbox" name="checkbox" id="inlineCheckbox28" value="089">
								<p>新疆</p>
								<input class="text-box" type="text" id="089">
							</label>
							<label class="checkbox-inline">
								<input type="checkbox" name="checkbox" id="inlineCheckbox29" value="090">
								<p>吉林</p>
								<input class="text-box" type="text" id="090">
							</label>
							<label class="checkbox-inline">
								<input type="checkbox" name="checkbox" id="inlineCheckbox30" value="091">
								<p>辽宁</p>
								<input class="text-box" type="text" id="091">
							</label>
							<label class="checkbox-inline">
								<input type="checkbox" name="checkbox" id="inlineCheckbox31" value="097">
								<p>黑龙江</p>
								<input class="text-box" type="text" id="097">
							</label>
						</li>
					</ul>
				</div>
				<div class="button-box-v">
					<a class="button baocun baocun-3" onclick="save('0')">保存</a>
					<a class="button quxiao quxiao-3" onclick="javascript:history.go(-1);">取消</a>
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