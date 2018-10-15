<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<div class="page-title">
    <div class="title_left">
        <img src="${pageContext.request.contextPath }${sessionScope.user.picPath}"
             alt="..." onclick="genhuan()" class="img-circle profile_img" style="width: 20%">
        <h3 style="float: right">
            欢迎你:${sessionScope.user.username}
        </h3>
</div>
    <div class="x_content">
        <div class="clearfix"></div>
        <form class="form-horizontal form-label-left" action="personal" method="post" enctype="multipart/form-data" id="biaodan">
            <input type="hidden" value="${sessionScope.user.id}" name="userid" id="userid">
            <div class="item form-group">
                <label class="control-label col-md-3 col-sm-3 col-xs-12" >用户名 <span class="required">*</span>
                </label>
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <input id="username" class="form-control col-md-7 col-xs-12"
                           data-validate-length-range="20" data-validate-words="1" name="username"  required="required"
                           value="${sessionScope.user.username}" type="text" readonly>
                </div>
            </div>

            <input type="hidden" value="${user.type}" name="type" id="type">
            <input type="hidden" value="${user.picPath}" name="picPath" id="picPath">


            <div class="item form-group">
                <label class="control-label col-md-3 col-sm-3 col-xs-12" >密码 <span class="required">*</span>
                </label>
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <input id="password" class="form-control col-md-7 col-xs-12" onblur="login()"
                           data-validate-length-range="20" data-validate-words="1" name="password"   required="required"
                           value="${sessionScope.user.password}" type="text" maxlength="15"><span style="color: red;"></span>
                </div>
            </div>
            <div class="item form-group">
                <label class="control-label col-md-3 col-sm-3 col-xs-12" >手机号 <span class="required">*</span>
                </label>
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <input id="phone" class="form-control col-md-7 col-xs-12" name="phone" onblur="login()"
                           data-validate-length-range="20" data-validate-words="1"   required="required"
                           value="${sessionScope.user.phone}" type="text" maxlength="11"><span style="color: red;"></span>
                </div>
            </div>
            <div class="item form-group">
                <label class="control-label col-md-3 col-sm-3 col-xs-12" >邮箱号 <span class="required">*</span>
                </label>
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <input id="email" class="form-control col-md-7 col-xs-12" onblur="login()"
                           data-validate-length-range="20" data-validate-words="1" name="email"   required="required"
                           value="${sessionScope.user.email}" type="text" maxlength="25" ><span style="color: red;"></span>
                </div>
            </div>
            <div class="ln_solid"></div>
            <div class="form-group">
                <div class="col-md-6 col-md-offset-3">
                    <button id="send" type="submit" class="btn btn-success">保存</button>
                    <a href="javaScript:history.back(-1)"><button type="button" class="btn btn-primary" id="back">返回</button></a>
                    <br/><br/>
                </div>
            </div>
        </form>
            <form class="form-horizontal form-label-left" action="personal2" method="post" enctype="multipart/form-data" id="touxinag" style="display: none;">
                <input type="hidden" value="${sessionScope.user.id}" name="userid" id="userid1">
                <input type="hidden" value="${user.type}" name="type" >
                <input type="hidden" value="${user.password}" name="password" >
                <input type="hidden" value="${user.phone}" name="phone" >
                <input type="hidden" value="${user.email}" name="email" >
                <input type="hidden" value="${user.username}" name="username" >

                <div class="item form-group">
                <label class="control-label col-md-3 col-sm-3 col-xs-12">头像 <span class="required">*</span>
                </label>
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <input type="file" class="form-control col-md-7 col-xs-12" name="picPath"  required="required" id="picPath1"/>
                    <img alt="" src=" ${pageContext.request.contextPath }${sessionScope.user.picPath}" id="backImg" style="width: 140px">
                </div>
                ${fileUploadError}
            </div>
                <div class="form-group">
                    <div class="col-md-6 col-md-offset-3">
                        <button id="send1" type="submit" class="btn btn-success">保存</button>
                       <button type="button" class="btn btn-primary" id="back1" onclick="fanhui()">返回</button>
                        <br/><br/>
                    </div>
                </div>
            </form>
<div class="clearfix"></div>
<%@include file="../common/footer.jsp"%>
            <script src="${pageContext.request.contextPath}/indexBootstrap/js/personal.js"></script>
