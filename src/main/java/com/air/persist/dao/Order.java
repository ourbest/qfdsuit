package com.air.persist.dao;

/**
 * create at: 11-7-5
 *
 * @author Yonghui Chen
 */
public class Order {
    public static final int ASC = 0;
    public static final int DESC = 1;

    private int type;
    private String column;
    private Order next;


    public Order(String column, int type) {
        this.type = type;
        this.column = column;
    }

    public int getType() {
        return type;
    }

    public String getColumn() {
        return column;
    }

    public Order getNext() {
        return next;
    }

    public static Order asc(String column) {
        return new Order(column, ASC);
    }

    public static Order desc(String column) {
        return new Order(column, DESC);
    }

    public Order addAsc(String col) {
        if(next == null) next = Order.asc(col);
        else next.addAsc(col);
        return this;
    }

    public Order addDesc(String col) {
        if(next == null) next = Order.desc(col);
        else next.addDesc(col);
        return this;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder().append(" order by ");
        // order by `column1` asc,`column2` desc
        //return " order by " + str() + ((next == null) ? "" : ", " + next.str());
        fillStringBuilder(sb);
        return sb.toString();
    }


    private void fillStringBuilder(StringBuilder sb) {
        sb.append(column).append(' ').append(type);
        if(next != null){
            sb.append(',');
            next.fillStringBuilder(sb);
        }
    }
}
