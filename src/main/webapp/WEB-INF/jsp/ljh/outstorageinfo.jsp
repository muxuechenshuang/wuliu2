<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="../common/header.jsp" %>
<script src="${pageContext.request.contextPath }/statics/js/jquery-1.4.2.min.js"></script>
<div class="clearfix"></div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>
                    出库交接单详情<i class="fa fa-user"></i>
                    <small>${user.username}</small>
                </h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_title">
                <h2>出库交接单信息</h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content1">
                <div class="item form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12"
                           for="id">出库交接单号
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input class="form-control col-md-7 col-xs-12" readonly="readonly"
                               type="text" name="receiptId" id="id" value="${outstorage.outId}">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12"
                           for="workNum">工单号
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input class="form-control col-md-7 col-xs-12" readonly="readonly"
                               type="text" name="workorderId" id="workNum" value="${outstorage.workorderId}">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12"
                           for="orderNum">发货单位
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" class="form-control col-md-7 col-xs-12" readonly="readonly"
                               value="${outstorage.sendUnitName}" name="sendUnitName" id="orderNum">
                    </div>
                </div>

                <div class="item form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12"
                    >收货单位
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" class="form-control col-md-7 col-xs-12" readonly="readonly"
                               value="${outstorage.getUnitName}" name="getUnitName">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12"
                           for="productNum">出库时间
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input class="form-control col-md-7 col-xs-12" readonly="readonly"
                               value="<fmt:formatDate value="${outstorage.outstorageTime}" pattern='yyyy-MM-dd HH:mm:ss'/>"
                               name="outstorageTime" id="productNum" type="text">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12"
                           for="sName">物件编号
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" value="${outstorage.productNum}" readonly="readonly"
                               class="form-control col-md-7 col-xs-12" name="productNum" id="sName">
                    </div>
                </div>

                <div class="item form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12"
                           for="sTel">合包号
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <c:choose>
                            <c:when test="${outstorage.packageId!=null}">
                                <input type="text" value="${outstorage.packageId}" readonly="readonly"
                                       class="form-control col-md-7 col-xs-12" name="packageId" id="sTel">
                            </c:when>
                            <c:otherwise>
                                暂无
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <div class="item form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12"
                           for="sCity">合包重量 </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <c:choose>
                            <c:when test="${outstorage.packageWeight!=null}">
                                <input type="text" class="form-control col-md-7 col-xs-12" readonly="readonly"
                                       value="${outstorage.packageWeight}" name="packageWeight" id="sCity">
                            </c:when>
                            <c:otherwise>
                                暂无
                            </c:otherwise>
                        </c:choose>


                    </div>
                </div>

                <div class="item form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12"
                           for="sPoint">出库状态
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input type="text" class="form-control col-md-7 col-xs-12" readonly="readonly"
                               value="${outstorage.outstorageStatusName}" name="sPointName" id="sPoint">
                    </div>
                </div>
                <div class="item form-group">
                    <label class="control-label col-md-3 col-sm-3 col-xs-12"
                           for="sAddress">出库所在地
                    </label>
                    <div class="col-md-6 col-sm-6 col-xs-12">
                        <input class="form-control col-md-7 col-xs-12" readonly="readonly"
                               value=" ${outstorage.storageIdName}"
                               name="sAddress" id="sAddress"/>
                    </div>
                </div>
            </div>
            <div class="x_content" style="display: block;">
                <br>
            </div>
            <div class="form-group">
                <div class="col-md-6 col-md-offset-3">
                    <button type="button" class="btn btn-primary" id="back">返回</button>
                </div>
            </div>
            <div class="clearfix"></div>
            <br/>
            <br/>
        </div>
    </div>
    <%@include file="../common/footer.jsp" %>
    <script>
        $("#back").on("click", function () {
            window.location.href = "../putoutstorage";
        });
    </script>
