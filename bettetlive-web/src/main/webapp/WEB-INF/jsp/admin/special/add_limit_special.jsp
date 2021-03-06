<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>增加限量抢购</title>
		<link rel="stylesheet" type="text/css"  href="${resourcepath}/plugin/custom/uimaker/easyui.css">
		<link rel="stylesheet" type="text/css"  href="${resourcepath}/plugin/custom/uimaker/icon.css">
    	<link rel="stylesheet" type="text/css"  href="${resourcepath}/admin/css/base.css">
		<link rel="stylesheet" type="text/css"  href="${resourcepath}/admin/css/providers.css">
	    <link rel="stylesheet" type="text/css"  href="${resourcepath}/admin/css/basic_info.css" >
		<link rel="stylesheet" type="text/css"  href="${resourcepath}/admin/css/zyupload-1.0.0.min.css">
		<script type="text/javascript" src="${resourcepath}/plugin/custom/jquery.min.js"></script>
    	<script type="text/javascript" src="${resourcepath}/plugin/custom/jquery.easyui.min.js"></script>
    	<script type="text/javascript" src="${resourcepath}/plugin/custom/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript" src="${resourcepath}/admin/js/zyupload.drag-1.0.0.min.js"></script>
    	<script type="text/javascript" src="${resourcepath}/admin/js/ajaxfileupload.js"></script>
		<script type="text/javascript" src="${resourcepath}/admin/js/application.js"></script>
		<script type="text/javascript" src="${resourcepath}/admin/js/zyupload.party.js"></script>
		<script type="text/javascript">
			var mainServer = '${mainserver}';
		</script>
		<style type="text/css">
				label{
				cursor:pointer;
			}
			
			.addTea{
			    background: #1da02b;
			    filter: none;
			    color: #fff;
			    border: 1px solid #1da02b;
			    display: inline-block;
			    position: relative;
			    overflow: hidden;
			    margin: 0;
			    padding: 0;
			    vertical-align: top;
			    display: inline-block;
			    vertical-align: top;
			    width: 60px;
			    border-radius: 5px 5px 5px 5px;
			    line-height: 33px;
			    font-size: 12px;
			    padding: 0;
			    margin: 0 4px;
			    cursor: pointer;
			    text-align: center;
			}
		</style>   
	</head>
	
	<body>
		<div class="container">
			<div class="content">
				<div class="easyui-tabs1" style="width:100%;">
			      <div title="添加限量抢购信息" data-options="closable:false" class="basic-info">
			      		<div class="column"><span class="current">基础信息</span>(<font color="red">*</font>&nbsp;是必填项)</div>
			      		<form id="specialform" name="specialform" action=""  method="post" enctype="multipart/form-data">
			      		<input type="hidden" id="specialType" name="specialType" value="${specialType}">
						<input type="hidden" id="activityType" name="activityType" value="${activityType}">
			      		<input id="productId" name="productId" type="hidden">
					      	<table class="kv-table">
								<tbody>
									<tr>
										<td class="kv-label">限量抢购标题&nbsp;<font color="red">*</font></td>
										<td class="kv-content">
											<input class="textbox" type="text" name="specialTitle" id="specialTitle"  style="height:35px;margin:0 0;width:220px;" maxlength="100"/>
											<span id="Title_msg" style="color: red;"></span>
										</td>
					<%-- 				<td class="kv-label">销量&nbsp;<font color="red">*</font></td>
										<td class="kv-content">
											<input class="easyui-textbox" type="text" name="fakeSalesCopy" id="fakeSalesCopy" style="height:35px;margin:0 0;width:220px;"/>
											<span id="fakeSalesCopy_msg" style="color: red;">不填则显示真实销量</span>
										</td>
					--%>
										<td class="kv-label">活动排序</td>
										<td class="kv-content" colspan="3">
											<input class="numberbox" type="text" name="specialSort" id="specialSort" style="height:35px;margin:0 0;width:15%;" onkeyup="value=value.replace(/[^\d]/g,'')" value="0"/>
											数字越小排位越前，默认从0开始
											<span id="special_short_msg" style="color: red;"></span>
										</td>
									</tr>
									<tr>
										<td class="kv-label">抢购开始时间&nbsp;<font color="red">*</font></td>
										<td class="kv-content">
											<input class="easyui-datetimebox" type="text" name="startTime" id="startTime"  style="height:35px;margin:0 0;width:220px;"/>
											<span id="Start_msg" style="color: red;"></span>
										</td>
										
										<td class="kv-label">抢购结束时间&nbsp;<font color="red">*</font></td>
										<td class="kv-content">
											<input class="easyui-datetimebox" type="text" name="endTime" id="endTime"  style="height:35px;margin:0 0;width:220px;"/>
											<span id="End_msg" style="color: red;"></span>
										</td> 
									</tr>
									
									<tr>
										<td class="kv-label">推荐到首页&nbsp;<font color="red">*</font></td>
										<td class="kv-content">
											<select name="homeFlag" id="homeFlag" style="height:35px;width: 120px;">
												<option value="1" selected="selected">是</option>
												<option value="0">否</option>
											</select>
											<span id="homeFlag_msg" style="color: red;"></span>
										</td>
										<td class="kv-label">活动介绍&nbsp;<font color="red">*</font></td>
										<td class="kv-content">
											<input class="easyui-textbox" type="text" name="specialIntroduce" id="specialIntroduce" style="height:35px;margin:0 0;width:90%;"/>
											<span id="Introduce_msg" style="color: red;"></span>
										</td>
									</tr>
								</tbody>
							</table> 
							<div class="column"><span class="current">选择产品</span></div>
							<table class="kv-table">
								<tbody>
									<tr>
										<td class="kv-label">
											<div style="font-size: 12px;font-weight: bolder;" align="center">选择产品</div>
										</td>
										<td class="kv-content" colspan="5" >
											<input type="hidden"  name="notDispatchs"  id="notDispatchs"  readonly="readonly"/>
											<input class="easyui-textbox" type="text"  name="dispatching" id="dispatching"  style="height:35px;margin:0 0;width:90%;" readonly="readonly" />
											<span class="addTea" onclick="chooseProduct()" >选择</span>											
											<span id="Dispatch_msg" style="color: red;"></span>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="column" style="display:none" id="spec"><span class="current">产品规格--原价--限量抢购价格</span></div>
							<table class="kv-table">
								<tbody id="spectbl" style="display:none">
									<tr>
										<td class="kv-label" style="width:200px">
											<div style="font-size: 12px;font-weight: bolder;" align="center">规格--原价--限量抢购价格</div>
											<input type="hidden" name="speclist" id="speclist">
											<input type="hidden" name="speclist" id="speclist">
											<input type="hidden" name="productlist" id="productlist">
										</td>
										<td id="addSpec" class="kv-label" colspan="5" >
											
										</td>
									</tr>
								</tbody>
							</table>
							
							<div class="column"><span class="current">活动封面图片</span></div>
							<table class="kv-table">
								<tbody>
									<tr>
										<td class="kv-label" >限量抢购封面图片&nbsp;<font color="red">*</font><br/>(720x316)</td>
										<td class="kv-content" colspan="3">
										<input  type="hidden" name="specialCover" id="specialCover" />
										<span id="specialCover1" style="color: red;"></span>
											<div id="zyupload">
											</div>
										</td>
										<td class="kv-label" colspan="2" id="pics">
										</td>
									</tr>
									<%-- 
									<tr>
										<td class="kv-label">
											<div style="font-size: 12px;font-weight: bolder;" align="center">抢购列表图</div>
										</td>
										<td class="kv-content" colspan="5" >
											<input class="easyui-filebox" type="text" name="list_img" id="list_img" style="height:35px;width:60px;"
						                      data-options="buttonText:'选择图片',accept:'image/jpeg,image/png,image/gif,image/JPEG,image/PNG,image/GIF', onChange:function(){previewImg($(this));}"/>
												<span style="color: red;"></span><div id="listImgShow"></div>
										</td>
									</tr>
									--%>
									<tr>
										<td colspan="5" align="center">
											<div style="margin-top: 20px;" align="center">
												<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-add" data-options="selected:true" onclick="isSubmit()">新增</a>
												<a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-back" data-options="selected:true" onclick="toBack()">返回</a>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</form>
			      </div> 
			    </div>
			</div>
		</div>
		
		<div id="dlg" class="easyui-dialog" title="选择产品" data-options="closed:true" style="width:700px;height:500px;padding:10px;">
			<table id="StoreGrid" style="width:100%;height:529px;" title="商品列表">
	        
	      	</table>
	      
		      <div id="storeToolbar" style="padding:0 30px;">
		      		<div id="tb" style="padding:0 30px;">
					             商品名称: <input class="easyui-textbox" type="text" name="product_name"  id="product_name" maxlength="30" style="width:160px;height:35px;line-height:35px;" />
					                    
					       	   <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" data-options="selected:true" onclick="searchProduct()" >查询</a>
			      	</div>
		     </div>
		</div>
		
		<script type="text/javascript" src="${resourcepath}/admin/js/special/add_limit_special.js"></script>
	</body>
</html>