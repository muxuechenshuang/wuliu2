<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<script src="${pageContext.request.contextPath }/statics/js/jquery-1.4.2.min.js"></script>
<div class="clearfix"></div>
<div class="row">
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">

			<div class="x_title">
				<h2>工单信息</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content1">
				<form class="form-horizontal form-label-left" action="${pageContext.request.contextPath}/order/returnorder">
					<input type="hidden" name="id" value="${workorder.id}">

					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="workNum">工单号 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input class="form-control col-md-7 col-xs-12"  readonly
								type="text" name="gid" id="workNum" value="${workorder.workNum}">
						</div>
					</div>




					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="sName">寄件人姓名 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" value="${workorder.sName}"   readonly
								class="form-control col-md-7 col-xs-12" name="sName" id="sName">
						</div>
					</div>

					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="sTel">寄件人电话 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" value="${workorder.sTel}"   readonly
								class="form-control col-md-7 col-xs-12" name="sPhone" id="sTel">
						</div>
					</div>

					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="sCity">寄件人城市 <span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" class="form-control col-md-7 col-xs-12"   readonly
								   value="${workorder.sCityName}" name="sCity" id="sCity">

						</div>
					</div>

					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="sPoint">寄件人网点 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" class="form-control col-md-7 col-xs-12"  readonly
								value="${workorder.sPointName}" name="sPoint" id="sPoint">
						</div>
					</div>
					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="sAddress">寄件人详细地址<span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<textarea class="form-control col-md-7 col-xs-12"  readonly
									  name="sAddress" id="sAddress">${workorder.sAddress}</textarea>
						</div>
					</div>
					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="gName">收件人姓名<span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input class="form-control col-md-7 col-xs-12" value="${workorder.gName}"  readonly
								type="text" name="gName" id="gName">
						</div>
					</div>
					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="gPhone">收件人电话 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input class="form-control col-md-7 col-xs-12"  readonly
								   name="gPhone" id="gPhone" value="${workorder.gTel}" type="text">
						</div>
					</div>
					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="gCity">收件人城市 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" value="${workorder.gCityName}"   readonly
								class="form-control col-md-7 col-xs-12" name="gCity" id="gCity">
						</div>
					</div>

					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="gPoint">收件人网点 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input type="text" value="${workorder.gPointName}"   readonly
								class="form-control col-md-7 col-xs-12" name="gPoint" id="gPoint">
						</div>
					</div>
					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							   for="gAddress">收件人详细地址<span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<textarea class="form-control col-md-7 col-xs-12"  readonly
									  name="gAddress" id="gAddress">${workorder.gAddress}</textarea>
						</div>
					</div>

					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							   for="comment">返货原因: <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<textarea type="text" value=""
									  class="form-control col-md-7 col-xs-12" name="result" id="result"></textarea>
						</div>
					</div>






					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							   for="comment">备注: <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<textarea type="text" value=""
									  class="form-control col-md-7 col-xs-12" name="comment" id="comment"></textarea>
						</div>
					</div>

					<div class="form-group">
						<div class="col-md-6 col-md-offset-3">
							<input type="hidden" name="id" value="${workorder.id}">
							<button type="submit" class="btn btn-danger" id="ret">保存</button>
						</div>
					</div>

				</form>

			</div>
			<div class="x_content" style="display: block;">
				<br>

			</div>



				<div class="clearfix"></div>

			<br />
			<br />
		</div>
	</div>
	<%@include file="../common/footer.jsp"%>
	<script type="text/javascript">
        /*返回按纽*/
        $("#back").click(function () {
            window.location.href = "toworkorder/?courierNum=${user.id}";
        })
	</script>