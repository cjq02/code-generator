package ${packageName};

import com.${packageSign}.framework.mybatis.dao.pojo.Page;
import com.${packageSign}.framework.spring.web.bind.annotation.JsonPathParam;
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
    public String init(Model model) {
        return "${rootPath}";
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

}
