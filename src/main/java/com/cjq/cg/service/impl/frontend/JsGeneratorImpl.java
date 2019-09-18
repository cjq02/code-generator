package com.cjq.cg.service.impl.frontend;

import com.cjq.cg.service.base.BaseGenerator;
import com.google.common.collect.Maps;

import java.util.HashMap;

import static com.cjq.cg.service.base.GeneratorProperty.ACTION_NAME;
import static com.cjq.cg.service.base.GeneratorProperty.RESOURCES_PATH;
import static com.cjq.cg.service.impl.backend.ControllerGeneratorImpl.getWebModulePath;
import static com.cjq.cg.service.impl.frontend.JspGeneratorImpl.getRootPath;
import static com.cjq.cg.service.impl.backend.ServiceIntfGeneratorImpl.getPageMethodName;

/**
 * @author cjq
 * @date 2019-09-18
 */
public class JsGeneratorImpl extends BaseGenerator {
    @Override
    protected HashMap<String, String> getTemplateProperties() {
        HashMap<String, String> map = Maps.newHashMap();
        map.put("getRootPath", getRootPath());
        map.put("getPageMethodName", getPageMethodName());
        return map;
    }

    @Override
    protected String getFileName() {
        return ACTION_NAME;
    }

    @Override
    protected String getFileNameSuffix() {
        return ".js";
    }

    @Override
    protected String getPackageType() {
        return null;
    }

    @Override
    protected String getTemplateName() {
        return "frontend/js.ftl";
    }

    @Override
    protected String getModuleSign() {
        return "web";
    }

    @Override
    protected String getPackagePath() {
        return RESOURCES_PATH + "/static/assets/js/" + getWebModulePath();
    }

}
