$("#calculate").click(function () {
    //获取值
    var cityA = $("#cityA").val();
    var cityB = $("#cityB").val();
    var estimatedWeight = $("#estimatedWeight").val();

    if(cityA==0||cityB==0){
        alert("请选择城市！");
        return false;
    }
    if(null==estimatedWeight||""==estimatedWeight){
        alert("请填写预估重量！");
        return false;
    }
    if(cityA==cityB){
        alert("请选择不一样的城市");
        return false;
    }

    $.ajax({
        type:"GET",
        url:"result.json",
        data:"&cityA="+cityA+"&cityB="+cityB+"&estimatedWeight="+estimatedWeight,
        dataType:"json",
        success:function (data) {
            var weight = data.weight+"公斤";
            var money = data.money+"元";
            $("#weight").val(weight);
            $("#timeT").val(data.timeT);
            $("#money").val(money);
        }
    })
});