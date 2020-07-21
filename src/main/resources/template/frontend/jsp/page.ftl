<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/views/_include/_jsp_tags.jsp" %>
<%@ include file="/views/_include/_jsp_variable.jsp" %>
<c:set var="pageTitle" value="${title}"/>
<c:set var="pageJs" value="${r"${staticContextPath}"}/assets/js/${jspPath}Page.js"/>
<%@ include file="/views/application/_include_top.jsp" %>
<%@ include file="/views/application/_template_field.jsp" %>
<body>
<div class="wrapper">
    <!--topSearch-->
    <form id="formSearch" class="invisible"></form>
    <div class="top-search">
    <#if hasForm == '1'>
        <div class="action fl">
            <em class="separ"></em>
            <a id="btnAdd" class="txt-all" onclick="pageObj.add()">
                <i class="iconfont icon-add"></i>
                <span>新增</span>
            </a>
            <em class="separ"></em>
        </div>
    </#if>
        <div class="action">
            <em class="separ"></em>
            <a id="btnShowSearch" class="txt-all">
                <i class="iconfont icon-search"></i>
                <span>显示查询</span>
            </a>
            <em class="separ"></em>
        </div>
    </div>
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