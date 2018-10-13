<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@include file="../common/header.jsp" %>
<div class="clearfix"></div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>新增分公司管理员信息
                </h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <div class="clearfix"></div>
                <form class="form-horizontal form-label-left" action="/center/addSave1" method="post"
                      enctype="multipart/form-data">
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="username">分公司管理用户名 <span
                                class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input id="username" class="form-control col-md-7 col-xs-12"
                                   data-validate-length-range="20" data-validate-words="1" name="username"
                                   required="required"
                                   placeholder="分公司管理用户名" type="text" maxlength="15">
                            <span></span>
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="password">分公司管理密码 <span
                                class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input id="password" class="form-control col-md-7 col-xs-12"
                                   data-validate-length-range="20" data-validate-words="1" name="password"
                                   required="required" onblur="add()"
                                   placeholder="分公司管理密码" type="text" maxlength="15">
                            <span></span>
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">分公司管理员邮箱 <span
                                class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input id="email" class="form-control col-md-7 col-xs-12"
                                   data-validate-length-range="20" data-validate-words="1" name="email"
                                   required="required" onblur="add()"
                                   placeholder="分公司管理员邮箱" type="text" maxlength="25">
                            <span></span>
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="phone">分公司管理员电话 <span
                                class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input id="phone" class="form-control col-md-7 col-xs-12"
                                   data-validate-length-range="20" data-validate-words="1" name="phone"
                                   required="required" onblur="add()"
                                   placeholder="分公司管理员电话" type="text" maxlength="11">
                            <span></span>
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sex">分公司管理员性别 <span
                                class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">

                                &nbsp;&nbsp;&nbsp;<input type="radio" name="sex" id="sex" checked value="男">男 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="sex" id="sex1" value="女">女
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="parentid">管理员所属分公司 <span
                                class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input id="parentid" class="form-control col-md-7 col-xs-12"
                                   data-validate-length-range="20" data-validate-words="1" name="parentid"
                                   required="required"
                                   placeholder="管理员所属分公司" type="text" maxlength="50">
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="picpath">个人头像 <span
                                class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <!--             文件上传以及错误信息回显 -->
                            <input type="file" class="form-control col-md-7 col-xs-12" name="picpath"
                                   required="required" id="picpath"/>
                            <span><img src="" id="showpic" width="400" /></span>
                            <h2 style="color:red">${fileUploadError}</h2>
                        </div>
                    </div>
                    <div class="ln_solid"></div>
                    <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                            <button id="send" type="submit" class="btn btn-success">保存</button>
                            <a href="JavaScript:history.back(-1)" class="btn btn-primary">返回</a>
                            <br/><br/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%@include file="../common/footer.jsp" %>
 <script src="${pageContext.request.contextPath}/statics/js/zz/fengongsiguanlitianjia.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/jquery-1.4.2.min.js"></script>
<script></script>