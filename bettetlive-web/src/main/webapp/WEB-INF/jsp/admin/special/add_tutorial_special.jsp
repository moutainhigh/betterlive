<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>增加美食教程</title>
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
			var mainServer= '${mainserver}';
		</script>
		
		<style type="text/css">
				label{
				cursor:pointer;
			}
			
			.edui-default .edui-editor{
				border: 1px solid #d4d4d4 !important;
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
			
			.waiteTea{
		/* 	    background: #1da02b; */
			    filter: none;
			    color: #1F1F1F;
			    border: 1px solid #1da02b;
			    display: inline-block;
			    position: relative;
			    overflow: hidden;
			    margin: 0;
			    padding: 0;
			    vertical-align: top;
			    display: inline-block;
			    vertical-align: top;
			    width: 120px;
			    border-radius: 5px 5px 5px 5px;
			    line-height: 33px;
			    font-size: 12px;
			    padding: 0;
			    margin: 0 4px;
			    cursor: pointer;
			    text-align: center;
			    margin-top: 10px;
			}
			
			.chooseTea{
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
			    width: 120px;
			    border-radius: 5px 5px 5px 5px;
			    line-height: 33px;
			    font-size: 12px;
			    padding: 0;
			    margin: 0 4px;
			    cursor: pointer;
			    text-align: center;
			     margin-top: 10px;
			}
			
		
		</style>   
	</head>
	
	<body>
		<div class="container">
			<div class="content">
				<div class="easyui-tabs1" style="width:100%;">
			      <div title="添加美食教程" data-options="closable:false" class="basic-info">
			      		<div class="column"><span class="current">基础信息</span>(<font color="red">*</font>&nbsp;是必填项)</div>
			      		<form id="specialform" name="specialform" action=""  method="post" enctype="multipart/form-data">
			      			<input type="hidden" name="activityType" value="5">
			      			<input type="hidden" name="specialType" value="4">
					      	<table class="kv-table">
								<tbody>
									<tr>
										<td class="kv-label">美食教程名称&nbsp;<font color="red">*</font></td>
										<td class="kv-content">
											<input class="textbox" type="text" name="specialName" id="specialName" style="height:35px;margin:0 0;width:220px;" maxlength="100"/>
											<span id="Name_msg" style="color: red;"></span>
										</td>
										
									
										
										<td class="kv-label">美食教程标题&nbsp;<font color="red">*</font></td>
										<td class="kv-content">
											<input class="textbox" type="text" name="specialTitle" id="specialTitle"  style="height:35px;margin:0 0;width:220px;" maxlength="100"/>
											<span id="Title_msg" style="color: red;"></span>
										</td>
									</tr>
										
									<tr>
										<td class="kv-label">美食教程开始时间&nbsp;<font color="red">*</font></td>
										<td class="kv-content">
											<input class="easyui-datetimebox" type="text" name="startTime" id="startTime"  style="height:35px;margin:0 0;width:220px;"/>
											<span id="Start_msg" style="color: red;"></span>
										</td>
										
										<td class="kv-label">美食教程结束时间&nbsp;<font color="red">*</font></td>
										<td class="kv-content">
											<input class="easyui-datetimebox" type="text" name="endTime" id="endTime"  style="height:35px;margin:0 0;width:220px;"/>
											<span id="End_msg" style="color: red;"></span>
										</td> 
									</tr>
									<tr>
										<td class="kv-label">视频分类&nbsp;<font color="red">*</font></td>
										<td class="kv-content">
											<select name="objTypeId" id="objTypeId" style="height:35px;width: 120px;">
												<c:forEach var="vdoTypeVo" items="${vdoTypes}">
													<option value="${vdoTypeVo.typeId}">${vdoTypeVo.typeName}</option>
												</c:forEach>
											</select>
											<span id="objTypeId_msg" style="color: red;"></span>
										</td>
										<td class="kv-label">视频播放时长(单位：分钟)&nbsp;<font color="red">*</font></td>
										<td class="kv-content">
											<input class="easyui-textbox" type="text" name="objValue" id="objValue" style="height:35px;margin:0 0;width:220px;"/>
											<span id="objValue_msg" style="color: red;">如：02:30</span>
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
										<td class="kv-label">专题介绍&nbsp;<font color="red">*</font></td>
										<td class="kv-content">
											<input class="easyui-textbox" type="text" name="specialIntroduce" id="specialIntroduce" style="height:35px;margin:0 0;width:90%;"/>
											<span id="Introduce_msg" style="color: red;"></span>
										</td>
									</tr>
									<tr>
										<td class="kv-label">视频路径&nbsp;<font color="red">*</font></td>
										<td class="kv-content" colspan="3">
											<input class="textbox" type="text" name="specialPage" id="specialPage"  style="height:35px;margin:0 0;width:86.5%;"/>
											<span id="Page_msg" style="color: red;"></span>
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
							<div class="column" style="display:none" id="spec"><span class="current">产品规格--原价--活动价格</span></div>
							<table class="kv-table">
								<tbody id="spectbl" style="display:none">
									<tr>
										<td class="kv-label" style="width:200px">
											<div style="font-size: 12px;font-weight: bolder;" align="center">规格--原价--活动价格</div>
											<input type="hidden" name="speclist" id="speclist">
											<input type="hidden" name="productlist" id="productlist">
										</td>
										<td id="addSpec" class="kv-label" colspan="5" >
											
										</td>
									</tr>
								</tbody>
							</table>
							
							<div class="column"><span class="current">专题封面图片</span></div>
							<table class="kv-table">
								<tbody>
									<tr>
										<td class="kv-label" >专题封面图片&nbsp;<font color="red">*</font><br/>(720x316)</td>
										<td class="kv-content" colspan="3">
										<input  type="hidden" name="specialCover" id="specialCover" />
										<span id="specialCover1" style="color: red;"></span>
											<div id="zyupload">
											</div>
										</td>
										<td class="kv-label" colspan="2" id="pics">
										</td>
									</tr>
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
			<c:forEach items="${products}"  var="product">
       			 <span class="waiteTea"  id="${product.product_id}" title="${product.product_name}"  onclick="addCreateProduct(this)" >${product.product_name}</span> 
       		</c:forEach>						
			<div style="padding:35px" align="center">
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" data-options="selected:true" onclick="isSureProduct()">确定</a>
				<a href="javascript:void(0)" class="easyui-linkbutton"  data-options="selected:true" onclick="closeProduct()" >关闭</a>
            </div>
		</div>
		
		<script type="text/javascript" src="${resourcepath}/admin/js/special/add_tutorial_special.js"></script>
	</body>
</html>