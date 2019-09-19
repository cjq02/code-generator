package com.cjq.cg.service.impl.backend;

import com.cjq.cg.service.base.BaseGenerator;
import com.google.common.collect.Maps;

import java.util.HashMap;

import static com.cjq.cg.service.base.GeneratorProperty.PACKAGE_PREFIX;
import static com.cjq.cg.service.base.GeneratorProperty.PACKAGE_SIGN;
import static com.cjq.cg.service.base.GeneratorProperty.VO_PACKAGE;

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
        return map;
    }

    private String getVoName() {
        String[] arr = VO_PACKAGE.split("\\.");
        return arr[arr.length - 1];
    }

}
