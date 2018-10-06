<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!-- 工单查询（分公司） -->
<%@include file="../common/header.jsp" %>
<div class="clearfix"></div>
<div class="row">
    <div class="col-md-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>
                    分公司工单查询 <i class="fa fa-user"></i>
                    <small>${user.username}
                        - 您可以通过搜索来查询工单，也可以查看工单详情。^_^
                    </small>
                </h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <form method="post" action="/filiale/queryworkorder">
                    <input type="hidden" name="pageIndex" value="1"/>
                    <ul>
                        <li>
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">工单编号</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="workNum" type="text"
                                           class="form-control col-md-7 col-xs-12"
                                           value="${workNum }">
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">订单编号</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="orderNum" type="text"
                                           class="form-control col-md-7 col-xs-12"
                                           value="${orderNum }">
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">物件编号</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="productNum" type="text"
                                           class="form-control col-md-7 col-xs-12"
                                           value="${productNum }">
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
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">网点名称</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select id="wdName" name="wdName"
                                            class="form-control">
                                        <option value="">--请选择--</option>
                                    </select>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">工单状态</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="workStatus" class="form-control">
                                        <option value="">--请选择--</option>
                                    </select>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">出入库状态</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select name="storageStatus" class="form-control">
                                        <option value="">--请选择--</option>
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
                                   cellspacing="0" width="100%" role="grid"
                                   aria-describedby="datatable-responsive_info"
                                   style="width: 100%;">
                                <thead>
                                <tr role="row">
                                    <th class="sorting_asc" tabindex="0"
                                        aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                        style="width: 124px;"
                                        aria-label="First name: activate to sort column descending"
                                        aria-sort="ascending">工单编号
                                    </th>
                                    <th class="sorting_asc" tabindex="0"
                                        aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                        style="width: 124px;"
                                        aria-label="First name: activate to sort column descending"
                                        aria-sort="ascending">工单状态
                                    </th>
                                    <th class="sorting_asc" tabindex="0"
                                        aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                        style="width: 124px;"
                                        aria-label="First name: activate to sort column descending"
                                        aria-sort="ascending">订单号
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
                                        出入库状态
                                    </th>
                                    <th class="sorting_asc" tabindex="0"
                                        aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                        aria-label="First name: activate to sort column descending"
                                        aria-sort="ascending">操作
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="workorder" items="${workorderList }">
                                    <tr role="row" class="odd">
                                        <td>${workorder.workNum }</td>
                                        <td>${workorder.workStatus }</td>
                                        <td>${workorder.orderNum }</td>
                                        <td>${workorder.packageId }</td>
                                        <td>${workorder.storageStatus }</td>
                                        <td><a id="view" href="/filiale/todetail?workorderid=${workorder.id}"
                                               class="btn btn-primary">查看详情</a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-5">
                            <div class="dataTables_info" id="datatable-responsive_info"
                                 role="status" aria-live="polite">共${page.total }条记录
                                ${page.pageNum }/${page.pages }页
                            </div>
                        </div>
                        <div class="col-sm-7">
                            <div class="dataTables_paginate paging_simple_numbers"
                                 id="datatable-responsive_paginate">
                                <ul class="pagination">
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
                                                href="javascript:page_nav(document.forms[0],${page.nextPage });"
                                                aria-controls="datatable-responsive" data-dt-idx="1"
                                                tabindex="0">下一页</a>
                                        </li>
                                        <li class="paginate_button next"><a
                                                href="javascript:page_nav(document.forms[0],${page.lastPage });"
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
<%@include file="../common/footer.jsp" %>
<script
        src="${pageContext.request.contextPath }/statics/localjs/rollpage.js"></script>
<script
        src="${pageContext.request.contextPath }/statics/js/zz/gongdan2_zz.js"></script>