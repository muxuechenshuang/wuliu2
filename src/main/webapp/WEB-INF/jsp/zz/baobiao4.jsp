<%@ page language="java" contentType="text/html; charset=UTF-8"
                                                                                                   pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<div class="clearfix"></div>
<div class="row">
    <div class="col-md-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>
                    商品查询
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
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">商品名称：</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="produckName" name="produckName" class="form-control" type="text" value="${produckName}">
                                    </input>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="form-group">
                                <label class="control-label col-md-3 col-sm-3 col-xs-12">商品规格：</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input id="models" name="models" class="form-control" type="text" value="${models}">
                                    </input>
                                </div>
                            </div>
                        </li>
                        <li><button id="send" type="button" class="btn btn-primary">查
                            &nbsp;&nbsp;&nbsp;&nbsp;询</button></li>
                    </ul>
                </form>
            </div>
        </div>
    </div>
</div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/echarts.js"></script>
<!-- 显示Echarts图表 -->
<div style="height:410px;min-height:100px;margin:0 auto;" id="main"></div>

<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    genData();
    function genData() {
        myChart.showLoading();
        var legendData = [];
        var seriesData = [];
        var selected = {};
        var produckName=$("#produckName").val();
        var models=$("#models").val();
        $.ajax({	//使用JQuery内置的Ajax方法
            type : "post",		//post请求方式
            async : true,		//异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url : "/goods/echars?produckName="+produckName+"&models="+models,	//请求发送到ShowInfoIndexServlet处
            data : {ide:"all"},		//请求内包含一个key为name，value为A0001的参数；服务器接收到客户端请求时通过request.getParameter方法获取该参数值
            dataType : "json",		//返回数据形式为json
            success : function(result) {
                //请求成功时执行该函数内容，result即为服务器返回的json对象
                if (result != null && result.length > 0) {
                    for(var i=0;i<result.length;i++){
                        legendData.push(result[i].produckName);
                        seriesData.push({name:result[i].produckName,value:result[i].produckNum});
                        selected[result[i].produckNum] = i < 6;
                    }
                    myChart.setOption({
                        title : {
                            text: '商品统计表',

                            x:'center'
                        },
                        tooltip : {
                            trigger: 'item',
                            formatter: "{a} <br/>{b} : {c} ({d}%)"
                        },
                        legend: {
                            type: 'scroll',
                            orient: 'vertical',
                            right: 10,
                            top: 20,
                            bottom: 20,
                            data: legendData,

                            selected: selected
                        },
                        series : [
                            {
                                name: '商品名',
                                type: 'pie',
                                radius : '55%',
                                center: ['40%', '50%'],
                                data: seriesData,
                                itemStyle: {
                                    emphasis: {
                                        shadowBlur: 10,
                                        shadowOffsetX: 0,
                                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                                    }
                                }
                            }
                        ]
                    });
                    myChart.hideLoading();
                }
                else {
                    //返回的数据为空时显示提示信息
                    alert("图表请求数据为空，可能服务器暂未录入近五天的观测数据，您可以稍后再试！");
                    myChart.hideLoading();
                }
            }
        });
    }
    $(function () {
        $("#send").click(function () {
            genData();
        })
    })
</script>
<%@include file="../common/footer.jsp"%>
<script src="${pageContext.request.contextPath }/statics/localjs/rollpage.js"></script>
