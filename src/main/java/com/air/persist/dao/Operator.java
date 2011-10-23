package com.air.persist.dao;

/**
 * create at: 11-7-4
 *
 * @author Yonghui Chen
 */
public enum Operator {
    eq(" = "), lt(" < "), le(" <= "), gt(" > "), ge(" >= "), like(" like "), ne(" != ");

    public String getOperator() {
        return operator;
    }

    private String operator;

    Operator(String operator) {
        this.operator = operator;
    }
}
