<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<div class="clearfix"></div>
<div class="row">
  <div class="col-md-12 col-sm-12 col-xs-12">
    <div class="x_panel">
      <div class="x_title">
        <h2>服务网点查询<i class="fa fa-user"></i><small>${devUserSession.devName}</small></h2>
             <div class="clearfix"></div>
      </div>
      <div class="x_content">
           <div class="clearfix"></div>
        <form class="form-horizontal form-label-left" action="appinfoaddsave" method="post" enctype="multipart/form-data">
          <div class="form-group">
				<label class="control-label col-md-3 col-sm-3 col-xs-12">始发地：<span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<select id="queryCategoryLevel1" name="queryCategoryLevel1"
								class="form-control" style="width: 200px;">
							<option value="">--请选择城市--</option>
							<c:forEach var="appCategory" items="${categoryLevel1List}">
							<option
							<c:if test="${appCategory.id == queryCategoryLevel1 }">selected="selected"</c:if>
								value="${appCategory.id}">${appCategory.categoryName}</option>
						</c:forEach>
					</select><br/>
					<button id="send" type="button" class="btn btn-success">查询</button>
				</div>
			</div>
        </form>
        
        <div class="clearfix"></div>
        <div class="x_title">
            <h2>网点列表</h2>
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
					aria-sort="ascending">网点名称</th>
				<th class="sorting_asc" tabindex="0"
					aria-controls="datatable-responsive" rowspan="1" colspan="1"
					aria-label="First name: activate to sort column descending"
					aria-sort="ascending">网点地址</th>
				<th class="sorting_asc" tabindex="0"
					aria-controls="datatable-responsive" rowspan="1" colspan="1"
					aria-label="First name: activate to sort column descending"
					aria-sort="ascending">网点电话</th>
				<th class="sorting_asc" tabindex="0"
					aria-controls="datatable-responsive" rowspan="1" colspan="1"
					aria-label="First name: activate to sort column descending"
					aria-sort="ascending">网点负责人</th>
				<th class="sorting_asc" tabindex="0"
					aria-controls="datatable-responsive" rowspan="1" colspan="1"
					aria-label="First name: activate to sort column descending"
					aria-sort="ascending">呼叫上门</th>
				</tr>
			</thead>
			</table>
          <div class="clearfix"></div>
        </div>
        
      </div>
    </div>
  </div>
</div>
<%@include file="../common/footer.jsp"%>