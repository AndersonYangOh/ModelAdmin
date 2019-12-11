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
	<!-- <ul class="modelall-change">
		<li class="modelall-active">按钮1</li>
		<li>按钮2</li>
		<li>按钮3</li>
		<li>按钮4</li>
		<li>按钮5</li>
	</ul> -->
			  <div class="moxing-list-box">
				  <div class="moxing-list model-one">
					  <div class="list-box list-box-2">
						  <div class="text">
							  	<span class="span-1">客户识别期</span>
							  	<span class="span-2">RECOGNITION PERIOD</span>
							  	<p><i class="fa fa-chevron-right"></i></p>
						  </div>
						  <ul><br>
							  <li><a class="moxing-window-btn-1">异网用户营销模型</a></li>
							  <li><a class="moxing-window-btn-2">新发展用户重入网模型</a></li>
							  <li><a class="moxing-window-btn-3">新发展用户养卡模型</a></li>
							  <li><a class="moxing-window-btn-4">新发展用户来源模型</a></li>
							  <li><a class="moxing-window-btn-5">疑似窜卡模型</a></li>
							  <li><a class="moxing-window-btn-6">用户星级标定</a></li>
							  <li><a class="moxing-window-btn-7">真实用户识别</a></li>
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
						  <ul><br>
							  <li><a class="moxing-window-btn-8">终端适配</a></li>
							  <li><a class="moxing-window-btn-9">2I2C产品推荐</a></li>
							  <li><a class="moxing-window-btn-10">流量包潜在用户识别</a></li>
							  <li><a class="moxing-window-btn-11">流量套餐推荐</a></li>
							  <li><a class="moxing-window-btn-12">购买欲望</a></li>
							  <li><a class="moxing-window-btn-13">IPTV用户发展</a></li>
							  <li><a class="moxing-window-btn-14">电子围栏（机场/高铁站/商圈）</a></li>
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
						  <ul><br>
							  <li><a class="moxing-window-btn-15">2升4用户发展</a></li>
							  <li><a class="moxing-window-btn-16">终端换机概率预测</a></li>
							  <li><a class="moxing-window-btn-17">终端换机导购推荐</a></li>
							  <li><a class="moxing-window-btn-18">APP偏好</a></li>
							  <li><a class="moxing-window-btn-19">用户敏感度分类</a></li>
							  <li><a class="moxing-window-btn-20">商业兴趣标签</a></li>
							  <li><a class="moxing-window-btn-21">长期漫游用户识别模型</a></li>
							  <li><a class="moxing-window-btn-29">国际漫游潜在用户模型</a></li>
							  <li><a class="moxing-window-btn-30">疑似亲属模型</a></li>
							  <li><a class="moxing-window-btn-31">融合潜在用户识别模型</a></li>
							  <li><a class="moxing-window-btn-32">冰激凌产品推荐模型</a></li>
							  <li><a class="moxing-window-btn-33">流量特征模型</a></li>
							  <li><a class="moxing-window-btn-34">位置轨迹标签</a></li>
							  <li><a class="moxing-window-btn-35">用户婚恋状态标签</a></li>
							  <li><a class="moxing-window-btn-36">用户财产模型</a></li>
							  <li><a class="moxing-window-btn-37">购车意向模型</a></li>
							  <li><a class="moxing-window-btn-38">用户职住模型</a></li>
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
						  <ul><br>
							  <li><a class="moxing-window-btn-22">用户稳定度</a></li>
							  <li><a class="moxing-window-btn-23">离网成因分析</a></li>
							  <li><a class="moxing-window-btn-24">宽带流失预警</a></li>
							  <li><a class="moxing-window-btn-25">宽带合约到期提醒</a></li>
							  <li><a class="moxing-window-btn-26">移网流失预警</a></li>
							  <li><a class="moxing-window-btn-27">用户流失去向</a></li>
							  <li><a  class="moxing-window-btn-28">运营收入预测</a></li>
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
						  <ul><br>
							  <li><a class="moxing-window-btn-22">用户稳定度</a></li>
							  <li><a class="moxing-window-btn-23">离网成因分析</a></li>
							  <li><a class="moxing-window-btn-24">宽带流失预警</a></li>
							  <li><a class="moxing-window-btn-25">宽带合约到期提醒</a></li>
							  <li><a class="moxing-window-btn-26">移网流失预警</a></li>
							  <li><a class="moxing-window-btn-27">用户流失去向</a></li>
							  <li><a  class="moxing-window-btn-28">运营收入预测</a></li>
						  </ul>
						  <img class="list-box-img" src="img/model/line-10.png">
				     </div>
				     <img class="moxing-img" src="img/model/line-05.png">
				 </div>
		  </div>
<!--弹窗--->
	<div class="moxing-window window-1" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">异网用户营销模型（数据中心）</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					基于已有的异网用户数据少，如何利用仅有的数据准确挖掘目标异网用户并展开营销活动，为市场部的异网营销提供数据支撑，是增加企业用户规模和企业收入的重要手段。
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					用户语音、流量详单数据、实名制数据。
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>						
				<p class="p1">
					1、根据异网用户的联通交往圈中的年龄、业务量、ARPU预测该用户的ARPU大小，语音、流量情况</p>
	<p class="p1">2、根据异网用户的联通交往圈计算其联通交往圈大小</p>
	<p class="p1">3、根据异网用户的近3月主叫联通客服情况，计算是否呼叫联通客服
