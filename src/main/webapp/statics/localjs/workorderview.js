$("#view").on("click", function () {
    var obj = $(this);
    window.location.href = "workorderview/" + obj.attr("workorderid");
});

