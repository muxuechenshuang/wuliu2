<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../../common/header.jsp"%>
<div class="clearfix"></div>
<div class="row">
  <div class="col-md-12 col-sm-12 col-xs-12">
    <div class="x_panel">
      <div class="x_title">
        <h2>新增网点信息 <i class="fa fa-user"></i><small>${devUserSession.devName}</small></h2>
             <div class="clearfix"></div>
      </div>
      <div class="x_content">
	  <!-- <div class="item form-group">
               <label class="control-label col-md-3 col-sm-3 col-xs-12" ></label>
               <div class="col-md-6 col-sm-6 col-xs-12">
                 <form action="uploadlogo" class="dropzone" style="height:100px;">
                 </form>
            <div class="clearfix"></div>
         </div>
       </div> -->
           <div class="clearfix"></div>
        <form class="form-horizontal form-label-left" action="appinfoaddsave" method="post" enctype="multipart/form-data">
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">网点名称 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="softwareName" class="form-control col-md-7 col-xs-12" 
               data-validate-length-range="20" data-validate-words="1" name="softwareName"  required="required"
               placeholder="分公司名称" type="text" maxlength="50">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">网点用户名 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="softwareName" class="form-control col-md-7 col-xs-12" 
               data-validate-length-range="20" data-validate-words="1" name="softwareName"  required="required"
               placeholder="分公司名称" type="text" maxlength="50">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">网点密码 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="softwareName" class="form-control col-md-7 col-xs-12" 
               data-validate-length-range="20" data-validate-words="1" name="softwareName"  required="required"
               placeholder="分公司名称" type="text" maxlength="50">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">网点邮箱 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="softwareName" class="form-control col-md-7 col-xs-12" 
               data-validate-length-range="20" data-validate-words="1" name="softwareName"  required="required"
               placeholder="分公司名称" type="text" maxlength="50">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">网点地址 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="APKName" class="form-control col-md-7 col-xs-12" 
              	data-validate-length-range="20" data-validate-words="1" name="APKName"   required="required"
              	placeholder="请输入分公司地址" type="text" maxlength="50">
            </div>
          </div>
          
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">网点电话 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="supportROM" class="form-control col-md-7 col-xs-12" name="supportROM" 
              	data-validate-length-range="20" data-validate-words="1"   required="required"
              	placeholder="请输入分公司电话" type="text" maxlength="50">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">网点负责人<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="supportROM" class="form-control col-md-7 col-xs-12" name="supportROM" 
              	data-validate-length-range="20" data-validate-words="1"   required="required"
              	placeholder="请输入分公司电话" type="text" maxlength="50">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="select">网点所属分公司 <span class="required">*</span></label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <select name="categoryLevel1" id="categoryLevel1" class="form-control"   required="required"> </select>
            </div>
          </div>
          
           <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">网点图片 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
<!--             文件上传以及错误信息回显 -->
            <input type="file" class="form-control col-md-7 col-xs-12" name="a_logoPicPath"  required="required" id="a_logoPicPath"/>
            <span><img src="" id="showpic" width="400",height="400"/></span>
            <h4 style="color:red">${fileUploadError}</h4>
            </div>
          </div>
          <div class="ln_solid"></div>
          <div class="form-group">
            <div class="col-md-6 col-md-offset-3">
              <button id="send" type="submit" class="btn btn-success">保存</button>
              <button type="button" class="btn btn-primary" id="back">返回</button>
              <br/><br/>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<%@include file="../../../common/footer.jsp"%>
<%-- <script src="${pageContext.request.contextPath }/statics/localjs/appinfoadd.js"></script> --%>