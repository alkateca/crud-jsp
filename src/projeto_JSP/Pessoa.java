package projeto_JSP;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public class Pessoa implements Serializable{
	
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idPessoa;
	
	@Column(name = "Nome", nullable = false,
			columnDefinition = "text", length = 150)
	private String nome;
	
	@Column(name = "Email", nullable = false,
			columnDefinition = "text", length = 100)
	private String email;
	
	@Column(name = "Endereco", nullable = false,
			columnDefinition = "text", length = 200)
	private String endereco;
	
	public Pessoa(){}
	public Pessoa (Long idPessoa,
					String nome, 
					String email, 
					String endereco){
		this.idPessoa = idPessoa;
		this.nome = nome;
		this.email = email;
		this.endereco = endereco;
	}
	
	public Long getIdPessoa() {
		return idPessoa;
	}
	public void setIdPessoa(Long idPessoa) {
		this.idPessoa = idPessoa;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEndereco() {
		return endereco;
	}
	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}
	
	@Override
	public String toString() {
		return nome + "\n" + 
				"Email:" + email + "\n" + 
				"Endereco: " + endereco + "\n";
	}



	

}


