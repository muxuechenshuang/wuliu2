// 前端文件显示，不需要上传到服务器
$('#picpath').on('change', function () {
    var filePath = $(this).val();         //获取到input的value，里面是文件的路径
    var fileFormat = filePath.substring(filePath.lastIndexOf(".")).toLowerCase();
    var src = window.URL.createObjectURL(this.files[0]);

    // 检查是否是图片
    if (!fileFormat.match(/.png|.jpg|.jpeg|.bmp|.gif/)) {
        alert('上传错误,文件格式必须为：png/jpg/jpeg/bmp/gif');
        $("#send").attr("disabled", true);
        $('#showpic').hide();
        return;
    }
    // if($(this).getSize()>5000000){
    // 	alert('图片大小不能大于5000KB');
    // 	$("#send").attr("disabled",true);
    // 	return;
    // }
    $("#send").removeAttr("disabled");
    $('#showpic').show();
    $('#showpic').attr('src', src);


});

function add() {
//获取相关字段的值

    var username = $("#username").val();
    var email = $("#email").val();
    var phone = $("#phone").val();

    $.ajax({
        url: "/wuliu/login",
        type: "POST",
        data: {
            username: username,
            email: email,
            phone: phone
        },
        dataType: "json",
        success: function (data) {
            //用户名验证
            if (data.username == "nameVerification") {
                $("#username").next().html("用户名重复，请重新输入");
            } else if (username.length < 2 || username.length > 10) {
                $("#username").next().html("登录名不能小于两个字符或者大于十个字符.");
            } else {
                $("#username").next().html("");
            }
            //邮箱验证
            if (data.email == "emailVerification") {
                $("#email").next().html(" 邮箱重复，请重新输入 ");
            } else if (email != null && email != "" && !checkMail(email)) {
                $("#email").next().html("邮箱格式不正确，请重新输入");
            } else {
                $("#email").next().html("");

            }
            //手机验证
            if (data.phone == "phoneVerification") {
                $("#phone").next().html("手机号重复，请重新输入 ");
            } else if (phone != null && phone != "" && !checkMobile(phone)) {
                $("#phone").next().html("手机格式不正确，请重新输入");
            } else {
                $("#phone").next().html("");
            }
        }
    })

}

//邮箱格式
function checkMail(mail) {
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (filter.test(mail))
        return true;
    else {
        return false;
    }
}

//手机号格式
function checkMobile(phone) {
    var filter = /^\d{5,11}$/;
    if (filter.test(phone))
        return true;
    else {
        return false;
    }
}