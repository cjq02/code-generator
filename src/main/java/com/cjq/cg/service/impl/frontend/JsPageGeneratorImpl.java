package com.cjq.cg.service.impl.frontend;

import com.cjq.cg.utils.StringUtils;
import com.google.common.collect.Maps;

import java.util.HashMap;

import static com.cjq.cg.service.base.GeneratorProperty.ACTION_NAME;

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

    @Override
    protected String getFileName() {
        return StringUtils.decapitalize(ACTION_NAME) + "Page";
    }

}
