import java.util.Set;

import com.etu003184.annotation.Controller;
import com.etu003184.annotation.UrlHandler;
import com.test.ManualAnnotationScanner;
import com.test.TestUrlHandler;


public class Main {
    public static void main(String[] args) {
        TestUrlHandler test = new TestUrlHandler();
        System.out.println("Appel de la méthode annotée : " + test.test1());

        try {
            if (test.getClass().getDeclaredMethod("test1").isAnnotationPresent(UrlHandler.class)) {
                UrlHandler annotation = null;
                try {
                    annotation = test.getClass().getDeclaredMethod("test1").getAnnotation(UrlHandler.class);
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

        Set<Class<?>> annotated = ManualAnnotationScanner.findAnnotatedClasses("com.test", Controller.class);
        annotated.forEach(c -> System.out.println("Classe trouvée : " + c.getName()));
    
    }
}
