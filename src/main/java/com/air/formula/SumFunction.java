package com.air.formula;

import com.googlecode.aviator.runtime.function.AbstractFunction;
import com.googlecode.aviator.runtime.function.FunctionUtils;
import com.googlecode.aviator.runtime.type.AviatorDouble;
import com.googlecode.aviator.runtime.type.AviatorObject;
import com.googlecode.aviator.runtime.type.AviatorString;

import java.util.Map;

/**
 * create at: 11-7-31
 *
 * @author Yonghui Chen
 */
public class SumFunction extends AbstractFunction {
    @Override
    public String getName() {
        return "sum";
    }

    private AviatorObject execute(Map<String, Object> env, AviatorObject... args) {
        double d = 0;
        try {
            d = 0;
            for (AviatorObject arg : args) {
                d += FunctionUtils.getNumberValue(arg, env).doubleValue();
            }
        } catch (Exception e) {
            return new AviatorString("#ERROR");
        }
        return new AviatorDouble(d);
    }

    @Override
    public AviatorObject call(Map<String, Object> env) {
        return execute(env);
    }

    @Override
    public AviatorObject call(Map<String, Object> env, AviatorObject arg1) {
        return execute(env, arg1);
    }

    @Override
    public AviatorObject call(Map<String, Object> env, AviatorObject arg1, AviatorObject arg2) {
        return execute(env, arg1, arg2);
    }

    @Override
    public AviatorObject call(Map<String, Object> env, AviatorObject arg1, AviatorObject arg2, AviatorObject arg3) {
        return execute(env, arg1, arg2, arg3);
    }

    @Override
    public AviatorObject call(Map<String, Object> env, AviatorObject arg1, AviatorObject arg2, AviatorObject arg3, AviatorObject arg4) {
        return execute(env, arg1, arg2, arg3, arg4);
    }

    @Override
    public AviatorObject call(Map<String, Object> env, AviatorObject arg1, AviatorObject arg2, AviatorObject arg3, AviatorObject arg4, AviatorObject arg5) {
        return execute(env, arg1, arg2, arg3, arg4, arg5);
    }

    @Override
    public AviatorObject call(Map<String, Object> env, AviatorObject arg1, AviatorObject arg2, AviatorObject arg3, AviatorObject arg4, AviatorObject arg5, AviatorObject arg6) {
        return execute(env, arg1, arg2, arg3, arg4, arg5, arg6);
    }

