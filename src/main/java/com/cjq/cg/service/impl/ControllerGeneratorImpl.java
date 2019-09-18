package com.cjq.cg.service.impl;

import com.cjq.cg.service.base.BaseGenerator;
import com.google.common.collect.Maps;
import com.sun.xml.internal.ws.util.StringUtils;

import java.util.HashMap;

import static com.cjq.cg.service.base.GeneratorProperty.ACTION_NAME;
import static com.cjq.cg.service.base.GeneratorProperty.PACKAGE_SUFFIX;
import static com.cjq.cg.service.impl.JspGeneratorImpl.getRootPath;
import static com.cjq.cg.service.impl.ServiceGeneratorImpl.getInterfaceName;
import static com.cjq.cg.service.impl.ServiceIntfGeneratorImpl.getInterfacePath;
import static com.cjq.cg.service.impl.ServiceIntfGeneratorImpl.getPageMethodName;

/**
 * @author cjq
 * @date 2019-09-18
 */
public class ControllerGeneratorImpl extends BaseGenerator {

    @Override
    protected HashMap<String, String> getTemplateProperties() {
        HashMap<String, String> map = Maps.newHashMap();
        map.put("interfaceName", getInterfaceName());
        map.put("interfacePath", getInterfacePath());
        map.put("interfaceAlias", getInterfaceAlias());
        map.put("webModulePath", getWebModulePath());
        map.put("rootPath", getRootPath());
        map.put("controllerName", getFileName());
        map.put("getPageMethodName", getPageMethodName());
        getBackendProperties(map);
        return map;
    }

    @Override
    protected String getFileName() {
        return ACTION_NAME + "Controller";
    }

    @Override
    protected String getFileNameSuffix() {
        return ".java";
    }

    @Override
    protected String getPackageType() {
        return "web";
    }

    @Override
    protected String getTemplateName() {
        return "Controller.ftl";
    }

    @Override
    protected String getModuleSign() {
        return "web";
    }

    private String getInterfaceAlias() {
        return StringUtils.decapitalize(new ServiceGeneratorImpl().getFileName());
    }

    protected static String getWebModulePath() {
        return PACKAGE_SUFFIX.replace(".${type}", "").replace(".", "/");
    }
}
