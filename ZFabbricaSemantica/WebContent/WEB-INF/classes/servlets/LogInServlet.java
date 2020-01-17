package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Utente;

@WebServlet("/LogInServlet")
public class LogInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    private HashMap<String,Utente> listaUtenti;
    
    public LogInServlet() {
    	
    }
    
    public void init() {
    	ServletContext conx=getServletContext();
    	if (conx.getAttribute("listaUtenti")==null)
			conx.setAttribute("listaUtenti", new HashMap<String,Utente>());
		
		this.listaUtenti=(HashMap<String,Utente>)conx.getAttribute("listaUtenti");
    }
    
    

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		out.print("<head><link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">\r\n" + 
				"</head>");
		
		if (listaUtenti.containsKey(email)){
			if (listaUtenti.get(email).getPassword().equals(password)){
					HttpSession s=request.getSession(true);
					s.setAttribute("utente", listaUtenti.get(email));
					s.setAttribute("email", email);
					response.sendRedirect("htmls/home.html");
					}
			else{
				out.print("<br><br><br><br><br><center><h2>Hai inserito una password errata</h2><br><br><br>\r\n" + 
						"				<a href=\"index.html\"><h2><strong>Riprova</strong></h2></a></center>");
				return;
			}
		}
		out.print("<br><br><br><br><br><center><h2>Non abbiamo nessun utente con quest email</h2><br><br><br>\r\n" + 
				"	<a href=\"index.html\"><h2><strong>Riprova</strong></h2></a></center>");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
