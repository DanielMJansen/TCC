package Controlador;
import bean.Erro;
import Persistencia.UsuarioDAO;
import Modelo.Usuario;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Usuario u = new Usuario();
	u.setLogin(request.getParameter("login").trim());
	u.setSenha(UsuarioDAO.rehash(request.getParameter("senha").trim()));
	request.setCharacterEncoding("UTF-8");
	String pagina = "";
	Erro e = new Erro("");
	e.setLink("Login.jsp");
	if(UsuarioDAO.existeUsuario(u)){ // se o usuário já tá cadastrado
	    pagina = "InicioLogado.jsp";
	    HttpSession session = request.getSession(true); // cria a sessão - o 'true' é pra significar que tem que criar
	    session.setAttribute("loginUsuario", u.getLogin()); // atribui o login num atributo chamado "loginUsuario"
	    session.setAttribute("nick", UsuarioDAO.Nick(u.getLogin()));
	    request.setAttribute("usuario", UsuarioDAO.carregaUsuarioLogin(u.getLogin())); // atribui o próprio usuário num atributo chamado "usuario"
	}else{
	    pagina = "ErroLogin.jsp";
	    e.setErro("Login e/ou senha informados incorretamente ou um dos campos está vazio.");
	    request.setAttribute("erro", e);
	}
	RequestDispatcher rd = request.getRequestDispatcher(pagina);
	rd.forward(request, response);
    }
}
