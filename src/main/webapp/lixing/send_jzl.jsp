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
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">寄件人： <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="softwareName" class="form-control col-md-7 col-xs-12" 
               data-validate-length-range="20" data-validate-words="1" name="softwareName"  required="required"
               placeholder="请输入姓名" type="text" 	maxlength = 30;><span style="color: red;"></span>
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">电话： <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="APKName" class="form-control col-md-7 col-xs-12" 
              	data-validate-length-range="20" data-validate-words="1" name="APKName"   required="required"
              	placeholder="请输入电话" type="text"><span style="color: red;"></span>
            </div>
          </div>
          
          <div class="form-group">
				<label class="control-label col-md-3 col-sm-3 col-xs-12">城市：<span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<select id="queryCategoryLevel1" name="queryCategoryLevel1"
								class="form-control" style="width: 200px;">
							<option value="">--请选择城市--</option>
							<c:forEach var="appCategory" items="${categoryLevel1List}">
							<option
							<c:if test="${appCategory.id == queryCategoryLevel1 }">selected="selected"</c:if>
								value="${appCategory.id}">${appCategory.categoryName}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-md-3 col-sm-3 col-xs-12">网点：<span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<select id="queryCategoryLevel1" name="queryCategoryLevel1"
								class="form-control" style="width: 200px;">
							<option value="">--请选择网点--</option>
							<c:forEach var="appCategory" items="${categoryLevel1List}">
							<option
							<c:if test="${appCategory.id == queryCategoryLevel1 }">selected="selected"</c:if>
								value="${appCategory.id}">${appCategory.categoryName}</option>
						</c:forEach>
					</select>
				</div>
			</div>
          
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">上门地址 ：<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="supportROM" class="form-control col-md-7 col-xs-12" name="supportROM" 
              	data-validate-length-range="20" data-validate-words="1"   required="required"
              	placeholder="请输入地址" type="text">
            </div>
          </div>
          <br>
          <hr>
          <br>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">收件人：<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="interfaceLanguage" class="form-control col-md-7 col-xs-12" 
              data-validate-length-range="20" data-validate-words="1" name="interfaceLanguage"   required="required"
              placeholder="请输入姓名" type="text">
            </div>
          </div>
           <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">收件人电话：<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="interfaceLanguage" class="form-control col-md-7 col-xs-12" 
              data-validate-length-range="20" data-validate-words="1" name="interfaceLanguage"   required="required"
              placeholder="请输入电话" type="text">
            </div>
          </div>
           <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">收件人地址：<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="interfaceLanguage" class="form-control col-md-7 col-xs-12" 
              data-validate-length-range="20" data-validate-words="1" name="interfaceLanguage"   required="required"
              placeholder="请输入地址" type="text">
            </div>
          </div>
             <br>
          <hr>
          <br>
           <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">上门时间：<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="interfaceLanguage" class="form-control col-md-7 col-xs-12" 
              data-validate-length-range="20" data-validate-words="1" name="interfaceLanguage"   required="required"
              placeholder="请输入上门时间" type="text">
            </div>
          </div>
          
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">货物类型：<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="interfaceLanguage" class="form-control col-md-7 col-xs-12" 
              data-validate-length-range="20" data-validate-words="1" name="interfaceLanguage"   required="required"
              placeholder="请输入货物类型（例如：电子类、衣物类、文件类等）" type="text">
            </div>
          </div>
          
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">预估重量：<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="interfaceLanguage" class="form-control col-md-7 col-xs-12" 
              data-validate-length-range="20" data-validate-words="1" name="interfaceLanguage"   required="required"
              placeholder="请输入预估重量（不需要精确数值）" type="text">
            </div>
          </div>
          
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">对小哥说：
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="interfaceLanguage" class="form-control col-md-7 col-xs-12" 
              data-validate-length-range="20" data-validate-words="1" name="interfaceLanguage"   required="required"
              placeholder="备注信息（请带梯子、请带纸箱、缺文件袋等）" type="text">
            </div>
          </div>
          
          <div class="ln_solid"></div>
          <div class="form-group">
            <div class="col-md-6 col-md-offset-3">
              <button id="send" type="submit" class="btn btn-success">提交</button>
              <button type="button" class="btn btn-primary" id="back">重填</button>
              <br/><br/>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<%@include file="../common/footer.jsp"%>