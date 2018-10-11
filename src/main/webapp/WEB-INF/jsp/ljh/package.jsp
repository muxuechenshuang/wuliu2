<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="../common/header.jsp" %>
<div class="clearfix"></div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>
                    合包<i class="fa fa-user"></i>
                    <small>${user.username}</small>
                </h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_title">
                <h2>工单信息</h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content1">
                <form class="form-horizontal form-label-left" action="${pageContext.request.contextPath}/filiale/savepackage" method="post">
                    <input  hidden="hidden" type="text" name="id"  value="${workorder.id}">
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="workNum">工单号
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" readonly="readonly"
                                   type="text" name="workNum" id="workNum" value="${workorder.workNum}">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="orderNum">关联订单号
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12" readonly="readonly"
                                   value="${workorder.orderNum}" name="orderNum" id="orderNum">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="packageId">合包号
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" value=""
                                   type="text" required="required" name="packageId" id="packageId">

                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="productNum">物件编号
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" readonly="readonly"
                                   name="productNum" id="productNum" value="${workorder.productNum}" type="text">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="productType">货物类型
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12" readonly="readonly"
                                   value="${workorder.productTypeName}" name="productType" id="productType">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="realWeight">实际重量:kg
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" value="${workorder.realWeight}"
                                   readonly="readonly"
                                   type="text" name="realWeight" id="realWeight">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                            <button type="submit" class="btn btn-success">合包</button>
                            <button type="button" class="btn btn-primary" id="back">返回</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="x_content" style="display: block;">
                <br>
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
