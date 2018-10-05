//后退到list列表页
$("#back").on("click", function () {
    window.location.href = "/filiale/wdquery";
});


$("#wdName").bind("blur", function () {
    //只能输入中文
    var filter = new RegExp("^[\u4e00-\u9fa5]+$");
    if ($(this).val() == "null" || $(this).val() == "") {// 参数wdName为空，错误提示
        document.getElementById("send").disabled = "true";//阻止submit按钮
        $("#checkwdname").html("网点名称不能为空！");
        $("#checkwdname").css("color", "red");
        $("input[name=name]").focus();
    }
    else if (filter.test($("#wdName").val())) {
        $.ajax({
            type: "GET",
            url: "nameisexist.json",
            data: {
                wdName: $("#wdName").val()
            },
            dataType: "json",
            success: function (data) {
                if (data.wdName == "exist") {// 网点名称不可用，错误提示
                    document.getElementById("send").disabled = "true";//阻止submit按钮
                    $("#checkwdname").html("网点名称已存在，请重填！");
                    $("#checkwdname").css("color", "red");
                    $("input[name=name]").focus().val("");
                } else if (data.wdName == "noexist") {// 网点名称可用，正确提示
                    document.getElementById("send").removeAttribute("disabled");//开启submit
                    $("#checkwdname").html("网点名称可以使用");
                    $("#checkwdname").css("color", "#0062cc");
                }
            }, error: function (data) {// 当访问时候，404，500 等非200的错误状态码
                document.getElementById("send").disabled = "true";//阻止submit按钮
                $("#checkwdname").html("请求错误！");
                $("#checkwdname").css("color", "red");
            }
        });
    } else {
        document.getElementById("send").disabled = "true";//阻止submit按钮
        $("#checkwdname").html("请输入正确的名称！");
        $("#checkwdname").css("color", "red");
    }

});


function checkPhone(phone) {
    //支持手机号码和固定电话
    if (!(/^1(3|4|5|7|8)\d{9}$/.test(phone)) && !/^(\(\d{3,4}\)|\d{3,4}-|\s)?\d{7,14}$/.test(phone)) {
        return false;
    } else {
        return true;
    }
}


$("#phone").on("blur", function () {
    var phone = $(this).val();
    if (phone == null || phone == "") {
        document.getElementById("send").disabled = "true";//阻止submit按钮
        $("#checkPhone").html("电话不能为空！");
        $("#checkPhone").css("color", "red");
    } else if (checkPhone(phone) == false) {
        document.getElementById("send").disabled = "true";//阻止submit按钮
        $("#checkPhone").html("电话格式不正确，请重填！");
        $("#checkPhone").css("color", "red");
        $("input[name=phone]").focus().val("");
    } else {
        document.getElementById("send").removeAttribute("disabled");//开启submit
        $("#checkPhone").html("电话格式正确");
        $("#checkPhone").css("color", "#0062cc");
    }
});

$("#site").on("blur", function () {
    var site = $(this).val();
    var reg = new RegExp("^[0-9\u4e00-\u9fa5]+$");
    if (site == null || site == "") {
        document.getElementById("send").disabled = "true";//阻止submit按钮
        $("#checksite").html("地址不能为空！");
        $("#checksite").css("color", "red");
    } else if (!reg.test(site)) {
        document.getElementById("send").disabled = "true";//阻止submit按钮
        $("#checksite").html("请输入正确的地址！");
        $("#checksite").css("color", "red");
    } else {
        document.getElementById("send").removeAttribute("disabled");//开启submit
        $("#checksite").html("地址正确");
        $("#checksite").css("color", "#0062cc");
    }
})