    @Override
    public AviatorObject call(Map<String, Object> env, AviatorObject arg1, AviatorObject arg2, AviatorObject arg3, AviatorObject arg4, AviatorObject arg5, AviatorObject arg6, AviatorObject arg7) {
        return execute(env, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
    }

    @Override
    public AviatorObject call(Map<String, Object> env, AviatorObject arg1, AviatorObject arg2, AviatorObject arg3, AviatorObject arg4, AviatorObject arg5, AviatorObject arg6, AviatorObject arg7, AviatorObject arg8) {
        return execute(env, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
    }

    @Override
    public AviatorObject call(Map<String, Object> env, AviatorObject arg1, AviatorObject arg2, AviatorObject arg3, AviatorObject arg4, AviatorObject arg5, AviatorObject arg6, AviatorObject arg7, AviatorObject arg8, AviatorObject arg9) {
        return execute(env, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
    }

    @Override
    public AviatorObject call(Map<String, Object> env, AviatorObject arg1, AviatorObject arg2, AviatorObject arg3, AviatorObject arg4, AviatorObject arg5, AviatorObject arg6, AviatorObject arg7, AviatorObject arg8, AviatorObject arg9, AviatorObject arg10) {
        return execute(env, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10);
    }

    @Override
    public AviatorObject call(Map<String, Object> env, AviatorObject arg1, AviatorObject arg2, AviatorObject arg3, AviatorObject arg4, AviatorObject arg5, AviatorObject arg6, AviatorObject arg7, AviatorObject arg8, AviatorObject arg9, AviatorObject arg10, AviatorObject arg11) {
        return execute(env, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11);
    }

    @Override
    public AviatorObject call(Map<String, Object> env, AviatorObject arg1, AviatorObject arg2, AviatorObject arg3, AviatorObject arg4, AviatorObject arg5, AviatorObject arg6, AviatorObject arg7, AviatorObject arg8, AviatorObject arg9, AviatorObject arg10, AviatorObject arg11, AviatorObject arg12) {
        return execute(env, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12);
    }

    @Override
    public AviatorObject call(Map<String, Object> env, AviatorObject arg1, AviatorObject arg2, AviatorObject arg3, AviatorObject arg4, AviatorObject arg5, AviatorObject arg6, AviatorObject arg7, AviatorObject arg8, AviatorObject arg9, AviatorObject arg10, AviatorObject arg11, AviatorObject arg12, AviatorObject arg13) {
        return execute(env, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13);
    }

    @Override
    public AviatorObject call(Map<String, Object> env, AviatorObject arg1, AviatorObject arg2, AviatorObject arg3, AviatorObject arg4, AviatorObject arg5, AviatorObject arg6, AviatorObject arg7, AviatorObject arg8, AviatorObject arg9, AviatorObject arg10, AviatorObject arg11, AviatorObject arg12, AviatorObject arg13, AviatorObject arg14) {
        return execute(env, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14);
    }

    @Override
    public AviatorObject call(Map<String, Object> env, AviatorObject arg1, AviatorObject arg2, AviatorObject arg3, AviatorObject arg4, AviatorObject arg5, AviatorObject arg6, AviatorObject arg7, AviatorObject arg8, AviatorObject arg9, AviatorObject arg10, AviatorObject arg11, AviatorObject arg12, AviatorObject arg13, AviatorObject arg14, AviatorObject arg15) {
        return execute(env, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15);
    }

    @Override
    public AviatorObject call(Map<String, Object> env, AviatorObject arg1, AviatorObject arg2, AviatorObject arg3, AviatorObject arg4, AviatorObject arg5, AviatorObject arg6, AviatorObject arg7, AviatorObject arg8, AviatorObject arg9, AviatorObject arg10, AviatorObject arg11, AviatorObject arg12, AviatorObject arg13, AviatorObject arg14, AviatorObject arg15, AviatorObject arg16) {
        return execute(env, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16);
    }

    @Override
    public AviatorObject call(Map<String, Object> env, AviatorObject arg1, AviatorObject arg2, AviatorObject arg3, AviatorObject arg4, AviatorObject arg5, AviatorObject arg6, AviatorObject arg7, AviatorObject arg8, AviatorObject arg9, AviatorObject arg10, AviatorObject arg11, AviatorObject arg12, AviatorObject arg13, AviatorObject arg14, AviatorObject arg15, AviatorObject arg16, AviatorObject arg17) {
        return execute(env, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16, arg17);
    }

    @Override
    public AviatorObject call(Map<String, Object> env, AviatorObject arg1, AviatorObject arg2, AviatorObject arg3, AviatorObject arg4, AviatorObject arg5, AviatorObject arg6, AviatorObject arg7, AviatorObject arg8, AviatorObject arg9, AviatorObject arg10, AviatorObject arg11, AviatorObject arg12, AviatorObject arg13, AviatorObject arg14, AviatorObject arg15, AviatorObject arg16, AviatorObject arg17, AviatorObject arg18) {
        return execute(env, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16, arg17, arg18);
    }

    @Override
    public AviatorObject call(Map<String, Object> env, AviatorObject arg1, AviatorObject arg2, AviatorObject arg3, AviatorObject arg4, AviatorObject arg5, AviatorObject arg6, AviatorObject arg7, AviatorObject arg8, AviatorObject arg9, AviatorObject arg10, AviatorObject arg11, AviatorObject arg12, AviatorObject arg13, AviatorObject arg14, AviatorObject arg15, AviatorObject arg16, AviatorObject arg17, AviatorObject arg18, AviatorObject arg19) {
        return execute(env, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16, arg17, arg18, arg19);
    }

    @Override
    public AviatorObject call(Map<String, Object> env, AviatorObject arg1, AviatorObject arg2, AviatorObject arg3, AviatorObject arg4, AviatorObject arg5, AviatorObject arg6, AviatorObject arg7, AviatorObject arg8, AviatorObject arg9, AviatorObject arg10, AviatorObject arg11, AviatorObject arg12, AviatorObject arg13, AviatorObject arg14, AviatorObject arg15, AviatorObject arg16, AviatorObject arg17, AviatorObject arg18, AviatorObject arg19, AviatorObject arg20) {
        return execute(env, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11, arg12, arg13, arg14, arg15, arg16, arg17, arg18, arg19, arg20);
    }

    @Override
    public AviatorObject call(Map<String, Object> env, AviatorObject arg1, AviatorObject arg2, AviatorObject arg3, AviatorObject arg4, AviatorObject arg5, AviatorObject arg6, AviatorObject arg7, AviatorObject arg8, AviatorObject arg9, AviatorObject arg10, AviatorObject arg11, AviatorObject arg12, AviatorObject arg13, AviatorObject arg14, AviatorObject arg15, AviatorObject arg16, AviatorObject arg17, AviatorObject arg18, AviatorObject arg19, AviatorObject arg20, AviatorObject... args) {
        AviatorObject[] all = new AviatorObject[args.length + 20];
        int i = 0;
        all[i++] = arg1;
        all[i++] = arg2;
        all[i++] = arg3;
        all[i++] = arg4;
        all[i++] = arg5;
        all[i++] = arg6;
        all[i++] = arg7;
        all[i++] = arg8;
        all[i++] = arg9;
        all[i++] = arg10;
        all[i++] = arg11;
        all[i++] = arg12;
        all[i++] = arg13;
        all[i++] = arg14;
        all[i++] = arg15;
        all[i++] = arg16;
        all[i++] = arg17;
        all[i++] = arg18;
        all[i++] = arg19;
        all[i++] = arg20;
        for (AviatorObject arg : args) {
            all[i++] = arg;
        }
        return execute(env, all);
    }
}
