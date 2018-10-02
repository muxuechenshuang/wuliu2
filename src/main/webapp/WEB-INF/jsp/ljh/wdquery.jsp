&nbsp;
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@include file="../common/header.jsp" %>
<div class="clearfix"></div>
<div class="row">
    <div class="col-md-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>
                    网点查询 <i class="fa fa-user"></i>
                    <small>${devUserSession.devName}
                        - 您可以通过搜索或者其他的筛选项对网点的信息进行修改、删除等管理操作。^_^
                    </small>
                </h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <form method="post" action="/filiale/wd/query">
                    <input type="hidden" name="pageIndex" value="1"/>
                    <ul>
                        <li>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">网点编号：</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="queryWdId" type="text" class="form-control col-md-7 col-xs-12"
                                           value="${queryWdId }">
                                </div>
                            </div>
                        </li>


                        <li>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">电话：</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="queryWdPhone" type="text" class="form-control col-md-7 col-xs-12"
                                           value="${queryWdPhone }">
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">网点名称：</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="queryWdName" type="text" class="form-control col-md-7 col-xs-12"
                                           value="${queryWdName }">
                                </div>
                            </div>


                        <li>
                            <button type="submit" class="btn btn-primary"> 查 &nbsp;&nbsp;&nbsp;&nbsp;询</button>
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
                            <a href="${pageContext.request.contextPath}/filiale/wdinfoadd"
                               class="btn btn-success btn-sm">新增网点</a>
                            <table id="datatable-responsive"
                                   class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline collapsed"
                                   cellspacing="0" width="100%" role="grid" aria-describedby="datatable-responsive_info"
                                   style="width: 100%;">
                                <thead>
                                <tr role="row">
                                    <th class="sorting_asc" tabindex="0"
                                        aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                        aria-label="First name: activate to sort column descending"
                                        aria-sort="ascending">网点编号
                                    </th>
                                    <th class="sorting" tabindex="0"
                                        aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                        aria-label="Last name: activate to sort column ascending">
                                        网点名称
                                    </th>
                                    <th class="sorting" tabindex="0"
                                        aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                        aria-label="Last name: activate to sort column ascending">
                                        电话
                                    </th>
                                    <th class="sorting" tabindex="0"
                                        aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                        aria-label="Last name: activate to sort column ascending">
                                        地址
                                    </th>
                                    <th class="sorting" tabindex="0"
                                        aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                        style="width: 124px;"
                                        aria-label="Last name: activate to sort column ascending">
                                        操作
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${wdList}" var="wd">
                                    <tr>
                                        <td>${wd.id}</td>
                                        <td>${wd.name}</td>
                                        <td>${wd.phone}</td>
                                        <td>${wd.site}</td>
                                        <td>
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-danger">点击操作</button>
                                                <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                                    <span class="caret"></span>
                                                </button>
                                                <ul class="dropdown-menu" role="menu">
                                                    <li><a class="modifyWd"
                                                           wdid="${wd.id }"
                                                           data-toggle="tooltip"
                                                           data-placement="top" title=""
                                                           data-original-title="修改网点信息">修改</a>
                                                    </li>
                                                    <li><a class="viewWd" wdid=${wd.id}
                                                            data-toggle="tooltip" data-placement="top" title=""
                                                           data-original-title="查看网点信息">查看</a>
                                                    </li>
                                                    <li><a class="deleteWd" wd=${wd.id}
                                                            data-toggle="tooltip" data-placement="top" title=""
                                                           data-original-title="删除网点信息">删除</a>
                                                    </li>
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
    <%@include file="../common/footer.jsp" %>
    <script src="${pageContext.request.contextPath }/statics/localjs/rollpage.js"></script>
    <script src="${pageContext.request.contextPath}/statics/localjs/wdinfolist.js"></script>