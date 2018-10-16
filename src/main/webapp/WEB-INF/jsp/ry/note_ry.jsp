<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<div class="clearfix"></div>
<div class="row">
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>您的消息<i class="fa fa-user"></i><small>${devUserSession.devName}</small></h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                <div class="clearfix"></div>
                <form id="form" class="form-horizontal form-label-left" action="readAll" method="get" enctype="multipart/form-data">
                    <input type="hidden" name="pageIndex" value="1" />
                </form>

                <ul id="note" class="list-unstyled msg_list" role="menu">
                    <c:forEach items="${noteList}" var="note">
                        <li><a>
                            <span>${note.clientName}</span>
                            <span class="time"><fmt:formatDate value="${note.sendTime}" pattern="yyyy-MM-dd HH:ss:mm"/></span>
                            <span class="message">${note.noteText}</span>
                            <span style="color: #39B3D7" noteId = "${note.id}"
                            class="deleteNote">点我删除</span>
                        </a></li>
                    </c:forEach>
                </ul>

                <div class="row">
                    <div class="col-sm-5">
                        <div class="dataTables_info" id="datatable-responsive_info"
                             role="status" aria-live="polite">共${pages.count}条记录
                            ${pages.pageNo }/${pages.pageCount }页</div>
                    </div>
                    <div class="col-sm-7">
                        <div class="dataTables_paginate paging_simple_numbers"
                             id="datatable-responsive_paginate">
                            <ul class="pagination">
                                <c:if test="${pages.pageNo > 1}">
                                    <li class="paginate_button previous"><a
                                            href="javascript:page_nav(document.forms[0],1);"
                                            aria-controls="datatable-responsive" data-dt-idx="0"
                                            tabindex="0">首页</a></li>
                                    <li class="paginate_button "><a
                                            href="javascript:page_nav(document.forms[0],${pages.pageNo-1});"
                                            aria-controls="datatable-responsive" data-dt-idx="1"
                                            tabindex="0">上一页</a></li>
                                </c:if>
                                <c:if test="${pages.pageNo < pages.pageCount }">
                                    <li class="paginate_button "><a
                                            href="javascript:page_nav(document.forms[0],${pages.pageNo+1});"
                                            aria-controls="datatable-responsive" data-dt-idx="1"
                                            tabindex="0">下一页</a></li>
                                    <li class="paginate_button next"><a
                                            href="javascript:page_nav(document.forms[0],${pages.pageCount});"
                                            aria-controls="datatable-responsive" data-dt-idx="7"
                                            tabindex="0">最后一页</a></li>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<%@include file="../common/footer.jsp"%>
<script type="text/javascript">
    $(".deleteNote").on("click",function () {
       var obj = $(this);
       var noteId = obj.attr("noteId");
       if(noteId < 7){
           alert("才不让你删这条咧！哼！");
           return false;
       }
       if(confirm("你确定要删除该信息嘛?")){
           $.ajax({
              type:"GET",
              url:"deleteNote.json",
              data:{id:noteId},
              dataType:"json",
              success:function (data) {
                  if(data.delResult == "true"){//删除成功：移除删除行
                      alert("删除成功");
                      obj.parents("li").remove();
                  }else if(data.delResult == "false"){//删除失败
                      alert("对不起，删除失败");
                  }else if(data.delResult == "notexist"){
                      alert("对不起，未找到该信息");
                  }
              },
               error:function(data){
                   alert("对不起，删除失败");
               }
           });
       }
    });
</script>