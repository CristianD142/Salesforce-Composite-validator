/**
 * @description       : Manage the values for the interpretes, 
 *                      it works as map 
 * @author            : ing.cristian.diaz@gmail.com
 * @last modified on  : ISO8601: 2022-06-22
 * @last modified by  : ing.cristian.diaz@gmail.com
**/
public class Context {
    
    private Map<String,Object> values;

    public Context(){
        values = new Map<String,Object>();
    }

    public Context(Map<String,Object> values){
        this.values = values;
    }

    public void put(String name,Object value){
        values.put(name,value);
    }

    public Object get(String name){
        return values.get(name);
    }
}
