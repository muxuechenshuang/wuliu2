$(".viewWd").on("click", function () {
    var obj = $(this);
    window.location.href = "view/" + obj.attr("wdid");
});

//删除网点
$(".deleteWd").on("click", function () {
    var obj = $(this);
    if (confirm("你确定要删除网点【" + obj.attr("wdname")
        + "】吗？")) {
        $.ajax({
            type: "GET",
            url: "delwd.json",
            data: {
                id: obj.attr("wdid")
            },
            dataType: "json",
            success: function (data) {
                if (data.result == "sucess") {
                    alert("删除成功！");
                    obj.parents("ul").remove();
                } else if (data.result == "hasuser") {
                    alert("该网点存在快递员，不能删除！")
                } else if (data.result == "hasorder") {
                    alert("该网点存在订单，不能删除！")
                } else if (data.result == "null") {
                    alert("删除失败，请求参数不能为空！")
                }
            },
            error: function (data) {
                alert("对不起，删除失败！");
            }

        })
    }
});

