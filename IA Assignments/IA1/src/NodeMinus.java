//AMARA TARIQ

public class NodeMinus extends NodeFact{
  private String minus;
  
  public NodeMinus(String minus){
    this.minus = minus;
  }
  
  public int eval(Environment env) throws EvalExcpetion{
    return Integer.parseInt(minus);
  }
}
