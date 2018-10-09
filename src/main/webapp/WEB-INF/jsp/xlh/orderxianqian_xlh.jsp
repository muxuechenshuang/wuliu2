<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<div class="clearfix"></div>
<div class="row">
  <div class="col-md-12 col-sm-12 col-xs-12">
    <div class="x_panel">
      <div class="x_title">
        <h2>
          订单详情${user.type}<i class="fa fa-user"></i><small></small>

        </h2>
        <div class="clearfix"></div>
      </div>

      <div class="x_content1">
        <form class="form-horizontal form-label-left">
          <%--<input type="hidden" name="id" value="${appInfo.id}">--%>

          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">订单号 <span
                    class="required"></span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input class="form-control col-md-7 col-xs-12" name="orderNum" value="${order.orderNumber}" readonly
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
              <input class="form-control col-md-7 col-xs-12"  name="sTel" value="${order.sTel}" readonly
                     type="text">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">寄件人地址<span
                    class="required"></span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input class="form-control col-md-7 col-xs-12" name="sAddress" value="${order.sAddress}" readonly
                     type="text">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">收件人姓名<span
                    class="required"></span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input class="form-control col-md-7 col-xs-12" name="gName"value="${order.gName}" readonly
                     type="text">
            </div>
          </div>

          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">收件人电话<span
                    class="required"></span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input class="form-control col-md-7 col-xs-12" name="gTel"value="${order.gTel}" readonly
                     type="text">
            </div>
          </div>

          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" name="gAddress" for="select">收件人地址<span
                    class="required"></span></label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input class="form-control col-md-7 col-xs-12" value="${order.gAddress}" readonly
                     type="text">

            </div>
          </div>

          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">物品<span
                    class="required"></span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input class="form-control col-md-7 col-xs-12" name="productType" value="${order.product}" readonly
                     type="text">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">寄的网点<span
                    class="required"></span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input class="form-control col-md-7 col-xs-12" value="${order.name}" readonly
                     type="text">
            </div>
          </div>
          <div class="item form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">快递员编号<span
                      class="required"></span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
                <input class="form-control col-md-7 col-xs-12" value="${order.courierNumber}" readonly
                       type="text">
              </div>
            </div>
            <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">预估体积(m3)<span
                    class="required"></span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input class="form-control col-md-7 col-xs-12" value="${order.preVolume}" readonly
                     type="text">
            </div>
          </div>
            <div class="item form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">预估重量(kg)<span
                      class="required"></span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
                <input class="form-control col-md-7 col-xs-12" value="${order.preWeight}" readonly
                       type="text">
              </div>
            </div>
            <div class="item form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">订单生成时间<span
                      class="required"></span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
                <input class="form-control col-md-7 col-xs-12" value="<fmt:formatDate value="${order.riseTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" readonly
                                           type="text">
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
      <br />
      <br />
    </div>
  </div>
<%@include file="../common/footer.jsp"%>
<script src="${pageContext.request.contextPath }/statics/localjs/appinfoview.js"></script>
  <script type="text/javascript">
      /*返回按纽*/
      $("#back").click(function () {
          window.location.href = "someorder/?courierNum=${user.id}";
      })
  </script>