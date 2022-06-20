/**
 * @description       : 
 * @author            : ing.cristian.diaz@gmail.com
 * @last modified on  : ISO8601: 2022-06-19
 * @last modified by  : ing.cristian.diaz@gmail.com
**/
@isTest
private class PoCTest {

    @isTest
    static void checkRegularExpressions(){
        String source = ',VARIABLE)';
        String expression = ',';
        Pattern regex = Pattern.compile('^('+expression+')');
        Matcher m = regex.matcher(source);

        String tok;

        System.debug('source : '+source);

        if(m.find()){
            tok = m.group().trim();
            source = m.replaceFirst('');
        }

        System.debug('token : '+tok);
        System.debug('source : '+source);
    }

    @isTest 
    static void processScanner(){
        Scanner scanner = new Scanner(' 1 EQUAL 2 ');
        while(scanner.hasNext()){
            System.debug(scanner.next());
        }
    }

    @isTest 
    static void constructExp(){
        Scanner scanner = new Scanner('3 EQUAL 4');
        ExpBuilder builder = new ExpBuilder();
        Parser parser = new Parser(scanner,builder);
        parser.construct();
    }

    @isTest
    static void removeWhiteSpaces(){
        String s1 = '     1 EQUAL 2 )   ';
        String trimmed = s1.trim();
        System.debug(trimmed);
    }

    @isTest
    static void buildSimpleStructures(){
        
        //AND ( 1 EQUAL 2, OR (3 EQUAL 4, 5 EQUAL 6) )

        ExpBuilder builder = new ExpBuilder();
        builder.buildAnd();
        builder.buildEval(new Literal(1), new Literal(2));
        builder.buildOr();
        builder.buildEval(new Literal(3), new Literal(4));
        builder.buildEval(new Literal(5), new Literal(6));        
        builder.epsilon();

        Exp root = builder.getRootNode();
        System.debug(root);

        ExpPrettyPrintVisitor visitor = new ExpPrettyPrintVisitor();
        root.accept(visitor);

        System.debug(visitor.getResult());

    }

    @isTest
    static void wholeBuildProcess(){
        Scanner scanner = new Scanner('AND ( 1 EQUAL 2, OR (3 EQUAL 4, 5 EQUAL 6), 7 EQUAL 8 )');
        ExpBuilder builder = new ExpBuilder();
        Parser parser = new Parser(scanner,builder);
        parser.construct();
        
        Exp root = builder.getRootNode();
        ExpPrettyPrintVisitor visitor = new ExpPrettyPrintVisitor();
        root.accept(visitor);

        System.debug(visitor.getResult());
    }

}