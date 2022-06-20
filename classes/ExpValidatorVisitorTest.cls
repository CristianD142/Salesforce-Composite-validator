/**
 * @description       : 
 * @author            : ing.cristian.diaz@gmail.com
 * @last modified on  : ISO8601: 2022-06-20
 * @last modified by  : ing.cristian.diaz@gmail.com
**/
@isTest
private class ExpValidatorVisitorTest {
    static final String BAD_INTERPRETED = 'formula was bad interpreted';
    
    @isTest
    private static void singleVarValueTest(){
        
        // A
        String expected = 'test';

        Variable A = new Variable('A');
        
        Context context = new Context();
        context.put('A', expected);
        
        ExpValidatorVisitor visitor = new ExpValidatorVisitor(context);

        Test.startTest();
        A.accept(visitor);
        Test.stopTest();
        
        System.assertEquals(expected, visitor.value, 'incorrect value from context');

    }

    @isTest
    private static void singleLiteralValueTest(){
        
        // 123
        Value literal = new Literal(123);

        //no matter the context in literals
        ExpValidatorVisitor visitor = new ExpValidatorVisitor(new Context());
        
        Test.startTest();
        literal.accept(visitor);
        Test.stopTest();
        
        System.assertEquals(123, visitor.value, 'wrong value returned in literal');

    }

    @isTest
    private static void singleEvalExpSuccessTest(){
        // A = B
        Variable A = new Variable('A');
        Variable B = new Variable('B');

        EvalExp eval1 = new EvalExp(A,B);

        Context context = new Context();
        context.put('A', 1);
        context.put('B', 1);

        ExpValidatorVisitor visitor = new ExpValidatorVisitor(context);

        Test.startTest();
        eval1.accept(visitor);
        Test.stopTest();

        System.assertEquals(true, visitor.isValid(), BAD_INTERPRETED);

    }

    @isTest
    private static void singleEvalExpDiffSuccessTest(){
        // A = B
        Variable A = new Variable('A');
        Variable B = new Variable('B');

        EvalExp eval1 = new EvalExp(EvalExp.Type.DIFF,A,B);

        Context context = new Context();
        context.put('A', 1);
        context.put('B', 2);

        ExpValidatorVisitor visitor = new ExpValidatorVisitor(context);

        Test.startTest();
        eval1.accept(visitor);
        Test.stopTest();

        System.assertEquals(true, visitor.isValid(), BAD_INTERPRETED);

    }

    @isTest
    private static void singleAndExpSuccessTest(){

        // AND (A = B, C = D)
        Variable A = new Variable('A');
        Variable B = new Variable('B');
        Variable C = new Variable('C');
        Variable D = new Variable('D');
        
        EvalExp eval1 = new EvalExp(A,B);
        EvalExp eval2 = new EvalExp(C,D);

        AndExp andEval = new AndExp();
        andEval.add(eval1);
        andEval.add(eval2);

        Context context = new Context();
        context.put('A', 1);
        context.put('B', 1);
        context.put('C', '2');
        context.put('D', '2');

        ExpValidatorVisitor visitor = new ExpValidatorVisitor(context);

        Test.startTest();
        andEval.accept(visitor);
        Test.stopTest();

        System.assertEquals(true, visitor.isValid(), BAD_INTERPRETED);

    }

    @isTest
    private static void singleAndExpFailTest(){

        // AND (A = B, C = D)
        Variable A = new Variable('A');
        Variable B = new Variable('B');
        Variable C = new Variable('C');
        Variable D = new Variable('D');
        
        EvalExp eval1 = new EvalExp(A,B);
        EvalExp eval2 = new EvalExp(C,D);

        AndExp andEval = new AndExp();
        andEval.add(eval1);
        andEval.add(eval2);

        Context context = new Context();
        context.put('A', 1);
        context.put('B', 1);
        context.put('C', '2');
        context.put('D', '3');

        ExpValidatorVisitor visitor = new ExpValidatorVisitor(context);

        Test.startTest();
        andEval.accept(visitor);
        Test.stopTest();

        System.assertEquals(false, visitor.isValid(), BAD_INTERPRETED);

    }

    @isTest
    private static void singleOrExpSuccessTest(){

        // OR (A = B, C = D )
        Variable A = new Variable('A');
        Variable B = new Variable('B');
        Variable C = new Variable('C');
        Variable D = new Variable('D');
        
        EvalExp eval1 = new EvalExp(A,B);
        EvalExp eval2 = new EvalExp(C,D);

        OrExp orEval = new OrExp();
        orEval.add(eval1);
        orEval.add(eval2);

        Context context = new Context();
        context.put('A', 1);
        context.put('B', 2);
        context.put('C', '2');
        context.put('D', '2');

        ExpValidatorVisitor visitor = new ExpValidatorVisitor(context);

        Test.startTest();
        orEval.accept(visitor);
        Test.stopTest();

        System.assertEquals(true, visitor.isValid(), BAD_INTERPRETED);

    }

    @isTest
    private static void singleOrExpFailTest(){

        // OR (A = B, C = D)
        Variable A = new Variable('A');
        Variable B = new Variable('B');
        Variable C = new Variable('C');
        Variable D = new Variable('D');
        
        EvalExp eval1 = new EvalExp(A,B);
        EvalExp eval2 = new EvalExp(C,D);

        OrExp orEval = new OrExp();
        orEval.add(eval1);
        orEval.add(eval2);

        Context context = new Context();
        context.put('A', 1);
        context.put('B', 2);
        context.put('C', '3');
        context.put('D', '4');

        ExpValidatorVisitor visitor = new ExpValidatorVisitor(context);

        Test.startTest();
        orEval.accept(visitor);
        Test.stopTest();

        System.assertEquals(false, visitor.isValid(), BAD_INTERPRETED);

    }


    @isTest
    private static void complexMixedAndOrSuccessTest(){

        // AND (A = B, OR (C = D, E = F ))
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

        Context context = new Context();
        context.put('A', 1);
        context.put('B', 1);
        context.put('C', '3');
        context.put('D', '4');
        context.put('E', '5');
        context.put('F', '5');

        ExpValidatorVisitor visitor = new ExpValidatorVisitor(context);

        Test.startTest();
        andEval.accept(visitor);
        Test.stopTest();

        System.assertEquals(true, visitor.isValid(), BAD_INTERPRETED);

    }

    @isTest
    private static void singleNotEvalExpSuccessTest(){
        // NOT ( A = B )
        Variable A = new Variable('A');
        Variable B = new Variable('B');
        
        EvalExp eval1 = new EvalExp(A,B);
        NotExp notExp = new notExp(eval1);

        Context context = new Context();
        context.put('A', 1);
        context.put('B', 1);

        ExpValidatorVisitor visitor = new ExpValidatorVisitor(context);

        Test.startTest();
        notExp.accept(visitor);
        Test.stopTest();

        System.assertEquals(false, visitor.isValid(), BAD_INTERPRETED);

    }
}
