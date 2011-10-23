package com.demx.exception;

public class GeneralFailureException
        extends RuntimeException implements java.io.Serializable {
    private Throwable t;

    public GeneralFailureException(String s) {
        super(s);
    }

    public GeneralFailureException(String s, Throwable throwable) {
        super(s);
        t = throwable;
    }

    public String getThrowable() {
        return "Received throwable with Message: " + t.getMessage();
    }

    public Throwable getNestedThrowable() {
        return t;
    }

    public void printStackTrace() {
        super.printStackTrace();
        if (t != null) {
            System.err.println("-----nested throwable-----");
            t.printStackTrace();
        }
    }
}