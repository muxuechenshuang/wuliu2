<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@include file="../common/header.jsp" %>
<div class="clearfix"></div>
<div class="row">
    <div class="col-md-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>
                    出库 <i class="fa fa-user"></i>
                    <small>${user.username}
                        - 您可以对包裹进行出库操作，也可以查看已出库的包裹。^_^
                    </small>
                </h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <form method="post" action="/filiale/putoutstorage">
                    <input type="hidden" name="pageIndex" value="1"/>
                    <ul>
                        <li>
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">出库交接单号</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="outId" type="text"
                                           class="form-control col-md-7 col-xs-12"
                                           value="${outId}">
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">工单编号</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="workorderId" type="text"
                                           class="form-control col-md-7 col-xs-12"
                                           value="${workorderId}">
                                </div>
                            </div>
                        </li>

                        <li>
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">合包号</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="packageId" type="text"
                                           class="form-control col-md-7 col-xs-12"
                                           value="${packageId }">
                                </div>
                            </div>
                        </li>

                        <li>
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">出库状态</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="outStorageStatus" class="form-control">
                                        <c:if test="${outStorageStatusList!=null}">
                                            <option value="">--请选择--</option>
                                            <c:forEach items="${outStorageStatusList}" var="outStatus">
                                                <option class=""
                                                        <c:if test="${outStatus.valueId == outStorageStatus }">selected="selected"</c:if>
                                                        value="${outStatus.valueId}">
                                                        ${outStatus.valueName}
                                                </option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                </div>
                            </div>
                        </li>

                        <li>
                            <button type="submit" class="btn btn-primary">查
                                &nbsp;&nbsp;&nbsp;&nbsp;询
                            </button>
                        </li>
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
                            <table id="datatable-responsive"
                                   class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline collapsed"
                                   cellspacing="0" width="100%" role="grid" style="table-layout: fixed"
                                   aria-describedby="datatable-responsive_info"
                                   style="width: 100%;">
                                <thead>
                                <tr role="row">
                                    <c:choose>
                                        <c:when test="${outStorageStatus==1}">
                                            <th class="sorting_asc" tabindex="0"
                                                aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                                style="width: 80px;"
                                                aria-label="First name: activate to sort column descending"
                                                aria-sort="ascending">工单号
                                            </th>
                                            <th class="sorting_asc" tabindex="0"
                                                aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                                style="width: 80px;"
                                                aria-label="First name: activate to sort column descending"
                                                aria-sort="ascending">合包号
                                            </th>
                                            <th class="sorting" tabindex="0"
                                                aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                                style="width: 80px;"
                                                aria-label="Last name: activate to sort column ascending">
                                                出库状态
                                            </th>
                                            <th class="sorting" tabindex="0"
                                                aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                                style="width: 80px;"
                                                aria-label="Last name: activate to sort column ascending">
                                                重量：kg
                                            </th>
                                        </c:when>
                                        <c:otherwise>
                                            <th class="sorting_asc" tabindex="0"
                                                aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                                style="width: 124px;"
                                                aria-label="First name: activate to sort column descending"
                                                aria-sort="ascending">出库交接单号
                                            </th>
                                            <th class="sorting_asc" tabindex="0"
                                                aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                                style="width: 124px;"
                                                aria-label="First name: activate to sort column descending"
                                                aria-sort="ascending">工单号
                                            </th>
                                            <th class="sorting_asc" tabindex="0"
                                                aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                                style="width: 124px;"
                                                aria-label="First name: activate to sort column descending"
                                                aria-sort="ascending">合包号
                                            </th>
                                            <th class="sorting" tabindex="0"
                                                aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                                style="width: 80px;"
                                                aria-label="Last name: activate to sort column ascending">
                                                出库状态
                                            </th>
                                            <th class="sorting" tabindex="0"
                                                aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                                style="width: 80px;"
                                                aria-label="Last name: activate to sort column ascending">
                                                出库时间
                                            </th>
                                        </c:otherwise>
                                    </c:choose>
                                    <th class="sorting_asc" tabindex="0"
                                        aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                        aria-label="First name: activate to sort column descending"
                                        aria-sort="ascending" style="width: 120px">操作
                                    </th>
                                </tr>

                                </thead>
                                <tbody>
                                <c:choose>
                                    <c:when test="${outStorageStatus==1}">
                                        <c:forEach items="${readyOutWorkOrderList}" var="workorder">
                                            <tr>
                                                <td style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${workorder.workNum}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${workorder.packageId!=null}">
                                                            ${workorder.packageId}
                                                        </c:when>
                                                        <c:otherwise>
                                                            未进行合包
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>${workorder.outStorageStatusName }</td>
                                                <td>${workorder.realWeight}</td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/filiale/addoutstorage/${workorder.workNum}" type="buttoon" class="btn btn-success">出库</a>

                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="outstorage" items="${outstorageList }">
                                            <tr>
                                                <td style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${outstorage.outId }</td>
                                                <td style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${outstorage.workorderId }</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${outstorage.packageId!=null}">
                                                            ${outstorage.packageId}
                                                        </c:when>
                                                        <c:otherwise>
                                                            未进行合包
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>${outstorage.outStorageStatusName }</td>
                                                <td><fmt:formatDate value="${outstorage.outStorageTime}"
                                                                    pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                                <td class="view">
                                                    <button type="button" outId="${outstorage.outId}"
                                                            class="btn btn-primary">查看详情
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-5">
                            <div class="dataTables_info" id="datatable-responsive_info"
                                 role="status" aria-live="polite">
                                <c:choose>
                                    <c:when test="${outStorageStatus==1}">
                                        共${page2.total}条记录
                                        ${page2.pageNum }/${page2.pages}页
                                    </c:when>
                                    <c:otherwise>
                                        共${page.total}条记录
                                        ${page.pageNum }/${page.pages}页
                                    </c:otherwise>
                                </c:choose>

                            </div>
                        </div>
                        <div class="col-sm-7">
                            <div class="dataTables_paginate paging_simple_numbers"
                                 id="datatable-responsive_paginate">
                                <ul class="pagination">
                                    <c:choose>
                                        <c:when test="${outStorageStatus==1}">
                                            <c:if test="${page2.hasPreviousPage eq true }">
                                                <li class="paginate_button previous"><a
                                                        href="javascript:page_nav(document.forms[0],1);"
                                                        aria-controls="datatable-responsive" data-dt-idx="0"
                                                        tabindex="0">首页</a>
                                                </li>
                                                <li class="paginate_button "><a
                                                        href="javascript:page_nav(document.forms[0],${page2.prePage});"
                                                        aria-controls="datatable-responsive" data-dt-idx="1"
                                                        tabindex="0">上一页</a>
                                                </li>
                                            </c:if>
                                            <c:if test="${page2.hasNextPage eq true }">
                                                <li class="paginate_button "><a
                                                        href="javascript:page_nav(document.forms[0],${page2.nextPage});"
                                                        aria-controls="datatable-responsive" data-dt-idx="1"
                                                        tabindex="0">下一页</a>
                                                </li>
                                                <li class="paginate_button next"><a
                                                        href="javascript:page_nav(document.forms[0],${page2.lastPage});"
                                                        aria-controls="datatable-responsive" data-dt-idx="7"
                                                        tabindex="0">最后一页</a>
                                                </li>
                                            </c:if>
                                        </c:when>
                                        <c:otherwise>
                                            <c:if test="${page.hasPreviousPage eq true }">
                                                <li class="paginate_button previous"><a
                                                        href="javascript:page_nav(document.forms[0],1);"
                                                        aria-controls="datatable-responsive" data-dt-idx="0"
                                                        tabindex="0">首页</a>
                                                </li>
                                                <li class="paginate_button "><a
                                                        href="javascript:page_nav(document.forms[0],${page.prePage});"
                                                        aria-controls="datatable-responsive" data-dt-idx="1"
                                                        tabindex="0">上一页</a>
                                                </li>
                                            </c:if>
                                            <c:if test="${page.hasNextPage eq true }">
                                                <li class="paginate_button "><a
                                                        href="javascript:page_nav(document.forms[0],${page.nextPage});"
                                                        aria-controls="datatable-responsive" data-dt-idx="1"
                                                        tabindex="0">下一页</a>
                                                </li>
                                                <li class="paginate_button next"><a
                                                        href="javascript:page_nav(document.forms[0],${page.lastPage});"
                                                        aria-controls="datatable-responsive" data-dt-idx="7"
                                                        tabindex="0">最后一页</a>
                                                </li>
                                            </c:if>
                                        </c:otherwise>
                                    </c:choose>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<%@include file="../common/footer.jsp" %>
<script
        src="${pageContext.request.contextPath }/statics/localjs/rollpage.js"></script>
<script
        src="${pageContext.request.contextPath }/statics/localjs/putinstorage.js"></script>