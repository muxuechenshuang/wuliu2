<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="../common/header.jsp" %>
<div class="clearfix"></div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>修改网点信息<i class="fa fa-user"></i>
                    <small>${user.username}</small>
                </h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content1">
                <div class="clearfix"></div>
                <form class="form-horizontal form-label-left" action="wdinfomodifysave" method="post">
                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">网点编号
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12" value="${wd.id}"
                                   type="text" name="id" readonly="readonly">
                        </div>
                    </div>


                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="name">网点名称 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input id="wdName" class="form-control col-md-7 col-xs-12"
                                   data-validate-length-range="20" data-validate-words="1" value="${wd.name}"
                                   name="name" required="required" placeholder="请输入网点名称"
                                   type="text"
                                   onKeyUp="if(this.value.length>30) this.value=this.value.substr(0,30)"
                                   maxlength="30">
                        </div>
                        <span id="checkwdname" style="position: relative; top: 7px;"></span>
                    </div>


                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="number">电话<span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input id="phone" class="form-control col-md-7 col-xs-12"
                                   name="phone" data-validate-length-range="20" value="${wd.phone}"
                                   data-validate-words="1" required="required"
                                   maxlength="50" placeholder="请输入网点电话" type="text">
                        </div>
                        <span id="checkPhone" style="position: relative; top: 7px;"></span>
                    </div>


                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="name">所属公司
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input id="company" class="form-control col-md-7 col-xs-12"
                                   name="parentName" data-validate-length-range="20" value="${wd.parentName}"
                                   data-validate-words="1" readonly="true" type="text">
                        </div>
                    </div>


                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="name">网点地址
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <input class="form-control col-md-7 col-xs-12"
                                   name="site" data-validate-length-range="20"
                                   data-validate-words="1" required="required" readonly="readonly"
                                   type="text" value="${wd.site}">
                        </div>
                    </div>

                    <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"
                               for="textarea">网点简介 <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
							<textarea id="introduction" name="introduction" required="required"
                                      onKeyUp="if(this.value.length>500) this.value=this.value.substr(0,500)"
                                      maxlength="500" placeholder="请输入本网点的相关信息，本信息作为网点的详细信息进行网点的介绍。"
                                      class="form-control col-md-7 col-xs-12">${wd.introduction}</textarea>
                        </div>
                    </div>


                    <div class="x_content" style="display: block;">
                        <br>

                    </div>


                    <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                            <button type="submit" class="btn btn-success" id="send">保存</button>
                            <button type="button" class="btn btn-primary" id="back">返回</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="clearfix"></div>
            <br/><br/>
        </div>
    </div>
    <%@include file="../common/footer.jsp" %>
    <script src="${pageContext.request.contextPath}/statics/localjs/wdadd.js"></script>
