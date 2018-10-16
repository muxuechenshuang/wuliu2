// 前端文件显示，不需要上传到服务器
    $("#picPath1").on("change", function () {
        var filePath = $(this).val();
        var src = window.URL.createObjectURL(this.files[0]);
        $("#backImg").attr('src', src);
    });
//更换头像
    function genhuan() {
        $("#touxinag").css("display","block");
        $("#biaodan").css("display","none");
    }
   //返回跟新信息
function fanhui() {
    $("#biaodan").css("display","block");
    $("#touxinag").css("display","none");
}
//LOGO图片---------------------
    var logoPicPath = $("#logoPicPath").val();
    var id = $("#userid").val();
    if (logoPicPath == null || logoPicPath == "") {
        $("#uploadfile").show();
    } else {
        $("#logoFile").append("<p><img src=\"../../" + logoPicPath + "?m=" + Math.random() + "\" width=\"100px;\"/> &nbsp;&nbsp;" +
            "<a href=\"javascript:;\" onclick=\"delfile1('" + id + "');\">删除</a></p>");
    }

//删除图片
    function delfile1(id) {
        $.ajax({
            type: "GET",//请求类型
            url: "delfile",//请求的url
            data: {id: id, flag: 'logc'},//请求参数
            dataType: "json",//ajax接口（请求url）返回的数据类型
            success: function (data) {//data：返回数据（json对象）
                if (data.result == "success") {
                    alert("删除成功！");
                    $("#uploadfile").show();
                    $("#logoFile").html('');
                } else if (data.result == "failed") {
                    alert("删除失败！");
                }
            },
            error: function (data) {//当访问时候，404，500 等非200的错误状态码
                alert("请求错误！");
            }
        });
}
function login() {
//获取相关字段的值

    var password =$("#password").val();
    var email = $("#email").val();
    var phone = $("#phone").val();

//验证密码
    if (password == null || password == "") {
        $("#password").next().html("密码不能为空");

    } else {
        $("#password").next().html("");

    }
    $.ajax({
        url: "/wu/login",
        type: "POST",
        data: {
            email: email,
            phone: phone
        },
        dataType:"json",
        success: function (data) {
            //邮箱验证
            if(data.email == "emailVerification"){
                $("#email").next().next().html(" 邮箱重复，请重新输入 ");
            }else if (email != null && email != "" && !checkMail(email)) {
                $("#email").next().html("邮箱格式不正确，请重新输入");
            } else {
                $("#email").next().html("");

            }
            //手机验证
            if(data.phone == "phoneVerification"){
                $("#phone").next().html("手机号重复，请重新输入 ");
                document.getElementById("zy").disabled=true;
            }else if (phone != null && phone != "" && !checkMobile(phone)) {
                $("#phone").next().html("手机格式不正确，请重新输入");
                document.getElementById("zy").disabled=true;
            } else {
                $("#phone").next().html("");
                document.getElementById("zy").disabled=false;
            }
        }
    })

}
//邮箱格式
function checkMail(mail) {
    var filter  = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (filter.test(mail))
        return true;
    else {
        return false;}
}
//手机号格式
function checkMobile(phone) {
    var filter  = /^[1][358][0-9]{9}$/;
    if (filter.test(phone))
        return true;
    else {
        return false;
    }
}
