<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<div class="clearfix"></div>
<%-- <link href="${pageContext.request.contextPath }/statics/css/Botton.css"
	rel="stylesheet"> --%>
<div class="row">
	<div class="col-md-12 col-sm-12 col-xs-12">
		
		<div class="x_panel">
		
		<div class="x_title">
				<h2>
					订单查询<i class="fa fa-user"></i><small>${sessionScope.user.name}
						- 您可以通过搜索或者其他的筛选项对订单的信息进行查看、取消预约等管理操作。^_^</small>
				</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<form method="post" action="/calculate/query">
					<input type="hidden" name="pageIndex" value="1" />
					<ul>
						<li>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">订单号</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input name="queryOrderNumber" type="text"
										class="form-control col-md-7 col-xs-12"
										   value="${orderNumber}">
								</div>
							</div>
						</li>
						
						<li>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">收件人姓名</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input name="queryGName" type="text"
										class="form-control col-md-7 col-xs-12"
										   value="${gName}">
								</div>
							</div>
						</li>

						<li>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">收件人电话</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input name="queryGTel" type="text"
										   class="form-control col-md-7 col-xs-12"
										   value="${gTel}">
								</div>
							</div>
						</li>

						<li>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">订单状态</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<select name="queryOrderStatus" class="form-control">
											<option value="">--请选择--</option>
										<c:if test="${flatFormList != null }">
											<c:forEach var="status" items="${orderStatusList}">
												<option
													<c:if test="${status.valueId == orderStatus }">selected="selected"</c:if>
													value="${status.valueId}">${status.valueName}</option>
											</c:forEach>
										</c:if>
									</select>
								</div>
							</div>
						</li>
						<li><button type="submit" class="btn btn-primary">查
								&nbsp;&nbsp;&nbsp;&nbsp;询</button></li>
					</ul>
				</form>
			</div>
		
			<div class="x_title">
				<h2>您的快递</h2>
				<table id="datatable-responsive"
					class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline collapsed"
					cellspacing="0" width="100%" role="grid"
					aria-describedby="datatable-responsive_info" style="width: 100%;">
					<thead>
						<tr role="row">
							<th class="sorting_asc" tabindex="0"
								aria-controls="datatable-responsive" rowspan="1" colspan="1"
								aria-label="First name: activate to sort column descending"
								aria-sort="ascending" style="width: 300px;">订单号</th>
							<th class="sorting_asc" tabindex="0"
								aria-controls="datatable-responsive" rowspan="1" colspan="1"
								aria-label="First name: activate to sort column descending"
								aria-sort="ascending">收件人姓名</th>
							<th class="sorting_asc" tabindex="0"
								aria-controls="datatable-responsive" rowspan="1" colspan="1"
								aria-label="First name: activate to sort column descending"
								aria-sort="ascending" <%--width="200px"--%>>收件人电话</th>
							<th class="sorting_asc" tabindex="0"
								aria-controls="datatable-responsive" rowspan="1" colspan="1"
								aria-label="First name: activate to sort column descending"
								aria-sort="ascending">订单状态</th>
							<th class="sorting" tabindex="0"
								aria-controls="datatable-responsive" rowspan="1" colspan="1"
								style="width: 130px;"
								aria-label="Last name: activate to sort column ascending">
								操作</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${orderList}" var="order">
						<tr role="row" class="odd">
							<td>${order.orderNumber}</td>
							<td>${order.gName}</td>
							<td>${order.gTel}</td>
							<td>${order.status}</td>
							<td>
								<div class="btn-group">
									<button type="button" class="btn btn-danger">点击操作</button>
									<button type="button"
										class="btn btn-danger dropdown-toggle"
										data-toggle="dropdown" aria-expanded="false"
										style="height: 34px;">
										<span class="caret"></span>
										<span class="sr-only">Toggle Dropdown</span>
									</button>
									<ul class="dropdown-menu" role="menu">
										<li><a class="viewApp" appinfoid=${order.id },
											data-toggle="tooltip" data-placement="top" title=""
											data-original-title="查看订单的详情信息">查看明细</a>
										</li>
										<li><a class="deleteApp" appinfoid=${prder.id },
											status="${order.status }"
											data-toggle="tooltip" data-placement="top" title=""
											data-original-title="">取消预约</a>
										</li>
									</ul>
								</div>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<div class="clearfix"></div>
			</div>

			<div class="clearfix"></div>

			<div class="x_title">
				<h2>订单详情</h2>
				<div class="clearfix"></div>
			</div>
			<form class="form-horizontal form-label-left">
			
			<div id="wizard" class="form_wizard wizard_horizontal">
                      <ul class="wizard_steps anchor">

                        <li>
                          <a href="#step-1" class="selected" isdone="1" rel="1">
                            <span class="step_no">1</span>
                            <span class="step_descr">
                                 	寄件人<br>
                             </span>
                          </a>
                        </li>

                        <li>
                          <a href="#step-2" class="disabled" isdone="0" rel="2">
                            <span class="step_no">2</span>
                            <span class="step_descr">
                                 	寄件网点<br>
                            </span>
                          </a>
                        </li>

                        <li>
                          <a href="#step-3" class="disabled" isdone="0" rel="3">
                            <span class="step_no">3</span>
                            <span class="step_descr">
                                	 寄件城市<br>
                             </span>
                          </a>
                        </li>

                        <li>
                          <a href="#step-4" class="disabled" isdone="0" rel="4">
                            <span class="step_no">4</span>
                            <span class="step_descr">
                                 	收件城市<br>
                              </span>
                          </a>
                        </li>

                        <li>
                          <a href="#step-5" class="disabled" isdone="0" rel="5">
                            <span class="step_no">5</span>
                            <span class="step_descr">
                                	 收件网点<br>
                              </span>
                          </a>
                        </li>

                        <li>
                          <a href="#step-6" class="disabled" isdone="0" rel="6">
                            <span class="step_no">6</span>
                            <span class="step_descr">
                                 	收件人<br>
                              </span>
                          </a>
                        </li>
                      </ul>
                      
			
				<input type="hidden" name="id" value="${order.id}">

				<div class="item form-group">
					<label class="control-label col-md-3 col-sm-3 col-xs-12" for="orderNumber">订单号
						<span class="required">*</span> </label>
					<div class="col-md-6 col-sm-6 col-xs-12">
						<input class="form-control col-md-7 col-xs-12" id="orderNumber"
							value="${orderInfo.orderNumber}" type="text" readonly="readonly">
					</div>
				</div>

				<div class="item form-group">
					<label class="control-label col-md-3 col-sm-3 col-xs-12" for="orderStatus">订单类型
						<span class="required">*</span> </label>
					<div class="col-md-6 col-sm-6 col-xs-12">
						<input class="form-control col-md-7 col-xs-12" id="orderStatus"
							value="${orderInfo.status}" type="text" readonly="readonly">
					</div>
				</div>

				<div class="item form-group">
					<label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">订单现在所在位置
						<span class="required">*</span> </label>
					<div class="col-md-6 col-sm-6 col-xs-12">
						<input class="form-control col-md-7 col-xs-12"
							value="${orderInfo.softwareName}" type="text" readonly="readonly">
					</div>
				</div>

				<div class="item form-group">
					<label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">订单目前状态
						<span class="required">*</span> </label>
					<div class="col-md-6 col-sm-6 col-xs-12">
						<input class="form-control col-md-7 col-xs-12"
							value="${appInfo.softwareName}" type="text" readonly="readonly">
					</div>
				</div>

				<div class="item form-group">
					<label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">寄件人姓名
						<span class="required">*</span> </label>
					<div class="col-md-6 col-sm-6 col-xs-12">
						<input class="form-control col-md-7 col-xs-12"
							value="${appInfo.softwareName}" type="text" readonly="readonly">
					</div>
				</div>

				<div class="item form-group">
					<label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">寄件人地址
						<span class="required">*</span> </label>
					<div class="col-md-6 col-sm-6 col-xs-12">
						<input class="form-control col-md-7 col-xs-12"
							value="${appInfo.softwareName}" type="text" readonly="readonly">
					</div>
				</div>

				<div class="item form-group">
					<label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">寄件人电话
						<span class="required">*</span> </label>
					<div class="col-md-6 col-sm-6 col-xs-12">
						<input class="form-control col-md-7 col-xs-12"
							value="${appInfo.softwareName}" type="text" readonly="readonly">
					</div>
				</div>

				<div class="item form-group">
					<label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">收件人姓名
						<span class="required">*</span> </label>
					<div class="col-md-6 col-sm-6 col-xs-12">
						<input class="form-control col-md-7 col-xs-12"
							value="${appInfo.softwareName}" type="text" readonly="readonly">
					</div>
				</div>

				<div class="item form-group">
					<label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">收件人地址
						<span class="required">*</span> </label>
					<div class="col-md-6 col-sm-6 col-xs-12">
						<input class="form-control col-md-7 col-xs-12"
							value="${appInfo.softwareName}" type="text" readonly="readonly">
					</div>
				</div>

				<div class="item form-group">
					<label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">收件人电话
						<span class="required">*</span> </label>
					<div class="col-md-6 col-sm-6 col-xs-12">
						<input class="form-control col-md-7 col-xs-12"
							value="${appInfo.softwareName}" type="text" readonly="readonly">
					</div>
				</div>

				<div class="item form-group">
					<label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">废除订单理由
						<span class="required">*</span> </label>
					<div class="col-md-6 col-sm-6 col-xs-12">
						<input class="form-control col-md-7 col-xs-12"
							value="${appInfo.softwareName}" type="text" readonly="readonly">
					</div>
				</div>
			</form>
			<div class="form-group">
				<div class="col-md-6 col-md-offset-3">
					<!-- <button type="button" class="btn btn-primary" id="back">返回</button> -->
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