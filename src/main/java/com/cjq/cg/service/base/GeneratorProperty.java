package com.cjq.cg.service.base;

import com.cjq.cg.utils.PropertyUtils;

import java.util.Properties;

/**
 * @author cjq
 * @date 2019/09/17
 */
public class GeneratorProperty {

    public static String TEMPLATE_PATH;
    public static String PROJECT_PATH;
    public static String PROJECT_NAME;
    public static String RESOURCES_PATH;
    public static String JAVA_PATH;
    public static String ACTION_NAME;
    public static String PACKAGE_PREFIX;
    public static String PACKAGE_SUFFIX;
    public static String PACKAGE_SIGN;
    public static String FILE_TITLE;
    public static String FILE_AUTHOR;
    public static String FILE_DATE;
    public static String VO_PACKAGE;
    public static String ENTITY_PACKAGE;
    public static String HAS_FORM;

    static void init() {
        Properties properties = PropertyUtils.loadProperties();

        PROJECT_PATH = properties.getProperty("project.path");
        PROJECT_NAME = properties.getProperty("project.name");
        ACTION_NAME = properties.getProperty("action.name");
        PACKAGE_PREFIX = properties.getProperty("package.prefix");
        PACKAGE_SUFFIX = properties.getProperty("package.suffix");
        RESOURCES_PATH = properties.getProperty("resource.path");
        JAVA_PATH = properties.getProperty("java.path");
        TEMPLATE_PATH= properties.getProperty("template.file.path");
        FILE_TITLE = properties.getProperty("title");
        FILE_AUTHOR = properties.getProperty("author");
        FILE_DATE = properties.getProperty("date");
        PACKAGE_SIGN = properties.getProperty("package.sign");
        VO_PACKAGE = properties.getProperty("vo.package");
        ENTITY_PACKAGE = properties.getProperty("entity.package");
        HAS_FORM = properties.getProperty("hasForm");
    }

}
