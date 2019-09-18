var pageObj = pageObj || {};
require(["jQuery", "jqForm", "jQueryUtils", "AppUtils", "jqGrid", "Underscore"], function () {

    var urls = pageObj.urls = {
        ${getPageMethodName}: App["contextPath"] + "/${webModulePath}/${getPageMethodName}.json"
    };

    var dom = pageObj.dom = {
        init: function () {
            return $.extend(this, {
                grid: $('#grid'),
                formSearch: $('#formSearch')
            })
        }
    };

    var plugins = pageObj.plugins = {
        jqGrid: {
            getConfig: function () {
                return {
                    url: urls.${getPageMethodName},
                    pager: "#pager",
                    colModel: this.getColModel()
                }
            },

            init: function () {
                dom.grid.jqGrid(this.getConfig());
            },

            search: function (searchData) {
                dom.grid.jqGrid("setRequestData", {
                    condition: searchData,
                    pageInfo: {
                        currentPage: 1
                    }
                }).jqGrid("reloadGrid");
            },

            getColModel: function () {
                return [
                    {
                        name: "id",
                        label: "主键",
                        hidden: true,
                        hidedlg: true
                    }
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