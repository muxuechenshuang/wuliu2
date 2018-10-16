&nbsp;<%@ page language="java" contentType="text/html; charset=UTF-8"
			   pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/header.jsp" %>
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
				<form method="post" action="${pageContext.request.contextPath}/wuliu/fengongdan">
					<ul>
						<li>
							<div class="form-group">
								<label class="control-label col-md-5 col-sm-5 col-xs-12">工单编号：</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input name="workNum" type="text" class="form-control col-md-7 col-xs-12" value="${workNum}">
								</div>
							</div>
						</li>

						<li>
							<div class="form-group">
								<label class="control-label col-md-5 col-sm-5 col-xs-12">订单号：</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input name="orderNum" type="text" class="form-control col-md-7 col-xs-12" value="${orderNum }">
								</div>
							</div>
						</li>

						<li>
							<div class="form-group">
								<label class="control-label col-md-5 col-sm-5 col-xs-12">收件人姓名：</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input name="gName" type="text" class="form-control col-md-7 col-xs-12" value="${gName}">
								</div>
							</div>
						</li>
						<li>
							<div class="form-group">
								<label class="control-label col-md-5 col-sm-5 col-xs-12">收件人手机：</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input name="gTel" type="text" class="form-control col-md-7 col-xs-12" value="${gTel}">
								</div>
							</div>
						</li>
						<li>
							<div class="form-group">
								<label class="control-label col-md-5 col-sm-5 col-xs-12">收件人网点：</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input name="gPoint" type="text" class="form-control col-md-7 col-xs-12" value="${gPoint}">
								</div>
							</div>
						</li>
						<li>
							<div class="form-group">
								<label class="control-label col-md-5 col-sm-5 col-xs-12">工单状态：</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<select name="workStatus" class="form-control">
										<option value="" selected="selected">--请选择--</option>
										<option value="1">发货状态</option>
										<option value="2">签收状态</option>
										<option value="3">异常状态</option>
									</select>
								</div>
							</div>
						</li>

						<li>
							<div class="form-group">
								<label class="control-label col-md-5 col-sm-5 col-xs-12">收快递员工号：</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input name="gCourier" type="text" class="form-control col-md-7 col-xs-12" value="${gCourier }">
								</div>
							</div>
						</li>
						<li><input type="submit" class="btn btn-primary" value="查询"></input>
							<a href="JavaScript:history.back(-1)" class="btn btn-primary">返回</a>
						<li></li>
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
						<div class="col-sm-12" id="gong">
							<input type="button" id="selectAll" class="btn btn-primary " value="全选"/>
							<input type="button" id="selectAll2" class="btn btn-primary " value="取消全选"></input>
							<select id="qiang" >
								<option value="" selected="selected">---请选择-</option>
								<c:forEach items="${listUser}" var="user">
									<option value="${user.id}">${user.username}</option>
								</c:forEach>
							</select>
							<input type="button" id="selectAll3" class="btn btn-primary " value="批量操作"></input>

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
										订单号</th>

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
										配送员</th>
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
								<tbody class="go">
								<c:forEach items="${listWorkorder}" var="workor" varStatus="add">
									<input type="hidden" class="gid" value="${workor.id}" />
									<tr>
										<td>
											<input type="checkbox"  name="id" class="choose" />
											<input type="hidden"  name="id" value="${workor.id}" class="choose2"/>
										</td>
										<td>${workor.orderNum}</td>
										<td>${workor.gName}</td>
										<td>${workor.gTel}</td>
										<td>${workor.realWeight}</td>
										<td>${workor.expenses}</td>
										<td>${workor.comment}</td>
										<td>
											<div class="form-group">
												<div class="col-md-6 col-sm-6 col-xs-12">
													<select id="kuai2" name="username" class="form-control">
														<option value="">--请选择--</option>
														<c:forEach items="${listUser}" var="user">
															<option value="${user.id}">${user.username}</option>
														</c:forEach>
													</select>
												</div>
											</div>
										</td>
										<td class="pei3" <c:if test="${!empty workor.username}">style="color: red" </c:if>  >
										<c:choose>
											<c:when test="${empty workor.username}">未分配</c:when>
											<c:otherwise>${workor.username}</c:otherwise>
										</c:choose>
										</td>
										<td>${workor.entrustNumber}</td>

										<td><a href="javascript:;" class="btn btn-primary gg">分配</a>
											<a href="${pageContext.request.contextPath}/wuliu/gongxiang?id=${workor.id}" class="btn btn-primary">工单详情</a></td>
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
									<li class="paginate_button previous">
										<a href="${pageContext.request.contextPath}/wuliu/fengongdan?pageIndex=1">首页</a>
									</li>
									<li class="paginate_button ">
										<a href="${pageContext.request.contextPath}/wuliu/fengongdan?pageIndex=${pages.pageNum-1<1?1:pages.pageNum-1}">上一页</a>
									</li>
									<li class="paginate_button ">
										<a href="${pageContext.request.contextPath}/wuliu/fengongdan?pageIndex=${pages.pageNum+1>pages.pages?pages.pages:pages.pageNum+1}">下一页</a>
									</li>
									<li class="paginate_button next">
										<a href="${pageContext.request.contextPath}/wuliu/fengongdan?pageIndex=${pages.pages}">最后一页</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@include file="../common/footer.jsp"%>
		<script src="${pageContext.request.contextPath}/statics/js/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/statics/localjs/fenpeigong.js">
		</script>
