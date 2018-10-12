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
                    入库交接单详情<i class="fa fa-user"></i>
                    <small>${user.username}</small>
                </h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_title">
                <h2>入库交接单信息</h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content1">
                <form class="form-horizontal form-label-left">
                    <input type="hidden" name="receiptId" value="${instorage.receiptId}">
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="id">入库交接单号
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" readonly="readonly"
                                   type="text" name="receiptId" id="id" value="${instorage.receiptId}">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="workNum">工单号
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" readonly="readonly"
                                   type="text" name="workorderId" id="workNum" value="${instorage.workorderId}">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="orderNum">发货单位
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12" readonly="readonly"
                                   value="${instorage.sendUnitName}" name="sendUnitName" id="orderNum">
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               >收货单位
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12" readonly="readonly"
                                   value="${instorage.getUnitName}" name="getUnitName" >
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="productNum">入库时间
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" readonly="readonly"
                                   value="<fmt:formatDate value="${instorage.inStorageTime}" pattern='yyyy-MM-dd HH:mm:ss'/>"
                                   name="inStorageTime" id="productNum" type="text">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="sName">物件编号
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" value="${instorage.productNum}" readonly="readonly"
                                   class="form-control col-md-7 col-xs-12" name="productNum" id="sName">
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="sTel">合包号
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" value="${instorage.packageId}" readonly="readonly"
                                   class="form-control col-md-7 col-xs-12" name="packageId" id="sTel">
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="sCity">合包重量 </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12" readonly="readonly"
                                   value="${instorage.packageWeight}" name="packageWeight" id="sCity">

                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="sPoint">入库状态
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12" readonly="readonly"
                                   value="${instorage.inStorageStatusName}" name="sPointName" id="sPoint">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="sAddress">入库所在地
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" readonly="readonly"
                                   value=" ${instorage.storageIdName}"
                                   name="sAddress" id="sAddress"/>
                        </div>
                    </div>
                </form>
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
            window.location.href = "../putinstorage";
        });
    </script>
