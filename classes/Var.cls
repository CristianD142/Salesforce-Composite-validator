/**
 * @description       : 
 * @author            : ing.cristian.diaz@gmail.com
 * @last modified on  : ISO8601: 2022-06-12
 * @last modified by  : ing.cristian.diaz@gmail.com
**/
public class Var {

    String name;

    public Var(String name) {
        this.name = name;
    }

    public Object getValue(Context context){
        return context.get(name);
    }
}
