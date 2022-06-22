/**
 * @description       : represent a NOT in the structure.
 *                      it's not a composite because the add only update 
 *                      or replace the exp
 * @author            : ing.cristian.diaz@gmail.com
 * @last modified on  : ISO8601: 2022-06-22
 * @last modified by  : ing.cristian.diaz@gmail.com
**/
public class NotExp extends Exp {
    
    private Exp exp;
    
    public NotExp() { }

    public NotExp(Exp exp) {
        exp.parent = this;
        this.exp = exp;
    }

    public override void accept(ExpVisitor visitor){ 
        visitor.visit(this);
    }

    public Exp getExp(){
        return exp;
    }

    public override void add(Exp exp){
        exp.parent = this;
        this.exp = exp;
    }
}
