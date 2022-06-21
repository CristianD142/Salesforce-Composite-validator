/**
 * @description       : 
 * @author            : ing.cristian.diaz@gmail.com
 * @last modified on  : ISO8601: 2022-06-20
 * @last modified by  : ing.cristian.diaz@gmail.com
**/
public class ExpBuilder {
    
    private Exp root;
    private Exp current;

    public ExpBuilder(){
        
    }

    public void buildAnd(){
        buildComposite(new AndExp());
    }

    public void buildOr(){
        buildComposite(new OrExp());
    }

    public void buildEval(Value left,Value right){
        buildLeaf(new EvalExp(left,right));
    }

    public void buildEval(EvalExp.Type type,Value left,Value right){
        buildLeaf(new EvalExp(type,left,right));
    }

    public void epsilon(){
        current = current.parent;
    }

    public void buildNot(){
        buildComposite(new NotExp());
    }

    public Exp getRootNode(){
        return root;
    }

    private void buildComposite(Exp exp){
        if(root == null){
            root = exp;
            current = root;
        }else{
            current.add(exp);
            current = exp;
        }
    }

    private void buildLeaf(Exp exp){
        if(root == null){
            root = exp;
            current = root;
        }else{
            current.add(exp);
        }
    }

}
