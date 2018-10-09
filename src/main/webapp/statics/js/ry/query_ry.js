$(".showOrder").on("click",function () {
   var obj = $(this);
   $.ajax({
       type:"GET",
       url:"getOrderInfo.json",
       data:{id:obj.attr("orderId")},
       dataType:"json",
       success:function (data) {
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
           if(data.orderInfo.finishTime != null){
               $("#finishTime").val(data.orderInfo.finishTime);
               $("#finishTime").show();
           }
           //判断是否有废除订单理由
           if(data.orderInfo.reasonForCancle != null){
               $("#reasonForCancle").val(data.orderInfo.reasonForCancle);
               $("#reasonForCancle").show();
           }
           //判断是否有运费
           if(data.orderInfo.expenses != null){
               $("#expenses").val(data.orderInfo.expenses);
               $("#expenses").show();
           }
           //货物所在位置示意图
           if(data.orderInfo.productLocation != null){
               if(data.orderInfo.sCityName != null
               && data.orderInfo.sBranchName != null
               && data.orderInfo.gBranchName != null
               && data.orderInfo.gCityName != null){
                   $("#sCityName").html("data.orderInfo.sCityName");
                   $("#sBranchName").html("data.orderInfo.sBranchName");
                   $("#gBranchName").html("data.orderInfo.gBranchName");
                   $("#gCityName").html("data.orderInfo.gCityName");
               }
               var liArr = $("#productLocation li");
               //重置
               for(var i =1; i < 6; i++){
                   liArr.removeClass("done");
                   liArr.addClass("disabled")
               }
               //循环添加样式
               for(var i = 1; i < data.orderInfo.productLocation; i++){
                   liArr[i].removeClass("disabled");
                   liArr[i].addClass("done");
               }
           }
       }
   })
});

$(".offOrder").on("click",function () {
   var obj = $(this);
   if(obj.attr("orderStatus") != 1){
       alert("很抱歉，只有预约状态的订单才能取消预约！");
       return false;
   }else{
       $.ajax({
           type:"GET",
           url:"offOrder.json",
           data:{id:obj.attr("orderId")},
           dataType:"json",
           success:function (data) {
               if(data.result == "success"){
                    $("#status" + obj.attr("orderId")).html("已取消");
                   $("#status" + obj.attr("orderId")).css({
                       'background':'orange',
                       'color':'#fff',
                       'padding':'3px',
                       'border-radius':'3px'
                   });
               }else if(data.result == "false"){
                   alert("很抱歉，取消预约失败，请重试或联系管理员");
               }
           }
       })
   }
});