用户观察窗口期为3月。
				</p>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					手机号码，ARPU，语音、流量，联通交往圈，是否呼叫联通客服。
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					-
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					优先针对中等价值、联通粘度高的用户开展活动，该类用户流失率较高，容易改网，对联通贡献也高
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					模型正常生产。
				</p>
				<p class="p1">
					<strong>8.算法</strong>
				</p>
				<p class="p1">
					分类
				</p> 
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao" onclick="toExport(7);">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	
	<div class="moxing-window window-2" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">新发展用户重入网模型（数据中心）</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					通过客户重入网前后行为及价值对比，进一步完善发展用户的长效机制，从而提高客户收入，降低成本支出。
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					语音、短信详单，实名制数据。
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>						
				<p class="p1">
					1、根据用户语音通话及短信详单为每个用户生成呼叫指纹，将新入网用户的呼叫指纹与老用户的呼叫指纹进行相似度匹配；</p>
<p class="p1">2、根据新入网用户的身份证号码与老用户的身份证号码识别匹配，并佐以对端号码TOP5，终端型号，基站等等是否相同进行验证；</p>
<p class="p1">3、根据新老用户的IMEI 进行识别匹配。
				</p>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					手机号码、重入网号码。
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					总部统一实施，下发到各省分公司。
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					用于考核渠道发展用户质量。
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					模型正常生产。
				</p>
				<p class="p1">
					<strong>8.算法</strong>
				</p>
				<p class="p1">
					分类
				</p> 
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao" onclick="toExport(7);">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-3" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">新发展用户养卡模型（数据中心）</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					针对管控渠道商发展虚假用户,提出规则类似搭积木方式，根据市场行为变化可以灵活调整规则，以达到对疑似养卡率控制的目的。
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					业务数据、实名制数据、渠道数据、终端数据。
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>						
				<p class="p1">
					1、用户统计期内无业务量使用的用户或者业务量使用极少的用户；</p>
<p class="p1">2 、在统计月通话时较少的用户中，根据其使用中的出账收入、通话次数、上网流量和短信条数等指标利用空间距离计算任意两用户间相似度，同一渠道下发展的用户中相似用户的数量较多即为疑似行为相似养卡；</p>
	<p class="p1">3、同一渠道发展用户在次月使用中，较多用户使用同一IMEI号。
				</p>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					手机号码。
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					总部统一实施，下发到各省分公司。
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					用于考核渠道发展用户质量
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					模型正常生产。
				</p>
				<p class="p1">
					<strong>8.算法</strong>
				</p>
				<p class="p1">
					分类
				</p> 
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao" onclick="toExport(7);">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-4" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">新发展用户来源模型（数据中心）</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					通过客户来源的细分及其入网后行为观察，进一步完善发展用户的长效机制，提高有效发展用户比例。
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					语音、短信详单，实名制数据。
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>						
				<p class="p1">
					1、根据用户语音通话及短信详单为每个用户生成呼叫指纹</p>				
				<p class="p1">2、将新入网用户的呼叫指纹与老用户的呼叫指纹进行相似度匹配，判断发展用户来源。
				</p>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					手机号码。
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					总部统一实施，下发到各省分公司。
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					-
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					模型正常生产。
				</p>
				<p class="p1">
					<strong>8.算法</strong>
				</p>
				<p class="p1">
					分类
				</p> 
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao" onclick="toExport(7);">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-5" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">疑似窜卡模型（数据中心）</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					将新发展用户取出，研究用户的语音和流量漫游使用情况。
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					业务数据。
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>						
				<p class="p1">
					将近三个月没有本地流量和语音的用户取出，该部分用户属于漫游特征用户。
				</p>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					手机号码。
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					总部统一实施。
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					对高语音和高流量的漫游用户，可向其推荐本地产品。
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					模型正常生产。
				</p>
				<p class="p1">
					<strong>8.算法</strong>
				</p>
				<p class="p1">
					分类
				</p> 
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao" onclick="toExport(7);">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-6" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">用户星级标定（数据中心）</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					将新用户从入网起累计相应的业务行为、欠费等作为星级评定标准，而各星级用户可享受不同联通服务，提升用户感知。
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					用户ARPU，网龄，业务情况，欠费停机数据。
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>						
				<p class="p1">
					1、网龄在6个自然月以上（不含第6个自然月，即第7个自然月开始计算评级），评级当月状态为在网且出账的移网用户。</p>
<p class="p1">2、根据用户的历史消费金额以及在网时长等条件进行评级，级别从高往低依次分为“五星客户”、“四星客户”、“三星客户”、“二星客户”、“一星客户”这五个等级。
				</p>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					手机号码、用户星级。
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					总部统一实施。
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					-。
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					模型正常生产，T+15日用户数据。
				</p>
				<p class="p1">
					<strong>8.算法</strong>
				</p>
				<p class="p1">
					分类
				</p> 
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao" onclick="toExport(7);">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-7" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">真实用户识别模型（电商）</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					实时衡量用户的真实性和用户价值，是提升实体渠道效益和效能的重要抓手，解决实体渠道增存失衡问题的有力武器。
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					移网B侧数据、O域数据。
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>						
				<p class="p1">
					从用户入网的通话时长、频次、来去电情况、流量；上网内容、以及APP使用情况等综合评判。</p>
