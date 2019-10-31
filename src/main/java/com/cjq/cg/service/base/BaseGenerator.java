package com.cjq.cg.service.base;

import com.cjq.cg.service.intf.IGenerator;
import com.cjq.cg.utils.FreeMarkerUtils;
import com.google.common.collect.Maps;
import freemarker.template.Configuration;
import org.apache.commons.lang.time.DateFormatUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.FileWriter;
import java.util.Date;
import java.util.HashMap;

import static com.cjq.cg.service.base.GeneratorProperty.ACTION_NAME;
import static com.cjq.cg.service.base.GeneratorProperty.FILE_AUTHOR;
import static com.cjq.cg.service.base.GeneratorProperty.FILE_TITLE;
import static com.cjq.cg.service.base.GeneratorProperty.HAS_FORM;
import static com.cjq.cg.service.base.GeneratorProperty.JAVA_PATH;
import static com.cjq.cg.service.base.GeneratorProperty.PACKAGE_PREFIX;
import static com.cjq.cg.service.base.GeneratorProperty.PACKAGE_SUFFIX;
import static com.cjq.cg.service.base.GeneratorProperty.PROJECT_NAME;
import static com.cjq.cg.service.base.GeneratorProperty.PROJECT_PATH;
import static com.cjq.cg.service.base.GeneratorProperty.TEMPLATE_PATH;

/**
 * @author cjq
 */
public abstract class BaseGenerator implements IGenerator {

    protected static final Logger logger = LoggerFactory.getLogger(BaseGenerator.class);

    static {
        GeneratorProperty.init();
    }

    @Override
    public void generate() {
        Configuration cfg = FreeMarkerUtils.getFreemarkerConfiguration(getTemplatePath());

        String filePath = getFilePath();

        HashMap<String, String> data = getBaseTemplateProperties();
        try {
            File file = new File(filePath);
            if (!file.getParentFile().exists()) {
                file.getParentFile().mkdirs();
            }
            cfg.getTemplate(getTemplateName()).process(data, new FileWriter(file));
            logger.info(filePath + " Generated!");
        } catch (Exception e) {
            throw new RuntimeException("Generate Failed!", e);
        }
    }

    private HashMap<String, String> getBaseTemplateProperties() {
        HashMap<String, String> map = Maps.newHashMap();
        map.putAll(getTemplateProperties());
        map.put("title", FILE_TITLE);
        map.put("author", FILE_AUTHOR);
        map.put("date", getDate());
        map.put("hasForm", HAS_FORM);
        map.put("actionName", ACTION_NAME);
        return map;
    }

    private String getDate() {
        return DateFormatUtils.format(new Date(), "yyyy/MM/dd");
    }

    private String getTemplatePath() {
        return System.getProperty("user.dir") + TEMPLATE_PATH;
    }

    private String getFilePath() {
        return PROJECT_PATH + "/" + getModuleName() + getPackagePath() + "/" + getFileName() + getFileNameSuffix();
    }

    private String getModuleName() {
        return PROJECT_NAME + "-" + getModuleSign();
    }

    public String getPackageName() {
        return PACKAGE_PREFIX + "." + PACKAGE_SUFFIX.replace("${type}", getPackageType());
    }

    public String getPackageFileName() {
        return getPackageName() + "." + getFileName();
    }

    protected String getPackagePath() {
        return JAVA_PATH + "/" + getPackageName().replace(".", "/");
    }

    /**
     * 获取模板字段
     *
     * @return HashMap
     */
    protected abstract HashMap<String, String> getTemplateProperties();

    /**
     * 获取文件名称
     *
     * @return 文件名称
     */
    protected abstract String getFileName();

    /**
     * 获取文件名后缀
     *
     * @return 文件名后缀
     */
    protected abstract String getFileNameSuffix();

    /**
     * 获取包类别
     *
     * @return 类别
     */
    protected abstract String getPackageType();

    /**
     * 获取模板名称
     *
     * @return 模板名称
     */
    protected abstract String getTemplateName();

    /**
     * 获取模块标识
     *
     * @return 模板标识
     */
    protected abstract String getModuleSign();
}
