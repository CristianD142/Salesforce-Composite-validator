/**
 * @description       : 
 * @author            : ing.cristian.diaz@gmail.com
 * @last modified on  : ISO8601: 2022-06-12
 * @last modified by  : ing.cristian.diaz@gmail.com
**/
public class EvalExp extends Exp {
    
    private Var left;
    private Var right;

    public EvalExp(Var left,Var right) {
        this.left = left;
        this.right = right;
    }

    public override Boolean isValid(Context context){
        return left.getValue(context) == right.getValue(context);
    }
}
