package com.cjq.cg.service.impl.backend;

import com.cjq.cg.utils.StringUtils;
import com.google.common.collect.Maps;

import java.util.HashMap;

import static com.cjq.cg.service.base.GeneratorProperty.ACTION_NAME;
import static com.cjq.cg.service.base.GeneratorProperty.PACKAGE_SUFFIX;
import static com.cjq.cg.service.impl.backend.ServiceGeneratorImpl.getInterfaceName;
import static com.cjq.cg.service.impl.backend.ServiceIntfGeneratorImpl.getInterfacePath;
import static com.cjq.cg.service.impl.frontend.AbstractJspGeneratorImpl.getRootPath;

/**
 * @author cjq
 * @date 2019-09-18
 */
public class ControllerGeneratorImpl extends AbstractBackendGenerator {

    @Override
    protected HashMap<String, String> getTemplateProperties() {
        HashMap<String, String> map = Maps.newHashMap();
        map.put("interfaceName", getInterfaceName());
        map.put("interfacePath", getInterfacePath());
        map.put("interfaceAlias", getInterfaceAlias());
        map.put("webModulePath", getWebModulePath());
        map.put("rootPath", getRootPath());
        map.put("routePath", getRoutePath());
        map.put("controllerName", getFileName());
        map.putAll(getBackendCommonProperties());
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
        return TEMPLATE_FOLDER + "Controller.ftl";
    }

    @Override
    protected String getModuleSign() {
        return "web";
    }

    private String getInterfaceAlias() {
        return StringUtils.decapitalize(new ServiceGeneratorImpl().getFileName());
    }

    public static String getWebModulePath() {
        return PACKAGE_SUFFIX.replace(".${type}", "").replace(".", "/");
    }

    public static String getRoutePath() {
        return getWebModulePath() + "/" + StringUtils.decapitalize(ACTION_NAME);
    }
}
