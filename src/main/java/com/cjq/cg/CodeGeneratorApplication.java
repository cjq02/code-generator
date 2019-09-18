package com.cjq.cg;

import com.cjq.cg.service.director.GeneratorDirector;
import org.apache.log4j.BasicConfigurator;

/**
 * @author cjq
 * @date 2019/09/17
 */
public class CodeGeneratorApplication {

    public static void main(String[] args) {
        BasicConfigurator.configure();
        GeneratorDirector.run();
    }

}
