package com.cjq.cg.service.base;

import com.cjq.cg.service.intf.IGenerator;
import com.cjq.cg.utils.FreeMarkerUtils;
import com.google.common.collect.Maps;
import freemarker.template.Configuration;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.FileWriter;
import java.util.HashMap;

import static com.cjq.cg.service.base.GeneratorProperty.FILE_AUTHOR;
import static com.cjq.cg.service.base.GeneratorProperty.FILE_DATE;
import static com.cjq.cg.service.base.GeneratorProperty.FILE_TITLE;
import static com.cjq.cg.service.base.GeneratorProperty.JAVA_PATH;
import static com.cjq.cg.service.base.GeneratorProperty.PACKAGE_PREFIX;
import static com.cjq.cg.service.base.GeneratorProperty.PACKAGE_SIGN;
import static com.cjq.cg.service.base.GeneratorProperty.PACKAGE_SUFFIX;
import static com.cjq.cg.service.base.GeneratorProperty.PROJECT_NAME;
import static com.cjq.cg.service.base.GeneratorProperty.PROJECT_PATH;
import static com.cjq.cg.service.base.GeneratorProperty.TEMPLATE_PATH;
import static com.cjq.cg.service.base.GeneratorProperty.VO_NAME;
import static com.cjq.cg.service.base.GeneratorProperty.VO_PACKAGE;

/**
 * @author cjq
 */
public abstract class BaseGenerator implements IGenerator {

    protected static final Logger logger = LoggerFactory.getLogger(BaseGenerator.class);

    @Override
    public void generate() {
        Configuration cfg = FreeMarkerUtils.getFreemarkerConfiguration(getTemplatePath());

        String pathName = getPathName();

        HashMap<String, String> data = getBaseTemplateProperties();
        try {
            // 创建 Service 接口
            File file = new File(pathName);
            // 查看父级目录是否存在, 不存在则创建
            if (!file.getParentFile().exists()) {
                file.getParentFile().mkdirs();
            }
            cfg.getTemplate(getTemplateName()).process(data, new FileWriter(file));
            logger.info(pathName + " 生成成功!");
        } catch (Exception e) {
            throw new RuntimeException("生成失败!", e);
        }
    }

    static {
        GeneratorProperty.init();
    }

    private HashMap<String, String> getBaseTemplateProperties() {
        HashMap<String, String> map = Maps.newHashMap();
        map.putAll(getTemplateProperties());
        map.put("title", FILE_TITLE);
        map.put("author", FILE_AUTHOR);
        map.put("date", FILE_DATE);
        return map;
    }

    protected void getBackendProperties(HashMap<String, String> map) {
        map.put("packageName", getPackageName());
        map.put("packageSign", PACKAGE_SIGN);
        map.put("packagePrefix", PACKAGE_PREFIX);
        map.put("condition", VO_NAME);
        map.put("vo", VO_NAME);
        map.put("voPackage", VO_PACKAGE);
    }

    private String getTemplatePath() {
        return System.getProperty("user.dir") + TEMPLATE_PATH;
    }

    private String getPathName() {
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
