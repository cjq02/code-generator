package com.cjq.cg.service.impl.frontend;

import com.cjq.cg.service.base.BaseGenerator;
import com.cjq.cg.utils.StringUtils;
import com.google.common.collect.Maps;

import java.util.HashMap;

import static com.cjq.cg.service.base.GeneratorProperty.ACTION_NAME;
import static com.cjq.cg.service.base.GeneratorProperty.RESOURCES_PATH;
import static com.cjq.cg.service.impl.backend.ControllerGeneratorImpl.getWebModulePath;

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
        return StringUtils.decapitalize(ACTION_NAME);
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
        return "frontend/jsp.ftl";
    }

    @Override
    protected String getModuleSign() {
        return "web";
    }

    @Override
    protected String getPackagePath() {
        return RESOURCES_PATH + "/views/" + getWebModulePath();
    }

    public static String getRootPath() {
        return getWebModulePath() + "/" + StringUtils.decapitalize(ACTION_NAME);
    }
}
