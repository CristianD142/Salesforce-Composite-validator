/**
 * @description       : 
 * @author            : ing.cristian.diaz@gmail.com
 * @last modified on  : ISO8601: 2022-06-21
 * @last modified by  : ing.cristian.diaz@gmail.com
**/
public class FormulaInterpreter {

    private String formula;

    public FormulaInterpreter(String formula){
        this.formula = formula;
    }
    
    public Boolean isValid(Context context){

        Scanner scanner = new Scanner(formula);
        ExpBuilder builder = new ExpBuilder();
        Parser parser = new Parser(scanner,builder);
        parser.construct();
        
        Exp root = builder.getRootNode();
        ExpValidatorVisitor visitor = new ExpValidatorVisitor(context);
        root.accept(visitor);

        return visitor.isValid();
    }

    public Boolean isValid(SObject record){
        Context context = new Context(record.getPopulatedFieldsAsMap());
        return isValid(context);
    }
}
