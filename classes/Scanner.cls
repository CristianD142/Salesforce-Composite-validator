/**
 * @description       : Scan a string and returns different tokens
 * @author            : ing.cristian.diaz@gmail.com
 * @last modified on  : ISO8601: 2022-06-22
 * @last modified by  : ing.cristian.diaz@gmail.com
**/
public class Scanner {

    private String source;
    private List<TokenPattern> tokenPatterns;

    public Scanner(String source) {
        this.source = source.trim();
        tokenPatterns = new List<TokenPattern>();

        addTokenPattern(Token.Type.OPEN_BRACKET,'\\(');
        addTokenPattern(Token.Type.CLOSE_BRACKET,'\\)');
        addTokenPattern(Token.Type.COMMA,',');
        addTokenPattern(Token.Type.AND_OP,'AND');
        addTokenPattern(Token.Type.OR_OP,'OR');
        addTokenPattern(Token.Type.EQUAL,'EQUAL');
        addTokenPattern(Token.Type.DIFF,'DIFF');
        addTokenPattern(Token.Type.NOT_OP,'NOT');
        addTokenPattern(Token.Type.TRUE_CONS,'TRUE');
        addTokenPattern(Token.Type.FALSE_CONS,'FALSE');
        addTokenPattern(Token.Type.NULL_CONS,'NULL');
        addTokenPattern(Token.Type.INTEGER_CONS,'[0-9]+');
        addTokenPattern(Token.Type.STRING_CONS,'"[^"]*"');
        addTokenPattern(Token.Type.VARIABLE,'[a-zA-Z][a-zA-Z0-9_]*');
    }
    
    private void addTokenPattern(Token.Type type,String expression){
        tokenPatterns.add(
            new TokenPattern(
                type, 
                Pattern.compile('^('+expression+')')
            )
        );
    }

    public Boolean hasNext(){
        return (source != '');
    }

    public Token next(){ 
        Boolean match = false;
        Token token;
        for(TokenPattern tokenPattern : tokenPatterns){
            
            Matcher matcher = tokenPattern.pattern.matcher(source);
            
            if(matcher.find()){
                match = true;
                token = new Token(tokenPattern.type,matcher.group().trim());
                source = matcher.replaceFirst('').trim();
                break;
            }
        }

        if(!match){ throw new NoSuchElementException('Unexpected Character '+source); }
        
        return token;
    }

    private class TokenPattern{

        public Token.Type type;
        public Pattern pattern;
        
        public TokenPattern(Token.Type type,Pattern pattern){
            this.type = type;
            this.pattern = pattern;
        }
    }
}
