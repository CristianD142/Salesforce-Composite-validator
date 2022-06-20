/**
 * @description       : 
 * @author            : ing.cristian.diaz@gmail.com
 * @last modified on  : ISO8601: 2022-06-20
 * @last modified by  : ing.cristian.diaz@gmail.com
**/
public class ExpPrettyPrintVisitor implements ExpVisitor{
    
    private String result;

    public ExpPrettyPrintVisitor() {
        result = '';
    }

    public void visit(AndExp exp){
        Boolean isFirst = true;
        result+= 'AND(';
        for(Exp childExp : exp.getExpressions()){
            if(isFirst){
                childExp.accept(this);
                isFirst = false;
            }else{
                result+= ',';
                childExp.accept(this);
            }
        }
        result+= ')';
    }

    public void visit(OrExp exp){
        Boolean isFirst = true;
        result+= 'OR(';
        for(Exp childExp : exp.getExpressions()){
            if(isFirst){
                childExp.accept(this);
                isFirst = false;
            }else{
                result+= ',';
                childExp.accept(this);
            }            
        }
        result+= ')';
    }

    public void visit(EvalExp exp){
        exp.getLeft().accept(this);
        result += '=';
        exp.getRight().accept(this);
    }

    public void visit(Literal literal){
        result += String.valueOf(literal.getValue());
    }
    
    public void visit(Variable var){
        result += var.getName();
    }

    public String getResult(){
        return result;
    }
}
