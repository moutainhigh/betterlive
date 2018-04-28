<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
		<meta content="telephone=no" name="format-detection">
		<meta content="email=no" name="format-detection">
		<link rel="stylesheet" href="${resourcepath}/weixin/css/common.css" />
	    <link rel="stylesheet" href="${resourcepath}/weixin/css/myCoupon.css" />
	    
		<script type="text/javascript" src="${resourcepath}/weixin/js/rem.js"></script>
		<script type="text/javascript" src="${resourcepath}/admin/js/application.js"></script>
		<title>挥货-我的优惠券</title>
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
		<input type="hidden" id="SERVER_TIME" name="SERVER_TIME" readonly="readonly" value="${now.getTime()}" />
		<script src="${resourcepath}/weixin/js/refresh.js"></script>
		<div class="container">
			<div class="header">
				<a href="${mainserver}/weixin/index">
					<img src="${resourcepath}/weixin/img/huihuo-logo.png" alt="" />
				</a>
				<a href="javascript:void(0)" class="searchBox"></a>
				<a href="javascript:void(0)" class="shopCar">
				<span class="totNums<c:if test="${cartCnt >0}"> totNums_sp</c:if>"><c:if test="${cartCnt >0}">${cartCnt }</c:if></span>
				</a>
				<div class="search-frame" style="z-index: 9">
					<span>
						<i></i>
						<input type="search" placeholder="请输入商品名称进行搜索" id="productName"/>
					</span>
					<em>取消</em>
				</div>
			</div>
			<div class="mainBox">
				<div class="couponBox">
					<c:forEach items="${listSingleCoupon}" var="s">	
						<div class="coupon">
						<div class="valid-left">
							<div class="va-top">
								<p class="va-title">挥货优惠红包</p>
								<p class="validity">有效期至 ${s.endTime}</p>
							</div>
							<div style="margin-top:-18px;">
								  仅限单品(${s.product_name })使用
							</div>
							<div class="va-bot">
								<p>仅限用户${s.mobile}使用</p>
							</div>
						</div>
						<div class="valid-right">
							<p class="figure"><em>¥</em><fmt:formatNumber type="number" value="${s.couponMoney }" pattern="0" maxFractionDigits="0"></fmt:formatNumber></p>
							<p class="usable">满<fmt:formatNumber type="number" value="${s.fullMoney }" pattern="0" maxFractionDigits="0"></fmt:formatNumber>可用</p>
						</div>
					</div> 
					</c:forEach>
					<c:forEach items="${listCustomerCoupon}" var="l">
						<div class="coupon">
							<div class="valid-left">
								<div class="va-top">
									<p class="va-title">
										<c:choose>
											<c:when test="${l.coupon_from == 1}">${l.coupon_name }</c:when>
											<c:when test="${l.coupon_from == 2}">挥货优惠红包</c:when>
										</c:choose>
									</p>
									<p class="validity">有效期至${l.endtime}</p>
								</div>
								<div class="va-bot">
									<p>仅限用户${l.mobile}使用</p>
								</div>
							</div>
							<div class="valid-right">
								<p class="figure"><em>¥</em>${l.coupon_money}</p>
								<p class="usable">满${l.start_money}可用</p>
							</div>
						</div>
					</c:forEach>
					
					<!-- <div class="coupon">
						<div class="valid-left">
							<div class="va-top">
								<p class="va-title">挥货优惠红包</p>
								<p class="validity">有效期至 2017-03-10</p>
							</div>
							<div class="va-bot">
								<p>仅限用户15924566909使用</p>
							</div>
						</div>
						<div class="valid-right">
							<p class="figure"><em>¥</em> 5</p>
							<p class="usable">满50可用</p>
						</div>
					</div>  -->
				</div>
				<a href=" ${mainserver}/weixin/customercoupon/toCustomerCoupon?notusecoupon=2" class="check-coupon">查看无效券</a>
				<c:if test="${empty listCustomerCoupon }">
					<div class="no-coupon">
						<div class="no-coupon-img"><img src="${resourcepath}/weixin/img/no-coupon.png" alt="" /></div>
						<p>暂时没有优惠券</p>
					</div>
				</c:if> 	 	
			</div>
		</div>
		<div class="mask" style="z-index: 8"></div>
		<div style="display: none;">
			<form id="form2" action="${mainserver}/weixin/search" method="post">
				<input  id="searchName" name="productName" readonly="readonly">
			</form>
		</div>
	</body>
	
	<script src="${resourcepath}/weixin/js/jquery-2.1.1.min.js"></script>
	<script src="${resourcepath}/weixin/js/common.js"></script>
	
	<script type="text/javascript">
		$(function(){
			$('.backPage').click(function(){
				window.history.go(-1);
			});
			

			$('.shopCar').click(function(){
				window.location.href='${mainserver}/weixin/shoppingcart/toshoppingcar';
			});
		});
		

		$(function(){
			$('.footer li').click(function(){
				$(this).addClass('active').siblings('li').removeClass('active');
			});
			
			//queryProducts();
			
			
		});
		
		
	</script>
</html>	