<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="now" class="java.util.Date" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
		<meta content="telephone=no" name="format-detection">
    	<meta content="email=no" name="format-detection">
    	<meta name="keywords" content="挥货,挥货商城,电子商务,网购,电商平台,厨房,农产品,绿色,安全,土特产,健康,品质" /> 
		<meta name="description" content="挥货，你的美食分享平台" /> 
    	<link rel="stylesheet" href="${resourcepath}/weixin/css/common.css" />
    	<link rel="stylesheet" href="${resourcepath}/weixin/css/index.css?Version=201709041149" />
    	<script src="${resourcepath}/weixin/js/rem.js"></script>
    	<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    	<title>挥货-你的美食分享平台</title>
    	<script type="text/javascript">
    		var mainServer = '${mainserver}';
    		var _hmt = _hmt || [];
			(function() {
			  var hm = document.createElement("script");
			  hm.src = "https://hm.baidu.com/hm.js?d2a55783801cf33b1c198d5ebd62ec3d";
			  var s = document.getElementsByTagName("script")[0]; 
			  s.parentNode.insertBefore(hm, s);
			})();
    	</script>
	</head>
	
	<body>
		<div class="indexbg" style="display: none;"></div>
		<div class="linghbbg" style="display: none;">
			<a class="guanbi" href="javascript:closeDownTip();">
				<img src="${resourcepath}/weixin/img/hbxx.png" alt=""/>
			</a>
			<span id="showContent"></span>
			<a class="dowapp" href="javascript:toGoodsDetail();">立即购买</a>
		</div>
		<div class="dowbox_manjian" style="background:url(${operationVo.operationBanner}) no-repeat center top;background-size:100% 100%;">
	 		
		</div>
		<div class="dowbox_bottom"> 
			<div class="dowcent">
				<div class="shujibox">
					<input type="text" id="mobilePhone" placeholder="请输入手机号码"/> 
				</div>
				<div class="dowanniu">
					<a href="javascript:register();">立即参与</a>
				</div>
				<span class="lingtishi">领券后可直接购买，新版上线优惠多多</span>
				<div class="baokuanbox" style="padding-left: 0.55rem;"> 
					<h3><img src="${resourcepath}/weixin/img/down_xiegang.png" alt="" style="width:1.7rem;height:0.26rem;margin:0 auto;margin-top:0.18rem;"/></h3>
					<div id="productsShow">
					</div>
				</div>
			</div>
		</div>
		
		 <div class="vaguealert">
			<p></p>
		 </div>
	</body>
	
	
	<script src="${resourcepath}/weixin/js/jquery-2.1.1.min.js"></script>
	<script src="${resourcepath}/weixin/js/common.js"></script> 
 	<script>
 		var hasCouponFlag = 0;
 		var regFlag = 0;
 		var operationType = "${operationVo.operationType}";
 		var sourceType = null;
		$(function(){
			
			queryLikeProducts();
			
			sourceType = navigator.userAgent;
			
			var url = window.location.href;
			if(url.indexOf("#")!=-1){
				url = url.substring(0,url.indexOf("#"));
			}
			
			$.ajax({
				url : 'http://www.hlife.shop/huihuo/weixin/shareWeixin',
				data:{
					"url":url,
				},
				type : 'post',
				dataType : 'json',
				success : function(data) {
					wx.config({
					    debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
					    appId: data.shareInfo.appId, // 必填，公众号的唯一标识
					    timestamp: data.shareInfo.timestamp, // 必填，生成签名的时间戳
					    nonceStr: data.shareInfo.nonceStr, // 必填，生成签名的随机串
					    signature: data.shareInfo.signature,// 必填，签名，见附录1
					    jsApiList: [ // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
							'onMenuShareTimeline',
							'onMenuShareAppMessage',
							'onMenuShareQQ'
					    ]
					});
				},
				error : function(data) {
					return false;
				}
			});
	});
	
	var title = "挥货 - 你的美食分享平台";  
	var desc = "新人专享，优惠不停。";
	var link = 'http://www.hlife.shop/huihuo/weixin/operation/toRegisterByOperation?operationId=${operationVo.operationId}&source=${regSource}';
	var imgUrl = "http://www.hlife.shop/huihuo/resources/weixin/img/huihuologo.png";

	// config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
	wx.ready(function(){
		// 监听“分享到朋友圈”按钮点击、自定义分享内容及分享结果接口
		wx.onMenuShareTimeline({
		  	title: desc,
		  	desc: desc,
		  	link: link,
		  	imgUrl: imgUrl,
		  	trigger: function (res) {
		    	// 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
		    	//alert('用户点击分享到朋友圈');
		 	},
		  	success: function (res) {
		    	//alert('已分享');
		  	},
		  	cancel: function (res) {
		    	//alert('已取消');
		  	},
		  	fail: function (res) {
		    	alert(JSON.stringify(res));
		  	}
		});
		  
		// 监听“分享给朋友”按钮点击、自定义分享内容及分享结果接口
		wx.onMenuShareAppMessage({
			title: title,
		  	desc: desc,
		  	link: link,
		  	imgUrl: imgUrl,
		  	trigger: function (res) {
		    	// 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
		    	//alert('用户点击分享到朋友圈');
		 	},
		  	success: function (res) {
		    	//alert('已分享');
		  	},
		  	cancel: function (res) {
		    	//alert('已取消');
		  	},
		  	fail: function (res) {
		   // 	alert(JSON.stringify(res));
		    	alert(JSON.stringify(res));
		  	}
		});
		
		// 监听“分享给朋友”按钮点击、自定义分享内容及分享结果接口
		wx.onMenuShareQQ({
			title: title,
		  	desc: desc,
		  	link: link,
		  	imgUrl: imgUrl,
		  	trigger: function (res) {
		    	// 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
		    	//alert('用户点击分享到朋友圈');
		 	},
		  	success: function (res) {
		    	//alert('已分享');
		  	},
		  	cancel: function (res) {
		    	//alert('已取消');
		  	},
		  	fail: function (res) {
		  		alert(JSON.stringify(res));
		  	}
		});
	});
	
	function toGoodsDetail(){
		var productId = "${productId}";
		var speicalId = "${speicalId}";
		var speicalType = "${speicalType}";
		if(operationType == 1 || operationType == 3 || productId == null || parseFloat(productId) <= 0){
			window.location.href=mainServer+"/weixin/index";
		}else if(speicalType==null || parseFloat(speicalType)  <= 0){	//普通商品                                                               
			window.location.href=mainServer+'/weixin/product/towxgoodsdetails?productId='+productId;
		}else if(speicalType==3){	//团购                                                               
			window.location.href=mainServer+'/weixin/product/toGroupGoodsdetails?productId='+productId+'&specialId='+specialId;
		}else if(speicalType==2){	//限量抢购                                                               
			window.location.href=mainServer+'/weixin/product/toLimitGoodsdetails?productId='+productId+'&specialId='+specialId;
		}else{
			alert("参数错误");
		}
	}
		
		function queryLikeProducts(){
			$.ajax({                                       
				url:'${mainserver}/weixin/product/queryLikeProducts',
				type:'post',
				data:{
					"proIds":"${operationVo.linkPro}"
				},
				dataType:'json',
				success:function(data){
					if(data.code == "1010"){ //获取成功
						if(data.data == null || data.data.length <= 0){
							return;
						}
						var list = data.data;
						for (var continueIndex in list) {
							if(isNaN(continueIndex)){
								continue;
							}
							var productVo = list[continueIndex];
							
// 							var shareExplain = "";
// 							if(productVo.share_explain != null){
// 								shareExplain = productVo.share_explain;
// 								if(shareExplain.length > 25){
// 									shareExplain = shareExplain.substring(0, 25)+"...";
// 								}
// 							}
// 							var showLabel="";
// 							if(productVo.labelName != null && productVo.labelName != ""){
// 								showLabel = "<p>"+productVo.labelName+"</p>"; 
// 							}

							var showMoneyLine = "";
							if(productVo.activityPrice != null && productVo.activityPrice != "" && parseFloat(productVo.activityPrice) >= 0){
								showMoneyLine = "￥"+checkMoneyByPoint(productVo.activityPrice)
											 + "<strong>￥"+checkMoneyByPoint(productVo.price)+"</strong>";
							}else if(productVo.discountPrice != null && productVo.discountPrice != "" && parseFloat(productVo.discountPrice) >= 0){
								showMoneyLine = "￥"+checkMoneyByPoint(productVo.discountPrice)
								 + "<strong>￥"+checkMoneyByPoint(productVo.price)+"</strong>";
							}else{
								showMoneyLine = "￥"+checkMoneyByPoint(productVo.price);
							}
							var clsPosition = "left";
							if(continueIndex % 2 == 0){
								clsPosition = "right";
							}
							var proName = productVo.product_name;
							if(proName.length > 8){
								proName = proName.substring(0, 8)+"...";
							}
							
							var local = "${mainserver}/weixin/product/towxgoodsdetails?productId="+productVo.product_id;
							if(productVo.activityType == 2){ //限量抢购
								local = "${mainserver}/weixin/product/toLimitGoodsdetails?productId="+productVo.product_id+"&specialId="+productVo.activity_id;
							}else if(productVo.activityType == 3){ //团购
								local = "${mainserver}/weixin/product/toGroupGoodsdetails?specialId="+productVo.activity_id+"&productId="+productVo.product_id;
							}
							
							var showHtml='<div class="'+clsPosition+'" onclick="location.href=\''+local+'\'">'
										+'	<span>'
										+'		<img src="'+productVo.product_logo+'" alt="" />'
										+'	</span>'
										+'	<p>' + proName + '</p>'
										+'	<p class="bkjiage">'+showMoneyLine+'</p>'
										+'</div>'
							
							$("#productsShow").append(showHtml);
						}
					}else{
						showvaguealert("出现异常");
					}
				},
				failure:function(data){
					showvaguealert('出错了');
				}
			});
		}
	
		function checkReg(){
			if(operationType == 1 || operationType == 2){
				var couponType = "优惠券";
				if(operationType == 2){
					couponType == "红包";
				}
				if(hasCouponFlag == 0){
					$(".dowapp").html("去领取");
					$(".dowapp").attr("href", "javascript:closeDownTip();");
					$("#showContent").html("您尚未领取"+couponType+"，领券后进入商城使用更划算哦");
				}else{
					$("#showContent").html("您已领取"+couponType+"，进入商城享受优惠吧");
				}
			}else if (operationType == 3){
				if(regFlag == 1){
					$("#showContent").html("海量优惠券等你来拿，单张金额最高可达88元");
				}else{
					$(".dowapp").html("立即参与");
					$(".dowapp").attr("href", "javascript:closeDownTip();");
					$("#showContent").html("您尚未验证手机号~");
				}
			}
			showDownTip();
		}
		
		function register(){
	 		if(hasCouponFlag == 1 || regFlag == 1){
	 			checkReg();
	 			return;
	 		}
			var mobilePhone = $("#mobilePhone").val();
			if(mobilePhone == null || mobilePhone == ""){
				showvaguealert('请输入手机号码');
				return;
			}
			
			if(!(/^((1[0-9]{2})+\d{8})$/.test(mobilePhone))){ 
				  showvaguealert('手机号码格式错误');
				  return;
			}
			
			$.ajax({                                       
				url:'${mainserver}/weixin/operation/registerByOperation',
				data:{
					"operationId":"${operationVo.operationId}",
					"mobile": mobilePhone,
					"source":"${regSource}"
				},
				type:'post',
				dataType:'json',
				success:function(data){
						if(data.flag == 1 || data.flag == 2){
							$("#mobilePhone").hide();
							if(operationType == 1 || operationType == 2){
								hasCouponFlag = 1;
							}else if(operationType == 3){
								regFlag = 1;
							}
							$("#showContent").html(data.msg);
							showDownTip();
						}else{
							showvaguealert(data.msg);
						}
				},
				failure:function(data){
					showvaguealert('出错了');
				}
			});
		}
		
		function showDownTip(){
			$(".indexbg").show();
			$(".linghbbg").show();
		}
		
		function closeDownTip(){
			$(".indexbg").hide();
			$(".linghbbg").hide();
			$(".dowapp").html("立即购买");
			$("#showContent").html("");
			$("#mobilePhone").focus();
		}
 	</script>
</html>