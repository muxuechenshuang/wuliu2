 $("#form").submit(function () {
     var city = $("#city").val();
     if(city == null || city == ""){
         alert("请选择城市！");
         return false;
     }
 });
 function page_nav(frm,num){
     frm.pageIndex.value=num;
     frm.submit();
 }