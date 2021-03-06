&nbsp;<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../common/header.jsp"%>
<div class="clearfix"></div>
<div class="row">
	<div class="col-md-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>
					员工管理 <i class="fa fa-user"></i><small>
						</small>
				</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<form method="post" action="${pageContext.request.contextPath}/wuliu/list">
					<input type="hidden" name="pageIndex" value="1" />
			    <ul>
					<li>
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4 col-xs-12">员工编号：</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input name="id" type="text" class="form-control col-md-7 col-xs-12" value="${id}">
							</div>
						</div>
					</li>
					
					
					   <li>
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4 col-xs-12">姓名：</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input name="username" type="text" class="form-control col-md-7 col-xs-12" value="${username }">
							</div>
						</div>
					   </li>
						<li>
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4 col-xs-12">手机号：</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input name="phone" type="text" class="form-control col-md-7 col-xs-12" value="${phone}">
							</div>
						</div>
					   </li>
						<li>
						<div class="form-group">
							<label class="control-label col-md-4 col-sm-4 col-xs-12">邮箱：</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input name="email" type="text" class="form-control col-md-7 col-xs-12" value="${email}">
							</div>
						</div>
					   </li>
					
						<%-- <li>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">所属网点编号：</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input name="querySoftwareName" type="text" class="form-control col-md-7 col-xs-12" value="${querySoftwareName }">
							</div>
						</div>
					   </li>
					   
					   	<li>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">所属分公司编号：</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input name="querySoftwareName" type="text" class="form-control col-md-7 col-xs-12" value="${querySoftwareName }">
							</div>
						</div>
					   </li> --%>
				
					<li><button type="submit" class="btn btn-primary"> 查 &nbsp;&nbsp;&nbsp;&nbsp;询 </button>
						<a href="JavaScript:history.back(-1)" class="btn btn-primary">返回</a>
				</ul>
			</form>
			
		</div>
	</div>
</div>
<div class="col-md-12 col-sm-12 col-xs-12">
	<div class="x_panel">
		<div class="x_content">
			<p class="text-muted font-13 m-b-30"></p>
			<div id="datatable-responsive_wrapper"
				class="dataTables_wrapper form-inline dt-bootstrap no-footer">
				<div class="row">
					<div class="col-sm-12">
					<a href="${pageContext.request.contextPath}/wuliu/kuai" class="btn btn-success btn-sm">添加员工</a>
						<table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline collapsed"
							cellspacing="0" width="100%" role="grid" aria-describedby="datatable-responsive_info" style="width: 100%;">
							<thead>
								<tr role="row">
									<th class="sorting_asc" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="First name: activate to sort column descending"
										aria-sort="ascending">员工编号</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										手机号</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										员工名称</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										性别</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										邮箱</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										地址</th>

									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										style="width: 124px;"
										aria-label="Last name: activate to sort column ascending">
										操作</th>
								</tr>
							</thead>

							<tbody>
							<c:forEach items="${listUser}" var="courier" varStatus="add">
								<tr>
								 <td>${courier.id}</td>
								 <td>${courier.phone}</td>
								 <td>${courier.username}</td>
								 <td>${courier.sex}</td>
								 <td>${courier.email}</td>
								 <td>${courier.site}</td>
								 <td><a href="javascript:;" value="${courier.id}" class="btn btn-primary shan">删除</a>
									 <a href="${pageContext.request.contextPath}/wuliu/xiang?id=${courier.id}" class="btn btn-primary">个人详情</a></td>
								</tr>

							</c:forEach>
							</tbody>
						</table>
					</div>


				</div>
				<div class="row">
					<div class="col-sm-5">
						<div class="dataTables_info" id="datatable-responsive_info"
							role="status" aria-live="polite">共${page.count }条记录
							${page.pageNo }/${page.pageCount }页</div>
					</div>
					<div class="col-sm-7">
						<div class="dataTables_paginate paging_simple_numbers"
							id="datatable-responsive_paginate">
							<ul class="pagination">
									<li class="paginate_button previous">
										<a href="${pageContext.request.contextPath}/wuliu/list?pageIndex=1">
										首页</a>
									</li>
									<li class="paginate_button "><a href="${pageContext.request.contextPath}/wuliu/list?pageIndex=${page.pageNo-1}"
										>上一页</a>
									</li>
									<li class="paginate_button "><a href="${pageContext.request.contextPath}/wuliu/list?pageIndex=${page.pageNo+1}"
										>下一页</a>
									</li>
									<li class="paginate_button next"><a href="${pageContext.request.contextPath}/wuliu/list?pageIndex=${page.pageCount}"
									>最后一页</a>
									</li>
							</ul>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
<%@include file="../common/footer.jsp"%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery.min.js"></script>
	<script type="text/javascript">
        $(function() {
            $(".shan").on("click",function () {
                var o=$(this);
                if(confirm("确定要删除此快递员吗？")){
                    $.ajax({
                        type:"post",
                        url:"shan",
                        data:{uid:o.attr("value")},
                        success:function (data) {
                            if(data==true){
                                alert("删除成功！");
                                o.parents("tr").remove();
                            }else if(data==false){
                                alert("删除失败！");
                            }
                        }
                    });
				}

            })

        }) ;
	</script>