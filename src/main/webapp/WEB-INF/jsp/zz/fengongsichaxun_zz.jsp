<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@include file="../common/header.jsp"%>
<div class="clearfix"></div>
<div class="row">
	<div class="col-md-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>
					分公司管理 <i class="fa fa-user"></i><small>${devUserSession.devName}
						- 您可以通过搜索或者其他的筛选项对分公司的信息进行修改、删除等管理操作。^_^</small>
				</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<form method="post" action="/center/soncompanylist">
					<input type="hidden" name="pageIndex" value="1" />
			    <ul>
					<li>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12" for="id">公司编号：</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input name="id" id="id" type="number" class="form-control col-md-7 col-xs-12" value="${id }">
							</div>
						</div>
					</li>
					
					
					<li>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">电话：</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input name="phone" type="text" class="form-control col-md-7 col-xs-12" value="${phone }">
							</div>
						</div>
					</li>
						<li>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">分公司名称：</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input name="name" type="text" class="form-control col-md-7 col-xs-12" value="${name }">
							</div>
						</div>
					</li>

				
					<li><button type="submit" class="btn btn-primary"> 查 &nbsp;&nbsp;&nbsp;&nbsp;询 </button>
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
										aria-sort="ascending">分公司编号</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										分公司名称</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										电话</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										地址</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										所在城市</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										介绍</th>
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
							<c:forEach var="organization" items="${list }" varStatus="status">
								<tr role="row" class="odd">
									<td tabindex="0" class="sorting_1">${organization.id}</td>
									<td>${organization.name }</td>
									<td>${organization.phone }</td>
									<td>${organization.site }</td>
									<td>${organization.city }</td>
									<td>${organization.introduction }</td>
									<td><a id="lookandmodify" href="/center/tosondetail?organizationid=${organization.id}" class="btn btn-primary" >查看/修改</a></td>
									<td><a id="delect" href="/center/delect?organizationid=${organization.id}" class="btn btn-primary" >删除</a></td>

								<%--<td><a href="/center/tosondetail?id=${organization.id}" class="btn btn-primary">查看/修改</a></td>--%>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<%--<div class="row">--%>
					<%--<div class="col-sm-5">--%>
						<%--<div class="dataTables_info" id="datatable-responsive_info"--%>
							<%--role="status" aria-live="polite">共${pages.totalCount }条记录--%>
							<%--${pages.currentPageNo }/${pages.totalPageCount }页</div>--%>
					<%--</div>--%>
					<%--<div class="col-sm-7">--%>
						<%--<div class="dataTables_paginate paging_simple_numbers"--%>
							<%--id="datatable-responsive_paginate">--%>
							<%--<ul class="pagination">--%>
								<%--<c:if test="${pages.currentPageNo > 1}">--%>
									<%--<li class="paginate_button previous"><a--%>
										<%--href="javascript:page_nav(document.forms[0],1);"--%>
										<%--aria-controls="datatable-responsive" data-dt-idx="0"--%>
										<%--tabindex="0">首页</a>--%>
									<%--</li>--%>
									<%--<li class="paginate_button "><a--%>
										<%--href="javascript:page_nav(document.forms[0],${pages.currentPageNo-1});"--%>
										<%--aria-controls="datatable-responsive" data-dt-idx="1"--%>
										<%--tabindex="0">上一页</a>--%>
									<%--</li>--%>
								<%--</c:if>--%>
								<%--<c:if test="${pages.currentPageNo < pages.totalPageCount }">--%>
									<%--<li class="paginate_button "><a--%>
										<%--href="javascript:page_nav(document.forms[0],${pages.currentPageNo+1 });"--%>
										<%--aria-controls="datatable-responsive" data-dt-idx="1"--%>
										<%--tabindex="0">下一页</a>--%>
									<%--</li>--%>
									<%--<li class="paginate_button next"><a--%>
										<%--href="javascript:page_nav(document.forms[0],${pages.totalPageCount });"--%>
										<%--aria-controls="datatable-responsive" data-dt-idx="7"--%>
										<%--tabindex="0">最后一页</a>--%>
									<%--</li>--%>
								<%--</c:if>--%>
							<%--</ul>--%>
						<%--</div>--%>
					<%--</div>--%>
				<%--</div>--%>
			</div>
		</div>
	</div>
</div>
<%@include file="../common/footer.jsp"%>