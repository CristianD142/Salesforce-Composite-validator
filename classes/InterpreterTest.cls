/**
 * @description       : 
 * @author            : ing.cristian.diaz@gmail.com
 * @last modified on  : ISO8601: 2022-06-12
 * @last modified by  : ing.cristian.diaz@gmail.com
**/
@isTest
private class InterpreterTest {

    static final String BAD_INTERPRETED = 'formula was bad interpreted';
    
    @isTest
    private static void singleVarValueTest(){
        
        // A
        String expected = 'test';
        String result = 'test';

        Var A = new Var('A');
        Context context = new Context();
        context.put('A', 'test');

        Test.startTest();
        result = (String)A.getValue(context);
        Test.stopTest();
        
        System.assertEquals(expected, result, 'incorrect value from context');

    }

    @isTest
    private static void singleVarMultipleValueTest(){
        
        // A
        Object result1;
        Object result2;
        Object result3;
        Object result4;

        Var A = new Var('A');
       
        Context context1 = new Context();
        context1.put('A', 'test');

        Context context2 = new Context();
        context2.put('A', 123);

        Context context3 = new Context();
        context3.put('A', true);

        Context context4 = new Context();
        context4.put('A', null);
        
        Test.startTest();
        result1 = A.getValue(context1);
        result2 = A.getValue(context2);
        result3 = A.getValue(context3);
        result4 = A.getValue(context4);
        Test.stopTest();

        System.assertEquals(context1.get('A'), result1, 'incorrect value from context');
        System.assertEquals(context2.get('A'), result2, 'incorrect value from context');
        System.assertEquals(context3.get('A'), result3, 'incorrect value from context');
        System.assertEquals(context4.get('A'), result4, 'incorrect value from context');

    }

    @isTest
    private static void singleEvalExpSuccessTest(){
        // A = B
        Var A = new Var('A');
        Var B = new Var('B');

        EvalExp eval1 = new EvalExp(A,B);

        Context context = new Context();
        context.put('A', 1);
        context.put('B', 1);

        Boolean result = false;

        Test.startTest();
        result = eval1.isValid(context);
        Test.stopTest();

        System.assertEquals(true, result, BAD_INTERPRETED);

    }

    @isTest
    private static void singleAndExpSuccessTest(){

        // AND (A = B, C = D)
        Var A = new Var('A');
        Var B = new Var('B');
        Var C = new Var('C');
        Var D = new Var('D');
        
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

        Boolean result = false;

        Test.startTest();
        result = andEval.isValid(context);
        Test.stopTest();

        System.assertEquals(true, result, BAD_INTERPRETED);

    }
    
    @isTest
    private static void singleAndExpFailTest(){

        // AND (A = B, C = D)
        Var A = new Var('A');
        Var B = new Var('B');
        Var C = new Var('C');
        Var D = new Var('D');
        
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

        Boolean result = true;

        Test.startTest();
        result = andEval.isValid(context);
        Test.stopTest();

        System.assertEquals(false, result, BAD_INTERPRETED);

    }

    @isTest
    private static void singleOrExpSuccessTest(){

        // OR (A = B, C = D )
        Var A = new Var('A');
        Var B = new Var('B');
        Var C = new Var('C');
        Var D = new Var('D');
        
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

        Boolean result = false;

        Test.startTest();
        result = orEval.isValid(context);
        Test.stopTest();

        System.assertEquals(true, result, BAD_INTERPRETED);

    }

    @isTest
    private static void singleOrExpFailTest(){

        // OR (A = B, C = D)
        Var A = new Var('A');
        Var B = new Var('B');
        Var C = new Var('C');
        Var D = new Var('D');
        
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

        Boolean result = true;

        Test.startTest();
        result = orEval.isValid(context);
        Test.stopTest();

        System.assertEquals(false, result, BAD_INTERPRETED);

    }

    @isTest
    private static void complexMixedAndOrSuccessTest(){

        // AND (A = B, OR (C = D, E = F ))
        Var A = new Var('A');
        Var B = new Var('B');
        Var C = new Var('C');
        Var D = new Var('D');
        Var E = new Var('E');
        Var F = new Var('F');
        
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

        Boolean result = false;

        Test.startTest();
        result = andEval.isValid(context);
        Test.stopTest();

        System.assertEquals(true, result, BAD_INTERPRETED);

    }

}
