<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<div class="clearfix"></div>
<div class="row">
  <div class="col-md-12 col-sm-12 col-xs-12">
    <div class="x_panel">
      <div class="x_title">
        <h2>寄件服务<i class="fa fa-user"></i><small>${devUserSession.devName}</small></h2>
             <div class="clearfix"></div>
      </div>
      <div class="x_content">
           <div class="clearfix"></div>
        <form class="form-horizontal form-label-left" action="appinfoaddsave" method="post" enctype="multipart/form-data">
          <div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">始发地：<span class="required">*</span></label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<select id="queryCategoryLevel1" name="queryCategoryLevel1"
										class="form-control">
											<option value="">--请选择始发地--</option>
											<c:forEach var="appCategory" items="${categoryLevel1List}">
												<option
													<c:if test="${appCategory.id == queryCategoryLevel1 }">selected="selected"</c:if>
													value="${appCategory.id}">${appCategory.categoryName}</option>
											</c:forEach>
									</select>
								</div>
							</div>
							
          <div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">目的地：<span class="required">*</span></label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<select id="queryCategoryLevel1" name="queryCategoryLevel1"
										class="form-control">
											<option value="">--请选择目的地--</option>
											<c:forEach var="appCategory" items="${categoryLevel1List}">
												<option
													<c:if test="${appCategory.id == queryCategoryLevel1 }">selected="selected"</c:if>
													value="${appCategory.id}">${appCategory.categoryName}</option>
											</c:forEach>
									</select>
								</div>
							</div>
          
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">重量 ：<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="supportROM" class="form-control col-md-7 col-xs-12" name="supportROM" 
              	data-validate-length-range="20" data-validate-words="1"   required="required"
              	placeholder="请输入重量（公斤/kg）" type="text">
              	<br/><br/><button id="send" type="button" class="btn btn-success">查询</button>
              	<h3>注：<span style="font-size: 14px;">此报价仅供参考！</span></h3>
            </div>
            <div class="clearfix"></div>
          <hr>
          <br>
          <div class="x_content1">
				<form class="form-horizontal form-label-left">
					<input type="hidden" name="id" value="${appInfo.id}">
					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="name">实际计费重量 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input class="form-control col-md-7 col-xs-12"
								value="${appInfo.softwareName}" type="text" readonly="readonly">
						</div>
					</div>
					
					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="name">预估配送时间 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input class="form-control col-md-7 col-xs-12"
								value="${appInfo.softwareName}" type="text" readonly="readonly">
						</div>
					</div>
					
					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="name">预估运费 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input class="form-control col-md-7 col-xs-12"
								value="${appInfo.softwareName}" type="text" readonly="readonly">
						</div>
					</div>
				</form>
			</div>
        </form>
      </div>
    </div>
  </div>
</div>
<%@include file="../common/footer.jsp"%>