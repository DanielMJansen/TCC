package Modelo;
public class Usuario {
    private String login;
    private String senha;
    private String nick;    

    public String getNick() {
        return nick;
    }

    public void setNick(String nick) {
        this.nick = nick;
    }

    public Usuario(String login, String senha, String nick) {
        this.login = login;
        this.senha = senha;
        this.nick = nick;
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
