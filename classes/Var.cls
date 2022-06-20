/**
 * @description       : 
 * @author            : ing.cristian.diaz@gmail.com
 * @last modified on  : ISO8601: 2022-06-20
 * @last modified by  : ing.cristian.diaz@gmail.com
**/
public class Var implements Value {

    String name;

    public Var(String name) {
        this.name = name;
    }

    public void accept(ExpVisitor visitor){
        visitor.visit(this);
    }

    public String getName(){
        return name;
    }
}
