package com.cjq.cg.service.impl.backend;

import com.google.common.collect.Maps;

import java.util.HashMap;

import static com.cjq.cg.service.base.GeneratorProperty.ACTION_NAME;
import static com.cjq.cg.service.base.GeneratorProperty.RESOURCES_PATH;
import static com.cjq.cg.service.base.GeneratorProperty.TABLE_NAME;
import static com.cjq.cg.service.base.GeneratorProperty.VO_PACKAGE;

/**
 * @author cjq
 * @date 2019-09-17
 */
public class MapperGeneratorImpl extends AbstractBackendGenerator {
    @Override
    protected HashMap<String, String> getTemplateProperties() {
        HashMap<String, String> map = Maps.newHashMap();
        map.put("pageList", getPageList());
        map.put("pageCount", getPageCount());
        map.put("sqlList", getSqlList());
        map.put("mapperPackage", getPackageFileName());
        map.put("voPackage", VO_PACKAGE);
        map.put("entityPackage", VO_PACKAGE);
        map.put("tableName", TABLE_NAME);
        map.putAll(getBackendCommonProperties());
        return map;
    }

    @Override
    protected String getFileName() {
        return ACTION_NAME + "Mapper";
    }

    @Override
    protected String getFileNameSuffix() {
        return ".xml";
    }

    @Override
    protected String getPackageType() {
        return "sqlmapper";
    }

    @Override
    protected String getTemplateName() {
        return TEMPLATE_FOLDER + "Mapper.ftl";
    }

    @Override
    protected String getModuleSign() {
        return "service";
    }

    public static String getPageList() {
        return "find" + ACTION_NAME + "List";
    }

    public static String getPageCount() {
        return "count" + ACTION_NAME;
    }

    private String getSqlList() {
        return "sql" + ACTION_NAME;
    }

    @Override
    protected String getPackagePath() {
        return RESOURCES_PATH + "/" + getPackageName().replace(".", "/");
    }
}
