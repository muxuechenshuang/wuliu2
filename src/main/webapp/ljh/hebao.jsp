<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/header.jsp"%>


<div class="col-md-12 col-sm-12 col-xs-12">
	<div class="x_panel">
		<div class="x_title">
			<h2>请选择货物进行合包操作</h2>
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
			<form id="myForm" class="form-horizontal form-label-left"
				method="post">
				<table id="datatable-checkbox"
					class="table table-striped table-bordered bulk_action">
					<thead>
						<tr>
							<th><input type="checkbox" id="check-all" class="flat"></th>
							<th>单号</th>
							<th>货物编号</th>
							<th>货物类型</th>
							<th>状态</th>
						</tr>
					</thead>


					<tbody>
						<tr>
							<td><input type="checkbox" class="flat" name="table_records"></td>
							<td>1</td>
							<td>1</td>
							<td>电子商品</td>
							<td>待入库</td>
						</tr>
						<tr>
							<td><input type="checkbox" class="flat" name="table_records"></td>
							<td>2</td>
							<td>2</td>
							<td>电子商品</td>
							<td>待入库</td>
						</tr>
						<tr>
							<td><input type="checkbox" class="flat" name="table_records"></td>
							<td>3</td>
							<td>3</td>
							<td>电子商品</td>
							<td>待入库</td>
						</tr>
					</tbody>
				</table>

				<div class="form-group">
					<div class="col-md-6 col-md-offset-3">
						<button id="send" type="submit" class="btn btn-success">合包</button>
						<button type="button" class="btn btn-primary" id="back">返回</button>
						<br /> <br />
					</div>
				</div>
			</form>
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
