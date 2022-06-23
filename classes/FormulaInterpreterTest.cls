/**
 * @description       : tests for FormulaInterpreter facade
 * @author            : ing.cristian.diaz@gmail.com
 * @last modified on  : ISO8601: 2022-06-23
 * @last modified by  : ing.cristian.diaz@gmail.com
**/
@isTest
private class FormulaInterpreterTest {
    
    @isTest
    static void singleEvalExpSuccessTest(){
        
        // Name = 'test'
        Account acc = new Account();
        acc.Name = 'test';
        Boolean result = false;

        FormulaInterpreter interpreter = new FormulaInterpreter('Name EQUAL "test"');

        test.startTest();
        result = interpreter.isValid(acc);
        test.stopTest();

        System.assertEquals(true, result);
    }

    @isTest
    static void singleEvalExpFailTest(){
        
        // Name = 'test'
        Account acc = new Account();
        acc.Name = 'test1';
        Boolean result = false;

        FormulaInterpreter interpreter = new FormulaInterpreter('Name EQUAL "test"');

        test.startTest();
        result = interpreter.isValid(acc);
        test.stopTest();

        System.assertEquals(false, result);
    }

    @isTest
    static void singleAndExpSuccessTest(){
        
        // AND ( Name = 'test', AccountNumber = '123' )
        Account acc = new Account();
        acc.Name = 'test';
        acc.AccountNumber = '123';
        Boolean result = false;

        FormulaInterpreter interpreter = new FormulaInterpreter('AND ( Name EQUAL "test", AccountNumber EQUAL "123")');

        test.startTest();
        result = interpreter.isValid(acc);
        test.stopTest();

        System.assertEquals(true, result);
    }

    @isTest
    static void singleAndExpFailTest(){
        
        // AND ( Name = 'test', AccountNumber = '123' )
        Account acc = new Account();
        acc.Name = 'test';
        acc.AccountNumber = '1234';
        Boolean result = false;

        FormulaInterpreter interpreter = new FormulaInterpreter('AND ( Name EQUAL "test", AccountNumber EQUAL "123")');

        test.startTest();
        result = interpreter.isValid(acc);
        test.stopTest();

        System.assertEquals(false, result);
    }

    @isTest
    static void singleOrExpSuccessTest(){
        
        // OR ( Name = 'test1', AccountNumber = '123' )
        Account acc = new Account();
        acc.Name = 'test';
        acc.AccountNumber = '123';
        Boolean result = false;

        FormulaInterpreter interpreter = new FormulaInterpreter('OR ( Name EQUAL "test1", AccountNumber EQUAL "123")');

        test.startTest();
        result = interpreter.isValid(acc);
        test.stopTest();

        System.assertEquals(true, result);
    }

    @isTest
    static void singleOrExpFailTest(){
        
        // OR ( Name = 'test1', AccountNumber = '1234' )
        Account acc = new Account();
        acc.Name = 'test';
        acc.AccountNumber = '123';
        Boolean result = false;

        FormulaInterpreter interpreter = new FormulaInterpreter('OR ( Name EQUAL "test1", AccountNumber EQUAL "1234")');

        test.startTest();
        result = interpreter.isValid(acc);
        test.stopTest();

        System.assertEquals(false, result);
    }

    @isTest
    static void singleNotEvalExpSuccessTest(){
        
        // NOT ( Name = 'test1' )
        Account acc = new Account();
        acc.Name = 'test';

        Boolean result = false;

        FormulaInterpreter interpreter = new FormulaInterpreter('NOT ( Name EQUAL "test1" )');

        test.startTest();
        result = interpreter.isValid(acc);
        test.stopTest();

        System.assertEquals(true, result);
    }

    @isTest
    static void complexMixedSuccessTest(){
        
        // AND ( Name = 'test1', OR ( AccountNumber = '123', Description = 'test2' ) )
        Account acc = new Account();
        acc.Name = 'test1';
        acc.AccountNumber = '1234';
        acc.Description = 'test2';
        Boolean result = false;

        FormulaInterpreter interpreter = new FormulaInterpreter('AND ( Name EQUAL "test1", OR ( AccountNumber EQUAL "123", Description EQUAL "test2" ) )');

        test.startTest();
        result = interpreter.isValid(acc);
        test.stopTest();

        System.assertEquals(true, result);
    }

    @isTest
    static void singleAndExpSuccessFromRecordAndMapTest(){
        
        // AND ( Name = 'test', NoRelatedParameter = NULL )
        Account acc = new Account();
        acc.Name = 'test';
        
        Map<String,Object> extraParameters = new Map<String,Object>();
        extraParameters.put('NoRelatedParameter', null);
        
        Boolean result = false;
        FormulaInterpreter interpreter = new FormulaInterpreter('AND ( Name EQUAL "test", NoRelatedParameter EQUAL NULL)');

        test.startTest();
        result = interpreter.isValid(acc,extraParameters);
        test.stopTest();

        System.assertEquals(true, result);
    }

    @isTest
    static void singleEvalExpSuccessFromMapTest(){
        
        // Name = 'test'
        Map<String,Object> parameters = new Map<String,Object>();
        parameters.put('Name', 'test');

        Boolean result = false;
        FormulaInterpreter interpreter = new FormulaInterpreter('Name EQUAL "test"');

        test.startTest();
        result = interpreter.isValid(parameters);
        test.stopTest();

        System.assertEquals(true, result);
    }

}
