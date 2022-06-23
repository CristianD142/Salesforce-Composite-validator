# Salesforce Composite Validator
***
## Description

model for complex validations using  GoF design patters. Additionally I followed the training http://cogitolearning.co.uk/2013/03/writing-a-parser-in-java-introduction/ to understand how to create a simple parser.

You can write a formula multilevel and send the parameters to interpret the formula and get a boolean result.

License: LGLP3 Lesser General Public License. In few words you can use in any project commercial or non commercial. please don't remove my name of the code.

## How to use

To simplify the use of this small framework, it was created a facade class called 'FormulaInterpreter', you only need to pass the formula and the parameters to interpret the formula. 

### Formula

String composed the different exprresions and it could have multiple levels.

#### Literals

constants and they could be Strings, Booleans, Numbers or Null. 

Strings are represented by a text inside quotes. i.e "this is a text"
Boolean are represented by the keywords TRUE and FALSE
Numbers are represented by numbers with or without decimal separator i.e 123 123.456
Null is an empty value and it's represented with the keyword NULL

#### Variables

values interpreted by the context. they are represented by some text i.e VarA

#### Comparisons EQUAL and DIFF

you can compare literals and variables, to achieve it you must use the keywords EQUAL or DIFF.

```
Var EQUAL "123"
```

```
Var DIFF "123"
```

```
VarA EQUAL VarB
```

```
123 DIFF 345
```

#### AND

all the comparisions inside of the AND should be TRUE to return TRUE, this accepts multiple conditions or comparisions and they must be 
separated by comma.

```
AND ( VarA EQUAL "123" , VarB DIFF NULL) 
```

#### OR

at least one of the comparisions inside of the OR should be TRUE to return TRUE, this accepts multiple conditions or comparisions and they must be 
separated by comma.

```
OR ( VarA EQUAL "123" , VarB DIFF NULL) 
```

#### NOT

change the result of the a comparison or condition. this only support one comparison or condition. 

```
NOT ( VarA EQUAL NULL)  
```

```
NOT ( AND ( VarA EQUAL "123" , VarB DIFF NULL) ) 
```

#### Complex Formula example

```
AND ( Name EQUAL "test1", OR ( NOT ( AccountNumber EQUAL "123" ) , Description DIFF NULL ) )
```

### Parameters

Parameters could be a: 

- Context instance
- Map<String,Object>
- SObject
- SObject and a Map<String,Object> for extra parameters.

### Apex example using a SObject as context

```
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
```

