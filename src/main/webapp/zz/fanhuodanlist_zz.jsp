<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!-- 	返货单详情 -->
<%@include file="../../../common/header.jsp"%>
<div class="clearfix"></div>
<div class="row">

	<div class="col-md-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>
					APP 审核列表 <i class="fa fa-user"></i><small>${userSession.userName}
						- 您可以通过搜索或者其他的筛选项对APP的信息进行审核操作。^_^</small>
				</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<form method="post" action="list">
					<input type="hidden" name="pageIndex" value="1" />
			    <ul>
					<li>
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4 col-xs-12">返货单号</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input name="querySoftwareName" type="text" class="form-control col-md-7 col-xs-12" value="${querySoftwareName }">
							</div>
						</div>
					</li>
					<li>
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4 col-xs-12">申请员工工号</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input name="querySoftwareName" type="text" class="form-control col-md-7 col-xs-12" value="${querySoftwareName }">
							</div>
						</div>
					</li>
					<li>
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4 col-xs-12">审核状态</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<select name="queryStatus" class="form-control">
									   <option value="">--请选择--</option>
        						</select>
							</div>
						</div>
					</li>
					<li>
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4 col-xs-12">相关工单编号</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<select name="queryFlatformId" class="form-control">
									   <option value="">--请选择--</option>
        						</select>
							</div>
						</div>
					</li>

					<li><button type="submit" class="btn btn-primary"> 查 &nbsp;&nbsp;&nbsp;&nbsp;询 </button></li>
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
						<table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline collapsed"
							cellspacing="0" width="100%" role="grid" aria-describedby="datatable-responsive_info" style="width: 100%;">
							<thead>
								<tr role="row">
									<th class="sorting_asc" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										style="width: 124px;"
										aria-label="First name: activate to sort column descending"
										aria-sort="ascending">返货单号</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										style="width: 80px;"
										aria-label="Last name: activate to sort column ascending">
										申请人</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										style="width: 80px;"
										aria-label="Last name: activate to sort column ascending">
										返货原因</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										style="width: 80px;"
										aria-label="Last name: activate to sort column ascending">
										创建时间</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										style="" Last name: activate to sort column ascending">
										审核状态</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										style="width: 124px;"
										aria-label="Last name: activate to sort column ascending">
										审核时间</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										style="width: 66px;"
										aria-label="Last name: activate to sort column ascending">
										备注</th>

									<th class="sorting_asc" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="First name: activate to sort column descending"
										aria-sort="ascending">审核</th>
								</tr>
							</thead>
							<tbody>
								<tr>
								 <td>李普强</td>
								 <td>13588888888</td>
								 <td>市场部</td>
								 <td>湖南</td>
								 <td>岳阳</td>
								 <td>相思树</td>
								 <td>8991233883893</td>
								 <td><a href="fanhuodanxiangqing_zz.jsp" class="btn btn-primary">审核</a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-5">
						<div class="dataTables_info" id="datatable-responsive_info"
							role="status" aria-live="polite">共${pages.totalCount }条记录
							${pages.currentPageNo }/${pages.totalPageCount }页</div>
					</div>
					<div class="col-sm-7">
						<div class="dataTables_paginate paging_simple_numbers"
							id="datatable-responsive_paginate">
							<ul class="pagination">
								<c:if test="${pages.currentPageNo > 1}">
									<li class="paginate_button previous"><a
										href="javascript:page_nav(document.forms[0],1);"
										aria-controls="datatable-responsive" data-dt-idx="0"
										tabindex="0">首页</a>
									</li>
									<li class="paginate_button "><a
										href="javascript:page_nav(document.forms[0],${pages.currentPageNo-1});"
										aria-controls="datatable-responsive" data-dt-idx="1"
										tabindex="0">上一页</a>
									</li>
								</c:if>
								<c:if test="${pages.currentPageNo < pages.totalPageCount }">
									<li class="paginate_button "><a
										href="javascript:page_nav(document.forms[0],${pages.currentPageNo+1 });"
										aria-controls="datatable-responsive" data-dt-idx="1"
										tabindex="0">下一页</a>
									</li>
									<li class="paginate_button next"><a
										href="javascript:page_nav(document.forms[0],${pages.totalPageCount });"
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
<%@include file="../../../common/footer.jsp"%>
<script src="${pageContext.request.contextPath }/statics/localjs/rollpage.js"></script>
<script src="${pageContext.request.contextPath }/statics/localjs/applist.js"></script>