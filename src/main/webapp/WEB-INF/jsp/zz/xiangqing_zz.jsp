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
                    工单详情<i class="fa fa-user"></i>
                    <small>${user.username}</small>
                </h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_title">
                <h2>工单信息</h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content1">
                <form class="form-horizontal form-label-left" action="/center/addSave3" method="post">
                    <input type="hidden" name="id" value="${workorder.id}">
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="id">工单ID <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" readonly
                                   type="text" name="id" id="id" value="${workorder.id}">
                        </div>
                    </div>
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
                               for="packageId">合包号<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" value="${workorder.packageId}"
                                   type="text" name="packageId" id="packageId">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="productNum">物件编号 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12"
                                   name="productNum" id="productNum" value="${workorder.productNum}" type="text">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="sName">寄件人姓名 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" value="${workorder.sName}"
                                   class="form-control col-md-7 col-xs-12" name="sName" id="sName">
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="sTel">寄件人电话 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" value="${workorder.sTel}"
                                   class="form-control col-md-7 col-xs-12" name="sTel" id="sTel">
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="sCity">寄件人城市 <span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12"
                            <c:forEach var="cityList" items="${cityList}">
                                   <c:if test="${workorder.sCity eq cityList.id}">value="${cityList.city}"</c:if>
                            </c:forEach>
                                   name="sCity" id="sCity">
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="sPoint">寄件人网点 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12"
                                   value="${workorder.sPointName}" name="sPoint" id="sPoint">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="sAddress">寄件人详细地址<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <textarea class="form-control col-md-7 col-xs-12" name="sAddress"
                                      id="sAddress">${workorder.sAddress}</textarea>
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="gName">收件人姓名<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" value="${workorder.gName}"
                                   type="text" name="gName" id="gName">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="gTel">收件人电话 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12"
                                   name="gTel" id="gTel" value="${workorder.gTel}" type="text">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="gCity">收件人城市 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12"
                            <c:forEach var="cityList" items="${cityList}">
                                   <c:if test="${workorder.gCity eq cityList.id}">value="${cityList.city}"</c:if>
                            </c:forEach>
                                   name="gCity" id="gCity">
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="gPoint">收件人网点 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" value="${workorder.gPointName}"
                                   class="form-control col-md-7 col-xs-12" name="gPoint" id="gPoint">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="gAddress">收件人详细地址<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <textarea class="form-control col-md-7 col-xs-12" name="gAddress"
                                      id="gAddress">${workorder.gAddress}</textarea>
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="productType">货物类型<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12" readonly="readonly"
                                   value="${workorder.productTypeName}" name="productType" id="productType">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="realWeight">实际重量<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" value="${workorder.realWeight}"
                                   type="text" name="realWeight" id="realWeight">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="workStatus">工单状态 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" value="${workorder.workStatusName}"
                                   readonly="readonly"
                                   name="workStatus" id="workStatus" type="text">
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
                            <input type="text" class="form-control col-md-7 col-xs-12"
                                   value="${workorder.gCourier}" name="gCourier" id="gCourier">

                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="sCourier">送快递员工号<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" value="${workorder.sCourier}"
                                   type="text" name="sCourier" id="sCourier">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="preVolume">实际体积 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" readonly
                                   name="preVolume" id="preVolume" value="${workorder.preVolume}" type="text">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="riseTime">生成时间 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" readonly
                                   value="<fmt:formatDate value="${workorder.riseTime}" pattern='yyyy-MM-dd HH:mm:ss'/>"
                                   class="form-control col-md-7 col-xs-12" name="riseTime" id="riseTime">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="inStorageStatus">入库状态</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12" readonly="readonly"
                                   value="${workorder.inStorageStatusName}" name="inStorageStatus" id="inStorageStatus">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="outStorageStatus">出库状态</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <c:choose>
                                <c:when test="${workorder.outStorageStatusName!=null}">
                                    <input type="text" class="form-control col-md-7 col-xs-12" readonly="readonly"
                                           value="${workorder.outStorageStatusName}" name="outStorageStatus"
                                           id="outStorageStatus">
                                </c:when>
                                <c:otherwise>
                                    <input type="text" value="暂无" id="inStorageTime"
                                           class="form-control col-md-7 col-xs-12" name="inStorageTime"
                                           readonly="readonly">
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="inStorageTime">入库时间
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <c:choose>
                                <c:when test="${workorder.inStorageTime!=null and workorder.inStorageTime!=''}">
                                    <input type="text"
                                           value="<fmt:formatDate value="${workorder.inStorageTime}" pattern='yyyy-MM-dd HH:mm:ss'/>"
                                           class="form-control col-md-7 col-xs-12" name="inStorageTime"
                                           id="inStorageTime"
                                           readonly="readonly">
                                </c:when>
                                <c:otherwise>
                                    <input type="text" value="暂无" id="inStorageTime"
                                           class="form-control col-md-7 col-xs-12" name="inStorageTime"
                                           readonly="readonly">
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="outStorageTime">出库时间</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <c:choose>
                                <c:when test="${workorder.outStorageTime!=null and workorder.outStorageTime!=''}">
                                    <input type="text" class="form-control col-md-7 col-xs-12" readonly="readonly"
                                           value="<fmt:formatDate value="${workorder.outStorageTime}" pattern='yyyy-MM-dd HH:mm:ss'/>"
                                           name="outStorageTime" id="outStorageTime">
                                </c:when>
                                <c:otherwise>
                                    <input type="text" value="暂无"
                                           class="form-control col-md-7 col-xs-12" name="inStorageTime"
                                           id="inStorageTime"
                                           readonly="readonly">
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="finishedTime">完成时间 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <c:choose>
                                <c:when test="${workorder.outStorageTime!=null and workorder.outStorageTime!=''}">
                                    <input type="text" class="form-control col-md-7 col-xs-12" readonly="readonly"
                                           value="<fmt:formatDate value="${workorder.finishedTime}" pattern='yyyy-MM-dd HH:mm:ss'/>"
                                           name="finishedTime" id="finishedTime">
                                </c:when>
                                <c:otherwise>
                                    <input type="text" value="暂无"
                                           class="form-control col-md-7 col-xs-12" name="inStorageTime"
                                           id="inStorageTime"
                                           readonly="readonly">
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="productLocation">物件位置 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" value="${workorder.productLocationName}"
                                   class="form-control col-md-7 col-xs-12" name="productLocation" id="productLocation"
                                   readonly="readonly">
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="auditStatus">审核结果<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12"
                                   value="${workorder.auditStatus}" name="auditStatus" id="auditStatus">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="invalidatedState">失效状态<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12"
                                   value="${workorder.invalidatedState}" name="invalidatedState" id="invalidatedState">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="entrust">委托状态<span class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12"
                                   value="${workorder.entrust}" name="entrust" id="entrust">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="comment">备注 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <textarea class="form-control col-md-7 col-xs-12" name="gAddress"
                                      id="comment">${workorder.comment}</textarea>
                        </div>
                    </div>
                    <div class="x_content" style="display: block;">
                        <br>

                    </div>
                    <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                            <input type="submit" id="submit" value="保存修改" class="btn btn-success"/>
                            <a href="JavaScript:history.back(-1)" class="btn btn-primary">返回</a>
                        </div>
                    </div>
                </form>
            </div>

            <div class="clearfix"></div>
            <br/>
            <br/>
        </div>
    </div>
    <%@include file="../common/footer.jsp" %>
    <%--<script--%>
<%--src="${pageContext.request.contextPath }/statics/localjs/appinfoview.js"></script>--%>