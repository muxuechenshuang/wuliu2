<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>

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
					入库<small>列表</small>
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
							<th>入库交接单号</th>
							<th>状态</th>
							<th>合包号</th>
							<th>接收单位</th>
							<th>发出单位</th>
							<th>接收时间</th>
						</tr>
					</thead>


					<tbody>
						<tr>
							<td>1</td>
							<td>二次入库</td>
							<td>1001</td>
							<td>仓库1</td>
							<td>2号网点</td>
							<td>2018/7/15</td>
						</tr>
						<tr>
							<td>2</td>
							<td>中转入库</td>
							<td>1001</td>
							<td>仓库1</td>
							<td>2号网点</td>
							<td>2018/7/15</td>
						</tr>
						<tr>
							<td>3</td>
							<td>中转入库</td>
							<td>1001</td>
							<td>仓库1</td>
							<td>2号网点</td>
							<td>2018/7/15</td>
						</tr>
						<tr>
							<td>4</td>
							<td>初始入库</td>
							<td>1002</td>
							<td>仓库1</td>
							<td>2号网点</td>
							<td>2018/7/15</td>
						</tr>
						<tr>
							<td>5</td>
							<td>初始入库</td>
							<td>1002</td>
							<td>仓库1</td>
							<td>2号网点</td>
							<td>2018/7/15</td>
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
							<th>重量：kg</th>
							<th>状态</th>
							<th>操作</th>
						</tr>
					</thead>


					<tbody>
						<tr>
							<td>1</td>
							<td>2</td>
							<td>初始入库</td>
							<td><button  type="submit" class="btn btn-success">入库</button>
							<button type="button" class="btn btn-primary" >合包</button></td>
						</tr>
						<tr>
							<td>2</td>
							<td>2</td>
							<td>初始入库</td>
							<td><button  type="submit" class="btn btn-success">入库</button>
							<button type="button" class="btn btn-primary" >合包</button></td>
						</tr>
						<tr>
							<td>3</td>
							<td>2</td>
							<td>二次入库</td>
							<td><button id="send" type="submit" class="btn btn-success">入库</button>
							<button type="button" class="btn btn-primary" >合包</button></td>
						</tr>
						<tr>
							<td>4</td>
							<td>2</td>
							<td>二次入库</td>
							<td><button  type="submit" class="btn btn-success">入库</button>
							<button type="button" class="btn btn-primary" >合包</button></td>
						</tr>
						<tr>
							<td>5</td>
							<td>2</td>
							<td>中转入库</td>
							<td><button  type="submit" class="btn btn-success">入库</button>
							<button type="button" class="btn btn-primary">合包</button></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>



<%@include file="../common/footer.jsp"%>





