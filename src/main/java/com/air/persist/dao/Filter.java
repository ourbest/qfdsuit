package com.air.persist.dao;

import com.air.persist.util.DBUtils;
import org.apache.commons.lang.StringUtils;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * create at: 11-7-4
 *
 * @author Yonghui Chen
 */
public class Filter {
    private List<Filter> sub = new ArrayList<Filter>();
    private List<String> verb = new ArrayList<String>();
    protected Object[] value;
    private String column;
    private Operator op;


    public void setValue(Object[] value) {
        this.value = value;
    }

    public Filter and(Filter... filter) {
        for (Filter f : filter) {
            sub.add(f);
            verb.add("and");
        }
        return this;
    }

    public Filter or(Filter... filter) {
        for (Filter f : filter) {
            sub.add(f);
            verb.add("or");
        }
        return this;
    }

    public String toSQL(String alias) {
        StringBuilder b = selfSQL(alias);
        if (sub.size() > 0) {
            StringBuilder r = new StringBuilder();
            r.append("(");
            r.append(b);
            for (int i = 0; i < sub.size(); i++) {
                r.append(' ').append(verb.get(i)).append(" ").append(sub.get(i).toSQL(alias));
            }
            r.append(")");
            return r.toString();
        }
        return b.toString();
    }

    private StringBuilder selfSQL(String alias) {
        StringBuilder b = new StringBuilder();
        if (!StringUtils.isEmpty(alias)) {
            b.append(alias).append(".");
        }
        b.append(DBUtils.propertyToDb(column));
        if (Operator.eq.equals(op)) {
            if (value == null) {
                b.append(" is ?");
            } else {
                if (value.length > 1) {
                    b.append(" in (");
                    for (Object o : value) {
                        b.append("?,");
                    }
                    b.delete(b.length() - 1, b.length());
                    b.append(") ");
                } else {
                    b.append(op.getOperator()).append("?");
                }
            }
        } else if (Operator.ne.equals(op)) {
            if (value == null) {
                b.append(" is not ?");
            } else {
                if (value.length > 1) {
                    b.append(" not in (");
                    for (Object o : value) {
                        b.append("?,");
                    }
                    b.delete(b.length() - 1, b.length());
                    b.append(") ");
                } else {
                    b.append(op.getOperator()).append("?");
                }
            }
        } else {
            b.append(op.getOperator()).append("?");
        }
        return b;
    }

    @Override
    public String toString() {
        String c = selfSQL("t").toString();
        if (value == null) {
            c = StringUtils.replaceOnce(c, "?", "null");
        } else {
            for (Object o : value) {
                c = StringUtils.replaceOnce(c, "?", o == null ? "null" : o.toString());
            }
        }
        if (sub.size() > 0) {
            StringBuilder b = new StringBuilder();
            b.append("(").append(c);
            for (int i = 0; i < sub.size(); i++) {
                b.append(' ').append(verb.get(i)).append(' ').append(sub.get(i));
            }
            b.append(")");
            return b.toString();
        }
        return c;
    }

    public int setParameters(PreparedStatement pst, int pos) throws SQLException {
        int count = 0;
        if (value == null) {
            pst.setNull(pos++, Types.VARCHAR);
            count++;
        } else {
            for (Object s : value) {
                if (s == null) {
                    pst.setNull(pos++, Types.VARCHAR);
                } else if (Number.class.isAssignableFrom(s.getClass())) {
                    pst.setLong(pos++, Long.parseLong(s.toString()));
                } else if (Date.class.isAssignableFrom(s.getClass())) {
                    pst.setTimestamp(pos++, new Timestamp(((Date) s).getTime()));
                } else {
                    pst.setString(pos++, s.toString());
                }
                count++;
            }
        }
        for (Filter s : sub) {
            count += s.setParameters(pst, pos + count - 1);
        }
        return count;
    }

    public void setColumn(String column) {
        this.column = column;
    }

    public String getColumn() {
        return column;
    }

    public void setOp(Operator op) {
        this.op = op;
    }
}
