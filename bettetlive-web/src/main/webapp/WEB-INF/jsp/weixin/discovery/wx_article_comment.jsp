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
		<link rel="stylesheet" type="text/css"href="${resourcepath}/weixin/css/result.css" />
		<link rel="stylesheet" type="text/css" href="${resourcepath}/weixin/css/weui.min.css"/>
		<link rel="stylesheet" type="text/css" href="${resourcepath}/weixin/css/jquery-weui.min.css"/>
		<link rel="stylesheet" href="${resourcepath}/weixin/css/myCoupon.css?t=201711072204" />
	    <link rel="stylesheet" href="${resourcepath}/weixin/css/submitEvaluate.css?t=201711072204" />
		<script src="${resourcepath}/weixin/js/rem.js"></script>
		<script type="text/javascript" src="${resourcepath}/admin/js/application.js"></script>
		<title>挥货-发评论</title>
		<script type="text/javascript">
    		var mainServer = '${mainserver}';
    		var articleId = '${articleId}';
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
		<script src="${resourcepath}/weixin/js/refresh.js"></script>
		<div class="container">
 
			<div class="mainBox" style="top:0;">
			 
			 
				<form id="evalform"  action="${mainserver}/weixin/specialcomment/addComment"  method="post" enctype="multipart/form-data">
					<div class="textcon">
						<input type="hidden" name="parentId"  id="parentId" value="${commentVo.commentId}"/>
						<c:if test="${commentVo.rootId <= 0}">
							<input type="hidden" name="rootId" id="rootId"  value="${commentVo.commentId}"/>
						</c:if>
						<c:if test="${commentVo.rootId > 0}">
							<input type="hidden" name="rootId" id="rootId"  value="${commentVo.rootId}"/>
						</c:if>
					
						<textarea name="textval" id="textval" name="content" maxlength="100" rows="" cols="" placeholder="说点什么呗~" style="font-size: 16px"></textarea>
						<div class="xianfont" style="border:none;"> <label id="lyishu" >0</label>/<label id="lsheng" >100</label></div>  
					</div>
				</form>	
			</div>
			<div class="submitBox">
				提交评论
			</div>    
		</div>
		
	</body>
	<script src="${resourcepath}/weixin/js/jquery-2.1.1.min.js"></script>
	<script src="${resourcepath}/weixin/js/jquery-weui.min.js"></script>
	<script type="text/javascript" src="${resourcepath}/weixin/js/discovery/wx_article_comment.js?t=201802281240"></script>
</html>	