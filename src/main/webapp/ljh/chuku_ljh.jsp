<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/header.jsp"%>

<div class="page-title">
	<div class="title_left">
		<h3>
			Users <small>Some examples to get you started</small>
		</h3>
	</div>

	<div class="title_right">
		<div
			class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="Search for...">
				<span class="input-group-btn">
					<button class="btn btn-default" type="button">Go!</button>
				</span>
			</div>
		</div>
	</div>
</div>

<div class="clearfix"></div>

<div class="row">
	<div class="col-md-12 col-sm-12 col-xs-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>
					出库<small>列表</small>
				</h2>
				<ul class="nav navbar-right panel_toolbox">
					<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
					</li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false"><i
							class="fa fa-wrench"></i></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">Settings 1</a></li>
							<li><a href="#">Settings 2</a></li>
						</ul></li>
					<li><a class="close-link"><i class="fa fa-close"></i></a></li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<p class="text-muted font-13 m-b-30"></p>
				<table id="datatable" class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>出库交接单号</th>
							<th>交接单类型</th>
							<th>接货单位</th>
							<!-- <th>接货人</th> -->
							<th>交货单位</th>
							<!-- <th>交货人</th> -->
							<th>出库时间</th>
						</tr>
					</thead>


					<tbody>
						<tr>
							<td>1</td>
							<td>市内派送</td>
							<td>2号网点</td>
							<!-- <td>2号网点负责人</td> -->
							<td>仓库1</td>
							<!-- <td>出库管理员1</td> -->
							<td>2018/7/16</td>
						</tr>
						<tr>
							<td>2</td>
							<td>市内派送</td>
							<td>2号网点</td>
							<!-- <td>2号网点负责人</td> -->
							<td>仓库1</td>
							<!-- <td>出库管理员1</td> -->
							<td>2018/7/14</td>
						</tr>
						<tr>
							<td>3</td>
							<td>市外物流</td>
							<td>3号网点</td>
							<!-- <td>3号网点负责人</td> -->
							<td>仓库2</td>
							<!-- <td>出库管理员1</td> -->
							<td>2018/7/16</td>
						</tr>
						<tr>
							<td>4</td>
							<td>市外物流</td>
							<td>3号网点</td>
							<!-- <td>3号网点负责人</td> -->
							<td>仓库2</td>
							<!-- <td>出库管理员1</td> -->
							<td>2018/7/16</td>
						</tr>
						<tr>
							<td>5</td>
							<td>市内派送</td>
							<td>2号网点</td>
							<!-- <td>2号网点负责人</td> -->
							<td>仓库1</td>
							<!-- <td>出库管理员1</td> -->
							<td>2018/7/18</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<div class="x_panel">
			<div class="x_title">
				<h2>
					单号<small>列表</small>
				</h2>
				<ul class="nav navbar-right panel_toolbox">
					<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
					</li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false"><i
							class="fa fa-wrench"></i></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">Settings 1</a></li>
							<li><a href="#">Settings 2</a></li>
						</ul></li>
					<li><a class="close-link"><i class="fa fa-close"></i></a></li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">

				<table class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>单号</th>
							<th>合包号</th>
							<th>重量：kg</th>
							<th>到达地</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>


					<tbody>
						<tr>
							<td>1</td>
							<td>1001</td>
							<td>2</td>
							<td>岳阳市岳阳楼区湖南理工学院</td>
							<td>待出库</td>
							<td><a
								href="${pageContext.request.contextPath }/chuku_add.jsp"
								style="text-decoration: none">出库</a></td>
						</tr>
						<tr>
							<td>2</td>
							<td>1002</td>
							<td>2</td>
							<td>岳阳市君山区</td>
							<td>待出库</td>
							<td><a href="#" style="text-decoration: none">出库</a></td>
						</tr>
						<tr>
							<td>3</td>
							<td>1003</td>
							<td>2</td>
							<td>长沙市岳麓区</td>
							<td>待出库</td>
							<td><a href="#" style="text-decoration: none">出库</a></td>
						</tr>
						<tr>
							<td>4</td>
							<td>1004</td>
							<td>2</td>
							<td>长沙市天心区</td>
							<td>待入库</td>
							<td><a href="#" style="text-decoration: none">出库</a></td>
						</tr>
						<tr>
							<td>5</td>
							<td>1005</td>
							<td>2</td>
							<td>岳阳市岳阳楼区</td>
							<td>待出库</td>
							<td><a href="#" style="text-decoration: none">出库</a></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>



<%@include file="common/footer.jsp"%>
<!-- Datatables -->
<script>
	$(document).ready(function() {
		var handleDataTableButtons = function() {
			if ($("#datatable-buttons").length) {
				$("#datatable-buttons").DataTable({
					dom : "Bfrtip",
					buttons : [ {
						extend : "copy",
						className : "btn-sm"
					}, {
						extend : "csv",
						className : "btn-sm"
					}, {
						extend : "excel",
						className : "btn-sm"
					}, {
						extend : "pdfHtml5",
						className : "btn-sm"
					}, {
						extend : "print",
						className : "btn-sm"
					}, ],
					responsive : true
				});
			}
		};

		TableManageButtons = function() {
			"use strict";
			return {
				init : function() {
					handleDataTableButtons();
				}
			};
		}();

		$('#datatable').dataTable();

		$('#datatable-keytable').DataTable({
			keys : true
		});

		$('#datatable-responsive').DataTable();

		$('#datatable-scroller').DataTable({
			ajax : "js/datatables/json/scroller-demo.json",
			deferRender : true,
			scrollY : 380,
			scrollCollapse : true,
			scroller : true
		});

		$('#datatable-fixed-header').DataTable({
			fixedHeader : true
		});

		var $datatable = $('#datatable-checkbox');

		$datatable.dataTable({
			'order' : [ [ 1, 'asc' ] ],
			'columnDefs' : [ {
				orderable : false,
				targets : [ 0 ]
			} ]
		});
		$datatable.on('draw.dt', function() {
			$('input').iCheck({
				checkboxClass : 'icheckbox_flat-green'
			});
		});

		TableManageButtons.init();
	});
</script>
<!-- /Datatables -->




