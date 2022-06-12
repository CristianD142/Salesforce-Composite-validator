/**
 * @description       : 
 * @author            : ing.cristian.diaz@gmail.com
 * @last modified on  : ISO8601: 2022-06-12
 * @last modified by  : ing.cristian.diaz@gmail.com
**/
public class AndExp extends Exp {
    
    private List<Exp> expressions;

    public AndExp() {
        expressions = new List<Exp>();
    }

    public override Boolean isValid(Context context){

        Boolean result = true;

        for(Exp expression:expressions){
            if(!expression.isValid(context)){
                result = false;
                break;
            }
        }

        return result;
    }

    public override void add(Exp exp){ 
        expressions.add(exp);
    }
}
