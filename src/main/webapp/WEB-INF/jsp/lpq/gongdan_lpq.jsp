&nbsp;<%@ page language="java" contentType="text/html; charset=UTF-8"
			   pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../common/header.jsp"%>
<div class="clearfix"></div>
<div class="row">
	<div class="col-md-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>
					工单管理 <i class="fa fa-user"></i><small>
				</small>
				</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<form method="post" action="${pageContext.request.contextPath}/wuliu/gongdan" >
					<ul>
						<li>
							<div class="form-group">
								<label class="control-label col-md-4 col-sm-4 col-xs-12">工单编号：</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input name="id" type="number" class="form-control col-md-7 col-xs-12" value="">
								</div>
							</div>
						</li>
						<li>
							<div class="form-group">
								<label class="control-label col-md-4 col-sm-4 col-xs-12">寄件人姓名：</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input name="sName" type="text" class="form-control col-md-7 col-xs-12" value="">
								</div>
							</div>
						</li>

						<li>
							<div class="form-group">
								<label class="control-label col-md-4 col-sm-4 col-xs-12">寄件人手机：</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input name="sTel" type="text" class="form-control col-md-7 col-xs-12" value="">
								</div>
							</div>
						</li>

						<li>
							<div class="form-group">
								<label class="control-label col-md-4 col-sm-4 col-xs-12">收件人姓名：</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input name="gName" type="text" class="form-control col-md-7 col-xs-12" value="">
								</div>
							</div>
						</li>

						<li>
							<div class="form-group">
								<label class="control-label col-md-4 col-sm-4 col-xs-12">收件人手机：</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input name="gTel" type="text" class="form-control col-md-7 col-xs-12" value="">
								</div>
							</div>
						</li>


						<li><input type="submit" class="btn btn-primary" value="查询"/>
						</li>
					</ul>
				</form>

			</div>
		</div>
	</div>
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_content">
				<p class="text-muted font-13 m-b-30"></p>
				<div id="datatable-responsive_wrapper"
					 class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row">
						<div class="col-sm-12">
							<a href="" class="btn btn-success btn-sm">工单列表</a>
							<table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline collapsed"
								   cellspacing="0" width="100%" role="grid" aria-describedby="datatable-responsive_info" style="width: 100%;">
								<thead>
								<tr role="row">
									<th class="sorting_asc" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="First name: activate to sort column descending"
										aria-sort="ascending">工单编号</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										寄件人姓名</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										寄件人手机</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										寄件人地址</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										收件人姓名</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										收件人手机</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										收件人地址</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										style="width: 124px;"
										aria-label="Last name: activate to sort column ascending">
										快递员工号</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										style="width: 124px;"
										aria-label="Last name: activate to sort column ascending">
										时间</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										style="width: 124px;"
										aria-label="Last name: activate to sort column ascending">
										操作</th>
								</tr>
								</thead>
								<tbody>
								<c:forEach items="${listWorkorder}"  var="workor" varStatus="add">
									<tr>
										<td>${add.count}</td>
										<td>${workor.sName}</td>
										<td>${workor.sTel}</td>
										<td>${workor.sAddress}</td>
										<td>${workor.gName}</td>
										<td>${workor.gTel}</td>
										<td>${workor.gAddress}</td>
										<td>${workor.gCourier}</td>
										<td>${workor.riseTime}</td>
										<td><a href="javascript:;" class="btn btn-primary">确认</a></td>
									</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-5">
							<div class="dataTables_info" id="datatable-responsive_info"
								 role="status" aria-live="polite">共${pages.pages }条记录
								${pages.pageNum }/${pages.pages}页</div>
						</div>
						<div class="col-sm-7">
							<div class="dataTables_paginate paging_simple_numbers"
								 id="datatable-responsive_paginate">
								<ul class="pagination">
									<li class="paginate_button previous"><a href="${pageContext.request.contextPath}/wuliu/gongdan?pageIndex=1">首页</a>
									</li>
									<li class="paginate_button ">
										<a href="${pageContext.request.contextPath}/wuliu/gongdan?pageIndex=${pages.pageNum-1<1?1:pages.pageNum-1}">上一页</a>
									</li>
									<li class="paginate_button "><a href="${pageContext.request.contextPath}/wuliu/gongdan?pageIndex=${pages.pageNum+1>pages.pages?pages.pages:pages.pageNum+1}">下一页</a>
									</li>
									<li class="paginate_button next"><a href="${pageContext.request.contextPath}/wuliu/gongdan?pageIndex=${pages.pages}">最后一页</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
<%@include file="../common/footer.jsp"%>