//AMARA TARIQ

public class NodeMinus extends NodeFact{
  private String minus;
  
  public NodeMinus(String minus){
    this.minus = minus;
  }
  
  public double eval(Environment env) throws EvalException{
    return Double.parseDouble(minus);
  }
}