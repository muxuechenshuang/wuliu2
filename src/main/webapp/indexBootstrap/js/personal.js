// 前端文件显示，不需要上传到服务器
$(function () {
    $("#picPath").on("change", function() {
        var filePath = $(this).val();
        var src = window.URL.createObjectURL(this.files[0]);
        $("#backImg").attr('src', src);
    });
})

