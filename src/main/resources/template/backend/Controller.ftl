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
import org.springframework.web.bind.annotation.RequestMethod;
<#if hasForm == '1'>
import ${packagePrefix}.application.aspect.annotation.LogActuator;
import java.util.List;
</#if>

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
        return "${rootPath}Page";
    }

    <#if hasForm == '1'>
    @RequestMapping(value = "/form.htm")
    public String form(Model model, String id) {
        model.addAttribute("id", id);
        return "${rootPath}Form";
    }

    @RequestMapping(value = "/view.htm")
    public String view(Model model, String id) {
        model.addAttribute("id", id);
        return "${rootPath}View";
    }
    </#if>

    /**
     * 根据条件获取记录
     *
     * @param condition 查询条件
     * @return 响应结果
     */
    @RequestMapping(value = "/get${actionName}ByParam.json", method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult get${actionName}ByParam(@JsonPathParam("$.condition") ${condition} condition) {
        return new ResponseResult(${interfaceAlias}.get${actionName}ByParam(condition));
    }

    /**
     * 列表
     *
     * @param page 页面参数
     * @param condition 查询条件
     * @return 页面信息
     */
    @RequestMapping(value = "/${getPageMethodName}.json", method = RequestMethod.POST)
    @ResponseBody
    public Page ${getPageMethodName}(@JsonPathParam("$.pageInfo") Page page, @JsonPathParam("$.condition") ${condition} condition) {
        return ${interfaceAlias}.${getPageMethodName}(page, condition);
    }

    <#if hasForm == '1'>
    /**
     * 根据ID获取记录
     *
     * @param id 主键
     * @return 响应结果
     */
    @RequestMapping(value = "/${getVoById}.json", method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult ${getVoById}(String id) {
        return new ResponseResult(${interfaceAlias}.${getVoById}(id));
    }

    /**
     * 保存
     *
     * @param vo 实体
     * @return 响应结果
     */
    @RequestMapping(value = "/save${actionName}.json", method = RequestMethod.POST)
    @ResponseBody
    @LogActuator
    public ResponseResult save${actionName}(@JsonPathParam("$.vo") ${vo} vo) {
        return new ResponseResult("保存成功", ${interfaceAlias}.save${actionName}(vo, getCurrentUser()));
    }

    /**
     * 保存
     *
     * @param list 实体
     * @return 响应结果
     */
    @RequestMapping(value = "/save${actionName}List.json", method = RequestMethod.POST)
    @ResponseBody
    @LogActuator
    public ResponseResult save${actionName}List(@JsonPathParam("$.list") List<${vo}> list) {
        ${interfaceAlias}.save${actionName}List(list, getCurrentUser());
        return new ResponseResult("保存成功");
    }

    /**
     * 删除
     *
     * @param id 主键
     * @return 响应结果
     */
    @RequestMapping(value = "/delete${actionName}.json", method = RequestMethod.POST)
    @ResponseBody
    @LogActuator
    public ResponseResult delete${actionName}(String id) {
        ${interfaceAlias}.delete${actionName}(id);
        return new ResponseResult("删除成功");
    }
    </#if>

}
