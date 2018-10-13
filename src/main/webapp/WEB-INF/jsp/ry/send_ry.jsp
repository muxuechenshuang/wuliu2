<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<div class="clearfix"></div>
<div class="row">
  <div class="col-md-12 col-sm-12 col-xs-12">
    <div class="x_panel">
      <div class="x_title">
        <h2>寄件服务<i class="fa fa-user"></i><small>${sessionScope.user.username}</small></h2>
             <div class="clearfix"></div>
      </div>
      <div class="x_content">
           <div class="clearfix"></div>
        <form id="form" class="form-horizontal form-label-left" action="savesend" method="post" enctype="multipart/form-data">
            <c:if test="${sendErro != null}">
                <h1>${sendErro}</h1>
            </c:if>
            <input type="hidden" id="userId" name="userId" value="${sessionScope.user.id}">
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sName">寄件人： <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="sName" class="form-control col-md-7 col-xs-12"
               data-validate-length-range="20" data-validate-words="1" name="sName"  required="required"
               placeholder="请输入姓名" type="text" 	maxlength = 30;><span style="color: red;"></span>
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sTel">电话： <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="sTel" class="form-control col-md-7 col-xs-12" value=""
              	data-validate-length-range="20" data-validate-words="1" name="sTel"   required="required"
              	placeholder="请输入电话" type="text"><span id="sTelR" style="color: red;"></span>
            </div>
          </div>

          <div class="form-group">
				<label class="control-label col-md-3 col-sm-3 col-xs-12" for="sCity">城市：<span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<select id="sCity" name="cityId"
								class="form-control" style="width: 200px;">
                                <option value="">--请选择城市--</option>
                                <c:forEach var="cityList" items="${cityList}">
                                    <option value="${cityList.id}"
                                            <c:if test="${cityList.id == cityId}">selected="selected"</c:if>
                                    >${cityList.city}</option>
                                </c:forEach>
					</select><span id="sCityR"style="color:red;font-size:18px;"></span>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-md-3 col-sm-3 col-xs-12" for="sBranch">网点：<span class="required">*</span></label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<select id="sBranch" name="branchId"
								class="form-control" style="width: 200px;">
                                <option value="">--请选择网点--</option>
                                <c:if test="${branchList!=null}">
                                <c:forEach var="branchList" items="${branchList}">
                                    <option value="${branchList.id}"
                                            <c:if test="${branchList.id == branchId}">selected="selected"</c:if>
                                    >${branchList.name}</option>
                                </c:forEach>
                                </c:if>
					</select><span id="sBranchR"style="color:red;font-size:18px;"></span>
				</div>
			</div>

          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sAddress">上门地址 ：<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="sAddress" class="form-control col-md-7 col-xs-12" name="sAddress"
              	data-validate-length-range="20" data-validate-words="1"   required="required"
              	placeholder="请输入地址" type="text">
            </div>
          </div>
          <br>
          <hr>
          <br>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="gName">收件人：<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="gName" class="form-control col-md-7 col-xs-12"
              data-validate-length-range="20" data-validate-words="1" name="gName"   required="required"
              placeholder="请输入姓名" type="text">
            </div>
          </div>
           <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="gTel">收件人电话：<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="gTel" class="form-control col-md-7 col-xs-12"
              data-validate-length-range="20" data-validate-words="1" name="gTel"   required="required"
              placeholder="请输入电话" type="text"><span id="gTelR" style="color: red;"></span>
            </div>
          </div>
           <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="gAddress">收件人地址：<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="gAddress" class="form-control col-md-7 col-xs-12"
              data-validate-length-range="20" data-validate-words="1" name="gAddress"   required="required"
              placeholder="请输入地址" type="text">
            </div>
          </div>
             <br>
          <hr>
          <br>
           <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sTime">上门时间：<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="sTime" class="form-control col-md-7 col-xs-12 form_datetime"
              data-validate-length-range="20" data-validate-words="1" name="doorTime"  readonly
              placeholder="请输入上门时间(请选择上午九点到下午七点之间的时间)" type="text"><span id="sTimeR"style="color:red;font-size:18px;"></span>
            </div>
          </div>

          <div class="item form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="cType">货物类型：<span class="required">*</span></label>
              <div class="col-md-6 col-sm-6 col-xs-12">
                  <select id="cType" name="typeId"
                          class="form-control" style="width: 200px;">
                      <option value="">--请选择货物类型--</option>
                      <c:forEach var="type" items="${typeList}">
                          <option value="${type.valueId}">${type.valueName}</option>
                      </c:forEach>
                  </select><span id="cTypeR"style="color:red;font-size:18px;"></span>
              </div>
          </div>

            <div class="item form-group">
                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="product">货物名称：<span class="required">*</span>
                </label>
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <input id="product" class="form-control col-md-7 col-xs-12"
                           data-validate-length-range="20" data-validate-words="1" name="product"   required="required"
                           placeholder="请输入货物名称" type="text">
                </div>
            </div>

          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="sWeight">预估重量：<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
                <input id="sWeight" class="form-control col-md-7 col-xs-12" name="preWeight"
                       data-validate-length-range="20" data-validate-words="1"   required="required"
                       placeholder="请输入重量（公斤/kg）仅正整数" type="text"
                       onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                       onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}">
            </div>
          </div>

          <div class="item form-group">
              <label class="control-label col-md-3 col-sm-3 col-xs-12" for="preVolume">预估体积：<span class="required">*</span>
              </label>
              <div class="col-md-6 col-sm-6 col-xs-12">
                  <input id="preVolume" class="form-control col-md-7 col-xs-12" name="preVolume"
                         data-validate-length-range="20" data-validate-words="1"   required="required"
                         placeholder="请输入体积（/m³）仅正整数" type="text"
                         onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                         onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}">
              </div>
          </div>

          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="comment">对小哥说：
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="comment" class="form-control col-md-7 col-xs-12"
              data-validate-length-range="20" data-validate-words="1" name="comment"
              placeholder="备注信息（请带梯子、请带纸箱、缺文件袋等）" type="text">
            </div>
          </div>

          <div class="ln_solid"></div>
          <div class="form-group">
            <div class="col-md-6 col-md-offset-3">
              <button id="send" type="submit" class="btn btn-success">提交</button>
              <button type="reset" class="btn btn-primary" id="back">重填</button>
              <br/><br/>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<%@include file="../common/footer.jsp"%>
<script type="text/javascript">
    $(".form_datetime").datetimepicker({
        format:'yyyy-mm-dd hh:ii',
        language:'zh-CN',
        startDate:new Date(new Date()+1000*60*60*2)
    });
</script>
<script src="${pageContext.request.contextPath}/statics/js/ry/send_ry.js"></script>