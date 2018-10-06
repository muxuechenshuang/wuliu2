<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@include file="../common/header.jsp" %>
<div class="clearfix"></div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>查看并审核返货单</h2>
                <div class="clearfix"></div>
                <div class="x_title">
                    <h2>返货单基础信息</h2>
                    <div class="clearfix"></div>
                </div>
                <div class="x_content1">
                    <form class="form-horizontal form-label-left" action="/center/addSave5" method="post">
                        <input type="hidden" name="id" value="${returnorder.id}">
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="id">返货单号 <span
                                    class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input class="form-control col-md-7 col-xs-12" value="${returnorder.id}"
                                       type="text" readonly="readonly" id="id" name="id">
                            </div>
                        </div>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="gid">相关工单单号 <span
                                    class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input class="form-control col-md-7 col-xs-12" value="${returnorder.gid}"
                                       type="text" readonly="readonly" id="gid" name="gid">
                            </div>
                        </div>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="yid">申请员工工号<span
                                    class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" class="form-control col-md-7 col-xs-12"
                                       value="${returnorder.yid}" readonly="readonly" id="yid" name="yid">
                            </div>
                        </div>

                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="result">返货原因<span
                                    class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input class="form-control col-md-7 col-xs-12"
                                       value="${returnorder.result}" type="text" readonly="readonly" id="result"
                                       name="result">
                            </div>
                        </div>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="result">创建时间<span
                                    class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input class="form-control col-md-7 col-xs-12"
                                       value="<fmt:formatDate value="${returnorder.ctreaTime}" pattern='yyyy-MM-dd HH:mm:ss'/>"
                                       type="text" readonly="readonly" id="ctreaTime"
                                       name="ctreaTime">
                            </div>
                        </div>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="gName">收件人姓名<span
                                    class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" value="${returnorder.gName}"
                                       class="form-control col-md-7 col-xs-12" readonly="readonly" id="gName"
                                       name="gName">
                            </div>
                        </div>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="gPhone">收件人电话 <span
                                    class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" value="${returnorder.gPhone}"
                                       class="form-control col-md-7 col-xs-12" readonly="readonly" id="gPhone"
                                       name="gPhone">
                            </div>
                        </div>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="gCity">收件人城市 <span
                                    class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" value="${returnorder.gCity}"
                                       class="form-control col-md-7 col-xs-12" readonly="readonly" id="gCity"
                                       name="gCity">
                            </div>
                        </div>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="gPoint">收件人网点 <span
                                    class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" value="${returnorder.gPoint}"
                                       class="form-control col-md-7 col-xs-12" readonly="readonly" id="gPoint"
                                       name="gPoint">
                            </div>
                        </div>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="gAddress">收件人地址 <span
                                    class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" value="${returnorder.gAddress}"
                                       class="form-control col-md-7 col-xs-12" readonly="readonly" id="gAddress"
                                       name="gAddress">
                            </div>
                        </div>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sName">寄件人姓名 <span
                                    class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" value="${returnorder.sName}"
                                       class="form-control col-md-7 col-xs-12" readonly="readonly" id="sName"
                                       name="sName">
                            </div>
                        </div>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sPhone">寄件人电话 <span
                                    class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" value="${returnorder.gAddress}"
                                       class="form-control col-md-7 col-xs-12" readonly="readonly" id="sPhone"
                                       name="sPhone">
                            </div>
                        </div>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sCity">寄件人城市 <span
                                    class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" value="${returnorder.sCity}"
                                       class="form-control col-md-7 col-xs-12" readonly="readonly" id="sCity"
                                       name="sCity">
                            </div>
                        </div>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sPoint">寄件人网点 <span
                                    class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" value="${returnorder.sPoint}"
                                       class="form-control col-md-7 col-xs-12" readonly="readonly" id="sPoint"
                                       name="sPoint">
                            </div>
                        </div>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sPoint">寄件人地址 <span
                                    class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" value="${returnorder.sAddress}"
                                       class="form-control col-md-7 col-xs-12" readonly="readonly" id="sAddress"
                                       name="sAddress">
                            </div>
                        </div>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="status">审核状态 <span
                                    class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text" class="form-control col-md-7 col-xs-12" id="status" name="status" readonly
                                    <c:if test="${returnorder.status eq 1}"> value="未审核" </c:if>
                                    <c:if test="${returnorder.status eq 2}"> value="审核通过，同意返货" </c:if>
                                    <c:if test="${returnorder.status eq 3}"> value="审核不通过，请继续联系配送" </c:if>>
                            </div>
                        </div>
                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sPoint">审核时间 <span
                                    class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <input type="text"
                                       value="<fmt:formatDate value="${returnorder.auditTime}" pattern='yyyy-MM-dd HH:mm:ss'/>"
                                       class="form-control col-md-7 col-xs-12" id="auditTime"
                                       name="auditTime" readonly>
                            </div>
                        </div>

                        <div class="item form-group">
                            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="comment">备注 <span
                                    class="required">*</span>
                            </label>
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <textarea class="form-control col-md-7 col-xs-12" id="comment"
                                          name="comment">${returnorder.comment}</textarea>
                            </div>
                        </div>

                        <!-- <div class="item form-group"> -->
                        <!-- <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">LOGO图片 <span class="required">*</span> -->
                        <!-- </label> -->
                        <!-- <div class="col-md-6 col-sm-6 col-xs-12"> -->
                        <%-- 			 <c:choose>  --%>
                        <%-- 				  <c:when test="${appInfo.logoPicPath == null || appInfo.logoPicPath == ''}">    --%>
                        <!-- 暂无 -->
                        <%-- 				  </c:when>  --%>
                        <%-- 				  <c:otherwise>    --%>
                        <%-- 				    <img src="${appInfo.logoPicPath }?m=1" width="100px;"/>  --%>
                        <%-- 				  </c:otherwise>  --%>
                        <%--               </c:choose>  --%>
                        <!-- </div> -->
                        <!-- </div> -->
                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-3">
                                <%--<a id="status2" name="status2" class="btn btn-success"--%>
                                   <%--href="/center/shenhe?id=${returnorder.id}&comment=${returnorder.comment}&status=2">--%>
                                    <%--审核通过--%>
                                <%--</a>--%>
                                    <button type="submit" value="审核通过1">审核通过1</button>
                                <%--<input type="submit" id="status4" name="status4" class="btn btn-success" value="审核通过" onclick="pass"/>--%>
                                <a id="status3" name="status3" class="btn btn-success"
                                   href="/center/shenhe?id=${returnorder.id}&comment=${returnorder.comment}&status=3">
                                    审核不通过
                                </a>
                                <a type="button" class="btn btn-primary" id="back" href="/center/returnlist">返回</a>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="clearfix"></div>
                <br/><br/>
            </div>
        </div>
        <%@include file="../common/footer.jsp" %>
<%--<script src="${pageContext.request.contextPath }/statics/localjs/appcheck.js"></script>--%>