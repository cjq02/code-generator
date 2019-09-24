var pageObj = pageObj || {};
require(["jQuery", "jqForm", "jQueryUtils", "AppUtils", "jqGrid", "Underscore"], function () {

    var urls = pageObj.urls = {
        ${getPageMethodName}: App["contextPath"] + "/${getRootPath}/${getPageMethodName}.json"
    };

    var dom = pageObj.dom = {
        init: function () {
            pageObj.dom = $.extend(this, {
                getGrid: function() {
                    return $('#grid');
                },
                formSearch: $('#formSearch')
            });
        }
    };

    var plugins = pageObj.plugins = {
        jqGrid: {
            getConfig: function () {
                return $.extend({}, jqGridUtil.pageListConfig, {
                    url: urls.${getPageMethodName},
                    pager: "#pager",
                    colModel: this.getColModel()
                });
            },

            init: function () {
                dom.getGrid().jqGrid(this.getConfig());
            },

            search: function (searchData) {
                dom.getGrid().jqGrid("setRequestData", {
                    condition: searchData,
                    pageInfo: {
                        currentPage: 1
                    }
                }).jqGrid("reloadGrid");
            },

            getColModel: function () {
                return [
                    {name: "id",label: "主键",hidden: true}
                ];
            }
        }
    };

    $.extend(pageObj, {

        init: function () {
            this.initPrepare();
            this.initListeners();
            this.initPlugins();
            this.initData();
        },

        initPrepare: function () {
            this.dom.init();
        },

        initListeners: function () {

        },

        initPlugins: function () {
            this.plugins.jqGrid.init();
        },

        getSearchData: function () {
            return this.dom.formSearch.jqForm().jqForm('getValue');
        },

        initData: function () {
            this.plugins.jqGrid.search(this.getSearchData());
        },

        search: function () {
            this.initData();
        },

        reset: function () {
            this.dom.formSearch.jqForm().jqForm('reset');
        }
    });

    $(window).ready(function () {
        pageObj.init();
    });
});