package com.air.web.dummy;

import com.air.service.AirAutowired;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Hashtable;
import java.util.Map;

/**
 * create at: 11-7-11
 *
 * @author Yonghui Chen
 */
public class AutoBeanFactory {
    private static AutoBeanFactory factory;
    private static String impl = null;
    private static final Object NULL = new Object();

    public static void setImpl(String impl) {
        AutoBeanFactory.impl = impl;
        factory = null;
    }

    public static AutoBeanFactory getFactory() {
        if (factory == null) {
            synchronized (AutoBeanFactory.class) {
                if (factory == null) {
                    if (impl == null) {
                        factory = new AutoBeanFactory() {

                        };
                    } else {
                        try {
                            factory = (AutoBeanFactory) Class.forName(impl).newInstance();
                        } catch (Exception e) {
                            throw new IllegalArgumentException(impl);
                        }
                    }
                }
            }
        }
        return factory;
    }

    private Map<String, Object> beans = new Hashtable<String, Object>();

    public Object getBean(String name) {
        try {
            return getBean(Class.forName(name));
        } catch (ClassNotFoundException e) {
            return null;
        }
    }

    public <T> T getBean(Class<T> clazz) {
        T cached = (T) beans.get(clazz.getName());
        if (cached != null) return cached == NULL ? null : (T) cached;
        if (clazz.isInterface() || Modifier.isAbstract(clazz.getModifiers())) {
/*
            Impl ann = clazz.getAnnotation(Impl.class);
            String className = (ann == null) ? clazz.getPackage().getName() + ".impl."
                    + clazz.getSimpleName() + "Impl" : ann.value();
            try {
                cached = (T) Class.forName(className).newInstance();
            } catch (InstantiationException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
*/
        } else {
            try {
                cached = clazz.newInstance();
            } catch (InstantiationException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        }
        if (cached != null) {
            doAutoWired(cached);
        }
        beans.put(clazz.getName(), cached == null ? NULL : cached);
        return cached;
    }

    public void doAutoWired(Object object) {
        Class<? extends Object> clz = object.getClass();
        Method[] methods = clz.getMethods();
        for (Method method : methods) {
            if (method.getName().startsWith("set") && method.getParameterTypes().length == 1) {
                AirAutowired annotation = method.getAnnotation(AirAutowired.class);
                if (annotation != null) {
                    Object bean = getBean(method.getParameterTypes()[0]);
                    if (bean != null) {
                        try {
                            method.invoke(object, bean);
                        } catch (IllegalAccessException e) {
                            e.printStackTrace();
                        } catch (InvocationTargetException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        }

        while (clz != Object.class) {
            Field[] declaredFields = clz.getDeclaredFields();
            for (Field declaredField : declaredFields) {
                AirAutowired annotation = declaredField.getAnnotation(AirAutowired.class);
                if (annotation != null) {
                    Object bean = getBean(declaredField.getType());
                    if (bean == null) continue;
                    if (!declaredField.isAccessible()) {
                        declaredField.setAccessible(true);
                    }
                    try {
                        declaredField.set(object, bean);
                    } catch (IllegalAccessException e1) {
                        e1.printStackTrace();
                    }
                }
            }
            clz = clz.getSuperclass();
        }
    }
}
