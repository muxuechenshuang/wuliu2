<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<%@include file="../common/header.jsp"%>
<div class="clearfix"></div>
<div class="row">
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>
					工单详情<i class="fa fa-user"></i><small></small>
				</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_title">
				<h2>工单信息</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content1">
				<form class="form-horizontal form-label-left">
					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							   for="name">工单号 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input class="form-control col-md-7 col-xs-12" value="${workorder.workNum}"
								   type="text" readonly="readonly">
						</div>
					</div>


					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							   for="name">物件编号<span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input class="form-control col-md-7 col-xs-12" value="${workorder.productNum}"
								   type="number" readonly="readonly">
						</div>
					</div>
					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							   for="name">合包号 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input class="form-control col-md-7 col-xs-12"
								   readonly="readonly" value="${workorder.packageId} " type="number">
						</div>
					</div>
					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							   for="number">寄件人姓名 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" value="${workorder.sName}"
								   class="form-control col-md-7 col-xs-12" readonly="readonly">
						</div>
					</div>

					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							   for="number">寄件人电话 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" value="${workorder.sTel}"
								   class="form-control col-md-7 col-xs-12" readonly="readonly">
						</div>
					</div>

					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							   for="select">寄件人城市 <span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" class="form-control col-md-7 col-xs-12"
								   value="${workorder.sCityName}" readonly="readonly">

						</div>
					</div>

					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							   for="name">寄件人网点 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" class="form-control col-md-7 col-xs-12"
								   value="${workorder.sPointName}" readonly="readonly">
						</div>
					</div>

					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							   for="name">收件人姓名<span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input class="form-control col-md-7 col-xs-12" value="${workorder.gName}"
								   type="text" readonly="readonly">
						</div>
					</div>
					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							   for="name">收件人电话 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input class="form-control col-md-7 col-xs-12"
								   readonly="readonly" value="${workorder.gTel} " type="text">
						</div>
					</div>
					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							   for="number">收件人城市 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" value="${workorder.gCityName}"
								   class="form-control col-md-7 col-xs-12" readonly="readonly">
						</div>
					</div>

					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							   for="number">收件人网点 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" value="${workorder.gPointName}"
								   class="form-control col-md-7 col-xs-12" readonly="readonly">
						</div>
					</div>


					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							   for="name">货物类型<span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" class="form-control col-md-7 col-xs-12"
								   value="${workorder.productTypeName}" readonly="readonly">
						</div>
					</div>
					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							   for="name">实际重量<span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input class="form-control col-md-7 col-xs-12" value="${workorder.realWeight}"
								   type="text" readonly="readonly">
						</div>
					</div>
					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							   for="name">工单状态 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input class="form-control col-md-7 col-xs-12"
								   readonly="readonly" value="${workorder.workStatusName} " type="text">
						</div>
					</div>


					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							   for="number">运费 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" value="${workorder.expenses}"
								   class="form-control col-md-7 col-xs-12" readonly="readonly">
						</div>
					</div>

					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							   for="select">收快递员工号<span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" class="form-control col-md-7 col-xs-12"
								   value="${workorder.gCourier}" readonly="readonly">

						</div>
					</div>
					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							   for="name">送快递员工号<span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input class="form-control col-md-7 col-xs-12" value="${workorder.sCourier}"
								   type="text" readonly="readonly">
						</div>
					</div>
					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							   for="name">实际体积 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input class="form-control col-md-7 col-xs-12"
								   readonly="readonly" value="${workorder.preVolume} " type="text">
						</div>
					</div>
					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							   for="number">生成时间 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" value="<fmt:formatDate value='${workorder.riseTime}' pattern='yyyy-MM-dd HH:mm:ss'/> "
								   class="form-control col-md-7 col-xs-12" readonly="readonly">
						</div>
					</div>

					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							   for="number">入库时间 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" value="<fmt:formatDate value='${workorder.inStorageTime}' pattern='yyyy-MM-dd HH:mm:ss'/>"
								   class="form-control col-md-7 col-xs-12" readonly="readonly">
						</div>
					</div>

					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							   for="select">出库时间<span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" class="form-control col-md-7 col-xs-12"
								   value="<fmt:formatDate value='${workorder.outStorageTime}' pattern='yyyy-MM-dd HH:mm:ss'/>" readonly="readonly">
						</div>
					</div>


					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							   for="number">完成时间 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" value="<fmt:formatDate value="${workorder.finishedTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
								   class="form-control col-md-7 col-xs-12" readonly="readonly">
						</div>
					</div>

					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							   for="number">物件位置 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" value="${workorder.productLocationName}"
								   class="form-control col-md-7 col-xs-12" readonly="readonly">
						</div>
					</div>

					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							   for="select">审核结果<span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" class="form-control col-md-7 col-xs-12"
								   value="${workorder.auditStatusName}" readonly="readonly">
						</div>
					</div>

					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							   for="number">备注 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" value="${workorder.comment}"
								   class="form-control col-md-7 col-xs-12" readonly="readonly">
						</div>
					</div>
				</form>
			</div>
			<div class="x_content" style="display: block;">
				<br>

			</div>
			<div class="form-group">
				<div class="col-md-6 col-md-offset-3">
					<a href="JavaScript:history.back(-1)" class="btn btn-primary">返回</a>
				</div>
			</div>
			<div class="clearfix"></div>
			<br />
			<br />
		</div>
	</div>
	<%@include file="../common/footer.jsp"%>
	<script
			src="${pageContext.request.contextPath }/statics/localjs/appinfoview.js"></script>