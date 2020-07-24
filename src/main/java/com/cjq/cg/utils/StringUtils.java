package com.cjq.cg.utils;

import com.google.common.base.CaseFormat;

/**
 * @author cjq
 */
public class StringUtils extends org.apache.commons.lang.StringUtils {

    public static String decapitalize(String name) {
        return com.sun.xml.internal.ws.util.StringUtils.decapitalize(name);
    }

    public static String capitalize(String name) {
        return com.sun.xml.internal.ws.util.StringUtils.capitalize(name);
    }

    public static String camelCaseToSnakeCase(String camelCaseStr) {
        System.out.println(CaseFormat.UPPER_UNDERSCORE.to(CaseFormat.UPPER_CAMEL, "input_in_snake_case"));
        return CaseFormat.LOWER_CAMEL.to(CaseFormat.LOWER_UNDERSCORE, camelCaseStr);
    }

}
