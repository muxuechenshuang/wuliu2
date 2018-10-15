<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="../common/header.jsp" %>
<script src="${pageContext.request.contextPath }/statics/js/jquery-1.4.2.min.js"></script>
<div class="clearfix"></div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">

            <div class="x_title">
                <h2>工单信息</h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content1">
                <form class="form-horizontal form-label-left">
                    <input type="hidden" name="id" value="${workorder.id}">

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="workNum">工单号 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" readonly
                                   type="text" name="workNum" id="workNum" value="${workorder.workNum}">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="orderNum">关联订单号 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12" readonly
                                   value="${workorder.orderNum}" name="orderNum" id="orderNum">
                        </div>
                    </div>


                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="productNum">物件编号 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" readonly
                                   name="productNum" id="productNum" value="${workorder.productNum}" type="text">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="sName">寄件人姓名 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" value="${workorder.sName}" readonly
                                   class="form-control col-md-7 col-xs-12" name="sName" id="sName">
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="sTel">寄件人电话 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" value="${workorder.sTel}" readonly
                                   class="form-control col-md-7 col-xs-12" name="sTel" id="sTel">
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="sCity">寄件人城市 <span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12" readonly
                                   value="${workorder.sCityName}" name="sCity" id="sCity">

                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="sPoint">寄件人网点 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12" readonly
                                   value="${workorder.sPointName}" name="sPoint" id="sPoint">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="sAddress">寄件人详细地址<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
							<textarea class="form-control col-md-7 col-xs-12" readonly
                                      name="sAddress" id="sAddress">${workorder.sAddress}</textarea>
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="gName">收件人姓名<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" value="${workorder.gName}" readonly
                                   type="text" name="gName" id="gName">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="gTel">收件人电话 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" readonly
                                   name="gTel" id="gTel" value="${workorder.gTel}" type="text">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="gCity">收件人城市 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" value="${workorder.gCityName}" readonly
                                   class="form-control col-md-7 col-xs-12" name="gCity" id="gCity">
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="gPoint">收件人网点 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" value="${workorder.gPointName}" readonly
                                   class="form-control col-md-7 col-xs-12" name="gPoint" id="gPoint">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="gAddress">收件人详细地址<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
							<textarea class="form-control col-md-7 col-xs-12" readonly
                                      name="gAddress" id="gAddress">${workorder.gAddress}</textarea>
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="productType">货物类型<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12" readonly
                                   value="${workorder.productTypeName}" name="productType" id="productType">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="realWeight">实际重量<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" value="${workorder.realWeight}" readonly
                                   type="text" name="realWeight" id="realWeight">
                        </div>
                    </div>



                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="expenses">运费 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" value="${workorder.expenses}" readonly
                                   class="form-control col-md-7 col-xs-12" name="expenses" id="expenses">
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="gCourier">收快递员工号<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12" readonly
                                   value="${workorder.gCourier}" name="gCourier" id="gCourier">

                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="sCourier">送快递员工号<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" value="${workorder.sCourier}" readonly
                                   type="text" name="sCourier" id="sCourier">
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="riseTime">生成时间 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text"
                                   value="<fmt:formatDate value="${workorder.riseTime}" pattern='yyyy-MM-dd HH:mm:ss'/>"
                                   readonly
                                   class="form-control col-md-7 col-xs-12" name="riseTime" id="riseTime">
                        </div>
                    </div>


                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="productLocation">物件位置 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" value="${workorder.productLocationName}"
                                   readonly class="form-control col-md-7 col-xs-12" name="productLocation"
                                   id="productLocation">
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="comment">备注 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" value="${workorder.comment}" readonly
                                   class="form-control col-md-7 col-xs-12" name="comment" id="comment">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="comment">付款状态: <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">

                            <input type="text" value="${workorder.isPayName}" readonly
                                   class="form-control col-md-7 col-xs-12" name="ispay" id="isPay">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="workStatus">工单状态 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" value="${workorder.workStatusName}" readonly
                                   name="workStatus" id="workStatus" type="text">
                        </div>
                    </div>


                </form>
            </div>
            <div class="x_content" style="display: block;">
                <br>

            </div>
            <form action="${pageContext.request.contextPath}/order/finishedWorkorder">
                <div class="form-group">
                    <div class="col-md-6 col-md-offset-3">
                        <input type="hidden" name="id" value="${workorder.id}">
                        <c:choose>
                            <c:when test="${workorder.isPay==1 || workorder.workStatus==5}">
                            <button type="submit" class="btn btn-success" disabled id="finished">完成配送</button></c:when>

                            <c:when test="${workorder.isPay==2}">
                            <button type="submit" class="btn btn-success"  id="finished">完成配送</button></c:when>

                        </c:choose>
                        <button type="button" class="btn btn-primary" id="back">返回</button>
                    </div>
                </div>
                <div class="clearfix"></div>
            </form>
            <form action="${pageContext.request.contextPath}/order/toreturn">
                <div class="form-group">
                    <div class="col-md-6 col-md-offset-3">
                        <c:if test="${workorder.finishedTime == null }">
                            <input type="hidden" name="id" value="${workorder.id}">
                            <button type="submit" class="btn btn-danger" id="ret">生成返货单</button>
                        </c:if>
                    </div>
                </div>
                <div class="clearfix"></div>
            </form>
            <br/>
            <br/>
        </div>
    </div>
    <%@include file="../common/footer.jsp" %>
    <script type="text/javascript">
        /*返回按纽*/
        $("#back").click(function () {
            window.location.href = "toworkorder/?courierNum=${user.id}";
        })
    </script>