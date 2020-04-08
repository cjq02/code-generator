package com.cjq.cg.service.impl.backend;

import com.google.common.collect.Maps;

import java.util.HashMap;

import static com.cjq.cg.service.base.GeneratorProperty.ACTION_NAME;
import static com.cjq.cg.service.impl.backend.MapperGeneratorImpl.getPageCount;
import static com.cjq.cg.service.impl.backend.MapperGeneratorImpl.getPageList;

/**
 * @author cjq
 * @date 2019-09-16
 */
public class ServiceGeneratorImpl extends AbstractBackendGenerator {

    @Override
    protected HashMap<String, String> getTemplateProperties() {
        HashMap<String, String> map = Maps.newHashMap();
        map.put("serviceName", getFileName());
        map.put("interfaceName", getInterfaceName());
        map.put("pageList", getPageList());
        map.put("pageCount", getPageCount());
        map.put("mapperPackage", getMapperPackage());
        map.putAll(getBackendCommonProperties());
        return map;
    }

    @Override
    protected String getFileName() {
        return ACTION_NAME + "Service";
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
        return TEMPLATE_FOLDER + "Service.ftl";
    }

    @Override
    protected String getModuleSign() {
        return "service";
    }

    protected static String getInterfaceName() {
        return new ServiceIntfGeneratorImpl().getFileName();
    }

    private String getMapperPackage() {
        return new MapperGeneratorImpl().getPackageFileName();
    }
}
