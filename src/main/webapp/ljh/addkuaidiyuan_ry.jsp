<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/header.jsp"%>
<div class="clearfix"></div>
<div class="row">
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>
					新增快递员 <i class="fa fa-user"></i><small>填写基础信息</small>
				</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">

				<div class="clearfix"></div>
				<form class="form-horizontal form-label-left"
					action="appinfoaddsave" method="post" enctype="multipart/form-data">


					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="name">姓名 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input id="softwareName" class="form-control col-md-7 col-xs-12"
								data-validate-length-range="20" data-validate-words="1"
								name="softwareName" required="required" placeholder="请输入快递员姓名"
								type="text" maxlength="50">
						</div>
						<span id="ss" style="color:red;font-size:18px;"></span>
					</div>


					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="name">性别 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<select name="queryFlatformId" class="form-control">
								<option value="">男</option>
								<option value="">女</option>
							</select>
						</div>
					</div>




					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="name">出生日期 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input id="interfaceLanguage"
								class="form-control col-md-7 col-xs-12"
								data-validate-length-range="20" data-validate-words="1"
								name="interfaceLanguage" required="required"
								placeholder="请输入快递员出生日期 " type="text" maxlength="50">
						</div>
					</div>



					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="name">住址 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input id="interfaceLanguage"
								class="form-control col-md-7 col-xs-12"
								data-validate-length-range="20" data-validate-words="1"
								name="interfaceLanguage" required="required"
								placeholder="请输入快递员住址 " type="text" maxlength="50">
						</div>
					</div>


					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="name">电话<span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input id="interfaceLanguage"
								class="form-control col-md-7 col-xs-12"
								data-validate-length-range="20" data-validate-words="1"
								name="interfaceLanguage" required="required"
								placeholder="请输入快递员电话 " type="text" maxlength="50">
						</div>
					</div>


					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="name">身份证号<span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input id="interfaceLanguage"
								class="form-control col-md-7 col-xs-12"
								data-validate-length-range="20" data-validate-words="1"
								name="interfaceLanguage" required="required"
								placeholder="请输入快递员身份证号" type="text" maxlength="50">
						</div>
					</div>

					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="name">户籍所在地<span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input id="interfaceLanguage"
								class="form-control col-md-7 col-xs-12"
								data-validate-length-range="20" data-validate-words="1"
								name="interfaceLanguage" required="required"
								placeholder="请输入快递员户籍性质" type="text" maxlength="50">
						</div>
					</div>




					<div class="ln_solid"></div>
					<div class="form-group">
						<div class="col-md-6 col-md-offset-3">
							<button id="send" type="submit" class="btn btn-success">保存</button>
							<button type="button" class="btn btn-primary" id="back">返回</button>
							<br /> <br />
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<%@include file="common/footer.jsp"%>
