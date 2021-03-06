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
        <form id="form" class="form-horizontal form-label-left" action="branchquery" method="get" enctype="multipart/form-data">
			<input type="hidden" name="pageIndex" value="1" />
			<div class="form-group">
				<label class="control-label col-md-3 col-sm-3 col-xs-12">始发地：<span class="required">*</span></label>
				<div class="col-md-6 col-sm-6 col-xs-12" style="width: 300px;">
					<select id="city" name="city"
							class="form-control">
						<option value="">--请选择城市--</option>
						<c:forEach var="cityList" items="${cityList}">
							<option value="${cityList.id}"
								<c:if test="${cityList.id == cityId}">selected="selected"</c:if>
							>${cityList.city}</option>
						</c:forEach>
					</select>
				</div>
				<button id="branchquery" type="submit" class="btn btn-success">查&nbsp;&nbsp;&nbsp;&nbsp;询</button>
			</div>
        </form>

        <div class="clearfix"></div>

		<c:if test="${nullErro!=null}">
			<h1>${nullErro}</h1>
		</c:if>

        <c:if test="${branchList!=null}">
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
					aria-sort="ascending">呼叫上门</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="branch" items="${branchList}" varStatus="status">
					<tr role="row" class="odd">
						<td>${branch.name}</td>
						<td>${branch.site}</td>
						<td>${branch.phone}</td>
						<%--<td><a class="goSend"
							cityId = ${cityId},
							branchId = ${branch.id}>我要寄件</a></td>--%>
						<td><a href="/calculate/intosend?cityId=${cityId}&branchId=${branch.id}">我要寄件</a></td>
					</tr>
				</c:forEach>
			</tbody>
			</table>
			<div class="row">
				<div class="col-sm-5">
					<div class="dataTables_info" id="datatable-responsive_info"
						 role="status" aria-live="polite">共${pages.count }条记录
						${pages.pageNo }/${pages.pageCount }页</div>
				</div>
				<div class="col-sm-7">
					<div class="dataTables_paginate paging_simple_numbers"
						 id="datatable-responsive_paginate">
						<ul class="pagination">
							<c:if test="${pages.pageNo > 1}">
								<li class="paginate_button previous"><a
										href="javascript:page_nav(document.forms[0],1);"
										aria-controls="datatable-responsive" data-dt-idx="0"
										tabindex="0">首页</a></li>
								<li class="paginate_button "><a
										href="javascript:page_nav(document.forms[0],${pages.pageNo-1});"
										aria-controls="datatable-responsive" data-dt-idx="1"
										tabindex="0">上一页</a></li>
							</c:if>
							<c:if test="${pages.pageNo < pages.pageCount }">
								<li class="paginate_button "><a
										href="javascript:page_nav(document.forms[0],${pages.pageNo+1});"
										aria-controls="datatable-responsive" data-dt-idx="1"
										tabindex="0">下一页</a></li>
								<li class="paginate_button next"><a
										href="javascript:page_nav(document.forms[0],${pages.pageCount});"
										aria-controls="datatable-responsive" data-dt-idx="7"
										tabindex="0">最后一页</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
          <div class="clearfix"></div>
        </div>
        </c:if>
      </div>
    </div>
  </div>
</div>
<%@include file="../common/footer.jsp"%>
<script src="${pageContext.request.contextPath}/statics/js/ry/branchquery_ry.js"></script>