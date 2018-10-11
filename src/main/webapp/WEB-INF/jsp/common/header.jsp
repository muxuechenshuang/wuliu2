<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>飞鸟物流${user.id}</title>


	<!-- Bootstrap -->
	<link href="${pageContext.request.contextPath }/statics/css/bootstrap.min.css" rel="stylesheet">
	<!-- Font Awesome -->
	<link href="${pageContext.request.contextPath }/statics/css/font-awesome.min.css" rel="stylesheet">
	<!-- NProgress -->
	<link href="${pageContext.request.contextPath }/statics/css/nprogress.css" rel="stylesheet">
	<!-- iCheck -->
	<link href="${pageContext.request.contextPath }/statics/css/green.css" rel="stylesheet">
	<!-- bootstrap-progressbar -->
	<link href="${pageContext.request.contextPath }/statics/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
	<!-- JQVMap -->
	<link href="${pageContext.request.contextPath }/statics/css/jqvmap.min.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath }/statics/css/dropzone.min.css" rel="stylesheet">
	<!-- Custom Theme Style -->
	<link href="${pageContext.request.contextPath }/statics/css/custom.min.css"	rel="stylesheet">

	<!-- add localcss 2016-8-18 -->
	<link href='${pageContext.request.contextPath }/statics/localcss/appinfoadd.css' rel='stylesheet'>
	<link href='${pageContext.request.contextPath }/statics/localcss/appinfolist.css' rel='stylesheet'>

	<link href="${pageContext.request.contextPath}/statics/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
