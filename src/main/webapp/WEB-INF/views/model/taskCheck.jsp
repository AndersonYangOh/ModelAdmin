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
<title>新增模型</title>
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
$(function() {
	getTaskInfo();
});
function getTaskInfo() {
	var modelId=$.trim($("#id").val());
	var province=$.trim($("#province").val());
	$.ajax({
        url : "model/getTaskInfo.do",
        type : 'post',
        data :{"modelId" : modelId,
                "province" : province},
        success :function (data) {
            var html ="";
            var list=data.result;
            debugger
            $("#name").val(list.modelInfo.name);
           // $("#scene").val(list.modelInfo.scene);
            //$("#thinking").val(list.modelInfo.thinking);
          //  $("#input").val(list.modelInfo.input);
          //  $("#output").val(list.modelInfo.output);
          //  $("#advice").val(list.modelInfo.advice);
          //  $("#period").val(list.modelInfo.period);
          //  $('#period').attr("disabled",true);
           // var time=FormatDate(list.modelInfo.createDate);
          //  $("#datepicker").val(time);
          //  $("#author").val(list.modelInfo.author);
          //  $("#contact").val(list.modelInfo.contact);
          //  $("#inuse").val(list.taskInfo.inuse);
            $("#taskId").val(list.taskInfo.taskId);
            $("#provinceName").val(list.taskInfo.provinceName);
            $("#sendMonth").val(list.taskInfo.sendMonth+"月");
            $("#sendNum").val(list.taskInfo.sendNum);
            $("#id1").val(list.taskInfo.id);
            $("#taskScene").val(list.taskInfo.taskScene);
            $("#result").val(list.taskInfo.result);
            if(list.taskInfo.lc4==1){
            	$("#lc").removeClass("ystep-step-undone").addClass("ystep-step-done");
            	document.getElementById("lc2").style.width="100%";
            }
        },
        error : function () {
        	$.jBox.error("查询出现错误","提示");
        }
    });
}
//保存用户
function save(type) {
    var modelId=$("#id").val();
    debugger
    var id=$("#id1").val();
    //var inuse=$("#inuse").val();
    var taskScene=$("#taskScene").val();
    var result=$("#result").val();
    var type = "update";
    $.ajax({
        url : "model/saveTask.do",
        type : "post",
        data : {"modelId": modelId,
                "id" : id,
                "type" : type,
                "taskScene" : taskScene,
                "result" : result
            },
        success : function (data) {
            if(data.flag==true){
            	$.jBox.tip("修改工作状态成功","success");
                setTimeout("window.location.href='model/toTaskList.do'",3000);
            }else {
                $.jBox.error("修改工作状态失败", '提示');
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
			<span>新增模型</span>
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

		<div class="u-data-menu">
			<div class="data">
				<div class="user-form">
					<form>
						<div class="stepCont stepCont2" style="overflow: hidden;">
							<!-- <div class="ystep"></div> -->
							<div class="ystep-container ystep-lg ystep-blue"
								style="left: 31.5px;">
								<ul class="ystep-container-steps">
									<li class="ystep-step-done"
										style="width: 40px; margin-right: 93.2px;">流程发起</li>
									<li class="ystep-step-done"
										style="width: 40px; margin-right: 93.2px;">集团下发模型</li>
									<li class="ystep-step-done"
										style="width: 40px; margin-right: 93.2px;">录入模型信息</li>
									<li class="ystep-step-done"
										style="width: 40px; margin-right: 93.2px;">省分下发模型</li>
									<li class="ystep-step-undone" id="lc"
										style="width: 40px; margin-right: 93.2px;">省分反馈</li>
								</ul>
								<div class="ystep-progress" style="width: 532.8px;">
									<p class="ystep-progress-bar" style="width: 532.8px;">
										<span class="ystep-progress-highlight" id="lc2" style="width: 75%;"></span>
									</p>
								</div>
							</div>
						</div>
						<div class="biaodan">
							<label class="name" for="">模型id：</label>
							<div class="box">
								<input type="text" class="b-input-text" id="id" name="id" readonly="readonly" value="${modelId}"/> 
							</div>
						</div>
						<div class="biaodan b2">
							<label class="name" for="">模型名称：</label>
							<div class="box">
								<input type="text" class="b-input-text" id="name" name="name" readonly="readonly"/> 
							</div>
						</div>
						<div class="biaodan">
							<label class="name n1" for="">ftp ip地址：</label>
							<input type="text" class="b-input-text" id="ftp" name="ftp" readonly="readonly" value="${ftp}"/> 
						</div>
						<div class="biaodan">
							<label class="name n1" for="">文件名称：</label>
							<input type="text" class="b-input-text" id="fileName" name="fileName" readonly="readonly" value="${fileName}"/> 
						</div>
						<div class="biaodan">
							<label class="name n1" for="">文件路径：</label>
							<input type="text" class="b-input-text" id="filePath" name="filePath" readonly="readonly" value="${filePath}"/> 
						</div>
						<div class="biaodan b2">
							<label class="name" for="">作业ID：</label>
							<div class="box">
								<input type="text" class="form-control" name="taskId" id="taskId" readonly="readonly"></input>
								<input type="hidden" class="b-input-text" id="id1" name="id1" value="${id}"/> 
							</div>
						</div>
						<div class="biaodan b2">
							<label class="name" for="">下发省份：</label>
							<div class="box">
								<input type="text" class="form-control" name="provinceName" id="provinceName" readonly="readonly"></input>
								<input type="hidden" class="b-input-text" id="province" name="province" value="${province}"/>
							</div>
						</div>
						<div class="biaodan b2">
							<label class="name" for="">下发月份：</label>
							<div class="box">
								<input type="text" class="form-control" name="sendMonth" id="sendMonth" readonly="readonly"></input>
							</div>
						</div>
						<div class="biaodan b2">
							<label class="name" for="">下发数量：</label>
							<div class="box">
								<input type="text" class="form-control" name="sendNum" id="sendNum" readonly="readonly"></input>
							</div>
						</div>
						<!--  <div class="biaodan b2">
							<label class="name" for="">模型场景：</label>
							<div class="box">
								<textarea class="form-control" name="scene" id="scene" readonly="readonly"></textarea>
							</div>
						</div>
						<div class="biaodan b2">
							<label class="name" for="">模型思路：</label>
							<div class="box">
								<textarea class="form-control" name="thinking" id="thinking" readonly="readonly"></textarea>
							</div>
						</div>
						<div class="biaodan b2">
							<label class="name" for="">模型输入：</label>
							<div class="box">
								<textarea class="form-control" name="input" id="input" readonly="readonly"></textarea>
							</div>
						</div>
						<div class="biaodan b2">
							<label class="name" for="">模型输出：</label>
							<div class="box">
								<textarea class="form-control" name="output" id="output" readonly="readonly"></textarea>
							</div>
						</div>
						<div class="biaodan b2">
							<label class="name" for="">营销建议：</label>
							<div class="box">
								<textarea class="form-control" name="advice" id="advice" readonly="readonly"></textarea>
							</div>
						</div>
						<div class="biaodan b2">
							<label class="name" for="">下发周期：</label>
							<div class="box">
								<select class="u-input-text" name="period" id="period">
									<option value="1">一周</option>
									<option value="2">一月</option>
									<option value="3">一年</option>
								</select>
							</div>
						</div>
						<div class="biaodan b2">
							<label class="name" for="">下发日期：</label>
							<div class="box">
								<input type="text" class="b-input-text" id="datepicker" name="datepicker" readonly="readonly"/>
							</div>
						</div>
						<div class="biaodan b2">
							<label class="name" for="">发布者：</label>
							<div class="box">
								<input type="text" class="b-input-text" id="author" name="author" readonly="readonly"/>
							</div>
						</div>
						<div class="biaodan b2">
							<label class="name" for="">联系发布者：</label>
							<div class="box">
								<input type="text" class="b-input-text" id="contact" name="contact" readonly="readonly"/>
							</div>
						</div>
						<div class="biaodan b2">
							<label class="name" for="">是否使用模型：</label>
							<div class="box">
								<select class="u-input-text" name="inuse" id="inuse">
									<option value="0">否</option>
									<option value="1">是</option>
								</select>
							</div>
						</div>-->
						<div class="biaodan b2">
							<label class="name" for="">作业应用场景：</label>
							<div class="box">
								<textarea class="form-control" name="taskScene" id="taskScene"></textarea>
							</div>
						</div>
						<div class="biaodan b2">
							<label class="name" for="">作业使用效果：</label>
							<div class="box">
								<textarea class="form-control" name="result" id="result"></textarea>
							</div>
						</div>
						<div class="button-box button-box-2">
							<a class="button quxiao quxiao-3" onclick="javascript:history.go(-1);">取消</a>
						</div>
					</form>
				</div>
			</div>
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