package com.cjq.cg.service.director;

import com.cjq.cg.service.impl.backend.ControllerGeneratorImpl;
import com.cjq.cg.service.impl.frontend.JsGeneratorImpl;
import com.cjq.cg.service.impl.frontend.JspGeneratorImpl;
import com.cjq.cg.service.impl.backend.MapperGeneratorImpl;
import com.cjq.cg.service.impl.backend.ServiceGeneratorImpl;
import com.cjq.cg.service.impl.backend.ServiceIntfGeneratorImpl;
import com.cjq.cg.service.intf.IGenerator;

import java.util.ArrayList;
import java.util.List;

/**
 * @author cjq
 */
public class GeneratorDirector {

    public static void run() {
        List<IGenerator> iGeneratorList = new ArrayList<>();
        iGeneratorList.add(new MapperGeneratorImpl());
        iGeneratorList.add(new ServiceIntfGeneratorImpl());
        iGeneratorList.add(new ServiceGeneratorImpl());
        iGeneratorList.add(new ControllerGeneratorImpl());
        iGeneratorList.add(new JspGeneratorImpl());
        iGeneratorList.add(new JsGeneratorImpl());
        iGeneratorList.forEach(IGenerator::generate);
    }

}
