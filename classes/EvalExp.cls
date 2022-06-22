/**
 * @description       : represent a comparison, it could be equal 
 *                      or diff. A = B or A != B
 * @author            : ing.cristian.diaz@gmail.com
 * @last modified on  : ISO8601: 2022-06-22
 * @last modified by  : ing.cristian.diaz@gmail.com
**/
public class EvalExp extends Exp {
    
    private Value left;
    private Value right;
    private Type type;
    public enum Type {
        EQUAL,
        DIFF
    }

    public EvalExp(Value left,Value right) {
        this.left = left;
        this.right = right;
        this.type = EvalExp.Type.EQUAL;
    }

    public EvalExp(Type type,Value left,Value right) {
        this.left = left;
        this.right = right;
        this.type = type;
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

    public Type getType(){
        return type;
    }
}
