&nbsp;<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@include file="../common/header.jsp"%>
<div class="clearfix"></div>
<div class="row">
	<div class="col-md-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>
					员工管理 <i class="fa fa-user"></i><small>
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
							<label class="control-label col-md-3 col-sm-3 col-xs-12">员工编号：</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input name="querySoftwareName" type="text" class="form-control col-md-7 col-xs-12" value="${querySoftwareName }">
							</div>
						</div>
					</li>
					
					
					   <li>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">姓名：</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input name="querySoftwareName" type="text" class="form-control col-md-7 col-xs-12" value="${querySoftwareName }">
							</div>
						</div>
					   </li>
						<li>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">手机号：</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input name="querySoftwareName" type="text" class="form-control col-md-7 col-xs-12" value="${querySoftwareName }">
							</div>
						</div>
					   </li>
						<li>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">邮箱：</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input name="querySoftwareName" type="text" class="form-control col-md-7 col-xs-12" value="${querySoftwareName }">
							</div>
						</div>
					   </li>
					
						<%-- <li>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">所属网点编号：</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input name="querySoftwareName" type="text" class="form-control col-md-7 col-xs-12" value="${querySoftwareName }">
							</div>
						</div>
					   </li>
					   
					   	<li>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">所属分公司编号：</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input name="querySoftwareName" type="text" class="form-control col-md-7 col-xs-12" value="${querySoftwareName }">
							</div>
						</div>
					   </li> --%>
				
					<li><button type="submit" class="btn btn-primary"> 查 &nbsp;&nbsp;&nbsp;&nbsp;询 </button>
					<button type="submit" class="btn btn-primary"> 返 &nbsp;&nbsp;&nbsp;&nbsp;回 </button></li>
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
					<a href="tianjiayuangong2.jsp" class="btn btn-success btn-sm">添加员工</a>
						<table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline collapsed"
							cellspacing="0" width="100%" role="grid" aria-describedby="datatable-responsive_info" style="width: 100%;">
							<thead>
								<tr role="row">
									<th class="sorting_asc" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="First name: activate to sort column descending"
										aria-sort="ascending">员工编号</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										手机号</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										员工名称</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										性别</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										邮箱</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										地址</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										style="width: 124px;"
										aria-label="Last name: activate to sort column ascending">
										备注</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										style="width: 124px;"
										aria-label="Last name: activate to sort column ascending">
										操作</th>
								</tr>
							</thead>
							<tbody>
								<tr>
								 <td>1</td>
								 <td>13588888888</td>
								 <td>李普强</td>
								 <td>男</td>
								 <td>787465493@qq.com</td>
								 <td>相思树</td>
								 <td>发发发</td>
								 <td><a href="yuangongxiangqing2.jsp" class="btn btn-primary">个人详情</a></td>
								</tr>
									<tr>
								 <td>2</td>
								 <td>13588888888</td>
								 <td>李普强</td>
								 <td>男</td>
								 <td>787465493@qq.com</td>
								 <td>相思树</td>
								 <td>发发发</td>
								<td><a href="yuangongxiangqing2.jsp" class="btn btn-primary">个人详情</a></td>
								</tr>
									<tr>
								 <td>3</td>
								 <td>13588888888</td>
								 <td>李普强</td>
								 <td>男</td>
								 <td>787465493@qq.com</td>
								 <td>相思树</td>
								 <td>发发发</td>
								<td><a href="yuangongxiangqing2.jsp" class="btn btn-primary">个人详情</a></td>
								</tr>
										<tr>
								 <td>4</td>
								 <td>13588888888</td>
								 <td>李普强</td>
								 <td>男</td>
								 <td>787465493@qq.com</td>
								 <td>相思树</td>
								 <td>发发发</td>
								<td><a href="yuangongxiangqing2.jsp" class="btn btn-primary">个人详情</a></td>
								</tr>
								
									<tr>
								 <td>5</td>
								 <td>13588888888</td>
								 <td>李普强</td>
								 <td>男</td>
								 <td>787465493@qq.com</td>
								 <td>相思树</td>
								 <td>发发发</td>
								<td><a href="yuangongxiangqing2.jsp" class="btn btn-primary">个人详情</a></td>
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
<%@include file="../common/footer.jsp"%>