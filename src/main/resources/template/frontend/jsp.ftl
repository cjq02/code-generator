<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/views/_include/_jsp_tags.jsp" %>
<%@ include file="/views/_include/_jsp_variable.jsp" %>
<c:set var="pageTitle" value="${title}"/>
<c:set var="pageJs" value="${r"${staticContextPath}"}/assets/js/${jspPath}.js"/>
<%@ include file="/views/application/_include_top.jsp" %>
<link rel="stylesheet" href="${r"${staticContextPath}"}/assets/css/main.css"/>
<body>
<div class="wrapper">
    <form id="formSearch">
        <div class="top-search">
            <div class="row col-sm-12">
                <ul class="form-grid font6">
                    <li class="col-sm-4">
                        <label class="form-lab" for="conditionExample">查询条件</label>
                        <div class="form-control">
                            <input type="text" class="inp" id="conditionExample" name="conditionExample" placeholder="请输入">
                        </div>
                    </li>
                </ul>
            </div>
            <div class="box-btn">
                <a href="javascript:pageObj.search()" class="btn btn-primary">
                    <i class="iconfont icon-search"></i>查询
                </a>
                <a href="javascript:pageObj.reset()" class="btn btn-default">
                    <i class="iconfont icon-rest"></i>重置
                </a>
            </div>
        </div>
    </form>
    <!--topSearch-->
    <!-- 表格 -->
    <div class="main ">
        <div class="con-tab ">
            <table id="grid"></table>
            <div id="pager"></div>
        </div>
    </div>
</div>
</body>

<%@ include file="/views/application/_include_bottom.jsp" %>