package com.cjq.cg.service.impl.backend;

import com.cjq.cg.service.base.BaseGenerator;
import com.cjq.cg.utils.StringUtils;
import com.google.common.collect.Maps;

import java.util.HashMap;

import static com.cjq.cg.service.base.GeneratorProperty.ENTITY_PACKAGE;
import static com.cjq.cg.service.base.GeneratorProperty.PACKAGE_PREFIX;
import static com.cjq.cg.service.base.GeneratorProperty.PACKAGE_SIGN;
import static com.cjq.cg.service.base.GeneratorProperty.VO_PACKAGE;
import static com.cjq.cg.service.impl.backend.MapperGeneratorImpl.getPageList;
import static com.cjq.cg.service.impl.backend.ServiceIntfGeneratorImpl.getPageMethodName;
import static com.cjq.cg.service.impl.backend.ServiceIntfGeneratorImpl.getVoById;

/**
 * @author cjq
 * @date 2019-09-18
 */
abstract class AbstractBackendGenerator extends BaseGenerator {

    protected static final String TEMPLATE_FOLDER = "backend/";

    protected HashMap<String, String> getBackendCommonProperties() {
        HashMap<String, String> map = Maps.newHashMap();
        map.put("packageName", getPackageName());
        map.put("packageSign", PACKAGE_SIGN);
        map.put("packagePrefix", PACKAGE_PREFIX);
        map.put("condition", getVoName());
        map.put("vo", getVoName());
        map.put("voPackage", VO_PACKAGE);
        map.put("entity", getEntityName());
        map.put("entityPackage", getEntityPackage());
        map.put("getPageMethodName", getPageMethodName());
        map.put("getVoById", getVoById());
        map.put("pageList", getPageList());

        return map;
    }

    private String getVoName() {
        String[] arr = VO_PACKAGE.split("\\.");
        return arr[arr.length - 1];
    }

    private String getEntityPackage() {
        if (StringUtils.isNotBlank(ENTITY_PACKAGE)) {
            return ENTITY_PACKAGE;
        }
        return VO_PACKAGE.replace("vo", "entity").replace("VOExt", "Entity").replace("VO", "Entity");
    }

    private String getEntityName() {
        String[] arr = getEntityPackage().split("\\.");
        return arr[arr.length - 1];
    }

}