<p class="p1">用户观察窗口期为15天，T+15日输出模型数据，准确性达到84%。
				</p>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					手机号码。
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					总部统一实施，下发到各省分公司。
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					用户核查、渠道佣金暂停结算或扣罚。
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					模型正常生产，T+15日真实发展用户数据，每日以FTP方式下发至省分。
				</p>
				<p class="p1">
					<strong>8.算法</strong>
				</p>
				<p class="p1">
					分类
				</p> 
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao" onclick="toExport(7);">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-8" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">终端适配模型（数据中心）</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					将终端价格作为重要考量因素，计算用户换机概率，预测换机时间，为用户精准推荐5款终端机型。
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					业务数据、终端数据、实名制数据。
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>				
				<p class="p1">
					已知是否换机的用户在观察账期的各项数据指标，生成不同分类下用户换机特征的训练数据集，得到每个分类用户的换机比例、换机时间及热门换机机型，将待预测的用户做同样分类，相同分类的用户取相同的换机概率和换机时间，并为其推荐热门机型的TOP5。
				</p>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					手机号码。
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					总部统一实施，下发到各省分公司。
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					-
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					模型正常生产。
				</p>
				<p class="p1">
					<strong>8.算法</strong>
				</p>
				<p class="p1">
					分类
				</p> 
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao" onclick="toExport(8);" href="http://cl.wo.cn/stockmanagement-bi/file/model_8.rar" download="虚假用户识别.rar">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-9" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">2I2C产品推荐模型（数据中心）</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					将2I2C用户取出，分析用户的流量需求和偏好类型。
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					上网日志、业务数据、实名制数据。
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>				
				<p class="p1">
					将包含互联网产品的联通用户取出，如：腾讯大王卡，阿里小宝卡等。这部分用户有大流量需求且带有一定的使用偏好，如腾讯大王卡偏好使用腾讯APP。
				</p>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					手机号码。
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					总部统一实施。
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					分析拥有大用户量的2I2C产品，研究其特点，以便推出新产品。
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					模型正常生产。
				</p> 
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao" onclick="toExport(9);" href="http://cl.wo.cn/stockmanagement-bi/file/model_9.rar" download="用户套餐适配.rar">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-10" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">流量包潜在用户识别模型（数据中心）</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					流量超套的用户中主动降套、流失占比较高，通过分析该类用户日流量、月流量使用特点，推荐合适流量包，提升用户感知，增加企业用保、收保。
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					业务数据、产品数据、上网日志。
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>				
				<p class="p1">
					1、从流量超套用户的流量使用情况（日、月、时段）、ARPU、APP使用情况等综合评判其合适的流量包</p>
