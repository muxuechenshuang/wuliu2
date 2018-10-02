$(".viewWd").on("click",function () {
    var obj = $(this);
    window.location.href="view/"+obj.attr("wdid");
});
