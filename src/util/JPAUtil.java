package util;

import javax.persistence.*;

public class JPAUtil {
	
	private static EntityManagerFactory emf;
	public static EntityManager getEntityManager(){
		if (emf == null)
			emf = Persistence.createEntityManagerFactory("testesJPA");
		return emf.createEntityManager();
	}
	public void fechaEntityManager(){
		emf.close();
	}
}
