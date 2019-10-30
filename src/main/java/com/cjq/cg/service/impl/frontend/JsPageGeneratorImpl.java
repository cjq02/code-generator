package com.cjq.cg.service.impl.frontend;

import com.google.common.collect.Maps;

import java.util.HashMap;

/**
 * @author cjq
 * @date 2019-10-30
 */
public class JsPageGeneratorImpl extends AbstractJsGeneratorImpl {

    @Override
    protected HashMap<String, String> getTemplateProperties() {
        HashMap<String, String> map = Maps.newHashMap();
        map.putAll(super.getTemplateProperties());
        return map;
    }

    @Override
    protected String getTemplateName() {
        return "frontend/js/page.ftl";
    }

}
