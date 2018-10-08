/**
 * 
 */
function show(){
      $("#meibu").css("display","block");
    }

function deng(){
    $("#denglu").css("display","block");
    $("#zhuche").css("display","none");
  }

function zhu(){
    $("#zhuche").css("display","block");
    $("#denglu").css("display","none");
  }

function sc(){
    $("#meibu").css("display","none");
  }

//注册用的判断
function login() {
//获取相关字段的值

    var username = $("input[name='username']").val();
    var password =$("#password1").val();
    var password1 = $("input[name='password1']").val();
    var email = $("input[name='email']").val();
    var phone = $("input[name='phone']").val();

//验证密码
    if (password == null || password == "") {
        $("#password1").next().next().html("密码不能为空");

    } else {
        $("#password1").next().next().html("");

    }
    if (password != password1) {
        $("#password2").next().next().html("两次输入的密码不一致.");

    } else {
        $("#password2").next().next().html("");

    }

    $.ajax({
        url: "/wuliu/login",
        type: "POST",
        data: {
            username: username,
            email: email,
            phone: phone
        },
        dataType:"json",
        success: function (data) {
            //用户名验证
            if(data.username == "nameVerification"){

                $("#userName").next().next().html("用户名重复，请重新输入");
            }else if (username.length < 2 || username.length > 10) {

                $("#userName").next().next().html("登录名不能小于两个字符或者大于十个字符.");
            }else {
                $("#userName").next().next().html("");
            }
            //邮箱验证
            if(data.email == "emailVerification"){
                $("#email").next().next().html(" 邮箱重复，请重新输入 ");
            }else if (email != null && email != "" && !checkMail(email)) {
                $("#email").next().next().html("邮箱格式不正确，请重新输入");
            } else {
                $("#email").next().next().html("");

            }
            //手机验证
            if(data.phone == "phoneVerification"){
                $("#phone").next().next().html("手机号重复，请重新输入 ");
                document.getElementById("zy").disabled=true;
            }else if (phone != null && phone != "" && !checkMobile(phone)) {
                $("#phone").next().next().html("手机格式不正确，请重新输入");
                document.getElementById("zy").disabled=true;
            } else {
                $("#phone").next().next().html("");
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
//发送短信

var clock = '';
var nums = 120;
var btn;
function sendCode(thisBtn) {

    $.ajax({
        url: "/wuliu/Verification",
        type: "POST",
        dataType:"json",
        data: {
            phone:$("#phone").val()
        },
        success: function (data) {
                $("#judge").val(data)
            }
        })

    //倒计时
    btn = thisBtn;
    btn.disabled = true; //将按钮置为不可点击
    btn.value = nums+'秒后重试';
    clock = setInterval(doLoop, 1000); //一秒执行一次
}
function doLoop()
{
    nums--;
    if(nums > 0){
        btn.value = nums+'秒后可重新获取';
    }else{
        clearInterval(clock); //清除js定时器
        btn.disabled = false;
        btn.value = '点击发送验证码';
        nums = 120; //重置时间
    }
    }
//判断验证码是否相同
function Mobile() {
    var a=$("#judge").val();
    var b=$("#yzm").val();
    if(a!=b){
        $("#zy").next().next().html("验证码错误");
        document.getElementById("submit").disabled=true;
        return false;
    } else {
        $("#zy").next().next().html("");
        document.getElementById("submit").disabled=false;
        return true;
    }


}




