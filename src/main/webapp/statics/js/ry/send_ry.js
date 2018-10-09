$("#sCity").change(function () {
   var cityId = $("#sCity").val();
   if(cityId!=null&&cityId!=""){
        $.ajax({
            type:"GET",
            url:"queryBranchList.json",
            data:{parentId:cityId},
            dataType:"json",
            success:function (data) {
                if(data==null||data+""==0){//当没有返回数据，提醒没有网点，并重置网点下拉框
                    $("#sCityR").html("该城市网点正在紧张建设中");
                    $("#sBranch").html("");
                    var options = "<option value=\"\">--请选择网点--</option>";
                    $("#sBranch").html(options);
                    return false;
                }
                //当正常返回数据，清空城市下方提醒语句，返回网点下拉框
                $("#sCityR").html("");
                $("#sBranch").html("");
                var options = "<option value=\"\">--请选择网点--</option>";
                for(var i = 0; i < data.length; i++){
                    options += "<option value=\""+data[i].id+"\">"+data[i].name+"</option>";
                }
                $("#sBranch").html(options);
            },
            error:function (data) {
                alert("该城市网点正在建设中");
            }
        });
   }else{
       $("#sBranch").html("");
       var options = "<option value=\"\">--请选择网点--</option>";
       $("#sBranch").html(options);
       alert("请选择城市");
       return false;
   }
});

$("#form").submit(function () {
    //判断是否输入上门时间
   var sTime = $("#sTime").val();
   if(sTime!=null&&sTime!=""){
       $("#sTimeR").html("");
   }else{
       $("#sTimeR").html("请输入上门时间");
       return false;
   }

   //判断是否选择城市
   var sCity = $("#sCity").val();
   if(sCity!=null&&sCity!=""){
       $("#sCityR").html("");
   }else{
       $("#sCityR").html("请选择您所在城市");
       return false;
   }

   //判断是否选择网点
    var sBranch = $("#sBranch").val();
    if(sBranch!=null&&sBranch!=""){
        $("#sBranchR").html("");
    }else{
        $("#sBranchR").html("请选择离您最近的网点");
        return false;
    }

    //判断是否选择货物类型
    var cType = $("#cType").val();
    if(cType!=null&&cType!=""){
        $("#cTypeR").html("");
    }else{
        $("#cTypeR").html("请选择离货物类型");
        return false;
    }

    //判断电话格式
    var isPhone = /^([0-9]{3,4}-)?[0-9]{7,8}$/;
    var isMob=/^((\+?86)|(\(\+86\)))?(13[012356789][0-9]{8}|15[012356789][0-9]{8}|18[02356789][0-9]{8}|147[0-9]{8}|1349[0-9]{7})$/;
    var sTel = $("#sTel").val();
    var gTel = $("#gTel").val();
    if(isPhone.test(sTel) || isMob.test(sTel)){
        $("#sTelR").html("");
    }else{
        $("#sTelR").html("电话格式不正确,请重新输入");
        return false;
    }
    if(isPhone.test(gTel) || isMob.test(gTel)){
        $("#gTelR").html("");
    }else{
        $("#gTelR").html("电话格式不正确,请重新输入");
        return false;
    }
});