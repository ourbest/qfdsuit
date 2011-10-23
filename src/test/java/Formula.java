import com.air.formula.SumFunction;
import com.googlecode.aviator.AviatorEvaluator;
import com.googlecode.aviator.Expression;

import java.util.HashMap;
import java.util.Map;

/**
 * create at: 11-7-31
 *
 * @author Yonghui Chen
 */
public class Formula {
    public static void main(String[] args) {
        String expression = "sum(a_a1-(b2-c),a1,b2,c)";
        AviatorEvaluator.addFunction(new SumFunction());

        // 编译表达式
        Expression compiledExp = AviatorEvaluator.compile(expression);
        Map<String, Object> env = new HashMap<String, Object>();
        env.put("a_a1", 100.3);
//        env.put("a1", 100.3);
        env.put("b2", 45);
        env.put("c", -199.100);
        // 执行表达式

        System.out.println(compiledExp.execute(env));
    }
}
