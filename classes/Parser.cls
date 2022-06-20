/**
 * @description       : parser using the folowing grammar LL(1)
 * 1 evaluation     -> NOT ( evaluation ) evaluation
 * 2 evaluation     -> AND|OR ( evaluation ) evaluation
 * 3 evaluation     -> comparision evaluation
 * 4 evaluation     -> , evaluation
 * 5 evaluation     -> EPSILON
 * 6 comparision    -> value EQUAL|DIFF value comparision_op
 * 7 comparision_op -> EQUAL|DIFF value comparision_op
 * 8 comparision_op -> EPSILON

9 value -> VARIABLE
10 value -> CONSTANT
 * @author            : ing.cristian.diaz@gmail.com
 * @last modified on  : ISO8601: 2022-06-19
 * @last modified by  : ing.cristian.diaz@gmail.com
**/

public class Parser {
    
    private Scanner scanner;
    private ExpBuilder builder;
    private Token currentToken;
    
    public Parser(Scanner scanner,ExpBuilder builder){
        this.scanner = scanner;
        this.builder = builder;
    }

    public void construct(){
        next();
        evaluation();
        if(scanner.hasNext()){
            throw new HandledException('source was not parsed correctly '+currentToken);
        }
    }

    private void next(){
        if(scanner.hasNext()){
            currentToken = scanner.next();
        }
    }

    private void evaluation(){
        if(currentToken.getType() == Token.Type.NOT_OP){
            next();
            if(currentToken.getType() == Token.Type.OPEN_BRACKET){
                next();
                evaluation();
                if(currentToken.getType() == Token.Type.CLOSE_BRACKET){
                    builder.epsilon();
                    next();
                    evaluation();
                }
            }
        }else if(currentToken.getType() == Token.Type.AND_OR){
            
            if(currentToken.getValue() == 'AND'){
                builder.buildAnd();
            }else{
                builder.buildOr();
            }
            
            next();
            if(currentToken.getType() == Token.Type.OPEN_BRACKET){
                next();
                evaluation();
                if(currentToken.getType() == Token.Type.CLOSE_BRACKET){
                    builder.epsilon();
                    next();
                    evaluation();
                }
            }
        }else if(currentToken.getType() == Token.Type.COMMA){
            next();
            evaluation();
        }else if(isValue()){
            comparison();
        }
    }

    private void comparison(){
        Value left = value();
        if(currentToken.getType() == Token.Type.EQUAL_DIFF){
            next();
            if(isValue()){
                Value right = value();
                builder.buildEval(left, right);
                comparisonOp();
            }
        }
    }

    private void comparisonOp(){
        if(currentToken.getType() == Token.Type.EQUAL_DIFF){
            next();
            if(isValue()){
                value();
            }
        }else{
            evaluation();
        }
    }

    private Value value(){
        Value result;
        if(currentToken.getType() == Token.Type.VARIABLE){
            result = new Var(currentToken.getValue());
            next();
        }else if(currentToken.getType() == Token.Type.CONSTANT){
            result = new Literal(currentToken.getValue());
            next();
        }
        return result;
    }

    private Boolean isValue(){
        return (currentToken.getType() == Token.Type.VARIABLE || currentToken.getType() == Token.Type.CONSTANT);
    }

}
