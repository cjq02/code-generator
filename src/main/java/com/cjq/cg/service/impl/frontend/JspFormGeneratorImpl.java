package com.cjq.cg.service.impl.frontend;

import com.google.common.collect.Maps;

import java.util.HashMap;

import static com.cjq.cg.service.impl.backend.ControllerGeneratorImpl.getRoutePath;

/**
 * @author cjq
 * @date 2019-10-30
 */
public class JspFormGeneratorImpl extends AbstractJspGeneratorImpl {

    @Override
    protected HashMap<String, String> getTemplateProperties() {
        HashMap<String, String> map = Maps.newHashMap();
        map.putAll(super.getTemplateProperties());
        map.put("jspPath", getRoutePath() + "Form");
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