<p class="p1">2、流量波动较大的用户主动降套、流失占比较高，应优先考虑。
				</p>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					手机号码、推荐的流量包产品ID。
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					总部统一实施，下发到各省分公司。
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					对目标用户开展流量包推送。
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					未开发。
				</p> 
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-11" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">流量套餐推荐模型（电商）</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					用户准确推荐匹配自身需求流量业务，指导一线单元针对用户进行流量业务营销。
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					移网B域（年龄、性别、当前套餐、ARPU等）、移网O域（用户互联网标签）。
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>				
				<div class="data"><img src="img/model/model_3.png"></div>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					手机号码、最佳流量套餐。
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					总部统一建模，数据下发省分。
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					匹配最佳流量套餐、老用户的维系挽留营销。
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					模型已经开发完毕，等待生产。
				</p>
				<p class="p1">
					<strong>8.算法</strong>
				</p>
				<p class="p1">
					统计类
				</p> 
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-12" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">购买欲望（电商）</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					确定用户对通讯产品（语音、流量、权益等）的选择倾向度以及潜在压抑情况，为设计产品组合及权益填充，营销话述等，提供决策依据。
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					移固网B侧、移网O域数据。
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>				
				<p class="p1">
					根据用户的产品套餐、语音包、流量包、会员权益、积分兑换等历史数据以及APP访问标签等行为数据进行交叉分组，引入机器学习等方式叠进比对相关关系，对相关性强的属性进行固化。
				</p>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					手机号码、欲望倾向。
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					总部+省分众筹开发，数据统一下发。
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					适配畅越升档、权益产品等。
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					新模型概念，处于模型研发阶段。
				</p>
				<p class="p1">
					<strong>8.算法</strong>
				</p>
				<p class="p1">
					分类
				</p> 
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-13" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">IPTV用户发展（电商）</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					根据固网O域数据解析，分析宽带用户家中IPTV安装情况，定位出未安装联通IPTV的用户和较低档位联通IPTV的高清视频偏好用户。
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					固网o域数据、固网B域数据。
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>				
				<div class="data"><img src="img/model/model_1.png"></div>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					宽带账号、联系电话、联系地址、IPTV产品/升档。
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					省分根据各省情况，自主支撑。
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					推荐4G+4K产品、IPTV服务/会员、视频融合。
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					迭代推广阶段，已在北分等地区进行试点，营销成功率21%，需扩大应用推广。
				</p>
				<p class="p1">
					<strong>8.算法</strong>
				</p>
				<p class="p1">
					统计类
				</p> 
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-14" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">电子围栏（机场/高铁站/商圈）（电商）</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					基于地理围栏数据，识别用户到达机场、高铁站、商圈等围栏位置。
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					目前已经支撑的国际机场、口岸列表。机场范围200米内的3G、4G基站。
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>				
				<p class="p1">
					由特定机场/高铁站/商圈等范围内的基站来确定确定地理围栏，并根据用户常驻位置的模型算法，剔除该围栏内的工作人员，根据用户的位置轨迹，确定用户是机场出行/归来；高铁出行/归来。
				</p>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					手机号码、时间、经纬度。
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					总部提供电子围栏实时数据引擎API接口，省分公司对接kafka流。
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					权益类产品，通讯类产品，通讯+权益组合产品。
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					部分省分公司已经对接应用于流量包的生产，有需要的省分可以申请。
				</p>
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-15" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">2升4用户发展模型（电商）</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					老年2G用户，受年龄限制，无法理解现有的通讯产品，很难进行营销触达，完成2升4营销的目标。
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					移网B侧数据。
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>				
				<p class="p1">
					基于“疑似亲属关系”模型，从亲属关系对中，找出2G终端、且年龄>=65岁以上的老年用户，以及对应的亲属号码。
				</p>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					2G终端营销目标手机号码、疑似亲属号码。
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					总部统一支撑，数据下发省分。
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					终端+套餐、终端+主副卡业务、终端+家庭融合套餐等。
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					模型已经开发完成，等待生产验证。
				</p>
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao" onclick="toExport(16);" href="http://cl.wo.cn/stockmanagement-bi/file/model_16.rar" download="终端换机预测模型.rar">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-16" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">终端换机概率预测模型（电商）</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					把握用户换机频率，提高终端推荐的成功率。
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					移网B域、移网O域。
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>				
				<p class="p1">
					根据换机用户历史情况识别出不同特征(年龄/网龄/ARPU/历史换机次数/访问电商APP次数等)用户的实际换机概率（换机用户/整体用户），预测用户下个账期换机概率，依照所预测用户与历史换机用户特征相同，取历史换机用户的换机概率为该用户下个账期的换机概率。
				</p>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					手机号码、换机概率。
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					总部统一建模，数据下发省分。
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					终端+合约套餐业务
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					模型已经应用生产，形成概率标签，有需要的省分可以申请下发数据。
				</p>
				<p class="p1">
					<strong>8.算法</strong>
				</p>
				<p class="p1">
					协同过滤
				</p> 
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao" onclick="toExport(16);" href="http://cl.wo.cn/stockmanagement-bi/file/model_16.rar" download="终端换机预测模型.rar">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-17" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">终端换机导购推荐模型（电商）</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					根据用户终端喜好，向用户推荐合适终端。
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					移网B域、移网O域。
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>				
				<p class="p1">
					从购机客户的年龄、购机客户来源、购机品牌、价格选择倾向、购机选择原因、客户购机成交时机及消费渠道等多个角度进行建模分析匹配营销，采用神经网络，K-Neighbors，决策树，集成学习等算法，覆盖用户换机影响因素。
				</p>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					手机号码、推荐机型。
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					总部统一建模，数据下发省分。
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					最佳匹配终端列表。
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					模型已经开发完毕，等待生产。
				</p>
				<p class="p1">
					<strong>8.算法</strong>
				</p>
				<p class="p1">
					协同过滤
				</p> 
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao" onclick="toExport(16);" href="http://cl.wo.cn/stockmanagement-bi/file/model_16.rar" download="终端换机预测模型.rar">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-18" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">APP偏好模型（电商）</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					分析用户的偏好特征，进行用户APP画像。
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					上网日志。
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>				
				<p class="p1">
					根据用户活跃月份数，流量等特征字段分析用户的偏好特征及偏好程度。用户的偏好特征分为三大类：社交类，功能类和喜好类。
				</p>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					手机号码，分类app。
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					每月获取数据，进行用户画像分析。
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					可进行更细粒度的偏好细分。
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					模型正常生产。
				</p>
				<p class="p1">
					<strong>8.算法</strong>
				</p>
				<p class="p1">
					分类
				</p> 
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao" onclick="toExport(18);">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-19" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">用户敏感度分类模型（电商）
				</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					对通讯产品敏感度不同的用户，会做出不同的消费抉择。价格敏感型：寻求低价、便宜套餐；服务敏感性：注重服务质量体验；品牌敏感性：从众心理。
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					移网B域数据、移网O域数据。
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>				
				<p class="p1">
					根据用户的ARPU值、终端品牌价值、用户的职业、年龄、内容偏好行为、权益偏好行为，综合评定用户的敏感度类型。
				</p>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					手机号码、用户敏感类型。
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					总部+省分实施。
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					不同敏感度的用户，采取针对性的营销策略。
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					新模型概念，处于模型研发阶段。
				</p>
				<p class="p1">
					<strong>8.算法</strong>
				</p>
				<p class="p1">
					分类、聚类
				</p> 
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao" onclick="toExport(19);" href="http://cl.wo.cn/stockmanagement-bi/file/model_19.rar" download="用户敏感度分群模型.rar">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-20" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">商业兴趣标签（兴趣点标签）模型（数据中心）
				</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					通过信令数据分析用户的兴趣点，是分析用户出行、消费、职业行为等重要数据。
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					信令数据。
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>				
				<p class="p1">
					1、爬取全国地图的位置点标签（教育-大学、旅游-景点、日常-超市、旅游-酒店、交通-地铁站。。。）</p>
