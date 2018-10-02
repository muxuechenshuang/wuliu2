<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@include file="../../../common/header.jsp"%>
<div class="clearfix"></div>
<div class="row">
  <div class="col-md-12 col-sm-12 col-xs-12">
    <div class="x_panel">
      <div class="x_title">
        <h2>查看并审核返货单 <i class="fa fa-user"></i>${userSession.userName}</small></h2>
             <div class="clearfix"></div>
      </div>
      <div class="x_title">
            <h2>返货单基础信息</h2>
          <div class="clearfix"></div>
      </div>
      <div class="x_content1">
        <form class="form-horizontal form-label-left" action="checksave" method="post">
          <input type="hidden" name="id" value="${appInfo.id}">
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">返货单号 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input class="form-control col-md-7 col-xs-12" value="${appInfo.softwareName}" 
              type="text" readonly="readonly">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">申请员工工号<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" class="form-control col-md-7 col-xs-12" 
              value="${appInfo.APKName}" readonly="readonly">
            </div>
          </div>
          
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">返货原因<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input class="form-control col-md-7 col-xs-12" 
              	value="${appInfo.supportROM}" type="text" readonly="readonly">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">创建时间 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input class="form-control col-md-7 col-xs-12" readonly="readonly"
              	value="${appInfo.interfaceLanguage}" type="text">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">收件人姓名<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" value="${appInfo.softwareSize}"
              class="form-control col-md-7 col-xs-12" readonly="readonly">
            </div>
          </div>
          
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">收件人电话 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" value="${appInfo.downloads}"
               class="form-control col-md-7 col-xs-12" readonly="readonly">
            </div>
          </div>
          
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12"  for="select">收件人地址<span class="required">*</span></label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" class="form-control col-md-7 col-xs-12" 
              	value="${appInfo.flatformName}" readonly="readonly">
            
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="select">寄件人姓名<span class="required">*</span></label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" class="form-control col-md-7 col-xs-12" 
              	value="${appInfo.categoryLevel1Name} --> ${appInfo.categoryLevel2Name} --> ${appInfo.categoryLevel3Name}" readonly="readonly">
            </div>
            </div>
            <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12"  for="select">寄件人电话<span class="required">*</span></label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" class="form-control col-md-7 col-xs-12" 
              	value="${appInfo.flatformName}" readonly="readonly">
            
            </div>
          </div>
           <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">寄件人地址 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" value="${appInfo.downloads}"
               class="form-control col-md-7 col-xs-12" readonly="readonly">
            </div>
          </div>
           <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">审核状态 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" value="${appInfo.downloads}"
               class="form-control col-md-7 col-xs-12" readonly="readonly">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">审核时间 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
            	<input type="text" class="form-control col-md-7 col-xs-12" 
              	value="${appInfo.statusName}" readonly="readonly">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="textarea">备注 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <textarea class="form-control col-md-7 col-xs-12" > 
              ${appInfo.appInfo}</textarea>
            </div>
          </div>
<!--            <div class="item form-group"> -->
<!--             <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">LOGO图片 <span class="required">*</span> -->
<!--             </label> -->
<!--             <div class="col-md-6 col-sm-6 col-xs-12"> -->
<%-- 			 <c:choose>  --%>
<%-- 				  <c:when test="${appInfo.logoPicPath == null || appInfo.logoPicPath == ''}">    --%>
<!-- 				    	暂无 -->
<%-- 				  </c:when>  --%>
<%-- 				  <c:otherwise>    --%>
<%-- 				    <img src="${appInfo.logoPicPath }?m=1" width="100px;"/>  --%>
<%-- 				  </c:otherwise>  --%>
<%--               </c:choose>  --%>
<!--             </div> -->
<!--           </div> -->
        	<div class="form-group">
        		<div class="col-md-6 col-md-offset-3">
        		<button id="status" type="submit" name="status" value="2" class="btn btn-success">审核通过</button>
        		<button id="status" type="submit" name="status" value="3" class="btn btn-success">审核不通过</button>
          		<button type="button" class="btn btn-primary" id="back">返回</button>
        		</div>
     		</div>
        </form>
        </div>
<!--         <div class="clearfix"></div> -->
<!--         <div class="x_title"> -->
<!--             <h2>最新版本信息</h2> -->
<!--             <ul class="nav navbar-right panel_toolbox"> -->
<!--               <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a> -->
<!--               </li> -->
<!--             </ul> -->
<!--           <div class="clearfix"></div> -->
<!--         </div> -->
<!--         <div class="x_content" style="display: block;"> -->
<!--          <br> -->
<!--         <form class="form-horizontal form-label-left"> -->
<!--           <div class="item form-group"> -->
<!--             <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">版本号 <span class="required">*</span> -->
<!--             </label> -->
<!--             <div class="col-md-6 col-sm-6 col-xs-12"> -->
<%--               <input class="form-control col-md-7 col-xs-12" value="${appVersion.versionNo }"  --%>
<!--               type="text" readonly="readonly" > -->
<!--             </div> -->
<!--           </div> -->
<!--           <div class="item form-group"> -->
<!--             <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">版本大小 <span class="required">*</span> -->
<!--             </label> -->
<!--             <div class="col-md-6 col-sm-6 col-xs-12"> -->
<%--               <input type="number" value="${appVersion.versionSize }" class="form-control col-md-7 col-xs-12"> --%>
<!--             </div> -->
<!--           </div> -->
       
<!--           <div class="item form-group"> -->
<!--             <label class="control-label col-md-3 col-sm-3 col-xs-12"  for="select">发布状态 <span class="required">*</span></label> -->
<!--             <div class="col-md-6 col-sm-6 col-xs-12"> -->
<!--               <input type="hidden" name="publishStatus" id="publishStatus" value="3">预发布 -->
<!--             </div> -->
<!--           </div> -->
        
<!--           <div class="item form-group"> -->
<!--             <label class="control-label col-md-3 col-sm-3 col-xs-12" for="textarea">版本简介 <span class="required">*</span> -->
<!--             </label> -->
<!--             <div class="col-md-6 col-sm-6 col-xs-12"> -->
<!--               <textarea class="form-control col-md-7 col-xs-12"> -->
              ${appVersion.versionInfo }</textarea>
<!--             </div> -->
<!--           </div> -->
<!--            <div class="item form-group"> -->
<!--             <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">apk文件 <span class="required">*</span> -->
<!--             </label> -->
<!--             <div class="col-md-6 col-sm-6 col-xs-12"> -->
<%--             <c:choose>  --%>
<%-- 			  <c:when test="${appVersion.downloadLink == null || appVersion.downloadLink == ''}">    --%>
<!-- 			    	暂无 -->
<%-- 			  </c:when>  --%>
<%-- 			  <c:otherwise>    --%>
<%-- 			    <p>${appVersion.apkFileName}&nbsp;&nbsp; --%>
<%-- 			    <a href="${appVersion.downloadLink}" >下载</a> --%>
<!-- 			    </p> -->
<%-- 			  </c:otherwise>  --%>
<%--             </c:choose>  --%>
<!--             </div> -->
<!--           </div> -->
<!--           <div class="clearfix"></div> -->
<!--           <br/><br/> -->
<!--         </form> -->
<!--     </div> -->
    <div class="clearfix"></div>
    <br/><br/>
  </div>
</div>
<%@include file="../../../common/footer.jsp"%>
<script src="${pageContext.request.contextPath }/statics/localjs/appcheck.js"></script>