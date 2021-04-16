package com.cjq.cg.service.director;

import com.cjq.cg.service.impl.backend.ControllerGeneratorImpl;
import com.cjq.cg.service.impl.backend.MapperGeneratorImpl;
import com.cjq.cg.service.impl.backend.ServiceGeneratorImpl;
import com.cjq.cg.service.impl.backend.ServiceIntfGeneratorImpl;
import com.cjq.cg.service.impl.frontend.JsFormGeneratorImpl;
import com.cjq.cg.service.impl.frontend.JsPageGeneratorImpl;
import com.cjq.cg.service.impl.frontend.JspFormGeneratorImpl;
import com.cjq.cg.service.impl.frontend.JspPageGeneratorImpl;
import com.cjq.cg.service.intf.IGenerator;
import com.cjq.cg.utils.Constants;

import java.util.ArrayList;
import java.util.List;

import static com.cjq.cg.service.base.GeneratorProperty.HAS_FORM;

/**
 * @author cjq
 * @date 2019/09/18
 */
public class GeneratorDirector {

    public static void run() {
        List<IGenerator> iGeneratorList = new ArrayList<>();
        addBackendGenerator(iGeneratorList);
        addFrontendGenerator(iGeneratorList);
        iGeneratorList.forEach(IGenerator::generate);
    }

    private static void addFrontendGenerator(List<IGenerator> iGeneratorList) {
        iGeneratorList.add(new JsPageGeneratorImpl());
        iGeneratorList.add(new JspPageGeneratorImpl());
        if (HAS_FORM.equals(Constants.YES)) {
            iGeneratorList.add(new JsFormGeneratorImpl());
            iGeneratorList.add(new JspFormGeneratorImpl());
        }
    }

    private static void addBackendGenerator(List<IGenerator> iGeneratorList) {
        iGeneratorList.add(new MapperGeneratorImpl());
        iGeneratorList.add(new ServiceIntfGeneratorImpl());
        iGeneratorList.add(new ServiceGeneratorImpl());
        iGeneratorList.add(new ControllerGeneratorImpl());
    }

}
