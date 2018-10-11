$(function () {//分配工单js
    $(".gg").on("click",function () {
        var g= $(this);
        if(confirm("是否分配该工单？")){
            $.ajax({
                type:"post",
                url:"fen",
                data:{"id":g.parents("tr").find("#kuai2").val(),
                    "gid":g.parents(".go").find(".gid").val()},
                dataType:"json",
                success:function (data) {
                    alert("分配成功！");
                    g.parents("tr").find(".pei2").html(data.username);
                }
            });
        }

    });
});