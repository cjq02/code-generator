package ${packageName};

import com.google.common.collect.Maps;
import com.${packageSign}.framework.mybatis.dao.pojo.Page;
import com.${packageSign}.framework.mybatis.service.impl.BaseServiceImpl;
import ${voPackage};
<#if hasForm == '2'>
import com.${packageSign}.framework.base.utils.BeanUtils;
import com.${packageSign}.framework.base.utils.DateUtils;
import com.${packageSign}.framework.base.vo.BaseVO;
</#if>
<#if hasForm == '1'>
import ${entityPackage};
import ${packagePrefix}.sys.vo.UserVOExt;
import com.${packageSign}.framework.base.utils.BeanUtils;
import com.${packageSign}.framework.base.utils.StringUtils;
import ${packagePrefix}.util.DateUtils;
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

    <#if hasForm == '2'>
    @Override
    public void save(List<${vo}> list, String userId) {

        if (list == null) {
            return;
        }

        addList(list, userId);
        updateList(list, userId);
        deleteList(list);
    }

    private void addList(List<${vo}> list, String userId) {
        List<${vo}> newList = list.stream().filter(vo -> vo.getRowState().equals(BaseVO.RowStateEnum.ADDED.getValue()))
                .peek(vo -> {
                    vo.setId(null);
                    vo.setCreateTs(DateUtils.getCurrentDate());
                    vo.setCreateUserId(userId);
                }).collect(Collectors.toList());

        if (newList.size() > 0) {
            this.insertList(BeanUtils.copyToNewList(newList, ${entity}.class));
        }
    }

    private void updateList(List<${vo}> list, String userId) {
        List<${vo}> newList = list.stream().filter(vo -> vo.getRowState().equals(BaseVO.RowStateEnum.MODIFIED.getValue()))
                .peek(vo -> {
                    vo.setUpdateTs(DateUtils.getCurrentDate());
                    vo.setUpdateUserId(userId);
                }).collect(Collectors.toList());

        if (newList.size() > 0) {
            this.update(BeanUtils.copyToNewList(newList, ${entity}.class));
        }
    }

    private void deleteList(List<${vo}> list) {
        List<${vo}> newList = list.stream().filter(vo -> vo.getRowState().equals(BaseVO.RowStateEnum.DELETED.getValue()))
                .collect(Collectors.toList());

        if (newList.size() > 0) {
            this.delete(BeanUtils.copyToNewList(newList, ${entity}.class));
        }
    }
    </#if>

    <#if hasForm == '1'>
    @Override
    public ${vo} ${getVoById}(String id) {
        Map<String, Object> params = Maps.newHashMap();
        ${condition} condition = new ${condition}();
        condition.setId(id);
        params.put("condition", condition);
        return this.getMyBatisDao().selectOneBySql(MAPPER_NAMESPACE + ".${getVoById}", params);
    }

    @Override
    public ${vo} save(${vo} vo, UserVOExt user) {
        ${entity} entity = BeanUtils.copyToNewBean(vo, ${entity}.class);
        if (StringUtils.isEmpty(vo.getId())) {
            entity.setId(null);
            entity.setCreateUserId(user.getId());
            entity.setCreateTs(DateUtils.getCurrentTime());
            /*entity.setCorpId(user.getCorpId());*/
        } else {
            entity.setUpdateTs(DateUtils.getCurrentTime());
            entity.setUpdateUserId(user.getId());
        }
        return BeanUtils.copyToNewBean(this.saveWithQuery(entity), ${vo}.class);
    }

    @Override
    public void delete(String id) {
        ${entity} entity = new ${entity}();
        entity.setId(id);
        delete(entity);
    }
    </#if>
}
