$(function() {

        $.ajax({	//使用JQuery内置的Ajax方法
            type: "post",		//post请求方式
            async: true,		//异步请求（同步请求将会锁住浏览器，用户其他操作必须等待请求完成才可以执行）
            url: "shuju3.json",	//请求发送到ShowInfoIndexServlet处
            data: {},		//请求内包含一个key为name，value为A0001的参数；服务器接收到客户端请求时通过request.getParameter方法获取该参数值
            dataType: "json",		//返回数据形式为json
            success: function (result) {
                alert(result);
                //请求成功时执行该函数内容，result即为服务器返回的json对象
                for (var i = 0; i < result.length; i++) {
                    dataAxis.push(result[i]);
                }
                myChart.setOption({		//载入数据
                    xAxis: {
                        /*  data: dates	//填入X轴数据*/
                    },
                    series: [	//填入系列（内容）数据
                        {
                            // 根据名字对应到相应的系列
                            name: '天数',
                            data: dataAxis
                        },
                    ]
                });
            },
            error : function(result) {
                //请求失败时执行该函数
                alert("图表请求数据失败，可能是服务器开小差了");
            }
        });
})