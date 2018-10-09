// 前端文件显示，不需要上传到服务器
$('#picpath').on('change',function(){
        var filePath = $(this).val();         //获取到input的value，里面是文件的路径
        // alert(filePath);
        var fileFormat = filePath.substring(filePath.lastIndexOf(".")).toLowerCase();
        var src = window.URL.createObjectURL(this.files[0]);
        // alert(src);
    // alert($(this).getSize());
    // 检查是否是图片
    if( !fileFormat.match(/.png|.jpg|.jpeg|.bmp|.gif/) ) {
        alert('上传错误,文件格式必须为：png/jpg/jpeg/bmp/gif');
        $("#send").attr("disabled",true);
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
    $('#showpic').attr('src',src);
});