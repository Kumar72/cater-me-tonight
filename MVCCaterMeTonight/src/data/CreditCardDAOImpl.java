package data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public class CreditCardDAOImpl implements CreditCardDAO {
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public boolean validOrInvalidCreditCard() {
		
		return false;
	}

}