<p class="p1">2、统计用户信令数据中各兴趣点的开始时间、停留时间、次数、兴趣点位置，作为该用户的兴趣点标签。
				</p>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					手机号码、兴趣点兴趣点的开始时间、停留时间、次数、兴趣点位置。
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					总部统一实施。
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					-
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					模型未开发。
				</p>
				<p class="p1">
					<strong>8.算法</strong>
				</p>
				<p class="p1">
					分类
				</p> 
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao" onclick="toExport(19);" href="http://cl.wo.cn/stockmanagement-bi/file/model_19.rar" download="用户敏感度分群模型.rar">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-21" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">长期漫游用户识别模型（数据中心）
				</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					长期漫游用户多套餐不匹配、极易离网，识别长期漫游用户并对其制定合理的套餐方案，提升企业保有。
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					业务数据。
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>				
				<p class="p1">
					对近月漫游语音、流量占比均超过80%的用户计为长期漫游用户。
				</p>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					手机号码。
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					总部统一实施。
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					-
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					模型未开发。
				</p>
				<p class="p1">
					<strong>8.算法</strong>
				</p>
				<p class="p1">
					统计类
				</p> 
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao" onclick="toExport(19);" href="http://cl.wo.cn/stockmanagement-bi/file/model_19.rar" download="用户敏感度分群模型.rar">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-22" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">用户稳定度模型（数据中心）</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					提高用户稳定度对于预防高价值用户流失，降低用户入网成本，提升用户保有率等意义重大。
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					业务数据、信令数据、上网日志、缴费欠费数据、实名制数据、语音详单。
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>	
				<p class="p1">
					1、从出账用户的交往圈变化情况，出账收入、语音、流量等使用变化情况，入网时长，年龄，语音流量饱和度，以及APP使用情况等综合评判。</p> 
<p class="p1">2、依据稳定度历史情况，使用随机森林方法建模，预测当期用户稳定度。</p> 
<p class="p1">3、用户观察窗口期为6个月，T+12日输出模型数据。
				</p> 
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					手机号码、稳定度评分。
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					总部统一实施，下发到各省分公司。
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					针对性业务营销，挽留高价值低稳定度用户。
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					模型正常生产，12号下发。
				</p>
				<p class="p1">
					<strong>8.算法</strong>
				</p>
				<p class="p1">
					分类
				</p> 
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao" onclick="toExport(22);" href="http://cl.wo.cn/stockmanagement-bi/file/model_22.rar" download="用户离网预警模型.rar">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-23" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">离网成因分析（数据中心）</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					针对低稳定度用户，通过用户流失动因分析，明确用户流失原因，根据不同流失动因制定相应的营销策略，实现精准营销。
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					业务数据、信令数据、上网日志、缴费欠费数据、实名制数据、语音详单。
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>	
				<p class="p1">
					1、从潜在流失用户的交往圈变化情况，出账收入、语音、流量等使用变化情况，入网时长，语音流量饱和度，是否双卡以及APP使用情况等综合评判。</p>
