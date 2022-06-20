/**
 * @description       : 
 * @author            : ing.cristian.diaz@gmail.com
 * @last modified on  : ISO8601: 2022-06-20
 * @last modified by  : ing.cristian.diaz@gmail.com
**/
public class EvalExp extends Exp {
    
    private Value left;
    private Value right;

    public EvalExp(Value left,Value right) {
        this.left = left;
        this.right = right;
    }

    public override void accept(ExpVisitor visitor){ 
        visitor.visit(this);
    }

    public Value getLeft(){
        return left;
    }

    public Value getRight(){
        return right;
    }
}
