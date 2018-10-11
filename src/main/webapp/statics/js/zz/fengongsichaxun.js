
$(".delect").on("click", function() {
    var obj = $(this);
    if (confirm("删除是不可恢复的，你确认要删除吗？")) {
        // if (confirm("你确定要删除APP应用【" + obj.attr("appsoftwarename") + "】及其所有的版本吗？")) {

        $.ajax({
            type : "GET",
            url : "delect.json",
            data : {
                organizationid : organizationid
            },
            dataType : "json",
            success : function(data) {
                if (data.delResult >0) { //删除成功：移除删除行
                    alert("删除成功");
                } else if (data.delResult == 0) { //删除失败
                    alert("对不起，删除失败");
                }
            },
            error : function(data) {
                alert("对不起，删除失败");
            }
        });
    }
});