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
                    g.parents("tr").find(".pei3").html(data.username);
                    g.parents("tr").find(".pei3").css("color","red");
                }
            });
        }

    });



    //全选框
    $("#selectAll").click(function() {
        $(".choose").prop("checked", true);
    });

    //取消全选
    $("#selectAll2").click(function() {
        $(".choose").prop("checked", false);
    });


    //循环获取选中了的框的工单id放入数组中
    $("#selectAll3").click(function() {
        var selectva=new Array();
        var id= $(this).parents("#gong").find("#qiang").val();

        $("input[type='checkbox']:checked").each(function () {
            selectva.push($(this).next().val());
        });


        alert(id);
        alert(selectva);
        $.ajax({
            url:"quan",                        //id快递员id
            data:{"id":id,"selectva":selectva},//selectva工单id数组
            dataType: "json",
            success:function (data) {
                alert("批量操作成功！");
                for (let i = 0; i <selectva.length ; i++) {
                    g.parents("tr").find(".pei3").html(data.username);
                    g.parents("tr").find(".pei3").css("color","red");
                }
            }
        });
    });


});