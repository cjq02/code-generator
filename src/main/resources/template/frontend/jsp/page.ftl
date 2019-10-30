<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/views/_include/_jsp_tags.jsp" %>
<%@ include file="/views/_include/_jsp_variable.jsp" %>
<c:set var="pageTitle" value="${title}"/>
<c:set var="pageJs" value="${r"${staticContextPath}"}/assets/js/${jspPath}.js"/>
<%@ include file="/views/application/_include_top.jsp" %>
<body>
<div class="wrapper">
    <!--topSearch-->
    <form id="formSearch" class="invisible">
        <div class="top-search">
            <div class="row col-sm-12">
                <ul class="form-grid font6">
                    <li class="col-sm-4">
                        <label class="form-lab" for="conditionExample">查询条件</label>
                        <div class="form-control">
                            <div class="select">
                                <input type="text" id="conditionExample" name="conditionExample" placeholder="请输入">
                            </div>
                        </div>
                    </li>
                    <li class="col-sm-4">
                        <a href="javascript:pageObj.search()" class="btn btn-primary">
                            <i class="iconfont icon-search"></i>查询
                        </a>
                        <a href="javascript:pageObj.reset()" class="btn btn-default">
                            <i class="iconfont icon-rest"></i>重置
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </form>
    <div class="top-search">
    <#if hasForm == '1'>
        <div class="action fl">
            <em class="separ"></em>
            <a id="btnShowSearch" class="txt-all">
                <i class="iconfont icon-search"></i>
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