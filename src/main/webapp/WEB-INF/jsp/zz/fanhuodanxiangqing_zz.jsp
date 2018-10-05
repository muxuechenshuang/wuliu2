<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@include file="../common/header.jsp"%>
<div class="clearfix"></div>
<div class="row">
  <div class="col-md-12 col-sm-12 col-xs-12">
    <div class="x_panel">
      <div class="x_title">
        <h2>查看并审核返货单 <i class="fa fa-user">/h2>
             <div class="clearfix"></div>
      <div class="x_title">
            <h2>返货单基础信息</h2>
          <div class="clearfix"></div>
      </div>
      <div class="x_content1">
        <form class="form-horizontal form-label-left" action="checksave" method="post">
          <input type="hidden" name="id" value="${appInfo.id}">
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="id">返货单号 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input class="form-control col-md-7 col-xs-12" value="${appInfo.id}"
              type="text" readonly="readonly" id="id" name="id">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="gid">相关工单单号 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input class="form-control col-md-7 col-xs-12" value="${appInfo.gid}"
                     type="text" readonly="readonly" id="gid" name="gid">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="yid">申请员工工号<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" class="form-control col-md-7 col-xs-12" 
              value="${appInfo.yid}" readonly="readonly" id="yid" name="yid">
            </div>
          </div>
          
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="result">返货原因<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input class="form-control col-md-7 col-xs-12" 
              	value="${appInfo.result}" type="text" readonly="readonly" id="result" name="result">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="result">创建时间<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input class="form-control col-md-7 col-xs-12"
                     value="${appInfo.ctreaTime}" type="text" readonly="readonly" id="ctreaTime" name="ctreaTime">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="gName">收件人姓名<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" value="${appInfo.gName}"
              class="form-control col-md-7 col-xs-12" readonly="readonly" id="gName" name="gName">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="gPhone">收件人电话 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" value="${appInfo.gPhone}"
                     class="form-control col-md-7 col-xs-12" readonly="readonly" id="gPhone" name="gPhone">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="gCity">收件人城市 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" value="${appInfo.gCity}"
               class="form-control col-md-7 col-xs-12" readonly="readonly" id="gCity" name="gCity">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="gPoint">收件人网点 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" value="${appInfo.gPoint}"
                     class="form-control col-md-7 col-xs-12" readonly="readonly" id="gPoint" name="gPoint">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="gAddress">收件人地址 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" value="${appInfo.gAddress}"
                     class="form-control col-md-7 col-xs-12" readonly="readonly" id="gAddress" name="gAddress">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sName">寄件人姓名 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" value="${appInfo.sName}"
                     class="form-control col-md-7 col-xs-12" readonly="readonly" id="sName" name="sName">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sPhone">收件人电话 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" value="${appInfo.gAddress}"
                     class="form-control col-md-7 col-xs-12" readonly="readonly" id="sPhone" name="sPhone">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sCity">收件人城市 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" value="${appInfo.sCity}"
                     class="form-control col-md-7 col-xs-12" readonly="readonly" id="sCity" name="sCity">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sPoint">收件人网点 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" value="${appInfo.sPoint}"
                     class="form-control col-md-7 col-xs-12" readonly="readonly" id="sPoint" name="sPoint">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sPoint">收件人地址 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" value="${appInfo.sAddress}"
                     class="form-control col-md-7 col-xs-12" readonly="readonly" id="sAddress" name="sAddress">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sPoint">审核时间 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" value="${appInfo.auditTime}"
                     class="form-control col-md-7 col-xs-12" readonly="readonly" id="auditTime" name="auditTime">
            </div>
          </div>

          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="comment">备注 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <textarea class="form-control col-md-7 col-xs-12" id="comment" name="comment">
              ${appInfo.comment}</textarea>
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
        		<button id="status1" type="submit" name="status" value="3" class="btn btn-success">审核不通过</button>
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
              <%--${appVersion.versionInfo }</textarea>--%>
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
<%@include file="../common/footer.jsp"%>
<script src="${pageContext.request.contextPath }/statics/localjs/appcheck.js"></script>