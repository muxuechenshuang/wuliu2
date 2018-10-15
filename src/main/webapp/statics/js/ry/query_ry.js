$(".showOrder").on("click", function () {
    var obj = $(this);
    $.ajax({
        type: "GET",
        url: "getOrderInfo.json",
        data: {id: obj.attr("orderId")},
        dataType: "json",
        success: function (data) {
            $("#info").show();
            $("#orderNumber").val(data.orderInfo.orderNumber);
            $("#status").val(data.orderInfo.statusName);
            $("#sName").val(data.orderInfo.sName);
            $("#sAddress").val(data.orderInfo.sAddress);
            $("#sTel").val(data.orderInfo.sTel);
            $("#gName").val(data.orderInfo.gName);
            $("#gAddress").val(data.orderInfo.gAddress);
            $("#gTel").val(data.orderInfo.gTel);
            $("#typeName").val(data.orderInfo.typeName);
            $("#product").val(data.orderInfo.product);
            $("#riseTime").val(data.orderInfo.riseTime);
            //判断是否有完成时间
            if (data.orderInfo.finishTime != null) {
                $("#finishTime").val(data.orderInfo.finishTime);
                $("#finishTime").show();
            }
            //判断是否有废除订单理由
            if (data.orderInfo.reasonForCancle != null) {
                $("#reasonForCancle").val(data.orderInfo.reasonForCancle);
                $("#reasonForCancle").show();
            }
            //判断是否有运费
            if (data.orderInfo.expenses != null) {
                $("#expenses").val(data.orderInfo.expenses);
                $("#expenses").show();
            }
            //货物所在位置示意图
            if (data.orderInfo.productLocation != null) {
                if (data.orderInfo.sCityName != null
                    && data.orderInfo.sBranchName != null
                    && data.orderInfo.gBranchName != null
                    && data.orderInfo.gCityName != null) {
                    $("#sCityName").html(data.orderInfo.sCityName);
                    $("#sBranchName").html(data.orderInfo.sBranchName);
                    $("#gBranchName").html(data.orderInfo.gBranchName);
                    $("#gCityName").html(data.orderInfo.gCityName);
                }
                /*var liArr = $("#productLocation li");
                //重置
                liArr.removeClass();
                liArr.addClass("disabled");
                //循环添加样式
                for (var i = 0; i < data.orderInfo.productLocation; i++) {
                    liArr[i].removeClass("disabled");
                    liArr[i].addClass("done");
                }*/
                $("#productLocation li a").removeClass();
                $("#productLocation li a").addClass("disabled");
                for(var i =0 ; i<data.orderInfo.productLocation; i++){
                    $("#productLocation li:eq("+i+") a").removeClass();
                    $("#productLocation li:eq("+i+") a").addClass("done");
                }
            }else {
                $("#productLocation li a").removeClass();
                $("#productLocation li a:gt(0)").addClass("disabled");
                $("#productLocation li a:eq(0)").addClass("done");
                $("#sCityName").html("寄件城市");
                $("#sBranchName").html("寄件网点");
                $("#gBranchName").html("收件网点");
                $("#gCityName").html("收件城市");

            }
        }
    })
});

$(".offOrder").on("click", function () {
    var obj = $(this);
    if (obj.attr("orderStatus") != 1) {
        alert("很抱歉，只有预约状态的订单才能取消预约！");
        return false;
    } else {
        $.ajax({
            type: "GET",
            url: "offOrder.json",
            data: {id: obj.attr("orderId")},
            dataType: "json",
            success: function (data) {
                if (data.result == "success") {
                    $("#status" + obj.attr("orderId")).html("已取消");
                    $("#status" + obj.attr("orderId")).css({
                        'background': 'orange',
                        'color': '#fff',
                        'padding': '3px',
                        'border-radius': '3px'
                    });
                } else if (data.result == "false") {
                    alert("很抱歉，取消预约失败，请重试或联系管理员");
                }
            }
        })
    }
});

$(".payOrder").on("click", function () {
    var obj = $(this);
    var isPay = obj.parents("#pay").children("#isPay").val();
    var status = obj.parents("#pay").children("#orderStatus").val();
    // var isPay = obj.attr("isPay");
    if(status == 4){
        alert("您的订单已取消预约，不用支付哟！");
        return false;
    }
    if (isPay == null || isPay == "" ||status ==1) {
        alert("很抱歉，在预约的订单暂不能支付!");
        return false;
    } else if (isPay == "已付款") {
        alert("您的订单已付款，不需要再付款。");
        return false;
    }/*else{
        $.ajax({
            type:"POST",
            url: "goPay",
            data: {orderId: obj.attr("orderId")},
            dataType: "json",
            success:function (data) {
                window.location.href = data.action;
            }
        })
    }*/
});