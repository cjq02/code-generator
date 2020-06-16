package ${packageName};

import com.${packageSign}.framework.exception.BusinessException;
import com.${packageSign}.framework.mybatis.dao.pojo.Page;
import ${voPackage};
<#if hasForm =='1'>
import ${packagePrefix}.sys.vo.UserVOExt;
import java.util.List;
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
     * @throws BusinessException 业务异常
     */
    Page ${getPageMethodName}(Page page, ${condition} condition) throws BusinessException;

    /**
     * 根据条件获取一条记录
     *
     * @param condition 查询条件
     * @return 实体
     * @throws BusinessException 业务异常
     */
    ${vo} get${actionName}ByParam(${condition} condition) throws BusinessException;

    <#if hasForm =='1'>
    /**
     * 保存
     *
     * @param list   列表
     * @param userId 用户ID
     * @throws BusinessException 业务异常
     */
    void save${actionName}(List<${vo}> list, String userId) throws BusinessException;

    /**
     * 根据ID获取实体
     *
     * @param id 主键
     * @return 实体
     * @throws BusinessException 业务异常
     */
    ${vo} ${getVoById}(String id) throws BusinessException;

     /**
     * 保存
     *
     * @param vo 实体
     * @param user 用户
     * @return 实体
     * @throws BusinessException 业务异常
     */
    ${vo} save${actionName}(${vo} vo, UserVOExt user) throws BusinessException;

     /**
     * 删除
     *
     * @param id 主键
     * @throws BusinessException 业务异常
     */
    void delete${actionName}(String id) throws BusinessException;
    </#if>

}