<p class="p1">2、结合上述数据，分别针对不同动因构建逻辑回归模型，判断用户流失动因。</p>
<p class="p1">3、用户观察窗口期为1个月，T+12日输出模型数据。
				</p>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					手机号码、流失原因。
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					总部统一实施，下发到各省分公司。
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					根据用户流失动因制定营销策略。Eg:对于套餐过时用户，推荐办理合适新套餐。
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					模型正常生产，12号下发。
				</p>
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao" onclick="toExport(23);">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-24" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">宽带流失预警（电商）</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					根于历史宽带离网用户和未离网用户的相关属性特征，进行数理分析，从而固化下预测模型，根据导入用户当前属性特征，达到预测用户在未来一个周期内的离网行为发生概率。
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					宽带B侧数据。
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>	
				<p class="p1">
					筛选是否固移融合、是否订购IPTV、出账费用、账户余额、接入类型、生命周期、下行流量等特征字段作为关键因子，采用，决策树，随机森林，逻辑回归三种数理统计模型，分别对历史数据进行导入分析，固化分类模型；通过训练，预测，验证几个阶段，不断调参，提高查全，查准率；再导入当前在网用户的关键因子数据，对每个用户在之后未来3个月内离网的概率分别作出预测；筛选出离网概率较高的用户作为离网高危用户进行输出。
				</p>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					宽带账户、离网概率、联系电话等。
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					总部统一实施，结果下发省分。
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					优惠续约、填充IPTV、融合产品推荐。
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					已周期生产，不断迭代，周期性数据结果下发省分。
				</p>
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao" onclick="toExport(22);">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-25" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">宽带合约到期提醒模型（电商）</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					用户离网行为在，宽带到期时间点上发生的概率非常高，所以及时掌握用户宽带合约到期时间，在到期的前3月、前2个月直至到期当月进行维系操作，对维系的及时性必要性都是较高的时期。
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					固网B域数据、移网B域数据。
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>	
				<p class="p1">
					由固网、移网B域数据，查询出用户的单宽带合约到期时间、结合移网B域数据，计算融合套餐合约的到期时间 T；用当前账期时间减去到期时间T，计算用户的生命周期；再筛选出，生命周期分别在T-3，T-2，T-1内的用户宽带账号，结合联系方式等信息，形成维系清单。
				</p>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					宽带账号、联系电话、合约时间、是否单宽带、是否融合、生命周期 等。
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					总部统一实施，结果下发省分。
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					宽带续约优惠、单宽转融合产品         。
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					已周期性生产，周期性下发省分。
				</p>
				<p class="p1">
					<strong>8.算法</strong>
				</p>
				<p class="p1">
					统计类
				</p> 
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao" onclick="toExport(22);">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-26" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">移网流失预警模型（电商）</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					针对存量过程中的用户流失痛点，提前进行流失预警，增加用户保有的几率。
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					移网B侧数据、移网O域数据。
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>				
				<div class="data"><img src="img/model/model_2.png"></div>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					手机号码。
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					总部建模，数据下发省分
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					存费送费、权益赠送等用户保有和维系策略
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					模型正常生产，每月通过FTP方式下发省分。
				</p>
				<p class="p1">
					<strong>8.算法</strong>
				</p>
				<p class="p1">
					分类
				</p> 
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao" onclick="toExport(26);">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-27" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">用户流失去向模型（数据中心）</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					通过客户离网去向的细分及其流失前行为观察，进一步完善用户的长效机制，从而降低用户离网率。
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					语音详单，实名制数据。
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>				
				<p class="p1">
					根据用户语音通话及短信详单为每个用户生成呼叫指纹，将新入网用户的呼叫指纹与老用户的呼叫指纹进行相似度匹配，判断其流失去向。
				</p>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					手机号码。
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					总部统一实施，下发到各省分公司
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					-
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					模型正常生产。
				</p>
				<p class="p1">
					<strong>8.算法</strong>
				</p>
				<p class="p1">
					分类
				</p> 
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao" onclick="toExport(28);">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-28" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">运营收入预测模型（数据中心）</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					根据用户日计费收入预测用户本月出账收入，提前发现单月出账收入异动，快速制定相应策略。
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					业务汇总数据。
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>				
				<p class="p1">
					1、以累计计费收入、第三日出账收入、累计新发展用户数数据为基础。</p>
