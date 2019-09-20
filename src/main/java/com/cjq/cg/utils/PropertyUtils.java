package com.cjq.cg.utils;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.Properties;

/**
 * @author cjq
 */
public class PropertyUtils {

    /**
     * 加载配置文件
     *
     * @return 属性
     */
    public static Properties loadProperties() {
        Properties prop;
        try {
            prop = new Properties();
            InputStream in = PropertyUtils.class.getClassLoader().getResourceAsStream("generatorConfig.properties");
            assert in != null;
            prop.load(new InputStreamReader(in, StandardCharsets.UTF_8));
        } catch (Exception e) {
            throw new RuntimeException("加载配置文件异常!", e);
        }
        return prop;
    }


}
