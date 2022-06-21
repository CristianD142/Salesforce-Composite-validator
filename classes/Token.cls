/**
 * @description       : 
 * @author            : ing.cristian.diaz@gmail.com
 * @last modified on  : ISO8601: 2022-06-20
 * @last modified by  : ing.cristian.diaz@gmail.com
**/
public class Token {
    
    public enum Type { 
        OPEN_BRACKET,
        CLOSE_BRACKET,
        AND_OR,
        EQUAL_DIFF,
        CONSTANT,
        VARIABLE,
        NOT_OP,
        COMMA        
    }

    private Type type;
    private String value;

    public Token(Type type,String value) {
        this.type = type;
        this.value = value;
    }

    public Type getType(){
        return type;
    }

    public String getValue(){
        return value;
    }
}
