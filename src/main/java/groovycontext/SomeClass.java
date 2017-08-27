package groovycontext;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class SomeClass implements InitializingBean {
    @Autowired(required = true)
    WiredClass wiredClass;

    @Override
    public void afterPropertiesSet() throws Exception {
        System.out.println("init");
        System.out.println(this.wiredClass);
        System.out.println(this.wiredClass.field);
    }
}
