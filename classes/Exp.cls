/**
 * @description       : 
 * @author            : ing.cristian.diaz@gmail.com
 * @last modified on  : ISO8601: 2022-06-20
 * @last modified by  : ing.cristian.diaz@gmail.com
**/
public abstract class Exp {

    public Exp parent;
    public virtual void add(Exp exp){ }
    public abstract void accept(ExpVisitor visitor);
}
