import java.util.Set;

import com.etu003184.annotation.Controller;
import com.etu003184.annotation.UrlMapping;
import com.test.ManualAnnotationScanner;
import com.test.TestUrlMapping;


public class Main {
    public static void main(String[] args) {
        TestUrlMapping test = new TestUrlMapping();
        System.out.println("Appel de la méthode annotée : " + test.test1());

        try {
            if (test.getClass().getDeclaredMethod("test1").isAnnotationPresent(UrlMapping.class)) {
                UrlMapping annotation = null;
                try {
                    annotation = test.getClass().getDeclaredMethod("test1").getAnnotation(UrlMapping.class);
                } catch (NoSuchMethodException | SecurityException e) {
                    e.printStackTrace();
                }
                if (annotation != null) {
                    System.out.println("Method Annotation value: " + annotation.value());
                }
            }
        } catch (NoSuchMethodException | SecurityException e) {
            e.printStackTrace();
        }

        Set<Class<?>> annotated = ManualAnnotationScanner.findAnnotatedClasses("com", Controller.class);
        annotated.forEach(c -> System.out.println("Classe trouvée : " + c.getName()));
    
    }
}
