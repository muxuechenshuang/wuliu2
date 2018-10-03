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
        <form id="formId" class="form-horizontal form-label-left" action="appinfoaddsave" method="get" enctype="multipart/form-data">
			<%--输入发货地--%>
          <div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">始发地：<span class="required">*</span></label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<select id="cityA" name="cityA"
										class="form-control">
											<option value="0">--请选择始发地--</option>
											<c:forEach var="cityList" items="${cityList}">
												<option value="${cityList.city}">${cityList.city}</option>
											</c:forEach>
									</select>
								</div>
							</div>
			<%--输入目的地--%>
          <div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">目的地：<span class="required">*</span></label>
								<div class="col-md-6 col-sm-6 col-xs-12">
									<select id="cityB" name="cityB"
										class="form-control">
											<option value="0">--请选择目的地--</option>
										<c:forEach var="cityList" items="${cityList}">
											<option value="${cityList.city}">${cityList.city}</option>
										</c:forEach>
									</select>
								</div>
							</div>
          <%--输入重量--%>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="estimatedWeight">重量 ：<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="estimatedWeight" class="form-control col-md-7 col-xs-12" name="estimatedWeight"
              	data-validate-length-range="20" data-validate-words="1"   required="required"
              	placeholder="请输入重量（公斤/kg）" type="text"
				onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
				onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'0')}else{this.value=this.value.replace(/\D/g,'')}">
              	<br/><br/><button id="calculate" type="button" class="btn btn-success">查&nbsp;&nbsp;&nbsp;&nbsp;询</button>
              	<h3>注：<span style="font-size: 14px;">此报价仅供参考！</span></h3>
            </div>
		  </div>
		</form><
            <div class="clearfix"></div>
          <hr>
          <br>
          <div class="x_content1">
			  <%--接收返回数据--%>
				<form class="form-horizontal form-label-left">
					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="weight">实际计费重量 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input class="form-control col-md-7 col-xs-12" id="weight"
								value="" type="text" readonly="readonly">
						</div>
					</div>
					
					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="timeT">预估配送时间 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input class="form-control col-md-7 col-xs-12" id="timeT"
								value="" type="text" readonly="readonly">
						</div>
					</div>
					
					<div class="item form-group">
						<label class="control-label col-md-3 col-sm-3 col-xs-12"
							for="money">预估运费 <span class="required">*</span>
						</label>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<input class="form-control col-md-7 col-xs-12" id="money"
								value="" type="text" readonly="readonly">
						</div>
					</div>
				</form>
			</div>
      </div>
    </div>
  </div>
</div>
<%@include file="../common/footer.jsp"%>
<script src="${pageContext.request.contextPath}/statics/js/ry/moneyestimate_ry.js/"></script>