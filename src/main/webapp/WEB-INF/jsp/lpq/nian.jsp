&nbsp;<%@ page language="java" contentType="text/html; charset=UTF-8"
               pageEncoding="UTF-8" isELIgnored="false"%>
<%@include file="../common/header.jsp"%>
<h3><a href="${pageContext.request.contextPath}/wuliu/biao">月度表</a>&nbsp;&nbsp;&nbsp;
       <a href="${pageContext.request.contextPath}/wuliu/biao2">季度表</a>&nbsp;&nbsp;
       <a href="javascript:;">年度表</a></h3>
<!-- 显示Echarts图表 -->
<div style="height:510px;min-height:100px;margin:0 auto;" id="main"></div>

<%@include file="../common/footer.jsp"%>

<script type="text/javascript" src="../statics/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="../statics/js/echarts.js"></script>
<script type="text/javascript">

    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    // 指定图表的配置项和数据
    var option = {
        title: {	//图表标题
            text: '订单数据图表'
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
            data : [2010,2012,2013,2014,2015,2016,2017,2018,2019,2010,2011,2012]	//先设置数据值为空，后面用Ajax获取动态数据填入
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
                    formatter: '{value} 万件'	//控制输出格式
                }
            }


        ],
        series : [	//系列（内容）列表
            {
                name:'件数',
                type:'line',	//折线图表示（生成温度曲线）
                symbol:'emptycircle',	//设置折线图中表示每个坐标点的符号；emptycircle：空心圆；emptyrect：空心矩形；circle：实心圆；emptydiamond：菱形
                data:[300,435,644,300,435,644,300,435,644,300,435,644]		//数据值通过Ajax动态获取
            },
        ]
    };





    myChart.showLoading();	//数据加载完之前先显示一段简单的loading动画

    var tems=[];		//存放订单数量


    $.ajax({	//使用JQuery内置的Ajax方法
        type : "post",		//post请求方式
        async : true,		//异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
        url : "nian",	//请求发送到ShowInfoIndexServlet处
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
