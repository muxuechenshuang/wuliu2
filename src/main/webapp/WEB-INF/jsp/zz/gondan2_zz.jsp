<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 	工单查询（总部） -->
<%@include file="../common/header.jsp"%>
<div class="clearfix"></div>
<div class="row">
	<div class="col-md-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>
					总部工单查询 <i class="fa fa-user"></i><small>${devUserSession.devName}
						- 您可以通过搜索或者其他的筛选项对工单的信息进行修改、删除等管理操作。^_^</small>
				</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<form method="post" action="/center/selectworkorder">
					<input type="hidden" name="pageIndex" value="1" />
					<ul>
						<li>
							<div class="form-group">
								<label class="control-label col-md-4 col-sm-4 col-xs-12" for="workNum">工单号</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input name="workNum" type="text" id="workNum"
										class="form-control col-md-7 col-xs-12"
										value="${workNum }">
								</div>
							</div>
						</li>
						<li>
							<div class="form-group">
								<label class="control-label col-md-4 col-sm-4 col-xs-12" for="orderNum">订单号</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input name="orderNum" type="text" id="orderNum"
										class="form-control col-md-7 col-xs-12"
										value="${orderNum }">
								</div>
							</div>
						</li>
						<li>
							<div class="form-group">
								<label class="control-label col-md-4 col-sm-4 col-xs-12" for="productNum">物件编号</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input name="productNum" type="text" id="productNum"
										class="form-control col-md-7 col-xs-12"
										value="${productNum }">
								</div>
							</div>
						</li>
						<li>
							<div class="form-group">
								<label class="control-label col-md-4 col-sm-4 col-xs-12" for="packageId">合包号</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input name="packageId" type="text" id="packageId"
										class="form-control col-md-7 col-xs-12"
										value="${packageId }">
								</div>
							</div>
						</li>
						<li>
							<div class="form-group">
								<label class="control-label col-md-4 col-sm-4 col-xs-12" for="sName">寄件人姓名</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input name="sName" type="text" id="sName"
										class="form-control col-md-7 col-xs-12"
										value="${sName }">
								</div>
							</div>
						</li>

						<li>
							<div class="form-group">
								<label class="control-label col-md-4 col-sm-4 col-xs-12">寄件人电话</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input name="sTel" type="text"
										class="form-control col-md-7 col-xs-12"
										value="${sTel }">
								</div>
							</div>
						</li>
						<li>
							<div class="form-group">
								<label class="control-label col-md-4 col-sm-4 col-xs-12">寄件人城市</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<select id="sCity" name="sCity" class="form-control">
										<option value="">--请选择--</option>
										<c:forEach var="cityList" items="${cityList}">
											<option value="${cityList.id}"
													<c:if test="${cityList.id == sCity}">selected="selected"</c:if>
											>${cityList.city}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</li>
						<li>
							<div class="form-group">
								<label class="control-label col-md-4 col-sm-4 col-xs-12">寄件人网点</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<select id="sPoint" name="sPoint"
										class="form-control">
										<option value="">--请选择网点--</option>
										<c:if test="${branchList!=null}">
											<c:forEach var="branchList" items="${branchList}">
												<option value="${branchList.id}"
														<c:if test="${branchList.id == branchId}">selected="selected"</c:if>
												>${branchList.name}</option>
											</c:forEach>
										</c:if>
									</select>
								</div>
							</div>
						</li>
						<li>
							<div class="form-group">
								<label class="control-label col-md-4 col-sm-4 col-xs-12">收件人姓名</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input name="gName" type="text"
										class="form-control col-md-7 col-xs-12"
										value="${gName }">
								</div>
							</div>
						</li>
						<li>
							<div class="form-group">
								<label class="control-label col-md-4 col-sm-4 col-xs-12">收件人电话</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input name="gTel" type="text"
										class="form-control col-md-7 col-xs-12"
										value="${gTel }">
								</div>
							</div>
						</li>
						<li>
							<div class="form-group">
								<label class="control-label col-md-4 col-sm-4 col-xs-12">收件人城市</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<select id="gCity" name="gCity"
										class="form-control">
										<option value="">--请选择--</option>
										<c:forEach var="cityList" items="${cityList}">
											<option value="${cityList.id}"
													<c:if test="${cityList.id == gCity}">selected="selected"</c:if>
											>${cityList.city}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</li>
						<li>
							<div class="form-group">
								<label class="control-label col-md-4 col-sm-4 col-xs-12" for="gPoint">网点名称</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<select id="gPoint" name="gPoint"
											class="form-control">
										<%--<option value="">--请选择--</option>--%>
										<%--<c:if test="${branchList!=null}">--%>
											<%--<c:forEach items="${branchList}" var="branchList">--%>
												<%--<option--%>
														<%--<c:if test="${branchList.id == branchid}">selected="selected"</c:if>--%>
														<%--value="${branchList.name}">--%>
														<%--${branchList.name}--%>
												<%--</option>--%>
											<%--</c:forEach>--%>
										<%--</c:if>--%>
										<option value="">--请选择网点--</option>
										<c:if test="${branchList!=null}">
											<c:forEach var="branchList" items="${branchList}">
												<option value="${branchList.id}"
														<c:if test="${branchList.id == branchId}">selected="selected"</c:if>
												>${branchList.name}</option>
											</c:forEach>
										</c:if>
									</select>
								</div>
							</div>
							<%--<div class="form-group">--%>
								<%--<label class="control-label col-md-4 col-sm-4 col-xs-12">收件人网点</label>--%>
								<%--<div class="col-md-6 col-sm-6 col-xs-12">--%>
									<%--<select id="gPoint" name="gPoint"--%>
										<%--class="form-control">--%>
										<%--<option value="">--请选择--</option>--%>
									<%--</select>--%>
								<%--</div>--%>
							<%--</div>--%>
						</li>
						<li>
							<div class="form-group">
								<label class="control-label col-md-4 col-sm-4 col-xs-12">工单状态</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<select name="workStatus" class="form-control">
										<c:if test="${workStatusList!=null}">
											<option value="">--请选择--</option>
											<c:forEach items="${workStatusList}" var="status">
												<option
														<c:if test="${status.valueId == workStatus }">selected="selected"</c:if>
														value="${status.valueId}">
														${status.valueName}
												</option>
											</c:forEach>
										</c:if>
									</select>
								</div>
							</div>
						</li>
						<li>
							<div class="form-group">
								<label class="control-label col-md-4 col-sm-4 col-xs-12">收快递员工号</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input name="gCourier" type="text"
										class="form-control col-md-7 col-xs-12"
										value="${gCourier }">
								</div>
							</div>
						</li>
						<li>
							<div class="form-group">
								<label class="control-label col-md-4 col-sm-4 col-xs-12">送快递员工号</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input name="sCourier" type="text"
										class="form-control col-md-7 col-xs-12"
										value="${sCourier }">
								</div>
							</div>
						</li>
						<%--<li>--%>
							<%--<div class="form-group">--%>
								<%--<label class="control-label col-md-4 col-sm-4 col-xs-12">审核结果</label>--%>
								<%--<div class="col-md-6 col-sm-6 col-xs-12">--%>
									<%--<select name="result" class="form-control">--%>
										<%--<option value="">--请选择--</option>--%>
									<%--</select>--%>
								<%--</div>--%>
							<%--</div>--%>
						<%--</li>--%>
						<li><button type="submit" class="btn btn-primary">查
								&nbsp;&nbsp;&nbsp;&nbsp;询</button></li>
					</ul>
				</form>
			</div>
		</div>
	</div>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_content">
				<p class="text-muted font-13 m-b-30"></p>
				<div id="datatable-responsive_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row">
						<div class="col-sm-12">
							<table id="datatable-responsive" style="table-layout: fixed;width: 100%;"
								class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline collapsed"
								cellspacing="0" width="100%" role="grid"
								aria-describedby="datatable-responsive_info">
								<thead>
									<tr role="row">
										<th class="sorting_asc" tabindex="0"
											aria-controls="datatable-responsive" rowspan="1" colspan="1"
											style="width: 80px;"
											aria-label="First name: activate to sort column descending"
											aria-sort="ascending">工单编号</th>
										<th class="sorting_asc" tabindex="0"
											aria-controls="datatable-responsive" rowspan="1" colspan="1"
											style="width: 180px;"
											aria-label="First name: activate to sort column descending"
											aria-sort="ascending">工单号</th>

										<th class="sorting" tabindex="0"
											aria-controls="datatable-responsive" rowspan="1" colspan="1"
											style="width: 80px;"
											aria-label="Last name: activate to sort column ascending">
											目标城市</th>
										<th class="sorting" tabindex="0"
											aria-controls="datatable-responsive" rowspan="1" colspan="1"
											style="width: 150px;"
											aria-label="Last name: activate to sort column ascending">
											目标网点</th>
										<th class="sorting" tabindex="0"
											aria-controls="datatable-responsive" rowspan="1" colspan="1"
											style="width: 80px;"
											aria-label="Last name: activate to sort column ascending">
											收件人</th>
										<<th class="sorting" tabindex="0"
											 aria-controls="datatable-responsive" rowspan="1" colspan="1"
											 style="width: 150px;"
											 aria-label="Last name: activate to sort column ascending">
											收件人地址</th>
										<th class="sorting" tabindex="0"
											aria-controls="datatable-responsive" rowspan="1" colspan="1"
											style="width: 124px;"
											aria-label="Last name: activate to sort column ascending">
											收件人电话</th>
										<th class="sorting" tabindex="0"
											aria-controls="datatable-responsive" rowspan="1" colspan="1"
											style="width: 66px;"
											aria-label="Last name: activate to sort column ascending">
											重量</th>
										<th class="sorting_asc" tabindex="0" style="width: 80px;"
											aria-controls="datatable-responsive" rowspan="1" colspan="1"
											aria-label="First name: activate to sort column descending"
											aria-sort="ascending">取件员ID</th>
										<th class="sorting_asc" tabindex="0" style="text-align: center;"
											aria-controls="datatable-responsive" rowspan="1" colspan="1"
											aria-label="First name: activate to sort column descending"
											aria-sort="ascending">操作</th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="workorder" items="${workorderList }" varStatus="status">
									<tr role="row" class="odd">
										<td tabindex="0" class="sorting_1">${workorder.id}</td>
										<td style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${workorder.workNum }</td>
										<td>${workorder.gCityName}
										<%--<c:forEach var="cityList" items="${cityList}">--%>
										<%--<c:if test="${workorder.gCity eq cityList.id}">${cityList.city}</c:if>--%>
										<%--</c:forEach>--%>
										</td>
										<td>${workorder.gPointName}</td>
										<td>${workorder.gName }</td>
										<td style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${workorder.gAddress }</td>
										<td>${workorder.gTel }</td>
										<td>${workorder.realWeight }</td>
										<td>${workorder.sCourier }</td>
										<%--<td><a href="${pageContext.request.contextPath}/center/todetail" class="btn btn-primary">查看/修改</a></td>--%>
										<td><a id="lookandmodify" href="/center/todetail?workorderid=${workorder.id}" class="btn btn-primary" >查看/修改</a></td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-5">
							<div class="dataTables_info" id="datatable-responsive_info"
								 role="status" aria-live="polite">共${page.total}条记录
								${page.pageNum }/${page.pages}页
							</div>
						</div>
						<div class="col-sm-7">
							<div class="dataTables_paginate paging_simple_numbers"
								 id="datatable-responsive_paginate">
								<ul class="pagination">
									<c:if test="${page.hasPreviousPage eq true }">
										<li class="paginate_button previous"><a
												href="javascript:page_nav(document.forms[0],1);"
												aria-controls="datatable-responsive" data-dt-idx="0"
												tabindex="0">首页</a>
										</li>
										<li class="paginate_button "><a
												href="javascript:page_nav(document.forms[0],${page.prePage});"
												aria-controls="datatable-responsive" data-dt-idx="1"
												tabindex="0">上一页</a>
										</li>
									</c:if>
									<c:if test="${page.hasNextPage eq true }">
										<li class="paginate_button "><a
												href="javascript:page_nav(document.forms[0],${page.nextPage});"
												aria-controls="datatable-responsive" data-dt-idx="1"
												tabindex="0">下一页</a>
										</li>
										<li class="paginate_button next"><a
												href="javascript:page_nav(document.forms[0],${page.lastPage});"
												aria-controls="datatable-responsive" data-dt-idx="7"
												tabindex="0">最后一页</a>
										</li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
</div>
<%@include file="../common/footer.jsp"%>
<script src="${pageContext.request.contextPath }/statics/js/zz/gongdan2_zz.js"></script>
<script src="${pageContext.request.contextPath }/statics/localjs/rollpage.js"></script>