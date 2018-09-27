<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<div class="clearfix"></div>
<div class="row">
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>
					修改快递员信息 <i class="fa fa-user"></i>
				</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">

				<div class="clearfix"></div>
				<form id="myForm" class="form-horizontal form-label-left"
					action="appinfoaddsave" method="post" enctype="multipart/form-data">

					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="name">编号 </label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input id="softwareName" class="form-control col-md-7 col-xs-12"
								data-validate-length-range="20" data-validate-words="1"
								value="1" type="text" readonly="readonly">
						</div>

						<div class="item form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12"
								for="name">姓名 </label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input id="softwareName" class="form-control col-md-7 col-xs-12"
									data-validate-length-range="20" data-validate-words="1"
									value="小白" type="text" readonly="readonly">
							</div>

							<div class="item form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12"
									for="name">性别 </label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input id="APKName" class="form-control col-md-7 col-xs-12"
										data-validate-length-range="20" data-validate-words="1"
										value="男" readonly="readonly" type="text">
								</div>





								<div class="item form-group">
									<label class="control-label col-md-3 col-sm-3 col-xs-12"
										for="name">出生日期 </label>
									<div class="col-md-6 col-sm-6 col-xs-12">
										<input id="supportROM" class="form-control col-md-7 col-xs-12"
											data-validate-length-range="20" data-validate-words="1"
											readonly="readonly" type="text" value="1982/05/26">
									</div>
								</div>


								<div class="item form-group">
									<label class="control-label col-md-3 col-sm-3 col-xs-12"
										for="name">住址 </label>
									<div class="col-md-6 col-sm-6 col-xs-12">
										<input id="interfaceLanguage"
											class="form-control col-md-7 col-xs-12"
											data-validate-length-range="20" data-validate-words="1"
											type="text" value="岳阳市岳阳楼区">
									</div>
								</div>


								<div class="item form-group">
									<label class="control-label col-md-3 col-sm-3 col-xs-12"
										for="name">电话 </label>
									<div class="col-md-6 col-sm-6 col-xs-12">
										<input id="interfaceLanguage"
											class="form-control col-md-7 col-xs-12"
											data-validate-length-range="20" data-validate-words="1"
											value="13873091156" type="text">
									</div>
								</div>


								<div class="item form-group">
									<label class="control-label col-md-3 col-sm-3 col-xs-12"
										for="name">身份证号 </label>
									<div class="col-md-6 col-sm-6 col-xs-12">
										<input id="interfaceLanguage"
											class="form-control col-md-7 col-xs-12"
											data-validate-length-range="20" data-validate-words="1"
											readonly="readonly" type="text" value="430626198205261122">
									</div>
								</div>

								<div class="item form-group">
									<label class="control-label col-md-3 col-sm-3 col-xs-12"
										for="name">户籍所在地 </label>
									<div class="col-md-6 col-sm-6 col-xs-12">
										<input id="interfaceLanguage"
											class="form-control col-md-7 col-xs-12"
											data-validate-length-range="20" data-validate-words="1"
											value="岳阳市岳阳楼区奇家岭街道" type="text">
									</div>
								</div>




								<div class="ln_solid"></div>
								<div class="form-group">
									<div class="col-md-6 col-md-offset-3">
										<button type="button" class="btn btn-primary" id="back">保存</button>
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