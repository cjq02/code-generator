var pageObj = pageObj || {};
require(["form.base"], function (baseObj) {

    $.extend(true, pageObj, baseObj, {});

    $.extend(true, pageObj, {
        urls: {
            getData:  App["contextPath"] + "/${getRootPath}/${getVoById}.json",
            save: App["contextPath"] + "/${getRootPath}/save${actionName}.json",
        },
    });

    $.extend(true, pageObj, {
        templates: {
            fields: [],
            ,
            bottomButtons: [
                {name: 'saveThenClose', label: '保存', btnLevel: 'primary', btnIcon: 'save'},
                {name: 'cancel', label: '取消', btnLevel: 'default'},
            ]
        }
    });

    $.extend(true, pageObj, {
        plugins: {}
    });

    $.extend(true, pageObj, {});

    $(window).ready(function () {
        pageObj.init();
    });
});