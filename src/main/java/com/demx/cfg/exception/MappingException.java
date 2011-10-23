package com.demx.cfg.exception;

import com.demx.exception.NestableException;

public class MappingException
        extends NestableException {

    public MappingException(String msg, Throwable root) {
        super(msg, root);
    }

    public MappingException(Throwable root) {
        super(root);
    }


    public MappingException(String s) {
        super(s);
    }
}
