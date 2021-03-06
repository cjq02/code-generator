var pageObj = pageObj || {};
require(["page.base"<#if hasForm == '1'>, "artDialog"</#if>], function (baseObj) {

    $.extend(true, pageObj, baseObj, {});

    $.extend(true, pageObj, {
        urls: {
            getPage: App["contextPath"] + "/${getRootPath}/${getPageMethodName}.json",
            <#if hasForm == '1'>
            addEditForm: App["contextPath"] + "/${getRootPath}/form.htm?id=",
            delete: App["contextPath"] + "/${getRootPath}/delete${actionName}.json"
            </#if>
        },
    });

    $.extend(true, pageObj, {
        templates: {
            searchFields: []
        }
    });

    $.extend(true, pageObj, {
        plugins: {
            jqGrid: {
                getColModel: function () {
                    var colModelExt = this.colModelExt;
                    return [
                        {name: "id",label: "主键",hidden: true},
                        <#if hasForm == '1'>
                        {
                            name: "operate", label: "操作", width: 80, align: 'left',
                            formatter: function (cellContent, options, rowData) {
                                var html = '';
                                html += "<a class='mr5' onclick='pageObj.edit(\"" + rowData.id + "\")'>编辑</a>";
                                html += "<a class='mr5' onclick='pageObj.delete(this, \"" + rowData.id + "\")'>删除</a>";
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

    $.extend(true, pageObj, {});

    $(window).ready(function () {
        pageObj.init();
    });
});