<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<div class="clearfix"></div>
<div class="row">
  <div class="col-md-12 col-sm-12 col-xs-12">
    <div class="x_panel">
      <div class="x_title">
        <h2>
          委托页面${orderId}<i class="fa fa-user"></i><small></small>

        </h2>
        <div class="clearfix"></div>
      </div>

      <div class="x_content1">
        <form class="form-horizontal form-label-left"
              method="post" action="${pageContext.request.contextPath}/order/updateweituo?courierNum=${user.id}">
          <input type="hidden" name="orderId" value="${orderId}">


            <div class="item form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12"
                     for="storageStatus">委托发起人<span class="required">*</span></label>
              <div class="col-md-6 col-sm-6 col-xs-12">
                <input type="text" class="form-control col-md-7 col-xs-12"
                       readonly   value="${user.username}"  name="storageStatus" id="storageStatus">
              </div>
            </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12"
                   for="select">委托人<span class="required">*</span></label>
            <div class="col-md-2 col-sm-2 col-xs-3">
                <select class="form-control col-md-3 col-xs-3" >
                    <c:forEach var="couriers" items="${couriersList}">
                      <option>${couriers.username}</option>
                    </c:forEach>


                </select>
            </div>
          </div>
          <div class="x_content" style="display: block;">
            <br>

          </div>

          <div class="form-group">



            <div class="col-md-6 col-md-offset-3">
              <button type="submit" class="btn btn-success" id="save">保存</button>
              <button type="button" class="btn btn-primary" id="back">返回</button>
            </div>
          </div>
        </form>
      </div>


      <div class="clearfix"></div>
      <br />
      <br />
    </div>
  </div>
<%@include file="../common/footer.jsp"%>

  <script type="text/javascript">
      /*返回按纽*/
      $("#back").click(function () {
          window.location.href = "someorder/?courierNum=${user.id}";
      })
  </script>