/**
 * @description       : 
 * @author            : ing.cristian.diaz@gmail.com
 * @last modified on  : ISO8601: 2022-06-12
 * @last modified by  : ing.cristian.diaz@gmail.com
**/
public class Context {
    
    private Map<String,Object> values;

    public Context(){
        values = new Map<String,Object>();
    }

    public void put(String name,Object value){
        values.put(name,value);
    }

    public Object get(String name){
        return values.get(name);
    }
}
