/**
 * @description       : Leaf in the the composite, represent a value.
 *                      it could be a varable or a literal
 * @author            : ing.cristian.diaz@gmail.com
 * @last modified on  : ISO8601: 2022-06-22
 * @last modified by  : ing.cristian.diaz@gmail.com
**/
public interface Value {    
    void accept(ExpVisitor visitor);
}
