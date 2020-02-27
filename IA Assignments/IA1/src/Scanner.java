//AMARA TARIQ

// This class is a scanner for the program
// and programming language being interpreted.

import java.util.*;

public class Scanner {

    private String program;	// source program being interpreted
    private int pos;		// index of next char in program
    private Token token;	// last/current scanned token

    // sets of various characters and lexemes
    private Set<String> whitespace=new HashSet<String>();
    private Set<String> digits=new HashSet<String>();
    private Set<String> letters=new HashSet<String>();
    private Set<String> legits=new HashSet<String>();
    private Set<String> keywords=new HashSet<String>();
    private Set<String> operators=new HashSet<String>();
    
    //SETS FOR COMMENTS AND MINUS OPERATOR
    private Set<String> comments = new HashSet<String>();
    private Set<String> minus = new HashSet<String>(); //wait but its in the operators???
    
    // initializers for previous sets
    private void fill(Set<String> s, char lo, char hi) {
	for (char c=lo; c<=hi; c++)
	    s.add(c+"");
    }    

    private void initWhitespace(Set<String> s) {
	s.add(" ");
	s.add("\n");
	s.add("\t");
    }

    private void initDigits(Set<String> s) {
	fill(s,'0','9');
    }

    private void initLetters(Set<String> s) {
	fill(s,'A','Z');
	fill(s,'a','z');
    }

    private void initLegits(Set<String> s) {
	s.addAll(letters);
	s.addAll(digits);
    }

    private void initOperators(Set<String> s) {
	s.add("=");
	s.add("+");
	s.add("-");
	s.add("*");
	s.add("/");
	s.add("(");
	s.add(")");
	s.add(";");
    }

    private void initKeywords(Set<String> s) {
    }
  
  //creating symbols for a form of commenting
  //setting a string to be the set of symbols for commenting
    private void initComments(Set<String> s){
      s.add("$$"); //for a single line
      s.add("$^"); //starting a block
      s.add("$#$"); //startign javadocs
      s.add("^$");  //ending
    }
    
    //implementing a minus operator

    // constructor:
    //   - squirrel-away source program
    //   - initialize sets
    public Scanner(String program) {
	this.program=program;
	pos=0;
	token=null;
	initWhitespace(whitespace);
	initDigits(digits);
	initLetters(letters);
	initLegits(legits);
	initKeywords(keywords);
	initOperators(operators);
  
  intitComments(comments);
    }

    // handy string-processing methods

    public boolean done() {
	return pos>=program.length();
    }

    private void many(Set<String> s) {
	while (!done() && s.contains(program.charAt(pos)+""))
	    pos++;
    }
    
    private void past(char c) {
	while (!done() && c!=program.charAt(pos))
	    pos++;
	if (!done() && c==program.charAt(pos))
	    pos++;
    }

    // scan various kinds of lexeme

    private void nextNumber() {
	int old=pos;
	many(digits);
	token=new Token("num",program.substring(old,pos));
    }

    private void nextKwId() {
	int old=pos;
	many(letters);
	many(legits);
	String lexeme=program.substring(old,pos);
	token=new Token((keywords.contains(lexeme) ? lexeme : "id"),lexeme);
    }

    private void nextOp() {
	int old=pos;
	pos=old+2;
	if (!done()) {
	    String lexeme=program.substring(old,pos);
	    if (operators.contains(lexeme)) {
		token=new Token(lexeme); // two-char operator
		return;
	    }
	}
	pos=old+1;
	String lexeme=program.substring(old,pos);
	token=new Token(lexeme); // one-char operator
    }

 //cheking if comment
    private void nextComment(){
      int old = pos;
      pos = old + 2; //to check if the next two characters match characters for comments
      many(comments);
      String lexeme = program.substring(old, pos); //stores the entire comment 
      if(temp.equals("$$"){ //checking for single line comment
        while(!done()){ //loop until no longer a comment
          lexeme = program.substring(old,pos); 
          pos++;
        }
        temp = program.substring(old,pos);
      } else if(lexeme.equals("$^")){ //checking for comment block
        while(!lexeme. ){//aogfvneajrgvljk ---- HOW TO CHECK FOR THE LAST TWO CHARS
          pos++;
          lexeme = program.substring(old, pos);
        }
        lexeme = program.substring(old, pos);
    } else if(program.substring(old, pos + 1).equals("$#$")){ //checking for javadoc
      pos++;
      lexeme = program(old, pos);
      while(!lexeme. ){ //HOW TO CHECK FOR THE LAST TWO CHARSSAFJIRNGALEKRO--------
        pos++;
        lexeme = program.substring(old, pos);
      }
    }
    
    //check to see if done
    if(done()){ 
      token = new Token("comment"); 
      } else {
         next();
         }
 }


    // This method determines the kind of the next token (e.g., "id"),
    // and calls a method to scan that token's lexeme (e.g., "foo").
    public boolean next() {
	many(whitespace);
	if (done()) {
	    token=new Token("EOF");
	    return false;
	}
	String c=program.charAt(pos)+"";
	if (digits.contains(c))
	    nextNumber();
	else if (letters.contains(c))
	    nextKwId();
	else if (operators.contains(c))
	    nextOp();
	else {
	    System.err.println("illegal character at position "+pos);
	    pos++;
	    return next();
	}
	return true;
    }
 

    // This method scans the next lexeme,
    // if the current token is the expected token.
    public void match(Token t) throws SyntaxException {
	if (!t.equals(curr()))
	    throw new SyntaxException(pos,t,curr());
	next();
    }

    public Token curr() throws SyntaxException {
	if (token==null)
	    throw new SyntaxException(pos,new Token("ANY"),new Token("EMPTY"));
	return token;
    }

    public int pos() { return pos; }

    // for unit testing
    public static void main(String[] args) {
	try {
	    Scanner scanner=new Scanner(args[0]);
	    while (scanner.next())
		System.out.println(scanner.curr());
	} catch (SyntaxException e) {
	    System.err.println(e);
	}
    }

}
