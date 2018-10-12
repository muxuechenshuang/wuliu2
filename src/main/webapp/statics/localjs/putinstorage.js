$(".view button").on("click", function () {
    var obj = $(this);
    window.location.href = "instorageview/" + obj.attr("receiptId");
});