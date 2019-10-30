package com.cjq.cg.service.impl.frontend;

import com.google.common.collect.Maps;

import java.util.HashMap;

/**
 * @author cjq
 * @date 2019-10-30
 */
public class JspFormGeneratorImpl extends AbstractJspGeneratorImpl {

    @Override
    protected HashMap<String, String> getTemplateProperties() {
        HashMap<String, String> map = Maps.newHashMap();
        map.putAll(super.getTemplateProperties());
        map.put("jspPath", getRootPath() + "Form");
        return map;
    }

    @Override
    protected String getTemplateName() {
        return "frontend/jsp/form.ftl";
    }

    @Override
    protected String getFileName() {
        return super.getFileName() + "Form";
    }

}
