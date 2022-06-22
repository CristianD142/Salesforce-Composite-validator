/**
 * @description       : represent the minimal structure in the grammar
 * @author            : ing.cristian.diaz@gmail.com
 * @last modified on  : ISO8601: 2022-06-22
 * @last modified by  : ing.cristian.diaz@gmail.com
**/
public class Token {
    
    public enum Type { 
        OPEN_BRACKET,
        CLOSE_BRACKET,
        AND_OP,
        OR_OP,
        EQUAL,
        DIFF,
        TRUE_CONS,
        FALSE_CONS,
        STRING_CONS,
        INTEGER_CONS,
        DECIMAL_CONS,
        NULL_CONS,
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
