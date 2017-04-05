package data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import entities.Creditcard;

@Transactional
@Repository
public class CreditcardDAOImpl implements CreditcardDAO {
	@PersistenceContext
	private EntityManager em;

	@Override
	public Creditcard show(int id) {
		return em.find(Creditcard.class, id);
	}

	@Override
	public List<Creditcard> index() {
		List<Creditcard> creditcards = null;
		String queryString = "SELECT creditcard " 
				+ "FROM Creditcard creditcard";
		try {
			creditcards = em.createQuery(queryString, Creditcard.class)
					.getResultList();
		} catch (Exception e) {
			System.out.println(e);
		} 
		return creditcards;
	}

	@Override
	public Creditcard update(int id, Creditcard creditcard) {
		Creditcard managedCreditcard = em.find(Creditcard.class, id);
		managedCreditcard.setCreditcardNumber(creditcard.getCreditcardNumber());
		managedCreditcard.setExpirationDate(creditcard.getExpirationDate());
		managedCreditcard.setFullName(creditcard.getFullName());
		managedCreditcard.setSecurityCode(creditcard.getSecurityCode());
		managedCreditcard.setBillingAddress(creditcard.getBillingAddress());
		managedCreditcard.setUser(creditcard.getUser());		
		return managedCreditcard;
	}

	@Override
	public boolean destroy(int id) {
		boolean flag = false;
		try {			
			em.remove(em.find(Creditcard.class, id));
			flag = true;
		} catch (Exception e) {
			System.out.println(e);
		}
		return flag;
	}

	@Override
	public Creditcard create(Creditcard creditcard) {
		em.persist(creditcard);
		em.flush();
		return creditcard;
	}
	

}
