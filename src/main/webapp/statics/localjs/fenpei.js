$(function () {//查询订单的分配js
   $(".pp").on("click",function () {
      var ku= $(this);
      if(confirm("是否分配此订单？")){
          $.ajax({
              type:"post",
              url:"fendin",
              data:{"uid":ku.parents("tr").find("#kuai2").val(),
                  "orderid":ku.parents("tr").find(".hao").text()},
              dataType:"json",
              success:function (data) {
                  alert("分配成功！");
                  ku.parents("tr").find(".pei2").html(data.username);
                  ku.parents("tr").find(".pei2").css("color","red");
              }
          });
      }

   });
});