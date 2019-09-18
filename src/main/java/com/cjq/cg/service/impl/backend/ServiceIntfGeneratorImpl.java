package com.cjq.cg.service.impl.backend;

import com.cjq.cg.service.base.BaseGenerator;
import com.google.common.collect.Maps;

import java.util.HashMap;

import static com.cjq.cg.service.base.GeneratorProperty.ACTION_NAME;

/**
 * @author cjq
 * @date 2019/09/17
 */
public class ServiceIntfGeneratorImpl extends AbstractBackendGenerator {


    @Override
    protected HashMap<String, String> getTemplateProperties() {
        HashMap<String, String> map = Maps.newHashMap();
        map.put("interfaceName", getFileName());
        map.put("getPageMethodName", getPageMethodName());
        map.putAll(getBackendProperties());
        return map;
    }

    @Override
    protected String getFileName() {
        return "I" + ACTION_NAME + "Service";
    }

    @Override
    protected String getFileNameSuffix() {
        return ".java";
    }

    @Override
    protected String getPackageType() {
        return "service";
    }

    @Override
    protected String getTemplateName() {
        return "backend/IService.ftl";
    }

    @Override
    protected String getModuleSign() {
        return "api";
    }

    protected static String getInterfacePath() {
        return new ServiceIntfGeneratorImpl().getPackageFileName();
    }

    public static String getPageMethodName() {
        return "get" + ACTION_NAME + "Page";
    }
}
