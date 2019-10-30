<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/views/_include/_jsp_tags.jsp" %>
<%@ include file="/views/_include/_jsp_variable.jsp" %>
<c:set var="pageTitle" value="${title}"/>
<c:set var="pageJs" value="${r"${staticContextPath}"}/assets/js/${jspPath}.js"/>
<%@ include file="/views/application/_include_top.jsp" %>
<body>
<div class="wrapper">
    <form id="formEdit">
        <div class="top-search">
            <div class="row col-sm-12">
                <ul class="form-grid">
                    <li class="col-sm-12">
                    </li>
                    <li class="col-sm-12" style="text-align: center;">
                        <a href="javascript:pageObj.save()" class="btn btn-primary">
                            <i class="iconfont icon-search"></i>保存
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </form>
</div>
</body>

<%@ include file="/views/application/_include_bottom.jsp" %>