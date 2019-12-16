var pageObj = pageObj || {};
require(["jQuery", "jqForm", "jQueryUtils", "AppUtils", "Tips", "jqGrid"<#if hasForm == '1'>, "artDialog"</#if>], function () {

    var urls = pageObj.urls = {
        ${getPageMethodName}: App["contextPath"] + "/${getRootPath}/${getPageMethodName}.json",
        <#if hasForm == '1'>
        addEditForm: App["contextPath"] + "/${getRootPath}/form.htm?id=",
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
                <#if hasForm == '1'>
                btnAdd: $('#btnAdd'),
                </#if>
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

            load: function (searchData) {
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
                            html += "<a class='mr5' onclick='pageObj.edit(\"" + rowData.id + "\")'>编辑</a>";
                            html += "<a class='mr5' onclick='pageObj.delete(\"" + rowData.id + "\")'>删除</a>";
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
                    pageObj.addEditDialog = dialog({
                        url: urls.addEditForm + id,
                        title: '新增/编辑${title}',
                        quickClose: false,
                        height: 250
                    });
                    pageObj.addEditDialog.showModal();
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
            _.each(plugins, function (plugin) {
                _.isFunction(plugin.init) && plugin.init();
            });
        },

        initData: function () {
            this.plugins.jqGrid.load(this.getSearchData());
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

        delete: function (id) {
            artDialogUtil.confirm("确定删除吗？", _.bind(function () {
                ajaxUtil.ajaxWithBlock(ajaxUtil.getAjaxSetting(urls.delete, {id: id}),
                    _.bind(function (response) {
                        TipsUtil.show(response.success, response.message);
                        if (response.success) {
                            this.search();
                        }
                    }, this));
            }, this));
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