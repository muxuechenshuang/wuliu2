<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>APP开发者平台ffffxxxx</title>


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
							<img
								src="${pageContext.request.contextPath }/statics/images/img.jpg"
								alt="..." class="img-circle profile_img">
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
							<h3>${devUserSession.devName }</h3>
							<ul class="nav side-menu">
								<!--蒋梓伦  -->
								<li>
								<li><a><i class="fa fa-edit"></i> 客户(任一)<span
										class="fa fa-chevron-down"></span>
								</a>
									<ul class="nav child_menu">
										<li><a href="${pageContext.request.contextPath}/lixing/query_ry.jsp">查件</a>
										</li>
										<li><a href="${pageContext.request.contextPath}/lixing/branchquery_ry.jsp">服务网点查询</a>
										</li>
										<li><a href="${pageContext.request.contextPath}/lixing/moneyestimate_ry.jsp">运费时效查询</a>
										</li>
										<li><a href="${pageContext.request.contextPath}/lixing/send_ry.jsp">寄件服务</a>
										</li>
									</ul></li>
								
								
								
								<!--肖林辉  -->
								<li><a><i class="fa fa-home"></i>快递员角22222  肖林辉<span
										class="fa fa-chevron-down"></span>
								</a>
									<ul class="nav child_menu">
										<li><a href="${pageContext.request.contextPath}/xlh/dindan_xlh.jsp">订单查询</a>
										</li>
										<li><a href="${pageContext.request.contextPath}/xlh/gondan_xlh.jsp">查询工单</a>
										</li>
										<li><a href="${pageContext.request.contextPath}/xlh/xianqian_xlh.jsp">工单详情</a>
										</li>
										<li><a href="${pageContext.request.contextPath}/xlh/addinfo_xlh.jsp">生成工单</a>
										</li>
									</ul></li>
								
								<!--李普强  -->
								<li><a><i class="fa fa-home"></i> 网点(李普强) <span
										class="fa fa-chevron-down"></span>
								</a>
									<ul class="nav child_menu">
										<li><a href="${pageContext.request.contextPath}/lpq/yuangong2.jsp">员工管理</a>
										</li>

										<li><a href="${pageContext.request.contextPath}/lpq/chaxun_lpq.jsp">查看用户订单</a>
										</li>
									<!-- 	<li><a href="shenghe_lpq.jsp">审核订单</a>
										</li> -->
										<li><a href="${pageContext.request.contextPath}/lpq/gongdan_lpq.jsp">确认工单</a>
										</li>
										<li><a href="${pageContext.request.contextPath}/lpq/fenpei2.jsp">分配工单</a>
										</li>
									</ul></li>
									
								<!-- 任一 -->	
								<li><a><i class="fa fa-home"></i>分公司管理<span
										class="fa fa-chevron-down"></span>
								</a>
									<ul class="nav child_menu">
										<li><a href="${pageContext.request.contextPath}/wangdianchaxun_zz.jsp">网点管理</a></li>
										<li><a href="${pageContext.request.contextPath}/kuaidiyuan_ry.jsp">快递员管理</a></li>
										<li><a href="addkuaidiyuan_ry.jsp">新增快递员</a>
										</li>
										<li><a href="gongdan_ry.jsp">工单查询</a>
										</li>
										<!-- <li><a href="fenpei_ry.jsp">工单分配</a> -->
										</li>
										<!--李佳和  -->
										
										<li><a href="${pageContext.request.contextPath}/addwangdian_ljh.jsp">添加网点</a></li>
										<li><a href="${pageContext.request.contextPath}/chuku_ljh.jsp">出库</a></li>
										<li><a href="${pageContext.request.contextPath}/ruku_ljh.jsp">入库</a></li>
									</ul>
									
								</li>
								
								
								<!--张展  -->
								<li><a><i class="fa fa-home"></i>总公司管理<span
										class="fa fa-chevron-down"></span>
								</a>

									<ul class="nav child_menu">
<%-- 										<li><a href="${pageContext.request.contextPath}/gondan_zz.jsp">查询工单</a> --%>
<!-- 										</li> -->
										<%-- <li><a href="${pageContext.request.contextPath}/xiangqing_zz.jsp">工单详情</a> --%>
										</li>
<%-- 										<li><a href="${pageContext.request.contextPath}/addinfo_zz.jsp">订单信息补全</a> --%>
<!-- 										</li> -->
										<li><a href="${pageContext.request.contextPath}/gondan2_zz.jsp">查询工单（总部）</a>
										</li>
										<li><a href="${pageContext.request.contextPath}/fanhuodanlist_zz.jsp">返货单查询</a>
										</li>
										<li><a href="${pageContext.request.contextPath}/fanhuodanxiangqing_zz.jsp">审核返货单</a>
										</li>
										<li><a href="${pageContext.request.contextPath}/fengongsitianjia_zz.jsp">新增分公司</a></li>
										<li><a href="${pageContext.request.contextPath}/fengongsichaxun_zz.jsp">分公司管理</a></li>
										<li><a href="${pageContext.request.contextPath}/wangdianchaxun_zz.jsp">网点管理</a></li>
										<li><a href="${pageContext.request.contextPath}/kuaidiyuan_ry.jsp">快递员管理</a></li>
							</ul></li>
						</div>


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
							href="${pageContext.request.contextPath }/dev/logout"> <span
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
									src="${pageContext.request.contextPath }/statics/images/img.jpg"
									alt="">${devUserSession.devCode } <span
									class=" fa fa-angle-down"></span> </a>
								<ul class="dropdown-menu dropdown-usermenu pull-right">
									<li><a
										href="${pageContext.request.contextPath }/dev/logout"><i
											class="fa fa-sign-out pull-right"></i> Log Out</a>
									</li>
								</ul></li>

							<li role="presentation" class="dropdown">

								<a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
									<i class="fa fa-envelope-o"></i>
									<span class="badge bg-green">2</span>
								</a>
								<ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
									<li>
										<a>
											<!-- <span class="image"><img src="" alt="Profile Image"></span> -->
											<span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
											<span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
										</a>
									</li>

									<li>
										<a>
											<!-- <span class="image"><img src="" alt="Profile Image"></span> -->
											<span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
											<span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
										</a>
									</li>
									<li>
										<div class="text-center">
											<a>
												<strong>See All Alerts</strong>
												<i class="fa fa-angle-right"></i>
											</a>
										</div>
									</li>
								</ul>
							</li>
						</ul>
					</nav>
				</div>
			</div>
			<!-- /top navigation -->
			<div class="right_col" role="main">
				<div class="">
