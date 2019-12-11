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
<title>省分信息录入-大数据运营后台管理系统</title>
<base href="<%=basePath1 %>" />
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/general.css">
    <link rel="stylesheet" href="css/layout.css">
    <link rel="stylesheet" href="css/core.css">
    <link rel="stylesheet" href="js/kkpager/kkpager_blue.css">
    <link rel="stylesheet" href="js/zTree_v3/css/zTreeStyle/zTreeStyle.css">
    <link rel="stylesheet" href="js/jbox/jbox.css">
    <script type="text/javascript" src="js/jquery-2.1.4.js"></script>
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
    
    <script type="text/javascript">
    var orgCode="${orgCode}";
    var li1=[];
    var li2=[];
    var li3=[];
    var li4=[];
    var li5=[];
	var ulList=[];
 	$(function(){ 
 		getModelList();
	});
    function getModelList() {
    	$.ajax({
            url : "model/getModelAllInfo.do",
            type : 'post',
            data :{"orgCode" : orgCode},
            success :function (result) {
            	var html="";
            	var js="";
            	var num=0;
            	var list1=result.result.list1;
            	var list2=result.result.list2;
            	var list3=result.result.list3;
            	var list4=result.result.list4;
            	var list5=result.result.list5;
            	for(i=0;i<list1.length;i++){
            		switch(Number(list1[i].state)){
            			case 1:
	            			li1.push(num);
	            			break;
            			case 2:
	            			li2.push(num);
	            			break;
            			case 3:
	            			li3.push(num);
	            			break;
            			case 4:
	            			li4.push(num);
	            			break;
            			case 5:
	            			li5.push(num);
	            			break;
            		}
            		$('#ul1').append('<li id="moxing-'+num+'"><a class="moxing-window-btn-'+list1[i].id+'">'+list1[i].name+'</a></li> ');
            		html+="<div class='moxing-window window-"+list1[i].id+"'>";
            		html+="<div class='box'>";
            		html+="<div class='modal-header'>";
            		html+="<h3 id='myModalLabel'>"+list1[i].name+"</h3>";
            		html+="<a class='close' data-dismiss='modal' aria-hidden='true'href='javascript:void();'><i class='fa fa-times'></i></a>";
            		html+="</div>";
            		html+="<div class='wenben'>";
            		if(orgCode!="001"){
            			html+="<p class='p1'><strong>模型下载信息</strong></p>";
            			html+="<p class='p1'>下载地址："+list1[i].ftp+"</p>";
            			html+="<p class='p1'>文件名称："+list1[i].fileName+"</p>";
            			html+="<p class='p1'>文件路径："+list1[i].filePath+"</p>";
            		}
            		html+="<p class='p1'><strong>1.模型场景</strong></p>";
            		html+="<p class='p1'>"+list1[i].scene+"</p> ";
            		html+="<p class='p1'><strong>2.数据输入</strong></p>";
            		html+="<p class='p1'>"+list1[i].input+"</p>";
            		html+="<p class='p1'><strong>3.模型思路</strong></p>";
            		html+="<p class='p1'>"+list1[i].thinking+"</p>";
            		html+="<p class='p1'><strong>4.数据输出</strong></p>";
            		html+="<p class='p1'>"+list1[i].output+"</p>";
            		html+="<p class='p1'><strong>5.实施方式</strong></p>";
            		html+="<p class='p1'> </p>";
            		html+="<p class='p1'><strong>6.营销建议</strong></p>";
            		html+="<p class='p1'>"+list1[i].advice+"</p>";
            		html+="<p class='p1'><strong>7.应用阶段</strong></p>";
            		switch(Number(list1[i].state)){
        			case 1:
                		html+="<p class='p1'>开发中</p>";
            			break;
        			case 2:
        				html+="<p class='p1'>模型验证未投产</p>";
            			break;
        			case 3:
        				html+="<p class='p1'>已投产,模型数据集中生产中</p>";
            			break;
        			case 4:
        				html+="<p class='p1'>已投产,模型下发省分自行生产</p>";
            			break;
        			case 5:
        				html+="<p class='p1'>模型静默中</p>";
            			break;
        			default:
        				html+="<p class='p1'> </p>";
        			}
            		html+="<p class='p1'><strong>8.算法</strong></p>";
            		html+="<p class='p1'>"+list1[i].arithmetic+"</p> ";
            		html+="<p class='p1'><strong>9.负责部门</strong></p>";
            		html+="<p class='p1'>"+list1[i].department+"</p> ";
            		html+="</div>";
            		html+="</div>";
            		html+="</div>";
            		js+="$('.moxing-window-btn-"+list1[i].id+"').on('click', function(e) { ";
            		js+="$('.window-"+list1[i].id+"').show(); ";
            		js+="$('.close').on('click', function() { ";
            		js+="$('.moxing-window').hide(); ";
            		js+="}); ";
            		js+="}); ";
            		num++;
            	}
            	for(i=0;i<list2.length;i++){
            		switch(Number(list2[i].state)){
        			case 1:
            			li1.push(num);
            			break;
        			case 2:
            			li2.push(num);
            			break;
        			case 3:
            			li3.push(num);
            			break;
        			case 4:
            			li4.push(num);
            			break;
        			case 5:
            			li5.push(num);
            			break;
        			}
            		$('#ul2').append('<li id="moxing-'+num+'"><a class="moxing-window-btn-'+list2[i].id+'">'+list2[i].name+'</a></li> ');
	           		html+="<div class='moxing-window window-"+list2[i].id+"'>";
	         		html+="<div class='box'>";
	         		html+="<div class='modal-header'>";
	         		html+="<h3 id='myModalLabel'>"+list2[i].name+"</h3>";
	         		html+="<a class='close' data-dismiss='modal' aria-hidden='true'href='javascript:void();'><i class='fa fa-times'></i></a>";
	         		html+="</div>";
	         		html+="<div class='wenben'>";
	         		if(orgCode!="001"){
            			html+="<p class='p1'><strong>模型下载信息</strong></p>";
            			html+="<p class='p1'>下载地址："+list2[i].ftp+"</p>";
            			html+="<p class='p1'>文件名称："+list2[i].fileName+"</p>";
            			html+="<p class='p1'>文件路径："+list2[i].filePath+"</p>";
            		}
	         		html+="<p class='p1'><strong>1.模型场景</strong></p>";
	         		html+="<p class='p1'>"+list2[i].scene+"</p> ";
	         		html+="<p class='p1'><strong>2.数据输入</strong></p>";
	         		html+="<p class='p1'>"+list2[i].input+"</p>";
	         		html+="<p class='p1'><strong>3.模型思路</strong></p>";
	         		html+="<p class='p1'>"+list2[i].thinking+"</p>";
	         		html+="<p class='p1'><strong>4.数据输出</strong></p>";
	         		html+="<p class='p1'>"+list2[i].output+"</p>";
	         		html+="<p class='p1'><strong>5.实施方式</strong></p>";
	         		html+="<p class='p1'> </p>";
	         		html+="<p class='p1'><strong>6.营销建议</strong></p>";
	         		html+="<p class='p1'>"+list2[i].advice+"</p>";
	         		html+="<p class='p1'><strong>7.应用阶段</strong></p>";
	         		switch(Number(list2[i].state)){
        			case 1:
                		html+="<p class='p1'>开发中</p>";
            			break;
        			case 2:
        				html+="<p class='p1'>模型验证未投产</p>";
            			break;
        			case 3:
        				html+="<p class='p1'>已投产,模型数据集中生产中</p>";
            			break;
        			case 4:
        				html+="<p class='p1'>已投产,模型下发省分自行生产</p>";
            			break;
        			case 5:
        				html+="<p class='p1'>模型静默中</p>";
            			break;
        			default:
        				html+="<p class='p1'> </p>";
        			}
	         		html+="<p class='p1'><strong>8.算法</strong></p>";
	         		html+="<p class='p1'>"+list2[i].arithmetic+"</p> ";
            		html+="<p class='p1'><strong>9.负责部门</strong></p>";
            		html+="<p class='p1'>"+list2[i].department+"</p> ";
	         		html+="</div>";
	         		html+="</div>";
	         		html+="</div>";
	         		js+="$('.moxing-window-btn-"+list2[i].id+"').on('click', function(e) { ";
            		js+="$('.window-"+list2[i].id+"').show(); ";
            		js+="$('.close').on('click', function() { ";
            		js+="$('.moxing-window').hide(); ";
            		js+="}); ";
            		js+="}); ";
            		num++;
           		}
            	for(i=0;i<list3.length;i++){
            		switch(Number(list3[i].state)){
        			case 1:
            			li1.push(num);
            			break;
        			case 2:
            			li2.push(num);
            			break;
        			case 3:
            			li3.push(num);
            			break;
        			case 4:
            			li4.push(num);
            			break;
        			case 5:
            			li5.push(num);
            			break;
        			}
            		$('#ul3').append('<li id="moxing-'+num+'"><a class="moxing-window-btn-'+list3[i].id+'">'+list3[i].name+'</a></li> ');
           			html+="<div class='moxing-window window-"+list3[i].id+"'>";
            		html+="<div class='box'>";
            		html+="<div class='modal-header'>";
            		html+="<h3 id='myModalLabel'>"+list3[i].name+"</h3>";
            		html+="<a class='close' data-dismiss='modal' aria-hidden='true'href='javascript:void();'><i class='fa fa-times'></i></a>";
            		html+="</div>";
            		html+="<div class='wenben'>";
            		if(orgCode!="001"){
            			html+="<p class='p1'><strong>模型下载信息</strong></p>";
            			html+="<p class='p1'>下载地址："+list3[i].ftp+"</p>";
            			html+="<p class='p1'>文件名称："+list3[i].fileName+"</p>";
            			html+="<p class='p1'>文件路径："+list3[i].filePath+"</p>";
            		}
            		html+="<p class='p1'><strong>1.模型场景</strong></p>";
            		html+="<p class='p1'>"+list3[i].scene+"</p> ";
            		html+="<p class='p1'><strong>2.数据输入</strong></p>";
            		html+="<p class='p1'>"+list3[i].input+"</p>";
            		html+="<p class='p1'><strong>3.模型思路</strong></p>";
            		html+="<p class='p1'>"+list3[i].thinking+"</p>";
            		html+="<p class='p1'><strong>4.数据输出</strong></p>";
            		html+="<p class='p1'>"+list3[i].output+"</p>";
            		html+="<p class='p1'><strong>5.实施方式</strong></p>";
            		html+="<p class='p1'> </p>";
            		html+="<p class='p1'><strong>6.营销建议</strong></p>";
            		html+="<p class='p1'>"+list3[i].advice+"</p>";
            		html+="<p class='p1'><strong>7.应用阶段</strong></p>";
            		switch(Number(list3[i].state)){
        			case 1:
                		html+="<p class='p1'>开发中</p>";
            			break;
        			case 2:
        				html+="<p class='p1'>模型验证未投产</p>";
            			break;
        			case 3:
        				html+="<p class='p1'>已投产,模型数据集中生产中</p>";
            			break;
        			case 4:
        				html+="<p class='p1'>已投产,模型下发省分自行生产</p>";
            			break;
        			case 5:
        				html+="<p class='p1'>模型静默中</p>";
            			break;
        			default:
        				html+="<p class='p1'> </p>";
        			}
            		html+="<p class='p1'><strong>8.算法</strong></p>";
            		html+="<p class='p1'>"+list3[i].arithmetic+"</p> ";
            		html+="<p class='p1'><strong>9.负责部门</strong></p>";
            		html+="<p class='p1'>"+list3[i].department+"</p> ";
            		html+="</div>";
            		html+="</div>";
            		html+="</div>";
            		js+="$('.moxing-window-btn-"+list3[i].id+"').on('click', function(e) { ";
            		js+="$('.window-"+list3[i].id+"').show(); ";
            		js+="$('.close').on('click', function() { ";
            		js+="$('.moxing-window').hide(); ";
            		js+="}); ";
            		js+="}); ";
            		num++;
           		}
            	for(i=0;i<list4.length;i++){
            		switch(Number(list4[i].state)){
        			case 1:
            			li1.push(num);
            			break;
        			case 2:
            			li2.push(num);
            			break;
        			case 3:
            			li3.push(num);
            			break;
        			case 4:
            			li4.push(num);
            			break;
        			case 5:
            			li5.push(num);
            			break;
        			}
            		$('#ul4').append('<li id="moxing-'+num+'"><a class="moxing-window-btn-'+list4[i].id+'">'+list4[i].name+'</a></li> ');
           			html+="<div class='moxing-window window-"+list4[i].id+"'>";
            		html+="<div class='box'>";
            		html+="<div class='modal-header'>";
            		html+="<h3 id='myModalLabel'>"+list4[i].name+"</h3>";
            		html+="<a class='close' data-dismiss='modal' aria-hidden='true'href='javascript:void();'><i class='fa fa-times'></i></a>";
            		html+="</div>";
            		html+="<div class='wenben'>";
            		if(orgCode!="001"){
            			html+="<p class='p1'><strong>模型下载信息</strong></p>";
            			html+="<p class='p1'>下载地址："+list4[i].ftp+"</p>";
            			html+="<p class='p1'>文件名称："+list4[i].fileName+"</p>";
            			html+="<p class='p1'>文件路径："+list4[i].filePath+"</p>";
            		}
            		html+="<p class='p1'><strong>1.模型场景</strong></p>";
            		html+="<p class='p1'>"+list4[i].scene+"</p> ";
            		html+="<p class='p1'><strong>2.数据输入</strong></p>";
            		html+="<p class='p1'>"+list4[i].input+"</p>";
            		html+="<p class='p1'><strong>3.模型思路</strong></p>";
            		html+="<p class='p1'>"+list4[i].thinking+"</p>";
            		html+="<p class='p1'><strong>4.数据输出</strong></p>";
            		html+="<p class='p1'>"+list4[i].output+"</p>";
            		html+="<p class='p1'><strong>5.实施方式</strong></p>";
            		html+="<p class='p1'> </p>";
            		html+="<p class='p1'><strong>6.营销建议</strong></p>";
            		html+="<p class='p1'>"+list4[i].advice+"</p>";
            		html+="<p class='p1'><strong>7.应用阶段</strong></p>";
            		switch(Number(list4[i].state)){
        			case 1:
                		html+="<p class='p1'>开发中</p>";
            			break;
        			case 2:
        				html+="<p class='p1'>模型验证未投产</p>";
            			break;
        			case 3:
        				html+="<p class='p1'>已投产,模型数据集中生产中</p>";
            			break;
        			case 4:
        				html+="<p class='p1'>已投产,模型下发省分自行生产</p>";
            			break;
        			case 5:
        				html+="<p class='p1'>模型静默中</p>";
            			break;
        			default:
        				html+="<p class='p1'> </p>";
        			}
            		html+="<p class='p1'><strong>8.算法</strong></p>";
            		html+="<p class='p1'>"+list4[i].arithmetic+"</p> ";
            		html+="<p class='p1'><strong>9.负责部门</strong></p>";
            		html+="<p class='p1'>"+list4[i].department+"</p> ";
            		html+="</div>";
            		html+="</div>";
            		html+="</div>";
            		js+="$('.moxing-window-btn-"+list4[i].id+"').on('click', function(e) { ";
            		js+="$('.window-"+list4[i].id+"').show(); ";
            		js+="$('.close').on('click', function() { ";
            		js+="$('.moxing-window').hide(); ";
            		js+="}); ";
            		js+="}); ";
            		num++;
           		}
            	for(i=0;i<list5.length;i++){
            		switch(Number(list5[i].state)){
        			case 1:
            			li1.push(num);
            			break;
        			case 2:
            			li2.push(num);
            			break;
        			case 3:
            			li3.push(num);
            			break;
        			case 4:
            			li4.push(num);
            			break;
        			case 5:
            			li5.push(num);
            			break;
        			}
            		$('#ul5').append('<li id="moxing-'+num+'"><a class="moxing-window-btn-'+list5[i].id+'">'+list5[i].name+'</a></li> ');
           			html+="<div class='moxing-window window-"+list5[i].id+"'>";
            		html+="<div class='box'>";
            		html+="<div class='modal-header'>";
            		html+="<h3 id='myModalLabel'>"+list5[i].name+"</h3>";
            		html+="<a class='close' data-dismiss='modal' aria-hidden='true'href='javascript:void();'><i class='fa fa-times'></i></a>";
            		html+="</div>";
            		html+="<div class='wenben'>";
            		if(orgCode!="001"){
            			html+="<p class='p1'><strong>模型下载信息</strong></p>";
            			html+="<p class='p1'>下载地址："+list5[i].ftp+"</p>";
            			html+="<p class='p1'>文件名称："+list5[i].fileName+"</p>";
            			html+="<p class='p1'>文件路径："+list5[i].filePath+"</p>";
            		}
            		html+="<p class='p1'><strong>1.模型场景</strong></p>";
            		html+="<p class='p1'>"+list5[i].scene+"</p> ";
            		html+="<p class='p1'><strong>2.数据输入</strong></p>";
            		html+="<p class='p1'>"+list5[i].input+"</p>";
            		html+="<p class='p1'><strong>3.模型思路</strong></p>";
            		html+="<p class='p1'>"+list5[i].thinking+"</p>";
            		html+="<p class='p1'><strong>4.数据输出</strong></p>";
            		html+="<p class='p1'>"+list5[i].output+"</p>";
            		html+="<p class='p1'><strong>5.实施方式</strong></p>";
            		html+="<p class='p1'> </p>";
            		html+="<p class='p1'><strong>6.营销建议</strong></p>";
            		html+="<p class='p1'>"+list5[i].advice+"</p>";
            		html+="<p class='p1'><strong>7.应用阶段</strong></p>";
            		switch(Number(list5[i].state)){
        			case 1:
                		html+="<p class='p1'>开发中</p>";
            			break;
        			case 2:
        				html+="<p class='p1'>模型验证未投产</p>";
            			break;
        			case 3:
        				html+="<p class='p1'>已投产,模型数据集中生产中</p>";
            			break;
        			case 4:
        				html+="<p class='p1'>已投产,模型下发省分自行生产</p>";
            			break;
        			case 5:
        				html+="<p class='p1'>模型静默中</p>";
            			break;
        			default:
        				html+="<p class='p1'> </p>";
        			}
            		html+="<p class='p1'><strong>8.算法</strong></p>";
            		html+="<p class='p1'>"+list5[i].arithmetic+"</p> ";
            		html+="<p class='p1'><strong>9.负责部门</strong></p>";
            		html+="<p class='p1'>"+list5[i].department+"</p> ";
            		html+="</div>";
            		html+="</div>";
            		html+="</div>";
            		js+="$('.moxing-window-btn-"+list5[i].id+"').on('click', function(e) { ";
            		js+="$('.window-"+list5[i].id+"').show(); ";
            		js+="$('.close').on('click', function() { ";
            		js+="$('.moxing-window').hide(); ";
            		js+="}); ";
            		js+="}); ";
            		num++;
           		}
            	ulList.push(li1);
            	ulList.push(li2);
            	ulList.push(li3);
            	ulList.push(li4);
            	ulList.push(li5);
            	$(document.body).append(html); 
            	loadScriptString(js);
            	document.getElementById("t3").click();
            },
            error : function () {
            	$.jBox.error("查询出现错误","提示");
            }
        });
    }
    function loadScriptString(code) {
        var script = document.createElement("script");
        script.type = "text/javascript";
        try {
            script.appendChild(document.createTextNode(code));
        } catch (ex) {
            script.text = code;
        }
        document.body.appendChild(script);
    }
    function showLi(code) {
    	for(var i=1;i<=5;i++){
    		if(code==i){
    			for(var j=0;j<ulList[i-1].length;j++){
    				$("#moxing-"+ulList[i-1][j]).show();
    			}
    		}else{
    			for(var j=0;j<ulList[i-1].length;j++){
    				$("#moxing-"+ulList[i-1][j]).hide();
    			}
    		}
    	}
    }
    </script>
