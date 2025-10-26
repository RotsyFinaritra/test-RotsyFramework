package com.test;

import java.io.File;
import java.io.IOException;
import java.lang.annotation.Annotation;
import java.net.URL;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Set;

public class ManualAnnotationScanner {

    @SafeVarargs
    public static Set<Class<?>> findAnnotatedClasses(String basePackage, Class<? extends Annotation>... annotations) {
        Set<Class<?>> result = new HashSet<>();
        String path = basePackage.replace('.', '/');
        try {
            ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
            Enumeration<URL> resources = classLoader.getResources(path);

            while (resources.hasMoreElements()) {
                File directory = new File(resources.nextElement().getFile());
                if (directory.exists()) {
                    findClassesInDirectory(directory, basePackage, result, annotations);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return result;
    }

    private static void findClassesInDirectory(File directory, String packageName,
                                               Set<Class<?>> result, Class<? extends Annotation>[] annotations) {
        for (File file : directory.listFiles()) {
            if (file.isDirectory()) {
                findClassesInDirectory(file, packageName + "." + file.getName(), result, annotations);
            } else if (file.getName().endsWith(".class")) {
                String className = packageName + '.' + file.getName().substring(0, file.getName().length() - 6);
                try {
                    Class<?> cls = Class.forName(className);
                    for (Class<? extends Annotation> ann : annotations) {
                        if (cls.isAnnotationPresent(ann)) {
                            result.add(cls);
                            break;
                        }
                    }
                } catch (Throwable ignored) {
                }
            }
        }
    }

}
