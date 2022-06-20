/**
 * @description       : 
 * @author            : ing.cristian.diaz@gmail.com
 * @last modified on  : ISO8601: 2022-06-20
 * @last modified by  : ing.cristian.diaz@gmail.com
**/
public class Literal implements Value {
    
    private Object value;

    public Literal(Object value) {
        this.value = value;
    }

    public void accept(ExpVisitor visitor){
        visitor.visit(this);
    }

    public Object getValue(){
        return value;
    }
    
}