<p class="p1">2、以上述数据为基础建立多元线性回归模型，预测当月出账收入。
				</p>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					当月出账收入预测值。
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					-
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					提前发现问题，快速做出反应。
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					开发完成，未有生产。
				</p>
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao" onclick="toExport(28);">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-29" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">国际漫游潜在用户模型（数据中心）</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					对有国际漫游需求的用户，开展相应产品营销措施
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					业务数据、信令数据
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>				
				<p class="p1">
					1、已有国际漫游、未有办理相应产品的用户 </p>
					<p class="p1">2、有国际出行的用户：最后的信令记录出现在机场、轮船、后续1天未有信令记录的用户
				</p>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					手机号号码
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					总部统一实施
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					-
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					模型未开发
				</p>
				<p class="p1">
					<strong>8.算法</strong>
				</p>
				<p class="p1">
					统计类
				</p> 
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao" onclick="toExport(28);">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-30" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">疑似亲属模型（电商）</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					通过不同时间段的语音通话关系分析定位本网手机用户的交际圈关系，包括：本异网号码的亲密远近关系，识别出用户的家庭圈亲属关系，进而实现对家庭中，（疑似）父子，父女，兄弟姐妹，夫妻等家属关系对进行识别输出。
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					移网B域数据
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>				
				<p class="p1">
					通过工作日、节假日不同权重的通话频次和时长分值、判定有语音通话的相关人员之间的紧密度，在亲密度TOP10的范围内，再根据入网资料、位置距离、性别，年龄，姓氏等，推测本异网用户的之间是否存在家庭关系，已经家庭关系具体为，父子，母女，兄弟姐妹，夫妻等种的哪种
				</p>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					手机号号码、疑是亲属号码、疑似的亲属关系
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					总部模型生产，结果下发省分
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					异网营销、本网2升4、融合套餐等、亲情付、异地副卡等业务
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					模型数据已周期性生产并下发省分
				</p>
				<p class="p1">
					<strong>8.算法</strong>
				</p>
				<p class="p1">
					分类
				</p> 
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao" onclick="toExport(28);">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-31" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">融合潜在用户识别模型（数据中心）</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					识别对融合业务有需求，适用融合业务的非融合业务用户。
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					语音、短信详单、实名制数据、终端数据、实名制数据
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>				
				<p class="p1">
					从用户入网的通话时长、频次、来去电情况、流量使用模式、流量包使用情况、出账情况等，判断用户是否有融合业务的需求，可发展为融合用户。
				</p>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					手机号码，是否为潜在融合用户。
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					总部统一实施，下发到各省分公司
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					精准营销融合业务产品。
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					模型正常生产。
				</p>
				<p class="p1">
					<strong>8.算法</strong>
				</p>
				<p class="p1">
					-
				</p> 
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao" onclick="toExport(28);">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-32" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">冰激凌产品推荐模型（数据中心）</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					冰激凌套餐开通老用户转套餐业务后，为了有效营销潜在冰激凌用户，故建立冰激凌潜在用户识别模型
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					业务数据、上网日志
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>				
				<p class="p1">
					1、从出账用户的交往圈变化情况，出账收入、语音、流量等使用情况，入网时长，年龄，语音流量饱和度，以及APP使用情况等综合评判</p>
					<p class="p1">2、结合上述数据，分别针对不同的冰激凌套餐（全国、省分…）构建多元逻辑回归模型，对潜在冰激凌用户推荐合适套餐
				</p>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					手机号码、推荐办理的冰激凌套餐产品
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					总部统一实施，下发到各省分公司
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					对不同类冰激凌潜在用户实行精准营销
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					模型正常生产，T+15日真实发展用户数据
				</p>
				<p class="p1">
					<strong>8.算法</strong>
				</p>
				<p class="p1">
					-
				</p> 
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao" onclick="toExport(28);">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-33" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">流量特征模型（数据中心）</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					分析用户的日流量使用情况，标识用户的流量使用是否稳定。
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					业务数据
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>				
				<p class="p1">
					该模型包含用户的流量日数据，由日数据可分析用户的流量使用波动情况，由标准差和变异系数可知用户的流量使用是否平稳，如用户在月初使用了大量流量，月末几乎不使用流量，则说明该用户的流量使用情况是不平稳的。
				</p>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					手机号码
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					总部统一实施
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					对流量使用不稳定用户，特别是月初流量消耗大的可对其建议升级套餐
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					模型正常生产
				</p>
				<p class="p1">
					<strong>8.算法</strong>
				</p>
				<p class="p1">
					分类
				</p> 
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao" onclick="toExport(28);">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-34" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">位置轨迹标签（数据中心）</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					通过信令数据分析用户的常用轨迹，是分析用户出行等重要数据
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					信令数据
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>				
				<p class="p1">
					1、统计用户每天信令数据中各位置点的开始时间、停留时间、基站位置，即为用户每天的位置序列</p>
					<p class="p1">2、利用最大公共子序列的计算两天位置序列的相似度</p>
					<p class="p1">3、通过轨迹聚类获取本月用户各聚类点的公共序列，作为用户的常用轨迹
				</p>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					手机号码、常用轨迹TOP3
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					总部统一实施
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					-
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					模型未开发
				</p>
				<p class="p1">
					<strong>8.算法</strong>
				</p>
				<p class="p1">
					-
				</p> 
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao" onclick="toExport(28);">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-35" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">用户婚恋状态标签（数据中心）</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					通过中国联通手机用户的APP使用情况和用户通话行为分析用户是否为已婚状态
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					业务数据、上网日志
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>				
				<p class="p1">
					从用户入网的通话时长、频次、通话主被叫情况；</p>
					<p class="p1">上网内容、APP使用情况等综合评判。</p>
					<p class="p1">用户观察窗口期为3个月
				</p>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					手机号码，用户婚恋标签
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					-
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					有相亲需求目标用户精准营销
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					模型已开发完成
				</p>
				<p class="p1">
					<strong>8.算法</strong>
				</p>
				<p class="p1">
					-
				</p> 
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao" onclick="toExport(28);">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-36" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">用户财产模型（数据中心）</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					反映用户财产状况，用户是否有车辆、房产。
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					上网日志、信令数据
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>				
				<p class="p1">
					通过用户使用车辆养护、违章查询、地图导航等类别app的情况，搜索、浏览或购买汽车用品情况，及出现在高速路范围内的时段、频次等情况，综合判断用户是否有车；</p>
					<p class="p1">通过用户使用装修类、家居类等类别app或浏览相关网页的情况，及搜索、浏览或购买装修、家居等类型商品的情况，较长时间内工作日非工作时段驻留地点的稳定性，综合判断用户是否有房。</p>
				</p>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					手机号码、是否有车、是否有房。
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					总部统一实施，下发到各省分公司
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					-
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					模型正常生产
				</p>
				<p class="p1">
					<strong>8.算法</strong>
				</p>
				<p class="p1">
					-
				</p> 
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao" onclick="toExport(28);">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-37" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">购车意向模型（数据中心）</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					推算用户近期购买车辆的概率。
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					上网日志数据
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>				
				<p class="p1">
					通过对用户搜索、浏览汽车发售，二手车专卖等相关的网页情况，下载、使用汽车类app情况，致电汽车销售平台或接听汽车平台电话等行为分析，推算用户近期购买车辆的概率。
				</p>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					手机号码、购车意向指数。
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					总部统一实施，下发到各省分公司
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					-
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					模型正常生产
				</p>
				<p class="p1">
					<strong>8.算法</strong>
				</p>
				<p class="p1">
					分类
				</p> 
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao" onclick="toExport(28);">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-38" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel">用户职住模型（数据中心）</h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1">
					<strong>1.模型场景</strong>
				</p>
				<p class="p1">
					用户的居住地、工作地。
				</p> 
				<p class="p1">
					<strong>2.数据输入</strong>
				</p>
				<p class="p1">
					信令数据
				</p>
				<p class="p1">
					<strong>3.模型思路</strong>
				</p>				
				<p class="p1">
					统计用户工作时段（工作日白天9-12、14-17）、非工作时段（晚上18-22）驻留时间最长的位置，标记为用户的工作地与居住地。
				</p>
				<p class="p1">
					<strong>4.数据输出</strong>
				</p>
				<p class="p1">
					手机号码、居住地、工作地。
				</p>
				<p class="p1">
					<strong>5.实施方式</strong>
				</p>
				<p class="p1">
					总部统一实施，下发到各省分公司
				</p>
				<p class="p1">
					<strong>6.营销建议</strong>
				</p>
				<p class="p1">
					-
				</p>
				<p class="p1">
					<strong>7.应用阶段</strong>
				</p>
				<p class="p1">
					模型正常生产
				</p>
				<p class="p1">
					<strong>8.算法</strong>
				</p>
				<p class="p1">
					-
				</p> 
			</div>
