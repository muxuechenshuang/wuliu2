<%@ page language="java" contentType="text/html; charset=UTF-8"
                                                                                                   pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<div class="clearfix"></div>
<div class="row">
    <div class="col-md-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>
                    订单查询
                </small>
                </h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">

                <form method="post" action="${pageContext.request.contextPath}/order/someorder?courierNum=${user.id}">
                   <input type="hidden" name="pageIndex" value="1" />


                    <ul>
                        <li>
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">订单号</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="orderNumber" type="text"
                                           class="form-control col-md-7 col-xs-12"
                                           value="${queryNumber}">
                                </div>
                            </div>
                        </li>



                        <li>
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">寄件人姓名</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="sName" type="text"
                                           class="form-control col-md-7 col-xs-12"
                                           value="${querysName}">
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">寄件人电话</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input name="sTel" type="text"
                                           class="form-control col-md-7 col-xs-12"
                                           value="${querysTel}">
                                </div>
                            </div>
                        </li>



                        <li><button type="submit" class="btn btn-primary">查
                            &nbsp;&nbsp;&nbsp;&nbsp;询</button></li>
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
                            <table id="datatable-responsive"
                                   class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline collapsed"
                                   cellspacing="0" width="100%" role="grid"
                                   aria-describedby="datatable-responsive_info"
                                   style="width: 100%;">
                                <thead>
                                <tr role="row">
                                    <th class="sorting_asc" tabindex="0"
                                        aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                        style="width: 124px;"
                                        aria-label="First name: activate to sort column descending"
                                        aria-sort="ascending">订单号</th>

                                    <th class="sorting" tabindex="0"
                                        aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                        style="width: 100px;"
                                        aria-label="Last name: activate to sort column ascending">
                                        寄件人姓名</th>
                                    <th class="sorting" tabindex="0"
                                        aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                        style="width: 80px;"
                                        aria-label="Last name: activate to sort column ascending">
                                        寄件人电话</th>
                                    <th class="sorting" tabindex="0"
                                        aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                        style="width: 100px;"
                                        aria-label="Last name: activate to sort column ascending">
                                        寄件人地址 </th>

                                    <th class="sorting" tabindex="0"
                                        aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                        style="width: 100px;"
                                        aria-label="Last name: activate to sort column ascending">
                                        收件人姓名</th>
                                    <th class="sorting" tabindex="0"
                                        aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                        style="width: 80px;"
                                        aria-label="Last name: activate to sort column ascending">
                                        收件人电话</th>
                                    <th class="sorting" tabindex="0"
                                        aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                        style="width: 100px;"
                                        aria-label="Last name: activate to sort column ascending">
                                        收件人地址</th>
                                    <th class="sorting" tabindex="0"
                                        aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                        style="width: 50px;"
                                        aria-label="Last name: activate to sort column ascending">
                                        物品</th>
                                    <th class="sorting" tabindex="0"
                                        aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                        style="width: 70px;"
                                        aria-label="Last name: activate to sort column ascending">
                                        预估体积</th>
                                    <th class="sorting" tabindex="0"
                                        aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                        style="width: 70px;"
                                        aria-label="Last name: activate to sort column ascending">
                                        预估重量</th>
                                    <th class="sorting" tabindex="0"
                                        aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                        style="width: 100px;"
                                        aria-label="Last name: activate to sort column ascending">
                                        收件员编号</th>

                                    <th class="sorting_asc" tabindex="0"
                                        aria-controls="datatable-responsive" rowspan="1" colspan="1"
                                        aria-label="First name: activate to sort column descending"
                                        aria-sort="ascending">操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="orderL" items="${order}" varStatus="status">
                                    <tr role="row" class="odd">
                                        <td tabindex="0" class="sorting_1">${orderL.orderNumber}</td>
                                        <td>${orderL.sName }</td>
                                        <td>${orderL.sTel}</td>
                                        <td>${orderL.sAddress }</td>

                                        <td>${orderL.gName }</td>
                                        <td>${orderL.gTel}</td>
                                        <td>${orderL.gAddress }</td>
                                        <td>${orderL.product }</td>


                                        <td>${orderL.preVolume }</td>
                                        <td>${orderL.preWeight}</td>
                                        <td>${orderL.courierNumber}</td>

                                        <td>


                                            <div class="btn-group">
                                                <button type="button" class="btn btn-danger">点击操作</button>
                                                <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                                    <span class="caret"></span>
                                                    <span class="sr-only">Toggle Dropdown</span>
                                                </button>
                                                <ul class="dropdown-menu" role="menu">
                                                    <li><a href="${pageContext.request.contextPath}/order/toorderdesc?id=${orderL.id}&parentid=${user.parentid}&usertype=${user.type}" class="addVersion"  data-toggle="tooltip" data-placement="top" title="" data-original-title="查看订单">查看订单</a>
                                                    <li><a href="${pageContext.request.contextPath}/order/toaddgongdan?id=${orderL.id}" class="addVersion"  data-toggle="tooltip" data-placement="top" title="" data-original-title="生成工单">生成工单</a>
                                                    <li><a href="${pageContext.request.contextPath}/order/toweituo?id=${orderL.id}" class="addVersion"  data-toggle="tooltip" data-placement="top" title="" data-original-title="委托">委托</a>
                                                    </li>

                                                </ul>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-5">
                            <div class="dataTables_info" id="datatable-responsive_info"
                                 role="status" aria-live="polite">共${pageIndex.total}条记录
                                ${pageIndex.pageNum}/${pageIndex.pages }页</div>
                        </div>
                        <div class="col-sm-7">
                            <div class="dataTables_paginate paging_simple_numbers"
                                 id="datatable-responsive_paginate">
                                <ul class="pagination">
                                    <c:if test="${pageIndex.pageNum > 1}">
                                        <li class="paginate_button previous"><a
                                                href="javascript:page_nav(document.forms[0],1);"
                                                aria-controls="datatable-responsive" data-dt-idx="0"
                                                tabindex="0">首页</a></li>
                                        <li class="paginate_button "><a
                                                href="javascript:page_nav(document.forms[0],${pageIndex.pageNum-1});"
                                                aria-controls="datatable-responsive" data-dt-idx="1"
                                                tabindex="0">上一页</a></li>
                                    </c:if>
                                    <c:if test="${pageIndex.pageNum < pageIndex.pages }">
                                        <li class="paginate_button "><a
                                                href="javascript:page_nav(document.forms[0],${pageIndex.pageNum+1});"
                                                aria-controls="datatable-responsive" data-dt-idx="1"
                                                tabindex="0">下一页</a></li>
                                        <li class="paginate_button next"><a
                                                href="javascript:page_nav(document.forms[0],${pageIndex.pages });"
                                                aria-controls="datatable-responsive" data-dt-idx="7"
                                                tabindex="0">最后一页</a></li>
                                    </c:if>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
