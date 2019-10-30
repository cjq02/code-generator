var pageObj = pageObj || {};
require(["jQuery", "jqForm", "jQueryUtils", "AppUtils"], function () {

    var urls = pageObj.urls = {
        save: App["contextPath"] + "/${getRootPath}/save.json"
    };

    var dom = pageObj.dom = {
        init: function () {
            dom = $.extend(this, {
                form: $('#form')
            });
        }
    };

    var plugins = pageObj.plugins = {

    };

    $.extend(pageObj, {

        init: function () {
            this.initPrepare();
            this.initListeners();
            this.initPlugins();
            this.initData();
            this.initCompleted();
        },

        initPrepare: function () {
            this.dom.init();
        },

        initListeners: function () {
        },

        initPlugins: function () {
        },

        initData: function () {
        },

        initCompleted: function() {
        },

        validateRule: function () {
            return {
                field: {label: "字段", required: true}
            };
        },

        getSaveData: function () {
            return this.getForm().jqForm('getValue');
        },

        save: function() {
            if (validateUtil.validate(this.dom.form, this.validateRule())) {
                $.ajax($.extend(true, {}, ajaxUtil.getAjaxSetting(urls.add, this.getSaveData()))).done(_.bind(function (response) {
                    TipsUtil.show(response.success, response.message);
                    if (response.success) {
                        setTimeout(function () {
                            parent.pageObj.dialogObj.close();
                        }, 1000);
                    }
                }, this));
            }
        },

        reset: function () {
            this.getForm().jqForm('reset');
        },

        getForm: function () {
            return this.dom.form.jqForm();
        }
    });

    $(window).ready(function () {
        pageObj.init();
    });
});