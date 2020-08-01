package ${packageName};

import com.google.common.collect.Maps;
import com.${packageSign}.framework.mybatis.dao.pojo.Page;
import com.${packageSign}.framework.mybatis.service.impl.BaseServiceImpl;
import ${voPackage};
<#if hasForm == '1'>
import ${entityPackage};
import ${packagePrefix}.sys.vo.UserVOExt;
import com.${packageSign}.framework.base.utils.DateUtils;
import com.${packageSign}.framework.base.vo.BaseVO;
import com.${packageSign}.framework.base.utils.BeanUtils;
import com.${packageSign}.framework.base.utils.StringUtils;
import java.util.stream.Collectors;
</#if>
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * ${title} 接口实现类
 *
 * @author ${author}
 * @date ${date}
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class ${serviceName} extends BaseServiceImpl implements ${interfaceName} {

    private static final String MAPPER_NAMESPACE = "${mapperPackage}";

    @Override
    public Page ${getPageMethodName}(Page page, ${condition} condition) {
        Map<String, Object> params = Maps.newHashMap();
        params.put("page", page);
        params.put("condition", condition);
        List<${vo}> list = this.getMyBatisDao().selectListBySql(MAPPER_NAMESPACE + ".${pageList}", params);
        int count = this.getMyBatisDao().selectOneBySql(MAPPER_NAMESPACE + ".${pageCount}", params);
        if (page == null) {
            page = new Page();
        }
        page.setTotalRecord(count);
        page.setRecords(list);
        return page;
    }

    @Override
    public List<${vo}> ${pageList}(${condition} condition) {
        Map<String, Object> params = Maps.newHashMap();
        params.put("condition", condition);
        return this.getMyBatisDao().selectListBySql(MAPPER_NAMESPACE + ".${pageList}", params);
    }

    @Override
    public ${vo} get${actionName}ByParam(${condition} condition) {
        Map<String, Object> params = Maps.newHashMap();
        params.put("condition", condition);
        return this.getMyBatisDao().selectOneBySql(MAPPER_NAMESPACE + ".${pageList}", params);
    }

    <#if hasForm == '1'>
    @Override
    public void save${actionName}List(List<${vo}> list, UserVOExt user) {
        if (list == null) {
            return;
        }

        List<${entity}> entities = BeanUtils.copyToNewList(list, ${entity}.class);

        addList(entities, user.getId());
        updateList(entities, user.getId());
        deleteList(entities);
    }

    private void addList(List<${entity}> list, String userId) {
        List<${entity}> newList = list.stream().filter(entity -> entity.getRowState().equals(BaseVO.RowStateEnum.ADDED.getValue()))
                .peek(entity -> {
                    entity.setId(null);
                    entity.setCreateTs(DateUtils.getCurrentDate());
                    entity.setCreateUserId(userId);
                }).collect(Collectors.toList());

        if (newList.size() > 0) {
            this.insertList(newList);
        }
    }

    private void updateList(List<${entity}> list, String userId) {
        List<${entity}> newList = list.stream().filter(entity -> entity.getRowState().equals(BaseVO.RowStateEnum.MODIFIED.getValue()))
                .peek(entity -> {
                    entity.setUpdateTs(DateUtils.getCurrentDate());
                    entity.setUpdateUserId(userId);
                }).collect(Collectors.toList());

        if (newList.size() > 0) {
            this.update(newList);
        }
    }

    private void deleteList(List<${entity}> list) {
        List<${entity}> newList = list.stream().filter(entity -> entity.getRowState().equals(BaseVO.RowStateEnum.DELETED.getValue()))
                .collect(Collectors.toList());

        if (newList.size() > 0) {
            this.delete(newList);
        }
    }

    @Override
    public ${vo} ${getVoById}(String id) {
        Map<String, Object> params = Maps.newHashMap();
        ${condition} condition = new ${condition}();
        condition.setId(id);
        params.put("condition", condition);
        return this.getMyBatisDao().selectOneBySql(MAPPER_NAMESPACE + ".${pageList}", params);
    }

    @Override
    public ${vo} save${actionName}(${vo} vo, UserVOExt user) {
        ${entity} entity = BeanUtils.copyToNewBean(vo, ${entity}.class);
        if (StringUtils.isEmpty(vo.getId())) {
            entity.setId(null);
            entity.setCreateUserId(user.getId());
            entity.setCreateTs(DateUtils.getCurrentDate());
        } else {
            entity.setUpdateTs(DateUtils.getCurrentDate());
            entity.setUpdateUserId(user.getId());
        }
        return BeanUtils.copyToNewBean(this.saveWithQuery(entity), ${vo}.class);
    }

    @Override
    public void delete${actionName}(String id) {
        ${entity} entity = new ${entity}();
        entity.setId(id);
        delete(entity);
    }
    </#if>
}
