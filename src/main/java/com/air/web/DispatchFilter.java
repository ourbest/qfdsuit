package com.air.web;


import com.air.persist.util.DateTimeConverter;
import com.air.web.dummy.AutoBeanFactory;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.codehaus.jackson.map.ObjectMapper;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.annotation.Annotation;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

//import com.cutt.web.annotation.*;

/**
 * create at: 11-7-9
 *
 * @author Yonghui Chen
 */
public class DispatchFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        ConvertUtils.register(new DateTimeConverter(), Date.class);
    }

    ObjectMapper mapper = new ObjectMapper();

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        String requestURI = req.getRequestURI();
        Object a = request.getAttribute("__IN_" + requestURI);
        if (a != null) {
            chain.doFilter(request, response);
            return;
        }
        request.setAttribute("__IN_" + requestURI, "a");
        HttpServletResponse resp = (HttpServletResponse) response;
        req.setCharacterEncoding("utf-8");
        String uri = "/".equals(requestURI) ? "/index.html" : requestURI;
        String path = req.getSession().getServletContext().getRealPath(uri);
        File f = new File(path);


        if (f.exists()) {
            chain.doFilter(request, response);
        } else {
            String contextPath = req.getContextPath();

            if (contextPath.length() == 0) {
                uri = uri.substring(1);
            } else if (uri.startsWith(contextPath)) {
                uri = uri.substring(contextPath.length());
            }

            int i = StringUtils.lastIndexOf(uri, ".");
            String p = StringUtils.substring(uri, 0, i);
            ActionStack action = searchAction(p);
            if (action != null) {
                try {
                    if (uri.endsWith(".js")) {
                        response.setContentType("text/javascript");
                        response.setCharacterEncoding("utf-8");
                        Method[] methods = action.object.getClass().getMethods();
                        String[] strings = p.split("/");

                        PrintWriter out = response.getWriter();
                        String pkg = StringUtils.join(strings, ".");
                        out.println("rpc.addPackage('" + pkg + "');");

                        for (Method method : methods) {
                            if(Object.class.equals(method.getDeclaringClass())) continue;
                            out.println("rpc.addMethod('" + pkg + "', '" + method.getName() + "');");
                        }
                    } else {
                        Object ret = invokeAction(action, req, resp);
                        req.setAttribute("data", ret);
                        if (uri.endsWith(".json")) {
                            response.setCharacterEncoding("utf-8");
                            response.setContentType("application/json");
                            mapper.writeValue(resp.getOutputStream(), ret);
                        } else {
                            String jspFile = "/WEB-INF/jsp/" + StringUtils.replace(p, ".", "/") + ".jsp";
                            String realPath = req.getSession().getServletContext().getRealPath(jspFile);
                            File jFile = new File(realPath);
                            if (jFile.exists()) {
                                req.getRequestDispatcher(jspFile).forward(req, resp);
                            } else {
                                System.out.println("Jsp file not found: " + jFile);
                            }
                        }
                    }
                } catch (ParseException e) {
                    e.printStackTrace();
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                } catch (InstantiationException e) {
                    e.printStackTrace();
                } catch (InvocationTargetException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private Object invokeAction(ActionStack action, HttpServletRequest request, HttpServletResponse response) throws ServletException, ParseException, IllegalAccessException, InstantiationException, InvocationTargetException, IOException {

        String m = "execute";
        String[] p = action.rest;
        if (!ArrayUtils.isEmpty(action.rest)) {
            m = action.rest[0];
            p = (String[]) ArrayUtils.subarray(action.rest, 1, action.rest.length);
        }

        Method[] methods = action.object.getClass().getMethods();
        for (Method method : methods) {
            if (m.equals(method.getName())) {
                return callMethod(action, request, response, p, method);
            }
        }

        if (!"execute".equals(m)) {
            for (Method method : methods) {
                if ("execute".equals(method.getName())) {
                    return callMethod(action, request, response, action.rest, method);
                }
            }
        }
        return null;
    }

    private Object callMethod(ActionStack action, HttpServletRequest request, HttpServletResponse response, String[] p, Method method) throws ServletException, ParseException, InstantiationException, IllegalAccessException, InvocationTargetException, IOException {
        // 如果有同名，只有第一个
        Class<?>[] parameterTypes = method.getParameterTypes();
        Object[] params = new Object[parameterTypes.length];
        Annotation[][] annotations = method.getParameterAnnotations();
        Map<String, Object> parameterMap = getParameterMap(request);
        Iterator<String> it = Arrays.asList(p).iterator();
        Map<String, String> cookieMap = null;

        for (int i = 0; i < parameterTypes.length; i++) {
            Class<?> parameterType = parameterTypes[i];
            // request
            if (ServletRequest.class.isAssignableFrom(parameterType)) {
                params[i] = request;
            } else if (Principal.class.isAssignableFrom(parameterType)) {
                params[i] = request.getUserPrincipal();
            } else if (ServletResponse.class.isAssignableFrom(parameterType)) {
                // response
                params[i] = response;
            } else if (Map.class.isAssignableFrom(parameterType)) {
                // map 则传入request的内容
                params[i] = parameterMap;
            } else if (annotations[i].length > 0) {
                // 通过annotation指定参数来源
/*                Annotation ann = annotations[i][0];
                if (ann.annotationType() == RemoteUser.class) {
                    params[i] = request.getRemoteUser();
                } else if (ann.annotationType() == RequestParam.class) {
                    // request的参数
                    RequestParam param = (RequestParam) ann;
                    String name = param.value();
                    params[i] = convert(parameterType, parameterMap.get(name));
                } else if (CookieValue.class == ann.annotationType()) {
                    // cookie的值
                    CookieValue c = (CookieValue) ann;
                    String name = c.value();
                    if (cookieMap == null) {
                        cookieMap = makeCookieMap(request);
                    }
                    params[i] = convert(parameterType, cookieMap.get(name));
                } else if (SessionAttr.class == ann.annotationType()) {
                    // session的值
                    SessionAttr attr = (SessionAttr) ann;

                    params[i] = request.getSession().getAttribute(attr.value());
                } else if (RequestAttr.class == ann.annotationType()) {
                    // request attribute
                    RequestAttr attr = (RequestAttr) ann;

                    params[i] = request.getAttribute(attr.value());
                } else if (RequestVo.class == ann.annotationType() || Form.class == ann.annotationType()) {
                    // 一个值对象
                    if (parameterType.isInterface()
                            || Modifier.isAbstract(parameterType.getModifiers()))
                        throw new IllegalArgumentException("无法实例化对象");

                    Object vo;
                    if (parameterType == Object.class) {
                        throw new IllegalArgumentException("无法实例化未知对象");
                    } else {
                        vo = parameterType.newInstance();
                    }

                    BeanUtils.copyProperties(vo, parameterMap);
                    params[i] = vo;
                } else if (RequestHeader.class == ann.annotationType()) {
                    // cookie的值
                    RequestHeader c = (RequestHeader) ann;
                    String name = c.value();

                    String header = request.getHeader(name);
                    params[i] = convert(parameterType, header);
                } else if (RequestBody.class == ann.annotationType()) {
                    BufferedReader reader = null;
                    try {
                        reader = request.getReader();
                        params[i] = IOUtils.toString(reader);
                    } finally {
                        if (reader != null) reader.close();
                    }
                } else {
                    // 没有指定，则从uri获取的
                    if (it.hasNext()) {
                        params[i] = convert(parameterType, it.next());
                    }
                }*/
            } else if (com.air.web.util.Form.class.isAssignableFrom(parameterType)) {
                Object vo = parameterType.newInstance();
                BeanUtils.copyProperties(vo, parameterMap);
                params[i] = vo;
            } else {
                /*if (it.hasNext()) {
                    params[i] = convert(parameterType, it.next());
                }*/
                Object vo = parameterType.newInstance();
                BeanUtils.copyProperties(vo, parameterMap);
                params[i] = vo;
            }
        }
        return method.invoke(action.object, params);
    }

    private Map<String, String> makeCookieMap(HttpServletRequest request) {
        Map<String, String> ret = new HashMap<String, String>();
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                ret.put(cookie.getName(), cookie.getValue());
            }
        }
        return ret;
    }

    private Object convert(Class<?> parameterType, Object parameter) throws ParseException {
        try {
            if (parameter == null) {
                if (parameterType.isPrimitive()) {
                    if (parameterType == Boolean.TYPE) return false;
                    else return 0;
                } else {
                    return null;
                }
            }

            if (parameterType.isAssignableFrom(parameter.getClass())) {
                return parameter;
            }

            if (Integer.class == parameterType || Integer.TYPE == parameterType) {
                if (StringUtils.isBlank((String) parameter)) return 0;
                return Integer.parseInt((String) parameter);
            }

            if (Date.class == parameterType) {
                return !((String) parameter).contains(":") ? new SimpleDateFormat("y-MM-dd").parse((String) parameter)
                        : new SimpleDateFormat("y-MM-dd HH:mm").parse((String) parameter);
            }

            if (Long.class == parameterType || Long.TYPE == parameterType) {
                if (StringUtils.isBlank((String) parameter)) return 0;
                return Long.parseLong((String) parameter);
            }

            if (Boolean.class == parameterType || Boolean.TYPE == parameterType) {
                return "1".equals(parameter) || "true".equals(parameter);
            }

            if (parameterType.isArray()) {
                if (String[].class.equals(parameterType)) {
                    if (parameter.getClass().isArray()) return parameter;
                    return new String[]{(String) parameter};
                }
            }

            Constructor<?> constructor = parameterType.getConstructor(String.class);
            return constructor.newInstance(parameter);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    private Map<String, Object> getParameterMap(HttpServletRequest request) throws ServletException {
//        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
//        if (isMultipart && multipart) return parseUpload(request);
        Map<String, Object> parameterMap = new HashMap<String, Object>(request.getParameterMap());
        for (Map.Entry<String, Object> entry : parameterMap.entrySet()) {
            String[] a = (String[]) entry.getValue();
            if (a.length == 1) entry.setValue(a[0]);
        }
        return parameterMap;
    }

    private Map<String, Object> cached = new Hashtable<String, Object>();

    static class ActionStack {
        Object object;
        String[] rest;
        String name;
    }

    private ActionStack searchAction(String uri) {
        if (cached.containsKey(uri)) {
            Object o = cached.get(uri);
            ActionStack stack = new ActionStack();
            stack.object = o;
            stack.rest = new String[0];
            stack.name = uri.replace('/', '.');
            return stack;
        }
        String[] strings = StringUtils.split(uri, '/');
        int idx = 0;
        String cname = "";
        for (String string : strings) {
            idx++;
            try {
                String s = cname + string;
                ActionStack stack = new ActionStack();
                stack.name = s;
                stack.rest = (String[]) ArrayUtils.subarray(strings, idx, strings.length);

                Object o = cached.get(StringUtils.replace(s, ".", "/"));
                if (o != null) {
                    stack.object = o;
                }
                Class<?> aClass = Class.forName(getClass().getPackage().getName() + ".action." + cname
                        + StringUtils.capitalize(string) + "Action");
                stack.object = aClass.newInstance();
                AutoBeanFactory.getFactory().doAutoWired(stack.object);

                cached.put(StringUtils.replace(stack.name, ".", "/"), stack.object);
                return stack;
            } catch (ClassNotFoundException ignored) {
            } catch (InstantiationException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
            cname += string + ".";
        }
        return null;
    }

    @Override
    public void destroy() {

    }
}