</head>
<body class="nav-md footer_fixed">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col menu_fixed">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a href="${pageContext.request.contextPath }/dev/flatform/main" class="site_title"><i class="fa fa-paw"></i> <span>飞鸟物流</span>
						</a>
					</div>

					<div class="clearfix"></div>

					<!-- menu profile quick info -->
					<div class="profile">
						<div class="profile_pic">
							<a href="/wuliu/homepage"><img
								src="${pageContext.request.contextPath }${user.picPath}"
								alt="..." class="img-circle profile_img"></a>
						</div>
						<div class="profile_info">
							<span>Welcome,</span>
							<p>1</p>
							<h2>${devUserSession.devCode }</h2>
						</div>
					</div>
					<!-- /menu profile quick info -->

					<br />

					<!-- sidebar menu -->
					<div id="sidebar-menu"
						class="main_menu_side hidden-print main_menu">
						<div class="menu_section">
							<h3>${user.username }</h3>
							<ul class="nav side-menu">


								<li>
									<c:if test="${sessionScope.user.type eq 1 }">
								<li><a><i class="fa fa-edit"></i> 客户(任一)<span
										class="fa fa-chevron-down"></span>
								</a>
									<ul class="nav child_menu">
										<li><a href="/calculate/query">查件</a>
										</li>
										<li><a href="/calculate/branchquery">服务网点查询</a>
										</li>
										<li><a href="/calculate/moneyestimate">运费时效查询</a>
										</li>
										<li><a href="/calculate/intosend">寄件服务</a>
										</li>
									</ul></li>
									</c:if>


								<!--肖林辉  -->
								<c:if test="${sessionScope.user.type eq 2 }">

								<li><a><i class="fa fa-home"></i>快递员  肖林辉<span
										class="fa fa-chevron-down"></span>
								</a>
									<ul class="nav child_menu">
										<li><a href="/order/someorder?courierNum=${user.id}">订单查询</a>
										</li>
										<li><a href="/order/toworkorder?courierNum=${user.id}">查询工单</a>
										</li>
										<li><a href="/order/baobiao_someorder?courierNum=${user.id}">图形报表</a>
										</li>
									</ul></li>
								</c:if>

								<!--李普强  -->

								<c:if test="${sessionScope.user.type eq 3 }">
									<!--李普强  -->
									<li><a><i class="fa fa-home"></i> 网点(李普强) <span
											class="fa fa-chevron-down"></span>
									</a>
										<ul class="nav child_menu">
											<li>
												<a href="${pageContext.request.contextPath}/wuliu/yuan">员工管理</a>
											</li>

											<li><a href="${pageContext.request.contextPath}/wuliu/dingdan">查看用户订单</a>
											</li>
											<!-- 	<li><a href="shenghe_lpq.jsp">审核订单</a>
                                                </li> -->
											<li><a href="${pageContext.request.contextPath}/wuliu/gong">确认工单</a>
											</li>
											<li><a href="${pageContext.request.contextPath}/wuliu/fengong">分配工单</a>
											</li>
											<li><a href="${pageContext.request.contextPath}/wuliu/biao">网点报表</a>
											</li>
										</ul>
									</li>
								</c:if>

								<c:if test="${sessionScope.user.type eq 4 }">
								<!--李家和  -->
								<li><a><i class="fa fa-home"></i>分公司管理<span
										class="fa fa-chevron-down"></span>
								</a>
									<ul class="nav child_menu">
										<li><a href="${pageContext.request.contextPath}/filiale/wdquery">网点管理</a></li>
										<li><a href="${pageContext.request.contextPath}/filiale/queryworkorder">工单查询</a>
										<li><a href="${pageContext.request.contextPath}/">出库</a></li>
										<li><a href="${pageContext.request.contextPath}/filiale/putinstorage">入库</a></li>
									</ul>

								</li>
								</c:if>

								<c:if test="${sessionScope.user.type eq 5 }">
								<!--张展  -->

                                <li><a><i class="fa fa-home"></i>总公司管理<span
										class="fa fa-chevron-down"></span>
								</a>

									<ul class="nav child_menu">

										<li><a href="/center/toselectworkorder">查询工单（总部）</a></li>
										<li><a href="/center/returnlist">返货单查询</a></li>
										<li><a href="/center/returndetail">审核返货单</a></li>
										<li><a href="/center/addsoncompany">新增分公司</a></li>
										<li><a href="/center/tosoncompanylist">分公司管理</a></li>
										<%--<li><a href="/center/soncompanydetail">分公司详情（修改）</a></li>--%>
										<li><a href="/center/addsonperson">新增分公司管理</a></li>
										<li><a href="/center/finduser">查询分公司管理</a></li>
										<li><a href="/center/baobiao1">报表</a></li>
							</ul></li>
								</c:if>
						</ul></div>


					</div>
					<!-- /sidebar menu -->

					<!-- /menu footer buttons -->
					<div class="sidebar-footer hidden-small">
						<a data-toggle="tooltip" data-placement="top" title="Settings">
							<span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
						</a> <a data-toggle="tooltip" data-placement="top" title="FullScreen">
							<span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
						</a> <a data-toggle="tooltip" data-placement="top" title="Lock"> <span
							class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
						</a> <a data-toggle="tooltip" data-placement="top" title="Logout"
							href="${pageContext.request.contextPath }/wuliu/index"> <span
							class="glyphicon glyphicon-off" aria-hidden="true"></span> </a>
					</div>
					<!-- /menu footer buttons -->
				</div>
			</div>

			<!-- top navigation -->
			<div class="top_nav">
				<div class="nav_menu">
					<nav>
						<div class="nav toggle">
							<a id="menu_toggle"><i class="fa fa-bars"></i>
							</a>
						</div>

						<ul class="nav navbar-nav navbar-right">
							<li class=""><a href="javascript:;"
								class="user-profile dropdown-toggle" data-toggle="dropdown"
								aria-expanded="false"> <img
									src="${pageContext.request.contextPath }${user.picPath}"
									alt="">${devUserSession.devCode } <span
									class=" fa fa-angle-down"></span> </a>
								<ul class="dropdown-menu dropdown-usermenu pull-right">
									<li><a
										href="${pageContext.request.contextPath }/wuliu/index"><i
											class="fa fa-sign-out pull-right"></i> Log Out</a>
									</li>
								</ul></li>


                        <c:if test="${noteList!=null}">
                        <li role="presentation" class="dropdown">

                            <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown"
                               aria-expanded="false">
                                <i class="fa fa-envelope-o"></i>
                                <span class="badge bg-green">2</span>
                            </a>
                            <ul id="note" class="dropdown-menu list-unstyled msg_list" role="menu">

                                <c:forEach items="${noteList}" var="note">
                                    <li><a>
                                        <span>${note.clientName}</span>
                                        <span class="time"><fmt:formatDate value="${note.sendTime}" pattern="yyyy-MM-dd HH:ss:mm"/></span>
                                        <span class="message">${note.noteText}</span>
                                    </a></li>
                                </c:forEach>


                                <%--<li>
                                    <div class="text-center">
                                        <a>
                                            <strong>See All Alerts</strong>
                                            <i class="fa fa-angle-right"></i>
                                        </a>
                                    </div>
                                </li>--%>
                            </ul>
                        </li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>
        <!-- /top navigation -->
        <div class="right_col" role="main">
            <div class="">
