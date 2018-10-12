$("#sCity").change(function () {
    var cityId = $("#sCity").val();
    if(cityId!=null&&cityId!==""){
        $.ajax({
            type:"GET",
            url:"queryBranchList.json",
            data:{parentId:cityId},
            dataType:"json",
            success:function (data) {
                if(data==null||data+""==0){//当没有返回数据，提醒没有网点，并重置网点下拉框
                    $("#sPoint").html("");
                    var options = "<option value=\"\">--请选择网点--</option>";
                    $("#sPoint").html(options);
                    return false;
                }
                //当正常返回数据，清空城市下方提醒语句，返回网点下拉框
                $("#sPoint").html("");
                var options = "<option value=\"\">--请选择网点--</option>";
                for(var i = 0; i < data.length; i++){
                    options += "<option value=\""+data[i].id+"\">"+data[i].name+"</option>";
                }
                $("#sPoint").html(options);
            },
            error:function (data) {
            }
        });
    }else{
        $("#sPoint").html("");
        var options = "<option value=\"\">--请选择网点--</option>";
        $("#sPoint").html(options);
        alert("请选择城市");
        return false;
    }
});

$("#gCity").change(function () {
    alert(1);
    var cityId = $("#gCity").val();
    if(cityId!=null&&cityId!==""){
        $.ajax({
            type:"GET",
            url:"queryBranchList.json",
            data:{parentId:cityId},
            dataType:"json",
            success:function (data) {
                if(data==null||data+""==0){//当没有返回数据，提醒没有网点，并重置网点下拉框
                    $("#gCity").html("");
                    var options = "<option value=\"\">--请选择网点--</option>";
                    $("#gCity").html(options);
                    alert("该城市网点正在建设中,请选择其他城市");
                    return false;
                }
                //当正常返回数据，清空城市下方提醒语句，返回网点下拉框
                $("#gPoint").html("");
                var options = "<option value=\"\">--请选择网点--</option>";
                for(var i = 0; i < data.length; i++){
                    options += "<option value=\""+data[i].id+"\">"+data[i].name+"</option>";
                }
                $("#gPoint").html(options);
            },
            error:function (data) {
                alert("该城市网点正在建设中,请选择其他城市");
            }
        });
    }else{
        $("#gPoint").html("");
        var options = "<option value=\"\">--请选择网点--</option>";
        $("#gPoint").html(options);
        return false;
    }
});
