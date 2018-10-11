<%@ page language="java" contentType="text/html; charset=UTF-8"
                                                                                                   pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<div class="clearfix"></div>
<div class="row">
    <div class="col-md-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>
                    订单查询
                </small>
                </h2>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">

                <form method="post" action="">
                   <input type="hidden" name="pageIndex" value="1" />


                    <ul>
                        <li>
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4 col-xs-12">报表查询</label>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <select id="baobiaochoose" name="productType" class="form-control" style="width: 200px;">
                                        <option value="">-----------请选择-----------</option>
                                            <option value="1">-----------7天内订单-----------</option>
                                            <option value="2">-----------30天内订单-----------</option>
                                    </select>
                                </div>
                            </div>
                        </li>

                        <li><button type="button" id="querybao"class="btn btn-primary">查
                            &nbsp;&nbsp;&nbsp;&nbsp;询</button></li>
                    </ul>
                </form>
            </div>
        </div>
    </div>

</div>
</div>
<script type="text/javascript" src="../statics/js/jquery-1.8.3.js"></script>


<script type="text/javascript" src="../statics/js/echarts.js"></script>
<!-- 显示Echarts图表 -->
<div style="height:510px;width:1200px;display:none;min-height:100px;margin:0 auto;" id="main"></div>

<script type="text/javascript">
    $("#querybao").click(function () {
        var choice=$("#baobiaochoose").val();
        if(choice == 1){
            $("#main").css("display","block");
            <%@include file="../statics/js/xlh/weekbaobiao.js"%>
        }

    })
</script>
















<%@include file="../common/footer.jsp"%>
<script src="${pageContext.request.contextPath }/statics/localjs/rollpage.js"></script>
