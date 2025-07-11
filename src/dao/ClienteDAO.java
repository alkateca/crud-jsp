package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import projeto_JSP.Cliente;
import util.JPAUtil;

public class ClienteDAO {

	EntityManager em = JPAUtil.getEntityManager();

	public boolean salvar(Cliente cliente){
		try{
			em = JPAUtil.getEntityManager();
			em.getTransaction().begin();
			em.persist(cliente);
			em.getTransaction().commit();
			return true;
		} catch (RuntimeException e){
			if(em.getTransaction().isActive()){
				em.getTransaction().rollback();
			}
			return false;
		}
	}
	
	public boolean atualizar(Cliente cliente){
		try{
			em = JPAUtil.getEntityManager();
			em.getTransaction().begin();
			em.merge(cliente);
			em.getTransaction().commit();
			return true;
		} catch (RuntimeException e){
			if (em.getTransaction().isActive()){
				em.getTransaction().rollback();
			}
			return false;
		} 
	}
	

	public List<Cliente> listar(){
		try{
			em = JPAUtil.getEntityManager();
			TypedQuery<Cliente> query = em.createQuery("SELECT obj "
													+ "FROM Cliente obj", 
													Cliente.class);
			List<Cliente> cliente = query.getResultList();
			return cliente;
		} catch (RuntimeException e){
			return null;
		}
	}
	
	public Cliente buscarID(Long id){
		try{
			em = JPAUtil.getEntityManager();
			Cliente cliente = em.find(Cliente.class, id);
			return cliente;
		} catch (RuntimeException e){
			if (em.getTransaction().isActive()){
				em.getTransaction().rollback();
			}
			return null;
		}
	}
	
	public boolean remover(Long id){
		try{
			em = JPAUtil.getEntityManager();
			em.getTransaction().begin();
			Cliente cliente = em.find(Cliente.class, id);
			em.remove(cliente);
			em.getTransaction().commit();
			return true;
		} catch (RuntimeException e){
			if(em.getTransaction().isActive()){
				em.getTransaction().rollback();
			}
			return false;
		} 
	}
	
	
	
}
