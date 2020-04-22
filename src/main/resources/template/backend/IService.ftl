package ${packageName};

import com.${packageSign}.framework.mybatis.dao.pojo.Page;
import ${voPackage};
<#if hasForm =='2'>
import java.util.List;
</#if>
<#if hasForm =='1'>
import ${packagePrefix}.sys.vo.UserVOExt;
</#if>

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

    <#if hasForm =='2'>
    /**
     * 保存
     *
     * @param list   列表
     * @param userId 用户ID
     */
    void save${actionName}(List<${vo}> list, String userId);
    </#if>

    <#if hasForm =='1'>
    /**
     * 根据ID获取实体
     *
     * @param id 主键
     * @return 实体
     */
    ${vo} ${getVoById}(String id);

     /**
     * 保存
     *
     * @param vo 实体
     * @param user 用户
     * @return 实体
     */
    ${vo} save${actionName}(${vo} vo, UserVOExt user);

     /**
     * 删除
     *
     * @param id 主键
     */
    void delete${actionName}(String id);
    </#if>

}
