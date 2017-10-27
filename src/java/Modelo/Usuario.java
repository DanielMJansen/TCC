package Modelo;
public class Usuario {
    private String login;
    private String senha;
    private String nomeExibicao;

    public String getNomeExibicao() {
	return nomeExibicao;
    }

    public void setNomeExibicao(String nomeExibicao) {
	this.nomeExibicao = nomeExibicao;
    }

    public Usuario(){
        
    }
    
    public Usuario(String login, String senha) {
        this.login = login;
        this.senha = senha;

    }

    
    

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
}
