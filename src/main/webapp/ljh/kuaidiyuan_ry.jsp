<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/header.jsp"%>
<div class="clearfix"></div>
<div class="row">
	<div class="col-md-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>
					快递员查询 <i class="fa fa-user"></i><small>${devUserSession.devName}
					</small>
				</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<form method="post" action="list">
					<input type="hidden" name="pageIndex" value="1" />
					<ul>

						<li>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">快递员编号</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input name="querySoftwareName" type="text"
										class="form-control col-md-7 col-xs-12"
										value="${querySoftwareName }">
								</div>
							</div>
						</li>

						<li>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">快递员姓名</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input name="querySoftwareName" type="text"
										class="form-control col-md-7 col-xs-12"
										value="${querySoftwareName }">
								</div>
							</div>
						</li>

						<li>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">性别</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<select name="queryStatus" class="form-control">
										<option value="男">男</option>
										<option value="女">女</option>
									</select>
								</div>
							</div>
						</li>
						
						<li>
							<div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">身份证号码</label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<input name="querySoftwareName" type="text"
										class="form-control col-md-7 col-xs-12"
										value="${querySoftwareName }">
								</div>
							</div>
						</li>


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
				<div id="datatable-responsive_wrapper"
					class="dataTables_wrapper form-inline dt-bootstrap no-footer">
					<div class="row">
						<div class="col-sm-12">
							<a href="${pageContext.request.contextPath}/addkuaidiyuan_ry.jsp"
								class="btn btn-success btn-sm">新增快递员基础信息</a>
							<table id="datatable-responsive"
								class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline collapsed"
								cellspacing="0" width="100%" role="grid"
								aria-describedby="datatable-responsive_info"
								style="width: 100%;">
								<thead>
									<tr role="row">
										<th class="sorting_asc" tabindex="0"
											aria-controls="datatable-responsive" rowspan="1" colspan="1"
											aria-label="First name: activate to sort column descending"
											aria-sort="ascending">快递员编号</th>
										<th class="sorting" tabindex="0"
											aria-controls="datatable-responsive" rowspan="1" colspan="1"
											aria-label="Last name: activate to sort column ascending">
											快递员姓名</th>
										<th class="sorting" tabindex="0"
											aria-controls="datatable-responsive" rowspan="1" colspan="1"
											aria-label="Last name: activate to sort column ascending">
											快递员性别</th>
										<th class="sorting" tabindex="0"
											aria-controls="datatable-responsive" rowspan="1" colspan="1"
											aria-label="Last name: activate to sort column ascending">
											快递员出生日期</th>
										<th class="sorting" tabindex="0"
											aria-controls="datatable-responsive" rowspan="1" colspan="1"
											aria-label="Last name: activate to sort column ascending">
											快递员住址</th>
										<th class="sorting" tabindex="0"
											aria-controls="datatable-responsive" rowspan="1" colspan="1"
											aria-label="Last name: activate to sort column ascending">
											快递员电话</th>
										<th class="sorting" tabindex="0"
											aria-controls="datatable-responsive" rowspan="1" colspan="1"
											aria-label="Last name: activate to sort column ascending">
											快递员身份证号</th>
										<th class="sorting" tabindex="0"
											aria-controls="datatable-responsive" rowspan="1" colspan="1"
											aria-label="Last name: activate to sort column ascending">
											操作</th>
									</tr>
								</thead>
								<tbody>

									<tr role="row" class="odd">
										<td>1</td>
										<td>小白</td>
										<td>男</td>
										<td>1982/05/26</td>
										<td>岳阳市岳阳楼区</td>
										<td>13873091156</td>
										<td>430626198205261122</td>

										<td>
											<div class="btn-group">
												<button type="button" class="btn btn-danger">点击操作</button>
												<button type="button" class="btn btn-danger dropdown-toggle"
													data-toggle="dropdown" aria-expanded="false">
													<span class="caret"></span> <span class="sr-only">Toggle
														Dropdown</span>
												</button>
												<ul class="dropdown-menu" role="menu">

													<li><a
														href="${pageContext.request.contextPath}/kuaidiyuan_modify.jsp"
														data-toggle="tooltip" data-placement="top" title=""
														data-original-title="修改信息">修改信息</a></li>
													<li><a
														href="${pageContext.request.contextPath}/kuaidiyuan_view.jsp"
														data-toggle="tooltip" data-placement="top" title=""
														data-original-title="查看详细信息">查看信息</a></li>
												</ul>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-5">
							<div class="dataTables_info" id="datatable-responsive_info"
								role="status" aria-live="polite">共1条记录 1页</div>
						</div>
						<div class="col-sm-7">
							<div class="dataTables_paginate paging_simple_numbers"
								id="datatable-responsive_paginate">
								<ul class="pagination">
									<c:if test="${pages.currentPageNo > 1}">
										<li class="paginate_button previous"><a
											href="javascript:page_nav(document.forms[0],1);"
											aria-controls="datatable-responsive" data-dt-idx="0"
											tabindex="0">首页</a></li>
										<li class="paginate_button "><a
											href="javascript:page_nav(document.forms[0],${pages.currentPageNo-1});"
											aria-controls="datatable-responsive" data-dt-idx="1"
											tabindex="0">上一页</a></li>
									</c:if>
									<c:if test="${pages.currentPageNo < pages.totalPageCount }">
										<li class="paginate_button "><a
											href="javascript:page_nav(document.forms[0],${pages.currentPageNo+1 });"
											aria-controls="datatable-responsive" data-dt-idx="1"
											tabindex="0">下一页</a></li>
										<li class="paginate_button next"><a
											href="javascript:page_nav(document.forms[0],${pages.totalPageCount });"
											aria-controls="datatable-responsive" data-dt-idx="7"
											tabindex="0">最后一页</a></li>
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
<%@include file="common/footer.jsp"%>
<script
	src="${pageContext.request.contextPath }/statics/localjs/rollpage.js"></script>
