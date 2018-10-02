<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../../common/header.jsp"%>
<div class="clearfix"></div>
<div class="row">
  <div class="col-md-12 col-sm-12 col-xs-12">
    <div class="x_panel">
      <div class="x_title">
        <h2>订单<i class="fa fa-user"></i><small></small></h2>
             <div class="clearfix"></div>
      </div>
      <div class="x_title">
            <h2>订单信息</h2>
          <div class="clearfix"></div>
      </div>
      <div class="x_content1">
        <form class="form-horizontal form-label-left" action="${pageContext.request.contextPath}/wuliu/baoding" method="post">
          <input type="hidden" name="id" value="${appInfo.id}">
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">工单编号 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input class="form-control col-md-7 col-xs-12" name="id" value="${order_info.id}"
              type="text" readonly="readonly">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">寄件人电话 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="number" class="form-control col-md-7 col-xs-12" name="sTel"
              value="${order_info.sTel}" >
            </div>
          </div>
          
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">寄件人地址 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input class="form-control col-md-7 col-xs-12" name="sAddress"
              	value="${order_info.sAddress}" type="text" >
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">物品类别 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input class="form-control col-md-7 col-xs-12" name="product"
              	value="${order_info.product} " type="text">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">收件人姓名 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" value="${order_info.sName}" name="sName"
              class="form-control col-md-7 col-xs-12" >
            </div>
          </div>
          
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">收件人电话 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" value="${order_info.gTel}" name="gTel"
               class="form-control col-md-7 col-xs-12" >
            </div>
          </div>
          
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12"  for="select">收件人地址 <span class="required">*</span></label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" class="form-control col-md-7 col-xs-12" name="gAddress"
              	value="${order_info.gAddress}" >
            
            </div>
          </div>
         
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">所属地区 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
            	<input type="text" class="form-control col-md-7 col-xs-12" name="gAddress"
              	value="${order_info.gAddress}" >
            </div>
          </div>

          <div class="form-group">
            <div class="col-md-6 col-md-offset-3">
              <button type="submit" class="btn btn-primary" id="back">保存</button>
              <button type="button" class="btn btn-primary" id="ba">返回</button>
            </div>
          </div>
        </form>
        </div>
        
        <div class="x_content" style="display: block;">
         <br>
    </div>

    <div class="clearfix"></div>
    <br/><br/>
  </div>
</div>
<%@include file="../../../common/footer.jsp"%>
<script src="${pageContext.request.contextPath }/statics/localjs/appinfoview.js"></script>