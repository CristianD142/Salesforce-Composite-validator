/**
 * @description       : Visitor to interpret the structure
 *                      whit values and check if the result is valid
 * @author            : ing.cristian.diaz@gmail.com
 * @last modified on  : ISO8601: 2022-06-22
 * @last modified by  : ing.cristian.diaz@gmail.com
**/
public class ExpValidatorVisitor implements ExpVisitor{
    
    private Boolean result;
    @TestVisible 
    private Object value;
    private Context context;

    public ExpValidatorVisitor(Context context) {
        this.context = context;
        result = true;
    }

    public void visit(AndExp exp){
        if(result == false) return;

        for(Exp childExp : exp.getExpressions()){
            childExp.accept(this);
            if(result == false){
                break;
            }
        }
    }

    public void visit(OrExp exp){

        if(result == false) return;

        for(Exp childExp : exp.getExpressions()){
            childExp.accept(this);
            if(result == true){
                break;
            }
        }
    }

    public void visit(EvalExp exp){
        
        exp.getLeft().accept(this);
        Object leftValue = value;
        exp.getRight().accept(this);
        Object rightValue = value;
        if(exp.getType() == EvalExp.Type.EQUAL){
            result = (leftValue == rightValue);
        }else{
            result = (leftValue != rightValue);
        }
    }

    public void visit(Literal literal){
        value = literal.getValue();
    }
    
    public void visit(Variable var){
        value = context.get(var.getName());
    }

    public void visit(NotExp exp){
        exp.getExp().accept(this);
        result = !result;
    }

    public Boolean isValid(){
        return result;
    }

}
