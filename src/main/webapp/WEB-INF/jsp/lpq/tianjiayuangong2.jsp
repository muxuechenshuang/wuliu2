<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<div class="clearfix"></div>
<div class="row">
  <div class="col-md-12 col-sm-12 col-xs-12">
    <div class="x_panel">
      <div class="x_title">
        <h2>员工<i class="fa fa-user"></i><small></small></h2>
        <div class="clearfix"></div>
      </div>
      <div class="x_title">
        <h2>添加员工</h2>
        <div class="clearfix"></div>
      </div>
      <div class="x_content1">
        <form class="form-horizontal form-label-left"  action="${pageContext.request.contextPath}/wuliu/baokuai"
              method="post" enctype="multipart/form-data">

          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" >员工姓名 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" class="form-control col-md-7 col-xs-12" name="username"
                     >
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" >员工密码 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="password" class="form-control col-md-7 col-xs-12" name="password"
                     >
            </div>
          </div>

          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" >电话 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input class="form-control col-md-7 col-xs-12"
                     value="" type="text" name="phone">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" >邮箱 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input class="form-control col-md-7 col-xs-12" name="email"
                     value="" type="text">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" >性别 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <select name="sex" class="form-control">
                <option selected="selected">--请选择--</option>
                <option value="男">男</option>
                <option value="女">女</option>
              </select>
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="picpath">个人头像 <span
                    class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <!--             文件上传以及错误信息回显 -->
              <input type="file" class="form-control col-md-7 col-xs-12" name="picPath"
                     required="required" id="picpath"/>
              <span><img src="" id="showpic" width="400" /></span>
              <h3 style="color:red">${fileUploadError}</h3>
            </div>
          </div>
          <div class="form-group">
            <div class="col-md-6 col-md-offset-3">
              <input type="submit" class="btn btn-primary" id="b" value="添加" />
              <a href="JavaScript:history.back(-1)" class="btn btn-primary">返回</a>
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
  <%@include file="../common/footer.jsp"%>
  <script src="${pageContext.request.contextPath}/statics/js/zz/fengongsiguanlitianjia.js"></script>
  <script src="${pageContext.request.contextPath }/statics/localjs/appinfoview.js"></script>