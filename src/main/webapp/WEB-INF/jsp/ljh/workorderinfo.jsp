<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="../common/header.jsp" %>
<script src="${pageContext.request.contextPath }/statics/js/jquery-1.4.2.min.js"></script>
<div class="clearfix"></div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel" style="height: 1700px">
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
                <form class="form-horizontal form-label-left">
                    <input type="hidden" name="id" value="${workorder.id}">
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="id">工单ID
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" readonly="readonly"
                                   type="text" name="id" id="id" value="${workorder.id}">
                        </div>
                    </div>
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
                            <c:choose>
                                <c:when test="${organization.packageId!=null || organization.packageId}!=''}">
                                    <input class="form-control col-md-7 col-xs-12" value="${workorder.packageId}"
                                           type="text" name="packageId" id="packageId" readonly="readonly">
                                </c:when>
                                <c:otherwise>
                                    暂无
                                </c:otherwise>
                            </c:choose>

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
                               for="sName">寄件人姓名
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" value="${workorder.sName}" readonly="readonly"
                                   class="form-control col-md-7 col-xs-12" name="sName" id="sName">
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="sTel">寄件人电话
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" value="${workorder.sTel}" readonly="readonly"
                                   class="form-control col-md-7 col-xs-12" name="sTel" id="sTel">
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="sCity">寄件人城市 </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12" readonly="readonly"
                                   value="${workorder.sCityName}" name="sCityName" id="sCity">

                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="sPoint">寄件人网点
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12" readonly="readonly"
                                   value="${workorder.sPointName}" name="sPointName" id="sPoint">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="sAddress">寄件人详细地址
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
							<input class="form-control col-md-7 col-xs-12" readonly="readonly" value=" ${workorder.sAddress}"
                                      name="sAddress" id="sAddress"/>
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="gName">收件人姓名
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" value="${workorder.gName}"
                                   readonly="readonly"
                                   type="text" name="gName" id="gName">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="gTel">收件人电话
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" readonly="readonly"
                                   name="gTel" id="gTel" value="${workorder.gTel}" type="text">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="gCity">收件人城市
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" value="${workorder.gCityName}" readonly="readonly"
                                   class="form-control col-md-7 col-xs-12" name="gCityName" id="gCity">
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="gPoint">收件人网点
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" value="${workorder.gPointName}" readonly="readonly"
                                   class="form-control col-md-7 col-xs-12" name="gPointName" id="gPoint">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="gAddress">收件人详细地址
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
							<input class="form-control col-md-7 col-xs-12" value="${workorder.gAddress}" readonly="readonly"
                                      name="gAddress" id="gAddress"/>
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
                               for="realWeight">实际重量
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" value="${workorder.realWeight}"
                                   readonly="readonly"
                                   type="text" name="realWeight" id="realWeight">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="workStatus">工单状态
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" value="${workorder.workStatusName}"
                                   readonly="readonly"
                                   name="workStatus" id="workStatus" type="text">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="comment">备注
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" value="${workorder.comment}" readonly="readonly"
                                   class="form-control col-md-7 col-xs-12" name="comment" id="comment">
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="expenses">运费
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" value="${workorder.expenses}" readonly="readonly"
                                   class="form-control col-md-7 col-xs-12" name="expenses" id="expenses">
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="gCourier">取件员工号</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12" readonly="readonly"
                                   value="${workorder.gCourier}" name="gCourier" id="gCourier">

                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="sCourier">送件员工号
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" value="${workorder.sCourier}"
                                   readonly="readonly"
                                   type="text" name="sCourier" id="sCourier">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="preVolume">实际体积
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" readonly="readonly"
                                   name="preVolume" id="preVolume" value="${workorder.preVolume}" type="text">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="riseTime">生成时间
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text"
                                   value="<fmt:formatDate value="${workorder.riseTime}" pattern='yyyy-MM-dd HH:mm:ss'/>"
                                   class="form-control col-md-7 col-xs-12" name="riseTime" id="riseTime"
                                   readonly="readonly">
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="firInStorage">初次入库时间
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <c:choose>
                                <c:when test="${workorder.firInStorage!=null and workorder.firInStorage!=''}">
                                    <input type="text"
                                           value="<fmt:formatDate value="${workorder.firInStorage}" pattern='yyyy-MM-dd HH:mm:ss'/>"
                                           class="form-control col-md-7 col-xs-12" name="firInStorage" id="firInStorage"
                                           readonly="readonly">
                                </c:when>
                                <c:otherwise>
                                    暂无
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="firOutStorage">初次出库时间</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <c:choose>
                                <c:when test="${workorder.firOutStorage!=null and workorder.firOutStorage!=''}">
                                    <input type="text" class="form-control col-md-7 col-xs-12" readonly="readonly"
                                           value="<fmt:formatDate value="${workorder.firOutStorage}" pattern='yyyy-MM-dd HH:mm:ss'/>"
                                           name="firOutStorage" id="firOutStorage">
                                </c:when>
                                <c:otherwise>
                                    暂无
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="secInStorage">二次入库时间
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <c:choose>
                                <c:when test="${workorder.secInStorage!=null and workorder.secInStorage!=''}">
                                    <input class="form-control col-md-7 col-xs-12"
                                           value="<fmt:formatDate value="${workorder.secInStorage}" pattern='yyyy-MM-dd HH:mm:ss'/>"
                                           type="text" name="secInStorage" id="secInStorage" readonly="readonly">
                                </c:when>
                                <c:otherwise>
                                    暂无
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>


                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="secOutStorage">二次出库时间
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <c:choose>
                                <c:when test="${workorder.secOutStorage!=null and workorder.secOutStorage!=''}">
                                    <input class="form-control col-md-7 col-xs-12" readonly="readonly"
                                           name="secOutStorage" id="secOutStorage"
                                           value="<fmt:formatDate value="${workorder.secOutStorage}" pattern='yyyy-MM-dd HH:mm:ss'/>"
                                           type="text">
                                </c:when>
                                <c:otherwise>
                                    暂无
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>


                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="finishedTime">完成时间
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <c:choose>
                                <c:when test="${workorder.finishedTime!=null and workorder.finishedTime!=''}">
                                    <input type="text"
                                           value="<fmt:formatDate value="${workorder.finishedTime}" pattern='yyyy-MM-dd HH:mm:ss'/>"
                                           class="form-control col-md-7 col-xs-12" name="finishedTime" id="finishedTime"
                                           readonly="readonly">
                                </c:when>
                                <c:otherwise>
                                    暂无
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="productLocation">物件位置
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" value="${workorder.productLocationName}"
                                   class="form-control col-md-7 col-xs-12" name="productLocation" id="productLocation"
                                   readonly="readonly">
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="result">审核结果</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12"
                                   value="${workorder.auditStatusName}" name="result" id="result" readonly="readonly">
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="invalidatedState">失效状态</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12" readonly="readonly"
                                   value="${workorder.invalidatedStateName}" name="invalidatedState"
                                   id="invalidatedState">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="storageStatus">出入库状态</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12" readonly="readonly"
                                   value="${workorder.storageStatusName}" name="storageStatus" id="storageStatus">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="entrust">委托状态</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12" readonly="readonly"
                                   value="${workorder.entrustName}" name="entrust" id="entrust">
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
        $("#back").on("click",function(){
            window.location.href = "../queryworkorder";
        });
    </script>
