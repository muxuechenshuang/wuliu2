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
					订单管理 <i class="fa fa-user"></i><small>
				</small>
				</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<form method="post" action="${pageContext.request.contextPath}/wuliu/ding">
					<ul>
						<li>
							<div class="form-group">
								<label class="control-label col-md-4 col-sm-4 col-xs-12">订单编号：</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input name="id" type="text" class="form-control col-md-7 col-xs-12" value="${id}">
								</div>
							</div>
						</li>

						<li>
							<div class="form-group">
								<label class="control-label col-md-4 col-sm-4 col-xs-12">寄件人姓名：</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input name="gName" type="text" class="form-control col-md-7 col-xs-12" value="${gName}">
								</div>
							</div>
						</li>
						<li>
							<div class="form-group">
								<label class="control-label col-md-4 col-sm-4 col-xs-12">寄件人手机：</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input name="sTel" type="text" class="form-control col-md-7 col-xs-12" value="${sTel}">
								</div>
							</div>
						</li>

						<li>
							<div class="form-group">
								<label class="control-label col-md-4 col-sm-4 col-xs-12">订单状态：</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<select name="status" class="form-control">
										<option value="" selected="selected">--请选择--</option>
										<option value="1">已预约</option>
										<option value="2">正在进行</option>
										<option value="3">已完成</option>
										<option value="4">已取消</option>
									</select>
								</div>
							</div>
						</li>

						<li><input type="submit" class="btn btn-primary" value="查询">  </input>
							<input type="button" class="btn btn-primary" value="返回"> </input>
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
							<a href="${pageContext.request.contextPath}/dev/flatform/app/appinfoadd" class="btn btn-success btn-sm">审核订单列表</a>
							<table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline collapsed"
								   cellspacing="0" width="100%" role="grid" aria-describedby="datatable-responsive_info" style="width: 100%;">
								<thead>
								<tr role="row">
									<th class="sorting_asc" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="First name: activate to sort column descending"
										aria-sort="ascending">订单编号</th>
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
										地址</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										重量</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										价格</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										style="width: 124px;"
										aria-label="Last name: activate to sort column ascending">
										备注</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										style="width: 124px;"
										aria-label="Last name: activate to sort column ascending">
										快递员</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										style="width: 124px;"
										aria-label="Last name: activate to sort column ascending">
										订单状态</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										style="width: 124px;"
										aria-label="Last name: activate to sort column ascending">
										委托</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										style="width: 124px;"
										aria-label="Last name: activate to sort column ascending">
										操作</th>
								</tr>
								</thead>
								<tbody>
								<c:forEach items="${listOrder}" var="order" varStatus="add">


									<tr>
										<td class="hao">${order.id}</td>
										<td>${order.sName}</td>
										<td>${order.sTel}</td>
										<td>${order.sAddress}</td>
										<td>${order.preWeight}</td>
										<td>12元</td>
										<td>${order.comment}</td>
										<td>

											<div class="form-group">
												<div class="col-md-6 col-sm-6 col-xs-12">
													<select id="kuai2" name="userId" class="form-control">
														<option value="">--请选择--</option>
														<c:forEach items="${listUser}" varStatus="add" var="user">
															<option value="${user.id}">${user.username}</option>
														</c:forEach>
													</select>
												</div>
											</div>

										</td>
										<td class="pei2" <c:if test="${!empty order.usernamekuai}">style="color: red" </c:if>  >
											<c:choose>
											<c:when test="${empty order.usernamekuai}">未分配</c:when>
											<c:otherwise>${order.usernamekuai}</c:otherwise>
										    </c:choose>
										</td>
										<td>${order.username}</td>
										<td><a href="javascript:;" class="btn btn-primary pp"  >分配</a>
											<a href="${pageContext.request.contextPath}/wuliu/xiangqing?id=${order.id}" class="btn btn-primary">订单详情</a>
										</td>
									</tr>
								</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-5">
							<div class="dataTables_info" id="datatable-responsive_info"
								 role="status" aria-live="polite">共${pages.total }条记录
								${pages.pageNum }/${pages.pages }页</div>
						</div>
						<div class="col-sm-7">
							<div class="dataTables_paginate paging_simple_numbers"
								 id="datatable-responsive_paginate">
								<ul class="pagination">
									<c:if test="${pages.pageNum > 1}">
										<li class="paginate_button previous">
											<a href="${pageContext.request.contextPath}/wuliu/ding?pageIndex=1">首页</a>
										</li>
										<li class="paginate_button ">
											<a href="${pageContext.request.contextPath}/wuliu/ding?pageIndex=${pages.pageNum-1<1?1:pages.pageNum-1}">上一页</a>
										</li>
									</c:if>
									<c:if test="${pages.pageNum < pages.pages }">
										<li class="paginate_button ">
											<a href="${pageContext.request.contextPath}/wuliu/ding?pageIndex=${pages.pageNum+1>pages.pages?pages.pages:pages.pageNum+1}">下一页</a>
										</li>
										<li class="paginate_button next">
											<a href="${pageContext.request.contextPath}/wuliu/ding?pageIndex=${pages.pages}">最后一页</a>
										</li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<%@include file="../common/footer.jsp"%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/statics/localjs/fenpei.js"></script>