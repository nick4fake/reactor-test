package groovycontext;

import org.springframework.stereotype.Component;

@Component
public class WiredClass {

    public String field = "yoooooo";

    public WiredClass() {
        System.out.println("zzz");
    }
}
