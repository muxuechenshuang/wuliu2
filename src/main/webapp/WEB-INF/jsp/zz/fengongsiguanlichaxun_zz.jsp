<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@include file="../common/header.jsp"%>
<div class="clearfix"></div>
<div class="row">
	<div class="col-md-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>
					分公司管理人员 <i class="fa fa-user"></i><small>${devUserSession.devName}
						- 您可以通过搜索或者其他的筛选项对分公司的管理人员信息进行修改、删除等管理操作。^_^</small>
				</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<form method="post" action="/center/finduser">
					<input type="hidden" name="pageIndex" value="1" />
			    <ul>
					<li>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">管理员ID：</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input name="id" id="id" type="number" class="form-control col-md-7 col-xs-12" value="${id }">
							</div>
						</div>
					</li>
					
					
					<li>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">电话：</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input name="phone" id="phone" type="text" class="form-control col-md-7 col-xs-12" value="${phone }">
							</div>
						</div>
					</li>
						<li>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">所属分公司</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input name="parentid" id="parentid" type="text" class="form-control col-md-7 col-xs-12" value="${parentid }">
							</div>
						</div>
					</li>

				
					<li><input type="submit" class="btn btn-primary" value="查询">
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
					<%--<a href="${pageContext.request.contextPath}/dev/flatform/app/appinfoadd" class="btn btn-success btn-sm">员工列表</a>--%>
						<table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline collapsed"
							cellspacing="0" width="100%" role="grid" aria-describedby="datatable-responsive_info" style="width: 100%;">
							<thead>
								<tr role="row">
									<th class="sorting_asc" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="First name: activate to sort column descending"
										aria-sort="ascending">管理员ID</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										管理员用户名</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										管理员密码</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										管理员邮箱</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										电话</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										性别</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										所属分公司</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										创建时间</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										style="width: 124px;"
										aria-label="Last name: activate to sort column ascending">
										查看/修改</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										style="width: 124px;"
										aria-label="Last name: activate to sort column ascending">
										删除</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="user" items="${list }" varStatus="status">
								<tr role="row" class="odd">
									<td tabindex="0" class="sorting_1">${user.id}</td>
									<td>${user.username }</td>
									<td>${user.password }</td>
									<td>${user.email }</td>
									<td>${user.phone }</td>
									<td>${user.sex }</td>
									<td>${user.parentid }</td>
									<td><fmt:formatDate value="${user.time}" pattern='yyyy-MM-dd HH:mm:ss'/></td>
									<td><a id="lookandmodify" href="/center/userDetail?userid=${user.id}" class="btn btn-primary" >查看/修改</a></td>
									<td><a id="delect" href="/center/delectuser?userid=${user.id}" class="btn btn-primary" >删除</a></td>

								<%--<td><a href="/center/tosondetail?id=${organization.id}" class="btn btn-primary">查看/修改</a></td>--%>
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
		</div>
	</div>
</div>
</div>
<%@include file="../common/footer.jsp"%>
<script src="${pageContext.request.contextPath }/statics/localjs/rollpage.js"></script>