&nbsp;<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
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
				<form method="post" action="list">
					<input type="hidden" name="pageIndex" value="1" />
			    <ul>
					<li>
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4 col-xs-12">订单编号：</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input name="querySoftwareName" type="text" class="form-control col-md-7 col-xs-12" value="${querySoftwareName }">
							</div>
						</div>
					</li>
					
						<li>
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4 col-xs-12">寄件人姓名：</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<select name="queryStatus" class="form-control">
									   <option value="" selected="selected">--请选择--</option>
									   <option value="">张三</option>
									   <option value="">李四</option>
									   <option value="">王五</option>
        						</select>
							</div>
						</div>
					</li>
					<li>
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4 col-xs-12">寄件人手机：</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input name="querySoftwareName" type="text" class="form-control col-md-7 col-xs-12" value="${querySoftwareName }">
							</div>
						</div>
					</li>
				
						<li>
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4 col-xs-12">订单状态：</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<select name="queryStatus" class="form-control">
									   <option value="" selected="selected">--请选择--</option>
									   <option value="">发货状态</option>
									   <option value="">签收状态</option>
									   <option value="">异常状态</option>
        						</select>
							</div>
						</div>
					</li>
					<li>
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4 col-xs-12">所属网点：</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<select name="queryStatus" class="form-control">
									   <option value="" selected="selected">--请选择--</option>
									   <option value="">HA12212</option>
									   <option value="">AK43423</option>
									   <option value="">LP32323</option>
        						</select>
							</div>
						</div>
					</li>
					<li><button type="submit" class="btn btn-primary"> 查 &nbsp;&nbsp;&nbsp;&nbsp;询 </button>
					<button type="submit" class="btn btn-primary"> 返 &nbsp;&nbsp;&nbsp;&nbsp;回 </button></li>
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
								<tr>
								 <td>HH111111</td>
								 <td>李普强</td>
								 <td>13688888888</td>
								 <td>岳阳</td>
								 <td>50KG</td>
								 <td>200元</td>
								 <td>发发发</td>
								 <td>
								 
								 	<div class="form-group">
							<div class="col-md-6 col-sm-6 col-xs-12">
								<select id="queryCategoryLevel" name="queryCategoryLevel1" class="form-control">
									   <option value="">--请选择--</option>
									   <option value="">张三</option>
									   <option value="">李四</option>
									   <option value="">王五</option>
        						</select>
							</div>
						</div>
								 
								 </td>
								 <td>已分配：张三</td>
									<td>李四</td>
								 <td><a href="" class="btn btn-primary">分配</a>
								 <a href="shenghexiangqing3.jsp" class="btn btn-primary">订单详情</a></td>
								</tr>
								
								
								<tr>
								 <td>HH111111</td>
								 <td>李普强</td>
								 <td>13688888888</td>
								 <td>岳阳</td>
								 <td>50KG</td>
								 <td>200元</td>
								 <td>发发发</td>
								 <td>
								 
								 	<div class="form-group">
							<div class="col-md-6 col-sm-6 col-xs-12">
								<select id="queryCategoryLeve" name="queryCategoryLevel1" class="form-control">
									   <option value="">--请选择--</option>
									   <option value="">张三</option>
									   <option value="">李四</option>
									   <option value="">王五</option>
        						</select>
							</div>
						</div>
								 
								 </td>
								 <td>未分配</td>
									<td>李四</td>
								 <td><a href="" class="btn btn-primary">分配</a>
								 <a href="shenghexiangqing3.jsp" class="btn btn-primary">订单详情</a></td>
								</tr>
								
								
								<tr>
								 <td>HH111111</td>
								 <td>李普强</td>
								 <td>13688888888</td>
								 <td>岳阳</td>
								 <td>50KG</td>
								 <td>200元</td>
								 <td>发发发</td>
								 <td>
								 
								 	<div class="form-group">
							<div class="col-md-6 col-sm-6 col-xs-12">
								<select id="queryCategoryLe" name="queryCategoryLevel1" class="form-control">
									   <option value="">--请选择--</option>
									   <option value="">张三</option>
									   <option value="">李四</option>
									   <option value="">王五</option>
        						</select>
							</div>
						</div>
								 
								 </td>
								 <td>已分配：张三</td>
									<td>李四</td>
								 <td><a href="" class="btn btn-primary">分配</a>
								 <a href="shenghexiangqing3.jsp" class="btn btn-primary">订单详情</a></td>
								</tr>
								
								<tr>
								 <td>HH111111</td>
								 <td>李普强</td>
								 <td>13688888888</td>
								 <td>岳阳</td>
								 <td>50KG</td>
								 <td>200元</td>
								 <td>发发发</td>
								 <td>
								 
								 	<div class="form-group">
							<div class="col-md-6 col-sm-6 col-xs-12">
								<select id="queryCategoryLev1" name="queryCategoryLevel1" class="form-control">
									   <option value="">--请选择--</option>
									   <option value="">张三</option>
									   <option value="">李四</option>
									   <option value="">王五</option>
        						</select>
							</div>
						</div>
								 
								 </td>
								 <td>已分配：王五</td>
									<td>李四</td>
								 <td><a href="" class="btn btn-primary">分配</a>
								 <a href="shenghexiangqing3.jsp" class="btn btn-primary">订单详情</a></td>
								</tr>
								<tr>
								 <td>HH111111</td>
								 <td>李普强</td>
								 <td>13688888888</td>
								 <td>岳阳</td>
								 <td>50KG</td>
								 <td>200元</td>
								 <td>发发发</td>
								 <td>
								 
								 	<div class="form-group">
							<div class="col-md-6 col-sm-6 col-xs-12">
								<select id="queryCategoryLevel1" name="queryCategoryLevel1" class="form-control">
									   <option value="">--请选择--</option>
									   <option value="">张三</option>
									   <option value="">李四</option>
									   <option value="">王五</option>
        						</select>
							</div>
						</div>
								 
								 </td>
								 <td>已分配：李四</td>
									<td></td>
								 <td><a href="" class="btn btn-primary">分配</a>
								 <a href="shenghexiangqing3.jsp" class="btn btn-primary">订单详情</a></td>
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