public class SavingsAccount extends Account {

    private double interest=0;

    public SavingsAccount(String number, Customer customer, double balance) {
	this.number=number;
	this.customer=customer;
	this.balance=balance;
    }

    public void accrue(double rate) {
	interest+=balance*rate;
	balance+=balance*rate;
    }

}