<!-- 			<div class="button-box" style="margin-top:0px"> -->
<!-- 				<a class="button baocun">模型应用</a> -->
<!-- 				<a class="button quxiao" onclick="toExport(28);">模型下载</a> -->
<!-- 		    </div> -->
		</div>
	</div>
	<div class="moxing-window window-" >
		<div class="box">
			<div class="modal-header">
				<h3 id="myModalLabel"></h3>
				<a class="close" data-dismiss="modal" aria-hidden="true"href="javascript:void();"><i class="fa fa-times"></i></a>
			</div>
			<div class="wenben">
				<p class="p1"></p>
				<p class="p1"></p>
				<div class="data"><img src="img/moxing.png"></div>
			</div>
			<div class="button-box" style="margin-top:0px">
				<a class="button baocun">模型应用</a>
				<a class="button quxiao">模型下载</a>
		    </div>
		</div>
	</div>
	
	
	<!-- 弹窗 -->
	<script>
		$(".moxing-window-btn-1").on("click", function(e) {
			$(".window-1").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		}); 
		$(".moxing-window-btn-2").on("click", function(e) {
			$(".window-2").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-3").on("click", function(e) {
			$(".window-3").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-4").on("click", function(e) {
			$(".window-4").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-5").on("click", function(e) {
			$(".window-5").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-6").on("click", function(e) {
			$(".window-6").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-7").on("click", function(e) {
			$(".window-7").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-8").on("click", function(e) {
			$(".window-8").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-9").on("click", function(e) {
			$(".window-9").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-10").on("click", function(e) {
			$(".window-10").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-11").on("click", function(e) {
			$(".window-11").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-12").on("click", function(e) {
			$(".window-12").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-13").on("click", function(e) {
			$(".window-13").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-14").on("click", function(e) {
			$(".window-14").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-15").on("click", function(e) {
			$(".window-15").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-16").on("click", function(e) {
			$(".window-16").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-17").on("click", function(e) {
			$(".window-17").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-18").on("click", function(e) {
			$(".window-18").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-19").on("click", function(e) {
			$(".window-19").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-20").on("click", function(e) {
			$(".window-20").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-21").on("click", function(e) {
			$(".window-21").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-22").on("click", function(e) {
			$(".window-22").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-23").on("click", function(e) {
			$(".window-23").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-24").on("click", function(e) {
			$(".window-24").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-25").on("click", function(e) {
			$(".window-25").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-26").on("click", function(e) {
			$(".window-26").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-27").on("click", function(e) {
			$(".window-27").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-28").on("click", function(e) {
			$(".window-28").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-29").on("click", function(e) {
			$(".window-29").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-30").on("click", function(e) {
			$(".window-30").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-31").on("click", function(e) {
			$(".window-31").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-32").on("click", function(e) {
			$(".window-32").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-33").on("click", function(e) {
			$(".window-33").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-34").on("click", function(e) {
			$(".window-34").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-35").on("click", function(e) {
			$(".window-35").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-36").on("click", function(e) {
			$(".window-36").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-37").on("click", function(e) {
			$(".window-37").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		$(".moxing-window-btn-38").on("click", function(e) {
			$(".window-38").show();

			$(".close").on("click", function() {
				$(".moxing-window").hide();
			});
		});
		function toExport(code){
			$.ajax({
		        url : "model/exportLog.do",
		        type : 'post',
		        async:false, 
		        data :{"pageCode" : code},
		        dataType:"json",
		        success :function (result) {
		        }
			});
		}
	</script>
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