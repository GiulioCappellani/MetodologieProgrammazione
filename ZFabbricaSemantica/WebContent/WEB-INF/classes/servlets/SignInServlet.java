package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Utente;


@WebServlet("/SignInServlet")
public class SignInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	private HashMap<String,Utente> listaUtenti;
    
    public SignInServlet() {
    	
    }
    
    public void init() {
    	ServletContext conx=getServletContext();
    	if (conx.getAttribute("listaUtenti")==null)
			conx.setAttribute("listaUtenti", new HashMap<String,Utente>());
		
		this.listaUtenti=(HashMap<String,Utente>)conx.getAttribute("listaUtenti");
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		out.print("<head><link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">\r\n" + 
				"</head>");
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		if (listaUtenti.isEmpty()==false)
			if (listaUtenti.containsKey(email)){
				out.print("<br><br><br><br><br><center><h2>Abbiamo un utente gia registrato con questa email</h2><br><br><br>\r\n" + 
						"				<a href=\"index.html\"><h2>Vai al LogIn</h2></a><br><br>\r\n" + 
						"				<a href=\"htmls/iscrizione.html\"><h2>Riprova</h2></a></center>");
				return;
		}
		
		Utente u=new Utente(email,password);
		
		ArrayList<String> linguePreferite = new ArrayList<String>();
		ArrayList<String> lingueAggiuntive = new ArrayList<String>();
		
		Enumeration<String> e=request.getParameterNames();
		
		String temp;
		while (e.hasMoreElements()){
			temp=e.nextElement();
			if (request.getParameter(temp)!=null){
				if (temp.equals("Italiano") | temp.equals("Inglese") | temp.equals("Tedesco") | temp.equals("Spagnolo") | temp.equals("Francese"))
					linguePreferite.add(temp);
				else
					if (temp.equals("lingua_aggiuntiva1") | temp.equals("lingua_aggiuntiva2"))
						lingueAggiuntive.add(request.getParameter(temp)+"-LV:"+request.getParameter( (temp.equals("lingua_aggiuntiva1") ? "LV_lingua_aggiuntiva1" : "LV_lingua_aggiuntiva2") ));
			}
		}
		u.setLinguePreferite(linguePreferite);
		u.setLingueAggiuntive(lingueAggiuntive);
		
		listaUtenti.put(email,u);
		getServletContext().setAttribute("listaUtenti", listaUtenti);
		
		out.print("<br><br><br><br><br><center><h2><strong>Iscrizione avvenuta con successo!</strong></h2><br><br><br>\r\n" + 
				"		<a href=\"index.html\"><h3><strong>Torna al LogIn</strong></h3></a></center>");
		
	}

}
