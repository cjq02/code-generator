var pageObj = pageObj || {};
require(["page.base"<#if hasForm == '1'>, "artDialog"</#if>], function (superObj) {

    pageObj = $.extend(true, {}, superObj, pageObj, {

        urls: {
            getPage: App["contextPath"] + "/${getRootPath}/${getPageMethodName}.json",
            <#if hasForm == '1'>
            addEditForm: App["contextPath"] + "/${getRootPath}/form.htm?id=",
            delete: App["contextPath"] + "/${getRootPath}/delete${actionName}.json"
            </#if>
        },

        templates: {
            searchFields: [
            ]
        },

        plugins: {
            jqGrid: {
                getColModel: function () {
                    var _colModelExt = this.colModelExt;
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
            }
        }
    });

    $(window).ready(function () {
        pageObj.init();
    });
});