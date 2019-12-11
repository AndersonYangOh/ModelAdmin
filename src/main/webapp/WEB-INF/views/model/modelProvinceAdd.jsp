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
// 	  $( "#datepicker" ).datepicker({
// 		    dateFormat: 'yy-mm-dd'
// 	  });
	  setSelect2();
});
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
function validateMessage() {
    var name=$("#name").val().trim();//账号
    if (null==name || ""== name){
        $("#nameTip").show();
        return false;
    }else{
        $("#nameTip").hide();
    }
}
//保存用户
function save(type) {
    var temp=validateMessage();
    if(temp==false){
        return;
    }
    var temp=[];
    $('.btn-wrap .btn').each(function (index) {
        temp.push($(this).attr('data-value'));
    })
    var name=$("#name").val();
    var scene=$("#scene").val();
    var thinking=$("#thinking").val();
    var input=$("#input").val();
    var output=$("#output").val();
    var advice=$("#advice").val();
    var period=$("#period").val();
    var createDate=$("#datepicker").val();
    var state=$("#state").val();
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
        url : "model/saveModelProvince.do",
        type : "post",
        data : {"name": name,
                "scene" : scene,
                "thinking" : thinking,
                "input" : input,
                "output" : output,
                "advice" : advice,
                "period" : period,
                "state" : state,
                "type" : type,
                "createDate" : createDate,
              	"tagList" : tagList
            },
        success : function (data) {
            if(data.flag==true){
            	$.jBox.tip("添加模型成功","success");
                setTimeout("window.location.href='model/toProvinceModelList.do'",3000);
            }else {
                $.jBox.error("添加模型失败", '提示');
                return false;
            }
        },
        error : function () {
            return false;
        }
    });
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
		<div class="data d2">
			<form>
				<div class="biaodan">
					<label class="name" for="">模型名称：</label>
					<input type="text" class="b-input-text" id="name" name="name" onblur="validateMessage()" /> 
					<span id="nameTip" style="color: red; display: none">模型名称不能为空</span>
				</div>
				<div class="biaodan">
					<label class="name n2" for="">模型场景：</label>
					<div class="b-input-text b2">
						<textarea name="scene" id="scene"></textarea>
					</div>
				</div>
				<div class="biaodan b2">
					<label class="name n2" for="">模型思路：</label>
					<div class="b-input-text b2">
						<textarea name="thinking" id="thinking"></textarea>
					</div>
				</div>
				<div class="biaodan">
					<label class="name n2" for="">模型输入：</label>
					<div class="b-input-text b2">
						<textarea name="input" id="input"></textarea>
					</div>
				</div>
				<div class="biaodan">
					<label class="name n2" for="">模型输出：</label>
					<div class="b-input-text b2">
						<textarea name="output" id="output"></textarea>
					</div>
				</div>
				<div class="biaodan">
					<label class="name" for="">模型状态：</label>
					<select class="b-input-text" name="state" id="state">
						<option value="1">开发中</option>
						<option value="2">模型验证未投产</option>
						<option value="3">已投产,模型数据集中生产中</option>
						<option value="4">已投产,模型下发省分自行生产</option>
						<option value="5">模型静默中</option>
					</select>
				</div>
				<div class="biaodan">
					<label class="name" for="">模型标签：</label>
					<select class="b-input-text" name="states[]" id="tag" multiple="multiple" style="height:60px;background:#93a0b2">
					</select>
				</div>
				<div class="biaodan">
					<label class="name n2" for="">营销建议：</label>
					<div class="b-input-text b2">
						<textarea name="advice" id="advice"></textarea>
					</div>
				</div>
				<div class="biaodan">
					<label class="name" for="">下发周期：</label>
					<select class="b-input-text" name="period" id="period" style="width:150px">
						<option value="1">一周</option>
						<option value="2">一月</option>
					</select>
				</div>
				<div class="biaodan">
					<label class="name" for="">下发日期：</label>
					<input type="text" class="b-input-text" id="datepicker" name="datepicker" style="width:142px"/>
				</div>
				<div class="button-box-v">
					<a class="button baocun baocun" onclick="save(0)">保存为草稿</a>
					<a class="button baocun baocun-3" onclick="save(1)">正式提交</a>
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