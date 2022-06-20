/**
 * @description       : 
 * @author            : ing.cristian.diaz@gmail.com
 * @last modified on  : ISO8601: 2022-06-20
 * @last modified by  : ing.cristian.diaz@gmail.com
**/
@isTest
private class ExpPrettyPrintVisitorTest {

    @isTest
    private static void singleVarTest(){
        
        // A
        Variable A = new Variable('A');
        ExpPrettyPrintVisitor visitor = new ExpPrettyPrintVisitor();

        Test.startTest();
        A.accept(visitor);
        Test.stopTest();
        
        System.assertEquals('A', visitor.getResult(), 'Incorrect var result');

    }

    @isTest
    private static void singleLiteralTest(){
        
        // 123
        Literal literal = new Literal(123);
        ExpPrettyPrintVisitor visitor = new ExpPrettyPrintVisitor();

        Test.startTest();
        literal.accept(visitor);
        Test.stopTest();
        
        System.assertEquals('123', visitor.getResult(), 'Incorrect literal result');

    }

    @isTest
    private static void multipleLiteralTest(){
        
        // 'test' 123 TRUE  null
        Literal literal1 = new Literal('test');
        Literal literal2 = new Literal(123);
        Literal literal3 = new Literal(true);
        Literal literal4 = new Literal(null);

        ExpPrettyPrintVisitor visitor1 = new ExpPrettyPrintVisitor();
        ExpPrettyPrintVisitor visitor2 = new ExpPrettyPrintVisitor();
        ExpPrettyPrintVisitor visitor3 = new ExpPrettyPrintVisitor();
        ExpPrettyPrintVisitor visitor4 = new ExpPrettyPrintVisitor();

        Test.startTest();
        literal1.accept(visitor1);
        literal2.accept(visitor2);
        literal3.accept(visitor3);
        literal4.accept(visitor4);
        Test.stopTest();

        System.assertEquals('test', visitor1.getResult(), 'Incorrect literal result');
        System.assertEquals('123', visitor2.getResult(), 'Incorrect literal result');
        System.assertEquals('true', visitor3.getResult(), 'Incorrect literal result');
        System.assertEquals('null', visitor4.getResult(), 'Incorrect literal result');

    }

    @isTest
    private static void singleEvalExpTest(){
        // A = 123
        Variable var = new Variable('A');
        Literal literal = new Literal(123);

        EvalExp eval1 = new EvalExp(var,literal);        
        ExpPrettyPrintVisitor visitor = new ExpPrettyPrintVisitor(); 

        Test.startTest();
        eval1.accept(visitor);
        Test.stopTest();

        System.assertEquals('A=123', visitor.getResult(), 'Incorrect EvalExp result');

    }

    @isTest
    private static void singleOrExpTest(){

        // OR (A = B, C = D )
        ExpPrettyPrintVisitor visitor = new ExpPrettyPrintVisitor();

        Variable A = new Variable('A');
        Variable B = new Variable('B');
        Variable C = new Variable('C');
        Variable D = new Variable('D');
        
        EvalExp eval1 = new EvalExp(A,B);
        EvalExp eval2 = new EvalExp(C,D);

        OrExp orEval = new OrExp();
        orEval.add(eval1);
        orEval.add(eval2);

        Test.startTest();
        orEval.accept(visitor);
        Test.stopTest();
        
        System.assertEquals('OR(A=B,C=D)', visitor.getResult(), 'incorrect OrExp result');

    }

    @isTest
    private static void singleAndExpTest(){

        // AND (A = B, C = D )
        ExpPrettyPrintVisitor visitor = new ExpPrettyPrintVisitor();

        Variable A = new Variable('A');
        Variable B = new Variable('B');
        Variable C = new Variable('C');
        Variable D = new Variable('D');
        
        EvalExp eval1 = new EvalExp(A,B);
        EvalExp eval2 = new EvalExp(C,D);

        AndExp andEval = new AndExp();
        andEval.add(eval1);
        andEval.add(eval2);

        Test.startTest();
        andEval.accept(visitor);
        Test.stopTest();
        
        System.assertEquals('AND(A=B,C=D)', visitor.getResult(), 'incorrect OrExp result');

    }

    @isTest
    private static void complexMixedAndOrTest(){

        // AND (A = B, OR (C = D, E = F ))
        ExpPrettyPrintVisitor visitor = new ExpPrettyPrintVisitor();

        Variable A = new Variable('A');
        Variable B = new Variable('B');
        Variable C = new Variable('C');
        Variable D = new Variable('D');
        Variable E = new Variable('E');
        Variable F = new Variable('F');
        
        EvalExp eval1 = new EvalExp(A,B);
        EvalExp eval2 = new EvalExp(C,D);
        EvalExp eval3 = new EvalExp(E,F);

        AndExp andEval = new AndExp();

        OrExp orEval = new OrExp();
        orEval.add(eval2);
        orEval.add(eval3);

        andEval.add(eval1);
        andEval.add(orEval);

        Boolean result = false;

        Test.startTest();
        andEval.accept(visitor);
        Test.stopTest();

        System.assertEquals('AND(A=B,OR(C=D,E=F))', visitor.getResult(), 'incorrect OrExp result');

    }

    
}
