 package Modelo;
public class Usuario {
    private String login;
    private String senha;
   public static String nick;

    public String getNick() {
	return nick;
    }

    public void setNick(String nick) {
	this.nick = nick;
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
