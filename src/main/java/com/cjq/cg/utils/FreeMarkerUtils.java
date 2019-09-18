package com.cjq.cg.utils;

import freemarker.template.Configuration;
import freemarker.template.TemplateExceptionHandler;

import java.io.File;
import java.io.IOException;

/**
 * @author cjq
 */
public class FreeMarkerUtils {

    private static Configuration configuration = null;

    /**
     * 获取 Freemarker 模板环境配置
     *
     * @return 配置
     */
    public static Configuration getFreemarkerConfiguration(String templatePath) {
        if (configuration == null) {
            configuration = initFreemarkerConfiguration(templatePath);
        }
        return configuration;
    }

    /**
     * Freemarker 模板环境配置
     *
     * @return 配置
     */
    private static Configuration initFreemarkerConfiguration(String templatePath) {
        Configuration cfg;
        try {
            cfg = new Configuration(Configuration.VERSION_2_3_23);
            cfg.setDirectoryForTemplateLoading(new File(templatePath));
            cfg.setDefaultEncoding("UTF-8");
            cfg.setTemplateExceptionHandler(TemplateExceptionHandler.IGNORE_HANDLER);
        } catch (IOException e) {
            throw new RuntimeException("Freemarker 模板环境初始化异常!", e);
        }
        return cfg;
    }

}
