/**
 * @description       : 
 * @author            : ing.cristian.diaz@gmail.com
 * @last modified on  : ISO8601: 2022-06-20
 * @last modified by  : ing.cristian.diaz@gmail.com
**/
public interface ExpVisitor {
    void visit(AndExp exp);
    void visit(OrExp exp);
    void visit(EvalExp exp);
    void visit(Literal literal);
    void visit(Variable var);
}
