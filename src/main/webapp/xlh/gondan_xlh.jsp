<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<div class="clearfix"></div>
<div class="row">
	<div class="col-md-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>
					工单查询 <i class="fa fa-user"></i><small>${devUserSession.devName}
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
							<label class="control-label col-md-3 col-sm-3 col-xs-12">查询条件</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<select name="queryFlatformId" class="form-control">
									
									   <option value="">--请选择--</option>
									  	<option value="">--待确认定单--</option>
									  	<option value="">--历史订单--</option>
									  	
									  	
									
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
										aria-label="First name: activate to sort column descending"
										aria-sort="ascending">工单号</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										寄件人姓名</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										寄件人电话</th>
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
										收件人电话</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										收件人地址</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										创建时间</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending" >
										操作</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										style="width: 124px;"
										aria-label="Last name: activate to sort column ascending">
										操作</th>
								</tr>
							</thead>
							<tbody>
								
									<tr role="row" class="odd">
										<td tabindex="0" class="sorting_1">123</td>
										<td>任一</td>
										<td>1839800006454</td>
										<td>湖南理工学院</td>
										<td>肖林辉</td>
										<td>18934343343</td>
										<td>深圳大学</td>
										<td>2018-8-20 11:22:30</td>
										<td>
										<div class="btn-group">
                      <button type="button" class="btn btn-danger">查看</button>
                    </div>
										</td>
										
										<td>
										<div class="btn-group">
                      <button type="button" class="btn btn-success">确认</button>
                    </div>
										</td>
									</tr>
									
									
									<tr role="row" class="odd">
										<td tabindex="0" class="sorting_1">123</td>
										<td>任一</td>
										<td>1839800006454</td>
										<td>湖南理工学院</td>
										<td>肖林辉<</td>
										<td>18934343343</td>
										<td>深圳大学</td>
										<td>2018-8-20 11:22:30</td>
										<td>
										
										
										<div class="btn-group">
                      <button type="button" class="btn btn-danger">查看</button>
                      
                    </div>
										</td>
										<td>
										
										
										<div class="btn-group">
                      <button type="button" class="btn btn-success">确认</button>
                      
                    </div>
										</td>
									</tr>
								
							</tbody>
						</table>
					</div>
				</div>
			
			</div>

		</div>
	</div>
</div>
</div>
<%@include file="../common/footer.jsp"%>
<script src="${pageContext.request.contextPath }/statics/localjs/rollpage.js"></script>
<script src="${pageContext.request.contextPath }/statics/localjs/appinfolist.js"></script>