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


$(function(){
    $("#user").bind("blur",function(){
    $.ajax({
        "url":"register",
        "type":"POST",
        "data":{user:"user"},
        "dataType":"json",
        "success":function(data){
            if(data.user == "empty"){
                $("#user").next().html("用户名、手机号或邮箱错误");
            }else {
                $("#user").next().html("");
            }
        }
    });
    })
});