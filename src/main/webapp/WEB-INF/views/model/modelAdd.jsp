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
var index=0;
$(function() {
// 	  $( "#datepicker" ).datepicker({
// 		    dateFormat: 'yy-mm-dd'
// 	  });
// 	  setSelect2();
	$("#tag").select2({	
		
	});
	getSelect();
	createPath();
});
function createPath(){
	var temp="";
	temp+="<tr>";
	temp+="<td style='white-space: nowrap;'>";
	temp+="<select class='u-input-text text-model' id='province"+index+"'>";
	temp+="<option value=''></option>";
	temp+="<option value='010'>内蒙古</option>";
	temp+="<option value='011'>北京</option>";
	temp+="<option value='013'>天津</option>";
	temp+="<option value='017'>山东</option>";
	temp+="<option value='018'>河北</option>";
	temp+="<option value='019'>山西</option>";
	temp+="<option value='030'>安徽</option>";
	temp+="<option value='031'>上海</option>";
	temp+="<option value='034'>江苏</option>";
	temp+="<option value='036'>浙江</option>";
	temp+="<option value='038'>福建</option>";
	temp+="<option value='050'>海南</option>";
	temp+="<option value='051'>广东</option>";
	temp+="<option value='059'>广西</option>";
	temp+="<option value='070'>青海</option>";
	temp+="<option value='071'>湖北</option>";
	temp+="<option value='074'>湖南</option>";
	temp+="<option value='075'>江西</option>";
	temp+="<option value='076'>河南</option>";
	temp+="<option value='079'>西藏</option>";
	temp+="<option value='081'>四川</option>";
	temp+="<option value='083'>重庆</option>";
	temp+="<option value='084'>陕西</option>";
	temp+="<option value='085'>贵州</option>";
	temp+="<option value='086'>云南</option>";
	temp+="<option value='087'>甘肃</option>";
	temp+="<option value='088'>宁夏</option>";
	temp+="<option value='089'>新疆</option>";
	temp+="<option value='090'>吉林</option>";
	temp+="<option value='091'>辽宁</option>";
	temp+="<option value='097'>黑龙江</option>";
	temp+="</select>";
	temp+="</td>";
	
	temp+="<td style='white-space: nowrap;'>";
	temp+="<input type='text' class='u-input-text  text-model' id='ftp"+index+"' style='width:80px' />";
	temp+="</td>";
	temp+="<td style='white-space: nowrap;'>";
	temp+="<input type='text' class='u-input-text  text-model' id='fileName"+index+"' style='width:80px' />";
	temp+="</td>";
	temp+="<td style='white-space: nowrap;'>";
	temp+="<input type='text' class='u-input-text  text-model' id='filePath"+index+"' style='width:180px' />";
	temp+="</td>";
	temp+="</tr>";
	if(index==0){
		 $("#dataList").html(temp);
	}else{
		$("#dataList").append(temp);
	}
	index++;
}
// function setSelect2(){
// 	function formatRepo(repo) {    
//         if (repo.loading) return repo.text;    
//         var markup = "<div>" + repo.name + "</div>";    
//         return markup;    
//     } 
// 	$("#tag").select2({
// 		data : {},
// 			ajax: {    
//                 url : "model/getSelect.do",    
//                 dataType : 'json',
//                 delay : 250,    
//                 data : function (params) {    
//                     return {    
//                     	keyword : params.term
//                     };    
//                 },    
//                 processResults : function (data, params) {
//                     return {    
//                         results : data.items
//                     };    
//                 },    
//                 cache : true
//             },
// 	        escapeMarkup : function (markup) { return markup; },   
// 	        minimumInputLength: 0,
// 	        maximumInputLength:100,
// 	        templateResult: formatRepo,    
// 	        templateSelection: formatRepo
//         });
// }
var items=[];
function getSelect(){
	$.ajax({
        url : "model/getSelect.do",
        type : "post",
        success :function (data) {
        	items=data.items;
        	setSelect(items);
        }
    });
}
function setSelect(data){
	$("#tag").empty();
	for(var i=0;i<data.length;i++){
		if(data[i].status!="0"){
			$("#tag").append("<option value=" + data[i].id + ">" + data[i].name + "</option>"); 
		}
	}
}
function setSelectOnChange(){
	var tagKeys = $("#tag").select2("data");
	if(tagKeys.length==1){
		if(tagKeys[0].id=="10"){
			$("#tag").empty();
			for(var i=0;i<items.length;i++){
				if(items[i].status=="2"){
					$("#tag").append("<option value=" + items[i].id + ">" + items[i].name + "</option>"); 
				}
			}
			$("#tag").removeAttr("onchange");
			var arr=[];
			arr.push(tagKeys[0].id);
			$("#tag").val(arr).trigger("change");
			$("#tag").attr("onchange","setSelectOnChange();");
		}else if(tagKeys[0].id=="1"||tagKeys[0].id=="2"||tagKeys[0].id=="3"||tagKeys[0].id=="4"){
			$("#tag").empty();
			for(var i=0;i<items.length;i++){
				if(items[i].status=="1"){
					$("#tag").append("<option value=" + items[i].id + ">" + items[i].name + "</option>"); 
				}
			}
			$("#tag").removeAttr("onchange");
			var arr=[];
			arr.push(tagKeys[0].id);
			$("#tag").val(arr).trigger("change");
			$("#tag").attr("onchange","setSelectOnChange();");
		}
	}else if(tagKeys.length==0){
		$("#tag").empty();
		for(var i=0;i<items.length;i++){
			if(items[i].status!="0"){
				$("#tag").append("<option value=" + items[i].id + ">" + items[i].name + "</option>"); 
			}
		}
	}
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
    var author=$("#author").val();
    var contact=$("#contact").val();
    var department=$("#department").val();
    var arithmetic=$("#arithmetic").val();
    var tagKeys = $("#tag").select2("data");
    var tagList = "";
    
    for (var i in tagKeys) {
    	tagList+=tagKeys[i].id;
    	tagList+=",";
	}
    if($("#logicTag").val()!=""){
    	tagList+=$("#logicTag").val();
    	tagList+=",";
    }
    if($("#aimTag").val()!=""){
    	tagList+=$("#aimTag").val();
    	tagList+=",";
    }
    if(tagList.substr(tagList.length-1,1)==","){
    	tagList=tagList.substr(0,tagList.length-1);
	}
    var fileInfo = [];
    for(i=0;i<index;i++){
    	var file = {};
    	var provinceCode=$("#"+"province"+i).val();
    	if (provinceCode!=null && provinceCode!=""){
    		file["provinceCode"] = provinceCode;
    		file["ftp"] = $("#"+"ftp"+i).val();
    		file["fileName"] = $("#"+"fileName"+i).val();
    		file["filePath"] = $("#"+"filePath"+i).val();
    		fileInfo.push(file);
    	}
    }
    var inVo = {};
    inVo["name"] = name;
    inVo["scene"] = scene;
    inVo["thinking"] = thinking;
    inVo["input"] = input;
    inVo["output"] = output;
    inVo["advice"] = advice;
    inVo["period"] = period;
    inVo["state"] = state;
    inVo["type"] = type;
    inVo["createDate"] = createDate;
    inVo["tagList"] = tagList;
    inVo["department"] = department;
    inVo["author"] = author;
    inVo["contact"] = contact;
    inVo["fileInfo"] = fileInfo;
    inVo["arithmetic"] = arithmetic;
    $.ajax({
        url : "model/saveModel.do",
        type : "post",
        data : JSON.stringify(inVo),
        dataType:"json",
        contentType:"application/json",
        success : function (data) {
            if(data.flag==true){
            	$.jBox.tip("添加模型成功","success");
                setTimeout("window.location.href='model/toModelListC.do'",3000);
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
	<div class="u-body">
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
					<label class="name n1" for="">模型名称：</label>
					<input type="text" class="b-input-text" id="name" name="name" onblur="validateMessage()" /> 
					<span id="nameTip" style="color: red; display: none">模型名称不能为空</span>
				</div>
				<div class="biaodan">
					<label class="name n2 n1" for="">模型场景：</label>
					<div class="b-input-text b2">
						<textarea name="scene" id="scene"></textarea>
					</div>
				</div>
				<div class="biaodan">
					<label class="name n2 n1" for="">模型思路：</label>
					<div class="b-input-text b2">
						<textarea name="thinking" id="thinking"></textarea>
					</div>
				</div>
				<div class="biaodan">
					<label class="name n2 n1" for="">模型算法：</label>
					<div class="b-input-text b2">
						<textarea name="arithmetic" id="arithmetic"></textarea>
					</div>
				</div>
				<div class="biaodan">
					<label class="name n2 n1" for="">模型输入：</label>
					<div class="b-input-text b2">
						<textarea name="input" id="input"></textarea>
					</div>
				</div>
				<div class="biaodan">
					<label class="name n2 n1" for="">模型输出：</label>
					<div class="b-input-text b2">
						<textarea name="output" id="output"></textarea>
					</div>
				</div>
				<div class="biaodan">
					<label class="name n1" for="">模型状态：</label>
					<select class="b-input-text" name="state" id="state">
						<option value="1">开发中</option>
						<option value="2">模型验证未投产</option>
						<option value="3">已投产,模型数据集中生产中</option>
						<option value="4">已投产,模型下发省分自行生产</option>
						<option value="5">模型静默中</option>
					</select>
				</div>
				<div class="biaodan">
					<label class="name n1" for="">生命周期标签：</label>
					<select class="b-input-text" name="states[]" id="tag" multiple="multiple" onchange="setSelectOnChange();">
					</select>
				</div>
				<div class="biaodan">
					<label class="name n1" for="">模型逻辑标签：</label>
					<select class="b-input-text" name="logicTag" id="logicTag" style="width:150px">
						<option value=""></option>
						<option value="5">基础数据模型</option>
						<option value="6">事实模型</option>
						<option value="7">预测模型</option>
					</select>
				</div>
				<div class="biaodan">
					<label class="name n1" for="">模型目标标签：</label>
					<select class="b-input-text" name="aimTag" id="aimTag" style="width:150px">
						<option value=""></option>
						<option value="8">价值提升</option>
						<option value="9">维系挽留</option>
					</select>
				</div>
				<div class="biaodan">
					<label class="name n2 n1" for="">营销建议：</label>
						<textarea class="b-input-text b2" name="advice" id="advice"></textarea>
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
					<div class="box">
						<input type="text" class="b-input-text" id="datepicker" name="datepicker" style="width:142px" />
					</div>
				</div>
				<div class="biaodan">
					<label class="name n1" for="">负责部门：</label>
					<div class="box">
						<input type="text" class="b-input-text" id="department" name="department" style="width:142px" />
					</div>
				</div>
				<div class="biaodan">
					<label class="name n1" for="">负责人：</label>
					<div class="box">
						<input type="text" class="b-input-text" id="author" name="author" style="width:142px" />
					</div>
				</div>
				<div class="biaodan">
					<label class="name n1" for="">联系方式：</label>
					<div class="box">
						<input type="text" class="b-input-text" id="contact" name="contact" style="width:142px" />
						<a class="button baocun" onclick="createPath()">添加省分下发信息</a>
					</div>
				</div>
				<table class="table table-bordered ">
	                <thead>
		                <tr>
		                   <th>省分</th>
		                   <th>ftp ip地址</th>
		                   <th>文件名称</th>
		                   <th>文件路径</th>
		               </tr>
	               </thead>
	             <tbody id="dataList"></tbody>
           		</table>
				<div class="button-box-v">
					<a class="button baocun" onclick="save(0)">保存为草稿</a>
					<a class="button baocun" onclick="save(1)">正式提交</a>
					<a class="button quxiao" onclick="javascript:history.go(-1);">取消</a>
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