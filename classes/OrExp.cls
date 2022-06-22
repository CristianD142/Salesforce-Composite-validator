/**
 * @description       : omposite that represents an or condition.
 * @author            : ing.cristian.diaz@gmail.com
 * @last modified on  : ISO8601: 2022-06-22
 * @last modified by  : ing.cristian.diaz@gmail.com
**/
public class OrExp extends Exp {
    
    private List<Exp> expressions;

    public OrExp() {
        expressions = new List<Exp>();
    }

    public override void add(Exp exp){
        exp.parent = this;
        expressions.add(exp);
    }

    public override void accept(ExpVisitor visitor){ 
        visitor.visit(this);
    }

    public List<Exp> getExpressions(){
        return expressions;
    }
}
