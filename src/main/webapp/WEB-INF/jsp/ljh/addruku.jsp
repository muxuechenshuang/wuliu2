<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>

<div class="clearfix"></div>
<div class="row">
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>
					新增入库<i class="fa fa-user"></i><small>${devUserSession.devName}</small>
				</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<div class="clearfix"></div>
				<form id="myForm" class="form-horizontal form-label-left"
					action="${pageContext.request.contextPath}/filiale/saveinstorage" method="post" enctype="multipart/form-data">
					<input  hidden="hidden" type="text" name="id"  value="${workorder.id}">
					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							   for="workNum">工单号
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input class="form-control col-md-7 col-xs-12" readonly="readonly"
								   type="text" name="workNum" id="workNum" value="${workorder.workNum}">
						</div>
					</div>
					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							   for="orderNum">关联订单号
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" class="form-control col-md-7 col-xs-12" readonly="readonly"
								   value="${workorder.orderNum}" name="orderNum" id="orderNum">
						</div>
					</div>
					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							   for="packageId">合包号
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<c:choose>
								<c:when test="${workorder.packageId!=null}">
									<input class="form-control col-md-7 col-xs-12" value="${workorder.packageId}"
										   type="text" readonly="readonly" name="packageId" id="packageId">
								</c:when>
								<c:otherwise>
									<input class="form-control col-md-7 col-xs-12" value="暂未进行合包"
										   type="text" readonly="readonly" name="packageId" id="packageId">
								</c:otherwise>
							</c:choose>
						</div>
					</div>

					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							   for="productNum">物件编号
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input class="form-control col-md-7 col-xs-12" readonly="readonly"
								   name="productNum" id="productNum" value="${workorder.productNum}" type="text">
						</div>
					</div>
					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							   for="productType">货物类型
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" class="form-control col-md-7 col-xs-12" readonly="readonly"
								   value="${workorder.productTypeName}" name="productType" id="productType">
						</div>
					</div>
					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							   for="realWeight">实际重量:kg<span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input class="form-control col-md-7 col-xs-12" value="${workorder.realWeight}"
								   readonly="readonly"
								   type="number" name="realWeight" id="realWeight">
						</div>
					</div>
					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							   for="productLocation">物件位置<span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" value="${workorder.productLocationName}"
								   class="form-control col-md-7 col-xs-12" name="productLocationName" id="productLocation"
								   readonly="readonly">
						</div>
					</div>

					<div class="ln_solid"></div>
					<div class="form-group">
						<div class="col-md-6 col-md-offset-3">
							<button id="send" type="submit" class="btn btn-success">入库</button>
							<button type="button" class="btn btn-primary" id="back">返回</button>
							<br /> <br />
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%@include file="../common/footer.jsp"%>
<script>
    $("#back").on("click", function () {
        window.location.href = "../putinstorage";
    });
</script>
