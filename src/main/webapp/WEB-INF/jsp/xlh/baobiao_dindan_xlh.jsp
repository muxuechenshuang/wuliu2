<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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

                <form method="post" action="">
                   <input type="hidden" name="pageIndex" value="1" />


                    <ul>
                        <li>
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">报表查询</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select id="baobiaochoose" name="productType" class="form-control" style="width: 200px;">
                                        <option value="0">-----------请选择-----------</option>
                                            <option value="1">-----------7天内订单-----------</option>
                                            <option value="2">-----------30天内订单-----------</option>
                                    </select>
                                </div>
                            </div>
                        </li>

                        <li><button type="button" id="querybao"class="btn btn-primary">查
                            &nbsp;&nbsp;&nbsp;&nbsp;询</button></li>
                    </ul>
                </form>
            </div>
        </div>
    </div>

</div>
</div>
<script type="text/javascript" src="../statics/js/jquery-1.8.3.js"></script>


<script type="text/javascript" src="../statics/js/echarts.js"></script>
<!-- 显示Echarts图表 -->
<div style="height:510px;width:1200px;display:none;min-height:100px;margin:0 auto;" id="main"></div>

<script type="text/javascript">
    $("#querybao").click(function () {
        var choice=$("#baobiaochoose").val();
        if(choice == 0){$("#main").css("display","none");}
        if(choice == 1){
            $("#main").css("display","block");


// 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById('main'));

// 指定图表的配置项和数据
            var option = {
                title: {	//图表标题
                    text: '最近7天内的订单数量'
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

        }
        if(choice == 2){
            $("#main").css("display","block");


// 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById('main'));

// 指定图表的配置项和数据
            var option = {
                title: {	//图表标题
                    text: '最近7天内的订单数量'
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
            var month=[];       //存放30天

            $.ajax({	//使用JQuery内置的Ajax方法
                type : "post",		//post请求方式
                async : true,		//异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
                url : "aweekordermonth.json",	//请求发送到ShowInfoIndexServlet处
                data : {},		//请求内包含一个key为name，value为A0001的参数；服务器接收到客户端请求时通过request.getParameter方法获取该参数值
                dataType : "json",		//返回数据形式为json
                success : function(result) {
                    //请求成功时执行该函数内容，result即为服务器返回的json对象

                    for (var i = 0; i < result.length; i++) {
                        tems.push(result[i]);		//挨个取出温度、湿度、压强等值并填入前面声明的温度、湿度、压强等数组

                    }
                    for(var i=1;i <31;i++){
                        month.push(i);
                    }

                    myChart.hideLoading();	//隐藏加载动画

                    myChart.setOption({		//载入数据
                        xAxis: {
                              data: month	//填入X轴数据
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

        }
    })
</script>
















<%@include file="../common/footer.jsp"%>
<script src="${pageContext.request.contextPath }/statics/localjs/rollpage.js"></script>
