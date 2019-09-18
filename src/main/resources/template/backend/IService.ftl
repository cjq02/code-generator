package ${packageName};

import com.${packageSign}.framework.mybatis.dao.pojo.Page;
import ${voPackage};

/**
 * ${title} 接口
 *
 * @author ${author}
 * @date ${date}
 */
public interface ${interfaceName} {

    /**
     * 页面列表
     *
     * @param page 页面
     * @param condition 查询条件
     * @return 列表
     */
    Page ${getPageMethodName}(Page page, ${condition} condition);
}
