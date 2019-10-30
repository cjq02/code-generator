package ${packageName};

import com.${packageSign}.framework.mybatis.dao.pojo.Page;
import com.${packageSign}.framework.spring.web.bind.annotation.JsonPathParam;
import com.${packageSign}.framework.adapter.vo.ResponseResult;
import ${packagePrefix}.application.web.BaseController;
import ${interfacePath};
import ${voPackage};
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * ${title}
 *
 * @author ${author}
 * @date ${date}
 */
@Controller
@RequestMapping("${rootPath}")
public class ${controllerName} extends BaseController {

    @Autowired
    private ${interfaceName} ${interfaceAlias};

    @RequestMapping(value = "/page.htm")
    public String page() {
        return "${rootPath}";
    }

    @RequestMapping(value = "/form.htm")
    public String form(Model model, String id) {
        model.addAttribute("id", id);
        return "${rootPath}Form";
    }

    /**
     * 列表
     *
     * @param page 页面参数
     * @param condition 查询条件
     * @return 页面信息
     */
    @RequestMapping(value = "/${getPageMethodName}.json")
    @ResponseBody
    public Page ${getPageMethodName}(@JsonPathParam("$.pageInfo") Page page, @JsonPathParam("$.condition") ${condition} condition) {
        return ${interfaceAlias}.${getPageMethodName}(page, condition);
    }

    <#if hasForm == '1'>
    /**
     * 保存
     *
     * @param vo 实体
     * @return 响应结果
     */
    @RequestMapping(value = "/save.json")
    @ResponseBody
    public ResponseResult save(@JsonPathParam("$.vo") ${vo} vo) {
        try {
            ${interfaceAlias}.save(vo, getCurrentUser());
            return new ResponseResult("保存成功");
        } catch (Exception ex) {
            return new ResponseResult(false, null, "保存失败！");
        }
    }

    /**
     * 删除
     *
     * @param id 主键
     * @return 响应结果
     */
    @RequestMapping(value = "/delete.json")
    @ResponseBody
    public ResponseResult delete(String id) {
        try {
            ${interfaceAlias}.delete(id);
            return new ResponseResult("删除成功");
        } catch (Exception ex) {
            return new ResponseResult(false, null, "删除失败！");
        }
    }
    </#if>

}
