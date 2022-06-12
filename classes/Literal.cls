/**
 * @description       : 
 * @author            : ing.cristian.diaz@gmail.com
 * @last modified on  : ISO8601: 2022-06-12
 * @last modified by  : ing.cristian.diaz@gmail.com
**/
public class Literal implements Value {
    
    public Object value;
    
    public Literal(Object value) {
        this.value = value;
    }

    public Object getValue(Context context){
        return value;
    }
}