</head>
<body style="width:100%;height:100%;overflow:auto">
<div class="moxing-box">
	<script>
		$(document).ready(function() {
			$(".modelall-change li").click(function() {
				$(".modelall-change li").removeClass("modelall-active");
				$(this).addClass("modelall-active");
			});
		});	
	</script>
	<ul class="modelall-change">
		<li class="modelall-active" id="t1" onclick="showLi(1);">开发中</li>
		<li id="t2" onclick="showLi(2);">模型验证未投产</li>
		<li id="t3" onclick="showLi(3);">已投产,模型数据集中生产中</li>
		<li id="t4" onclick="showLi(4);">已投产,模型下发省分自行生产</li>
		<li id="t5" onclick="showLi(5);">模型静默中</li>
	</ul>
			  <div class="moxing-list-box">
				  <div class="moxing-list model-one">
					  <div class="list-box list-box-2">
						  <div class="text">
							  	<span class="span-1">客户识别期</span>
							  	<span class="span-2">RECOGNITION PERIOD</span>
							  	<p><i class="fa fa-chevron-right"></i></p>
						  </div>
						  <ul id="ul1"><br>
						  </ul>
						  <img class="list-box-img" src="img/model/line-06.png">
					  </div>
					  <img class="moxing-img" src="img/model/line-01.png">
				  </div>
				  <div class="moxing-list moxing-two">
				      <div class="list-box">
						  <div class="text">
						  	  <span class="span-1">客户成长期</span>
						  	  <span class="span-2">GROWTH PERIOD</span>
						  	  <p><i class="fa fa-chevron-right"></i></p>
						  </div>
						  <ul id="ul2"><br>
						  </ul>
						  <img class="list-box-img" src="img/model/line-07.png">
				  	</div>
				  	<img class="moxing-img moxing-img-2" src="img/model/line-02.png">
				  </div>
				  <div class="moxing-list moxing-two">
				  	  <div class="list-box">
						  <div class="text">
						  	  <span class="span-1">客户稳定期</span>
						  	  <span class="span-2">STABLE PERIOD</span>
						  	  <p><i class="fa fa-chevron-right"></i></p>
						  </div>
						  <ul id="ul3"><br>
						  </ul>
						  <img class="list-box-img" src="img/model/line-08.png">
				      </div>
				      <img class="moxing-img" src="img/model/line-03.png">
				  </div>
				  <div class="moxing-list moxing-two">
				  	  <div class="list-box list-box-3">
					      <div class="text">
						 	  <span class="span-1">客户预警期</span>
						 	  <span class="span-2">WARNING PERIOD</span>
						 	  <p><i class="fa fa-chevron-right"></i></p>
					 	  </div>
						  <ul id="ul4"><br>
						  </ul>
						  <img class="list-box-img" src="img/model/line-09.png">
				     </div>
				     <img class="moxing-img" src="img/model/line-04.png">
				 </div>
				 <div class="moxing-list moxing-two">
				  	  <div class="list-box list-box-4">
					      <div class="text">
						 	  <span class="span-1">全生命周期</span>
						 	  <span class="span-2">TOTAL LIFE CYCLE</span>
						 	  <p><i class="fa fa-chevron-right"></i></p>
					 	  </div>
						  <ul id="ul5"><br>
						  </ul>
						  <img class="list-box-img" src="img/model/line-10.png">
				     </div>
				     <img class="moxing-img" src="img/model/line-05.png">
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