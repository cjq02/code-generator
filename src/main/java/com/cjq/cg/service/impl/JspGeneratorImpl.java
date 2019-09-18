package com.cjq.cg.service.impl;

import com.cjq.cg.service.base.BaseGenerator;
import com.google.common.collect.Maps;
import com.sun.xml.internal.ws.util.StringUtils;

import java.util.HashMap;

import static com.cjq.cg.service.base.GeneratorProperty.ACTION_NAME;
import static com.cjq.cg.service.base.GeneratorProperty.RESOURCES_PATH;
import static com.cjq.cg.service.impl.ControllerGeneratorImpl.getWebModulePath;

/**
 * @author cjq
 * @date 2019-09-18
 */
public class JspGeneratorImpl extends BaseGenerator {
    @Override
    protected HashMap<String, String> getTemplateProperties() {
        HashMap<String, String> map = Maps.newHashMap();
        map.put("jspPath", getRootPath());
        return map;
    }

    @Override
    protected String getFileName() {
        return ACTION_NAME;
    }

    @Override
    protected String getFileNameSuffix() {
        return ".jsp";
    }

    @Override
    protected String getPackageType() {
        return null;
    }

    @Override
    protected String getTemplateName() {
        return "jsp.ftl";
    }

    @Override
    protected String getModuleSign() {
        return "web";
    }

    @Override
    protected String getPackagePath() {
        return RESOURCES_PATH + "/views/" + getWebModulePath();
    }

    protected static String getRootPath() {
        return getWebModulePath() + "/" + StringUtils.decapitalize(ACTION_NAME);
    }
}
