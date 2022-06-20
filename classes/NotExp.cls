/**
 * @description       : 
 * @author            : ing.cristian.diaz@gmail.com
 * @last modified on  : ISO8601: 2022-06-20
 * @last modified by  : ing.cristian.diaz@gmail.com
**/
public class NotExp extends Exp {
    
    private Exp exp;
    
    public NotExp(Exp exp) {
        this.exp = exp;
    }

    public override void accept(ExpVisitor visitor){ 
        visitor.visit(this);
    }

    public Exp getExp(){
        return exp;
    }
}
