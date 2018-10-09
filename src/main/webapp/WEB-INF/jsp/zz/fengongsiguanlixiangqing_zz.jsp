<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="../common/header.jsp" %>
<script src="${pageContext.request.contextPath }/statics/js/jquery-1.4.2.min.js"></script>

<div class="clearfix"></div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>分公司管理员<i class="fa fa-user"></i>
                </h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_title">
                <h2>分公司管理员信息查看和修改</h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content1">
                <form class="form-horizontal form-label-left" method="post" action="/center/addSave6" enctype="multipart/form-data">
                    <input type="hidden" name="id" value="${user.id}">
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="id">分公司管理员编号 <span
                                class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" readonly
                                   type="text" value="${user.id}" name="id" id="id">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="username">账号 <span
                                class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12" readonly
                                   value="${user.username}" name="username" id="username">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="password">密码 <span
                                class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12"
                                   value="${user.password}" name="password" id="password">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="phone">电话 <span
                                class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12"
                                   value="${user.phone}" name="phone" id="phone" type="text">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">邮箱 <span
                                class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" value="${user.email}" name="email" id="email"
                                   class="form-control col-md-7 col-xs-12">
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sex">性别 <span
                                class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12"
                                   value="${user.sex}" name="sex" id="sex">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="parentid">所属分公司 <span
                                class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12"
                                   value="${user.parentid}" name="parentid" id="parentid">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="time">账号创建时间 <span
                                class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" class="form-control col-md-7 col-xs-12" readonly
                                   value="<fmt:formatDate value="${user.time}" pattern='yyyy-MM-dd HH:mm:ss'/>"
                                   name="time" id="time">
                        </div>
                    </div>
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="picpath">个人头像 <span
                                class="required">*</span></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="file" class="form-control col-md-7 col-xs-12" name="picpath"  required="required" id="picpath"/>
                            <span><img src="${pageContext.request.contextPath }${user.picPath}" id="showpic" width="400" /></span>
                            <h3 style="color:red">${fileUploadError}</h3>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                            <button type="submit" class="btn btn-primary" id="send">确认</button>
                            <button type="button" class="btn btn-primary" id="back">返回</button>
                        </div>
                    </div>
                </form>

                <div class="clearfix"></div>
                <br/><br/>
            </div>
        </div>
    </div>
</div>
        <%@include file="../common/footer.jsp" %>
        <script src="${pageContext.request.contextPath }/statics/js/zz/fengongsiguanlitianjia.js"></script>