// 前端文件显示，不需要上传到服务器
$(function () {
    $("#picPath").on("change", function() {
        var filePath = $(this).val();
        var src = window.URL.createObjectURL(this.files[0]);
        $("#backImg").attr('src', src);
    });

//LOGO图片---------------------
    var logoPicPath = $("#logoPicPath").val();
    var id = $("#userid").val();
    if(logoPicPath == null || logoPicPath == "" ){
        $("#uploadfile").show();
    }else{
        $("#logoFile").append("<p><img src=\"../../"+logoPicPath+"?m="+Math.random()+"\" width=\"100px;\"/> &nbsp;&nbsp;"+
            "<a href=\"javascript:;\" onclick=\"delfile1('"+id+"');\">删除</a></p>");

    }
}
//删除图片
    function delfile1(id){
        $.ajax({
            type:"GET",//请求类型
            url:"delfile.json",//请求的url
            data:{id:id,flag:'logc'},//请求参数
            dataType:"json",//ajax接口（请求url）返回的数据类型
            success:function(data){//data：返回数据（json对象）
                if(data.result == "success"){
                    alert("删除成功！");
                    $("#uploadfile").show();
                    $("#logoFile").html('');
                }else if(data.result == "failed"){
                    alert("删除失败！");
                }
            },
            error:function(data){//当访问时候，404，500 等非200的错误状态码
                alert("请求错误！");
            }
        });



})

