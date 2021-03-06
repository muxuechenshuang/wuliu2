<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<div class="clearfix"></div>
<div class="row">
    <div class="col-md-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>
                    工单查询
                    </small>
                </h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">

                <form method="post" action="${pageContext.request.contextPath}/order/toworkorder?courierNum=${user.id}">
                      <input type="hidden" name="pageIndex" value="1" />


                    <ul>
                        <li>
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">工单号</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="workNum" type="text"
                                           class="form-control col-md-7 col-xs-12"
                                           value="${queryworkNum }">
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">订单号</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="orderNum" type="text"
                                           class="form-control col-md-7 col-xs-12"
                                           value="${queryorderNum }">
                                </div>
                            </div>
                        </li>





                        <li>
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">收件人姓名</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="gName" type="text"
                                           class="form-control col-md-7 col-xs-12"
                                           value="${querygName }">
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">收件人电话</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="gTel" type="text"
                                           class="form-control col-md-7 col-xs-12"
                                           value="${querygTel }">
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">收件人详细地址</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="gAddress" type="text"
                                           class="form-control col-md-7 col-xs-12"
                                           value="${querygAddress }">
                                </div>
                            </div>
                        </li>


                        <li><button type="submit" class="btn btn-primary">查
                            &nbsp;&nbsp;&nbsp;&nbsp;询</button></li>
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
                                   style="width: 100%;table-layout: fixed;">
                                <thead>
                                <tr role="row">

                                    <th class="sorting_asc" tabindex="0"
                                        aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                        style="width: 124px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;"
                                        aria-label="First name: activate to sort column descending"
                                        aria-sort="ascending">工单号</th>
                                    <th class="sorting_asc" tabindex="0"
                                        aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                        style="width: 124px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;"
                                        aria-label="First name: activate to sort column descending"
                                        aria-sort="ascending">订单号</th>
                                    <th class="sorting" tabindex="0"
                                        aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                        style="width: 80px;"
                                        aria-label="Last name: activate to sort column ascending">
                                        目标城市</th>
                                    <th class="sorting" tabindex="0"
                                        aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                        style="width: 80px;"
                                        aria-label="Last name: activate to sort column ascending">
                                        目标网点</th>
                                    <th class="sorting" tabindex="0"
                                        aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                        style="width: 80px;"
                                        aria-label="Last name: activate to sort column ascending">
                                        收件人</th>
                                    <<th class="sorting" tabindex="0"
                                         aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                         style="width: 80px;"
                                         aria-label="Last name: activate to sort column ascending">
                                    收件人地址</th>
                                    <th class="sorting" tabindex="0"
                                        aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                        style="width: 124px;"
                                        aria-label="Last name: activate to sort column ascending">
                                        收件人电话</th>
                                    <th class="sorting" tabindex="0"
                                        aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                        style="width: 66px;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;"
                                        aria-label="Last name: activate to sort column ascending">
                                        物品类型</th>
                                    <th class="sorting" tabindex="0"
                                        aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                        style="width: 66px;"
                                        aria-label="Last name: activate to sort column ascending">
                                        重量</th>
                                    <th class="sorting_asc" tabindex="0"
                                        aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                        aria-label="First name: activate to sort column descending"
                                        aria-sort="ascending">取件员ID</th>
                                    <th class="sorting_asc" tabindex="0"
                                        aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                        aria-label="First name: activate to sort column descending"
                                        aria-sort="ascending">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="workorder" items="${workorderList }" varStatus="status">
                                    <tr role="row" class="odd">
                                        <td style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${workorder.workNum }</td>
                                        <td style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${workorder.orderNum }</td>
                                        <td>${workorder.gCity }</td>
                                        <td>${workorder.gPoint }</td>
                                        <td>${workorder.gName }</td>
                                        <td>${workorder.gAddress }</td>
                                        <td>${workorder.gTel }</td>
                                        <td>${workorder.productType }</td>

                                        <td>${workorder.realWeight }</td>
                                        <td>${workorder.sCourier }</td>

                                        <td>


                                            <div class="btn-group">
                                                <button type="button" class="btn btn-danger">点击操作</button>
                                                <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                                    <span class="caret"></span>
                                                    <span class="sr-only">Toggle Dropdown</span>
                                                </button>
                                                <ul class="dropdown-menu" role="menu">
                                                    <li><a href="${pageContext.request.contextPath}/order/toworkorderdesc?id=${workorder.id}" class="addVersion"  data-toggle="tooltip" data-placement="top" title="" data-original-title="查看订单">查看工单</a></li>
                                                    <c:if test="${workorder.finishedTime == null}">
                                                    <li><a href="${pageContext.request.contextPath}/order/toworkweituo?id=${workorder.id}" class="addVersion"  data-toggle="tooltip" data-placement="top" title="" data-original-title="委托">委托</a>
                                                        </c:if>
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-5">
                            <div class="dataTables_info" id="datatable-responsive_info"
                                 role="status" aria-live="polite">共${pageIndex.total}条记录
                                ${pageIndex.pageNum}/${pageIndex.pages }页</div>
                        </div>
                        <div class="col-sm-7">
                            <div class="dataTables_paginate paging_simple_numbers"
                                 id="datatable-responsive_paginate">
                                <ul class="pagination">
                                    <c:if test="${pageIndex.pageNum > 1}">
                                        <li class="paginate_button previous"><a
                                                href="javascript:page_nav(document.forms[0],1);"
                                                aria-controls="datatable-responsive" data-dt-idx="0"
                                                tabindex="0">首页</a></li>
                                        <li class="paginate_button "><a
                                                href="javascript:page_nav(document.forms[0],${pageIndex.pageNum-1});"
                                                aria-controls="datatable-responsive" data-dt-idx="1"
                                                tabindex="0">上一页</a></li>
                                    </c:if>
                                    <c:if test="${pageIndex.pageNum < pageIndex.pages }">
                                        <li class="paginate_button "><a
                                                href="javascript:page_nav(document.forms[0],${pageIndex.pageNum+1});"
                                                aria-controls="datatable-responsive" data-dt-idx="1"
                                                tabindex="0">下一页</a></li>
                                        <li class="paginate_button next"><a
                                                href="javascript:page_nav(document.forms[0],${pageIndex.pages });"
                                                aria-controls="datatable-responsive" data-dt-idx="7"
                                                tabindex="0">最后一页</a></li>
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
</div>
<%@include file="../common/footer.jsp"%>
<script src="${pageContext.request.contextPath }/statics/localjs/rollpage.js"></script>
