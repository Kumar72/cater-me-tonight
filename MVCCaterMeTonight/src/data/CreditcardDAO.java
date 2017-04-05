package data;

import java.util.List;

import entities.Creditcard;

public interface CreditcardDAO {
public Creditcard show(int id);
	
	public List<Creditcard> index();

	public Creditcard update(int id, Creditcard creditcard);

	public boolean destroy(int id);

	public Creditcard create(Creditcard creditcard);
	
	public List <Creditcard> getSavedCreditcardsForUser(int id);
}
