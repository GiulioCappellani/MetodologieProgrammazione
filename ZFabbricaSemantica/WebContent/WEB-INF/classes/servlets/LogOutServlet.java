package servlets;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Utente;

@WebServlet("/LogOutServlet")
public class LogOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private HashMap<String,Utente> listaUtenti;
    
    public LogOutServlet() {
        
    }

    public void init() {
    	ServletContext conx=getServletContext();
    	if (conx.getAttribute("listaUtenti")==null)
			conx.setAttribute("listaUtenti", new HashMap<String,Utente>());
		
		this.listaUtenti=(HashMap<String,Utente>)conx.getAttribute("listaUtenti");
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doPost(request,response);
		}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession s=request.getSession(false);
		
		listaUtenti.replace((String)s.getAttribute("email"), (Utente)s.getAttribute("utente"));
		
		getServletContext().setAttribute("listaUtenti", listaUtenti);
		
		s.invalidate();
		
		response.sendRedirect("index.html");
		
	}

}
