package com.cjq.cg.service.impl.frontend;

import com.cjq.cg.utils.StringUtils;
import com.google.common.collect.Maps;

import java.util.HashMap;

import static com.cjq.cg.service.base.GeneratorProperty.ACTION_NAME;
import static com.cjq.cg.service.impl.backend.ServiceIntfGeneratorImpl.getVoById;

/**
 * @author cjq
 * @date 2019-10-30
 */
public class JsFormGeneratorImpl extends AbstractJsGeneratorImpl {

    @Override
    protected HashMap<String, String> getTemplateProperties() {
        HashMap<String, String> map = Maps.newHashMap();
        map.putAll(super.getTemplateProperties());
        map.put("getVoById", getVoById());
        return map;
    }

    @Override
    protected String getTemplateName() {
        return "frontend/js/form.ftl";
    }

    @Override
    protected String getFileName() {
        return StringUtils.decapitalize(ACTION_NAME) + "Form";
    }

}