</div>

<script type="text/javascript" src="../statics/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="../statics/js/echarts.js"></script>
<!-- 显示Echarts图表 -->
<div style="height:510px;min-height:100px;margin:0 auto;" id="main"></div>



<script type="text/javascript">

    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    // 指定图表的配置项和数据
    var option = {
        title: {	//图表标题
            text: 'test数据图表'
        },
        tooltip: {
            trigger: 'axis', //坐标轴触发提示框，多用于柱状、折线图中
            /*
             控制提示框内容输出格式
            formatter: '{b0}<br/><font color=#FF3333>&nbsp;●&nbsp;</font>{a0} : {c0} ℃ ' +
                           '<br/><font color=#53FF53>●&nbsp;</font>{a1} : {c1} % ' +
                           '<br/><font color=#68CFE8>&nbsp;●&nbsp;</font>{a3} : {c3} mm ' +
                           '<br/><font color=#FFDC35>&nbsp;●&nbsp;</font>{a4} : {c4} m/s ' +
                           '<br/><font color=#B15BFF>&nbsp;&nbsp;&nbsp;&nbsp;●&nbsp;</font>{a2} : {c2} hPa '
            */
        },
        dataZoom: [
            {
                type: 'slider',	//支持鼠标滚轮缩放
                start: 0,			//默认数据初始缩放范围为10%到90%
                end: 100
            },
            {
                type: 'inside',	//支持单独的滑动条缩放
                start: 0,			//默认数据初始缩放范围为10%到90%
                end: 100
            }
        ],
        legend: {	//图表上方的类别显示
            show:true,
            data:['件数','湿度（%）','雨量（mm）','风速（m/s）','压强（hPa）']
        },
        color:[
            '#FF3333',	//温度曲线颜色
            '#53FF53',	//湿度曲线颜色
            '#B15BFF',	//压强图颜色
            '#68CFE8',	//雨量图颜色
            '#FFDC35'	//风速曲线颜色
        ],
        toolbox: {
            feature: {
                dataView: {show: true, readOnly: false},
                magicType: {show: true, type: ['line', 'bar']},
                restore: {show: true},
                saveAsImage: {show: true}
            }
        },
        xAxis:  {	//X轴
            type : 'category',
            data : [1,2,3,4,5,6,7]	//先设置数据值为空，后面用Ajax获取动态数据填入
        },
        yAxis : [	//Y轴（这里我设置了两个Y轴，左右各一个）
            {
                //第一个（左边）Y轴，yAxisIndex为0
                type : 'value',
                name : '订单数量',
                /* max: 10,*/
                min: 0,
                splitNumber:2,
                axisLabel : {
                    formatter: '{value} 件'	//控制输出格式
                }
            }


        ],
        series : [	//系列（内容）列表
            {
                name:'件数',
                type:'line',	//折线图表示（生成温度曲线）
                symbol:'emptycircle',	//设置折线图中表示每个坐标点的符号；emptycircle：空心圆；emptyrect：空心矩形；circle：实心圆；emptydiamond：菱形
                data:[]		//数据值通过Ajax动态获取
            },
        ]
    };

    myChart.showLoading();	//数据加载完之前先显示一段简单的loading动画

    var tems=[];		//存放订单数量


    $.ajax({	//使用JQuery内置的Ajax方法
        type : "post",		//post请求方式
        async : true,		//异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
        url : "aweekorder.json",	//请求发送到ShowInfoIndexServlet处
        data : {},		//请求内包含一个key为name，value为A0001的参数；服务器接收到客户端请求时通过request.getParameter方法获取该参数值
        dataType : "json",		//返回数据形式为json
        success : function(result) {
            //请求成功时执行该函数内容，result即为服务器返回的json对象

            for (var i = 0; i < result.length; i++) {
                tems.push(result[i]);		//挨个取出温度、湿度、压强等值并填入前面声明的温度、湿度、压强等数组

            }


            myChart.hideLoading();	//隐藏加载动画

            myChart.setOption({		//载入数据
                xAxis: {
                    /*  data: dates	//填入X轴数据*/
                },
                series: [	//填入系列（内容）数据
                    {
                        // 根据名字对应到相应的系列
                        name: '件数',
                        data: tems
                    },
                ]
            });
        },




        error : function(errorMsg) {
            //请求失败时执行该函数
            alert("图表请求数据失败，可能是服务器开小差了");
            myChart.hideLoading();
        }
    })

    myChart.setOption(option);	//载入图表

</script>















<%@include file="../common/footer.jsp"%>
<script src="${pageContext.request.contextPath }/statics/localjs/rollpage.js"></script>
