<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/views/_include/_jsp_tags.jsp" %>
<%@ include file="/views/_include/_jsp_variable.jsp" %>
<c:set var="pageTitle" value="新增/编辑${title}"/>
<c:set var="pageJs" value="${r"${staticContextPath}"}/assets/js/${jspPath}.js"/>
<%@ include file="/views/application/_include_top.jsp" %>
<%@ include file="/views/application/_template_field.jsp" %>
<body>
<div class="wrapper">
    <form id="form"></form>
    <div id="bottomBar" class="bottom-bar fr">
        <a href="javascript:pageObj.save()" class="btn btn-primary">
            <i class="iconfont icon-save"></i>保存
        </a>
    </div>
</div>
</body>

<script type="application/javascript">
    pageObj = {
        id: '${r"${id}"}'
    }
</script>

<%@ include file="/views/application/_include_bottom.jsp" %>