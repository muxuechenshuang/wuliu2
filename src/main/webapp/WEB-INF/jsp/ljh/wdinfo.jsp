<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<div class="clearfix"></div>
<div class="row">
  <div class="col-md-12 col-sm-12 col-xs-12">
    <div class="x_panel">
      <div class="x_title">
        <h2>查看网点信息<i class="fa fa-user"></i><small>${devUserSession.devName}</small></h2>
             <div class="clearfix"></div>
      </div>
      <div class="x_title">
            <h2>网点基础信息</h2>
          <div class="clearfix"></div>
      </div>
      <div class="x_content1">
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" >网点编号 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input class="form-control col-md-7 col-xs-12" value="${organization.id}"
              type="text" readonly="readonly">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" >网点名称 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" class="form-control col-md-7 col-xs-12" 
              value="${organization.name}" readonly="readonly">
            </div>
          </div>
          
         
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" >电话 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input class="form-control col-md-7 col-xs-12" readonly="readonly"
              	value=" ${organization.phone}" type="text">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" >地址 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" value="${organization.site}" readonly="readonly"
              class="form-control col-md-7 col-xs-12" >
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
    <br/><br/>
  </div>
</div>
<%@include file="../common/footer.jsp"%>
  <script src="${pageContext.request.contextPath}/statics/localjs/wdinfoview.js"></script>