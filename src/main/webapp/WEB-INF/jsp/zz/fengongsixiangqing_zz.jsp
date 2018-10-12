<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="../common/header.jsp" %>
<script src="${pageContext.request.contextPath }/statics/js/jquery-1.4.2.min.js"></script>

<div class="clearfix"></div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>总公司管理员<i class="fa fa-user"></i>
                </h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_title">
                <h2>分公司信息查询和修改</h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content1">
                <form class="form-horizontal form-label-left" method="post" action="/center/addSave2">
                    <input type="hidden" name="id" value="${organization.id}">
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="id">分公司编号 <span
                                class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" readonly
                                   type="text" value="${organization.id}" name="id" id="id">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">分公司名称 <span
                                class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12"
                                   value="${organization.name}" name="name" id="name">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="phone">分公司电话 <span
                                class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12"
                                   value="${organization.phone}" name="phone" id="phone" type="text">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="site">地址 <span
                                class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" value="${organization.site}" name="site" id="site"
                                   class="form-control col-md-7 col-xs-12">
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="city">城市 <span
                                class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <%--<select id="city" name="city" class="form-control">--%>
                                <%--<option value="">--请选择--</option>--%>
                                <%--<c:forEach var="cityList" items="${cityList}">--%>
                                    <%--<option value="${cityList.id}"--%>
                                            <%--<c:if test="${cityList.id == organization.city}">selected="selected"</c:if>--%>
                                    <%-->${cityList.city}</option>--%>
                                <%--</c:forEach>--%>
                            <%--</select>--%>
                            <input type="text" class="form-control col-md-7 col-xs-12"
                                   value="${organization.city}" name="city" id="city">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="introduction">分公司介绍 <span
                                class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12"
                                   value="${organization.introduction}" name="introduction" id="introduction">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                            <button type="submit" class="btn btn-primary" id="get">确认</button>
                            <a href="JavaScript:history.back(-1)" class="btn btn-primary">返回</a>
                        </div>
                    </div>
                </form>

                <div class="clearfix"></div>
                <br/><br/>
            </div>
        </div>
    </div>
</div>
        <%@include file="../common/footer.jsp" %>
        <%--<script src="${pageContext.request.contextPath }/statics/localjs/appinfoview.js"></script>--%>