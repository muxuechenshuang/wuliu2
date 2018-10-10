&nbsp;
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="../common/header.jsp" %>
<div class="clearfix"></div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>生成工单<i class="fa fa-user"></i></h2>
                <div class="clearfix"></div>
            </div>

            <div class="x_content1">
                <form method="post" class="form-horizontal form-label-left"
                      action="${pageContext.request.contextPath}/order/saveworkorder"
                >
                    <%--<input type="hidden" name="id" value="${order.id}">--%>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">订单号 <span
                                class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" name="orderNum" value="${order.orderNumber}"
                                   readonly
                                   type="text">
                            <input class="form-control col-md-7 col-xs-12" name="orderid" value="${order.id}"

                                   type="hidden">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">工单号 <span
                                class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" name="workNum" value="${workNumber}" readonly
                                   type="text">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">寄件人姓名<span
                                class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" name="sName" value="${order.sName}" readonly
                                   type="text">
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">寄件人电话<span
                                class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" name="sTel" value="${order.sTel}" readonly
                                   type="text">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">寄件人地址<span
                                class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" name="sAddress" value="${order.sAddress}"
                                   readonly
                                   type="text">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">寄的网点<span
                                class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" value="${order.pointName}" readonly
                                   type="text">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">收件人姓名<span
                                class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" name="gName" value="${order.gName}" readonly
                                   type="text">
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">收件人电话<span
                                class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" name="gTel" value="${order.gTel}" readonly
                                   type="text">
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" name="gAddress" for="select">收件人地址<span
                                class="required"></span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" value="${order.gAddress}" readonly
                                   name="gAddress"
                                   type="text">

                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">物品<span
                                class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" name="product" value="${order.product}"
                                   readonly
                                   type="text">
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">快递员编号<span
                                class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" value="${user.id}" readonly
                                   type="text">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sCity">城市：<span
                                class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select id="sCity" name="gCity"
                                    class="form-control" style="width: 200px;">
                                <option value="">--请选择城市--</option>
                                <c:forEach var="cityList" items="${cityList}">
                                    <option value="${cityList.id}"
                                            <c:if test="${cityList.id == cityId}">selected="selected"</c:if>
                                    >${cityList.city}</option>
                                </c:forEach>
                            </select><span id="sCityR" style="color:red;font-size:18px;"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sBranch">网点：<span
                                class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select id="sBranch" name="gPoint"
                                    class="form-control" style="width: 200px;">
                                <option value="">--请选择网点--</option>
                                <c:if test="${branchList!=null}">
                                    <c:forEach var="branchList" items="${branchList}">
                                        <option value="${branchList.id}"
                                                <c:if test="${branchList.id == branchId}">selected="selected"</c:if>
                                        >${branchList.name}</option>
                                    </c:forEach>
                                </c:if>
                            </select><span id="sBranchR" style="color:red;font-size:18px;"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="productType">物品类型：<span
                                class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <select id="productType" name="productType" class="form-control" style="width: 200px;">
                                <option value="">--请选择类型--</option>
                                <c:forEach var="goodtype" items="${goodtypeList}">
                                    <option value="${goodtype.id}">${goodtype.valueName}</option>
                                </c:forEach>

                            </select>
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">实际重量(kg)<span
                                class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" name="realWeight" value="" required
                                   onkeyup="value=value.replace(/[^\d]/g,'') "
                                   type="text">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">运费(元)<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" name="expenses" value="" required
                                   onkeyup="value=value.replace(/[^\d]/g,'') "
                                   type="text">
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="textarea">备注<span
                                class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <textarea class="form-control col-md-7 col-xs-12" name="comment"></textarea>
                        </div>
                    </div>
                    <input class="form-control col-md-7 col-xs-12" name="isPay" value="1"
                           type="hidden">
                    <input class="form-control col-md-7 col-xs-12" name="sCity" value="${order.cityId}"
                           type="hidden">
                    <input class="form-control col-md-7 col-xs-12" name="sPoint" value="${order.branchId}"
                           type="hidden">

                    <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                            <button type="submit" class="btn btn-success" id="save">生成工单</button>
                            <button type="button" class="btn btn-primary" id="back">返回</button>
                        </div>
                    </div>


                </form>
                <div class="clearfix"></div>
                <br/><br/>
            </div>
        </div>
        <%@include file="../common/footer.jsp" %>
        <script type="text/javascript">
            /*返回按纽*/
            $("#back").click(function () {
                window.location.href = "someorder/?courierNum=${user.id}";
            })
        </script>
        <script src="${pageContext.request.contextPath}/statics/js/ry/send_ry.js"></script>