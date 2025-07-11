package projeto_JSP;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import dao.ClienteDAO;

@Entity
public class Cliente extends Pessoa{
	
	private static final long serialVersionUID = 1L;

	@Temporal(TemporalType.DATE)
	@Column(name = "cadastro", nullable = false)
	private Date dataCadastro;
	
	@Column(name = "Limite_Credito", nullable = false)
	private double limiteCredito;
	
	public Cliente(){
		super();
	}
	public Cliente(	Long idPessoa,
					String nome,
					String email,
					String endereco,
					Date dataCadastro, 
					double limiteCredito) {
		super();
		this.dataCadastro = dataCadastro;
		this.limiteCredito = limiteCredito;
	}
	
	public Date getDataCadastro() {
		return dataCadastro;
	}
	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}
	public double getLimiteCredito() {
		return limiteCredito;
	}
	public void setLimiteCredito(double limiteCredito) {
		this.limiteCredito = limiteCredito;
	}
	
	@Override
	public String toString() {
		return "Cliente: \n" + super.toString() + "\n" +
				"Data de cadastro: " + dataCadastro + "\n" +
				"Limite de Credito:" + limiteCredito + "\n";
	}
	
	
	public boolean salvar() {
		return new ClienteDAO().salvar(this);
	}
	public boolean atualizar(){
		return new ClienteDAO().atualizar(this);
	}
	public boolean remover(){
		return new ClienteDAO().remover(this.getIdPessoa());
	}
	public List<Cliente> listar(){
		return new ClienteDAO().listar();
	}
		
	public Cliente buscarID(){
		return new ClienteDAO().buscarID(this.getIdPessoa());
	}
}
