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

    /*
    public Literal(String value) {

        if(value == 'TRUE'){
            this.value = true;
        }else if(value == 'FALSE'){
            this.value = false;
        }else if(value == 'NULL'){
            this.value = null;
        }else if(value.startsWith('"')){
            this.value = value.removeStart('"').removeEnd('"');
        }else if(value.contains('.')){
            this.value = Decimal.valueOf(value);
        }else{
            this.value = Integer.valueOf(value);
        }
    }
    */
    
    public void accept(ExpVisitor visitor){
        visitor.visit(this);
    }

    public Object getValue(){
        return value;
    }
    
}
