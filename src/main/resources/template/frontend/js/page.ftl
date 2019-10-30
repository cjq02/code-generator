var pageObj = pageObj || {};
require(["jQuery", "jqForm", "jQueryUtils", "AppUtils", "jqGrid"], function () {

    var urls = pageObj.urls = {
        ${getPageMethodName}: App["contextPath"] + "/${getRootPath}/${getPageMethodName}.json",
        <#if hasForm == '1'>
        addEditForm: App["contextPath"] + "/${getRootPath}/form.htm",
        delete: App["contextPath"] + "/${getRootPath}/delete.json"
        </#if>
    };

    var dom = pageObj.dom = {
        init: function () {
            dom = $.extend(this, {
                getGrid: function() {
                    return $('#grid');
                },
                grid: $('#grid'),
                formSearch: $('#formSearch'),
                btnShowSearch: $('#btnShowSearch')
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
                    {name: "id",label: "主键",hidden: true},
                    <#if hasForm == '1'>
                    {
                        name: "operate", label: "操作", width: 80, align: 'left',
                        formatter: function (cellContent, options, rowData) {
                            var html = '';
                            html += "<a class='mr5' onclick='pageObj.delete(\"" + rowData.id + "\")'>删除</a>";
                            html += "<a class='mr5' onclick='pageObj.edit(\"" + rowData.id + "\")'>编辑</a>";
                            return html;
                        }
                    },
                    </#if>
                    {name: "field",label: "字段", align: 'center'}
                ];
            }
        },

        <#if hasForm == '1'>
        dialog: {
            addEdit: {
                open: function (id) {
                    require(['artDialog'], function () {
                        pageObj.addEditDialog = dialog({
                            url: urls.addEditForm + id,
                            title: '新增/编辑${title}',
                            quickClose: false,
                            height: 250
                        });
                        pageObj.addEditDialog.showModal();
                    });
                },

                close: function (response) {
                    TipsUtil.show(response.success, response.message);

                    if (response.success) {
                        pageObj.addEditDialog.close();
                        pageObj.search();

                    }
                }
            }
        }
        </#if>
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
            this.dom.btnShowSearch.click(function () {
                dom.formSearch.toggle();
                $(this).children('span').toggleValue('显示查询', '隐藏查询');
            });
        },

        initPlugins: function () {
            this.plugins.jqGrid.init();
        },

        initData: function () {
            this.plugins.jqGrid.search(this.getSearchData());
        },

        initCompleted: function() {
        },

        getSearchData: function () {
            return this.getForm().jqForm('getValue');
        },

        search: function () {
            this.initData();
        },

        reset: function () {
            this.getForm().jqForm('reset');
        },

        <#if hasForm == '1'>
        add: function () {
            this.plugins.dialog.addEdit.open('');
        },

        edit: function (id) {
            this.plugins.dialog.addEdit.open(id);
        },
        </#if>

        getForm: function () {
            return this.dom.formSearch.jqForm();
        }
    });

    $(window).ready(function () {
        pageObj.init();
    });
});