var pageObj = pageObj || {};
require(["form.base"], function (superObj) {

    pageObj = $.extend(true, {}, superObj, pageObj, {

        urls: {
            getData:  App["contextPath"] + "/${getRootPath}/${getVoById}.json",
            save: App["contextPath"] + "/${getRootPath}/save${actionName}.json",
        },

        templates: {
            fields: [
            ]
        },

        plugins: {
        }
    });

    $(window).ready(function () {
        pageObj.init();
    });
});