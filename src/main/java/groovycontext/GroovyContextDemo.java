package groovycontext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.GenericGroovyApplicationContext;

public class GroovyContextDemo {
    public static void main(String[] args) {
        AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext();
        ctx.register(GroovyConfig.class);
        ctx.refresh();
    }
}
