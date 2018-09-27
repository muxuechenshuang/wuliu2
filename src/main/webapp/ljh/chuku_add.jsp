<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>

<div class="clearfix"></div>
<div class="row">
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>
					新增出库<i class="fa fa-user"></i><small>${devUserSession.devName}</small>
				</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<div class="clearfix"></div>
				<form id="myForm" class="form-horizontal form-label-left"
					action="appinfoaddsave" method="post" enctype="multipart/form-data">




					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="name">接货人 
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input id="APKName" class="form-control col-md-7 col-xs-12"
								data-validate-length-range="20" data-validate-words="1"
								name="APKName" required="required" 
								type="text" readonly="true" value="2号网点负责人">
						</div>
						<span id="message" style="position: relative; top: 7px;"></span>
					</div>



					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="name">接收单位 
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input id="supportROM" class="form-control col-md-7 col-xs-12"
								name="supportROM" data-validate-length-range="20"
								data-validate-words="1" required="required" 
								type="text" readonly="true" value="2号网点">
						</div>
						<span id="checksupportROM" style="position: relative; top: 7px;"></span>
					</div>





					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="name">交货人 
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input id="supportROM" class="form-control col-md-7 col-xs-12"
								name="supportROM" data-validate-length-range="20"
								data-validate-words="1" required="required" 
								type="text" readonly="true" value="出库操作员1">
						</div>
						<span id="checksupportROM" style="position: relative; top: 7px;"></span>
					</div>





					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="name">交货单位 
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input id="supportROM" class="form-control col-md-7 col-xs-12"
								name="supportROM" data-validate-length-range="20"
								data-validate-words="1" readonly="true" type="text"
								readonly="true" value="仓库1">
						</div>
					</div>






					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="textarea">出库时间 
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input id="appInfo" name="appInfo" required="required"
								class="form-control col-md-7 col-xs-12" readonly="true"
								value="2018/7/16 15:29：34"></input>
						</div>
					</div>


					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="textarea">单号 
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input id="appInfo" name="appInfo" required="required"
								class="form-control col-md-7 col-xs-12" readonly="true"
								value="1"></input>
						</div>
					</div>



					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="textarea">合包号
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input id="appInfo" name="appInfo" required="required"
								class="form-control col-md-7 col-xs-12" readonly="true"
								value="1001"></input>
						</div>
					</div>



					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="textarea">重量：kg 
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input id="appInfo" name="appInfo" required="required"
								class="form-control col-md-7 col-xs-12" readonly="true"
								value="2"></input>
						</div>
					</div>




					


					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="textarea">状态
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input id="appInfo" name="appInfo" required="required"
								class="form-control col-md-7 col-xs-12" readonly="true"
								value="待出库"></input>
						</div>
					</div>




					<div class="ln_solid"></div>
					<div class="form-group">
						<div class="col-md-6 col-md-offset-3">
							<button id="send" type="submit" class="btn btn-success">出库</button>
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
