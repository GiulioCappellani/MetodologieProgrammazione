package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Test;
import beans.Utente;

@WebServlet("/TasksHandlerServlet")
public class TasksHandlerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public TasksHandlerServlet() {
       
    }

    public void init() { }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getSession().getAttribute("remainingPages")==null) {
			ArrayList<String> allPages=new ArrayList<String>();
	    	setAllPages(allPages);
			request.getSession().setAttribute("remainingPages",allPages);
			request.getSession().setAttribute("test", new Test());
		}
		
		ArrayList<String> remainingPages=(ArrayList<String>) request.getSession().getAttribute("remainingPages");
		
		boolean isEmpty=remainingPages.isEmpty();
		 
		Random r=new Random();
		int n=0;
		
		if (request.getParameter("currentPage")!=null) {
			corrector(request, response);
		}
		
		if (isEmpty==false) {
			if (remainingPages.size()>1) {
				n=r.nextInt(remainingPages.size()-1);
				response.sendRedirect("jsps/"+remainingPages.get(n));
			}
			else
				response.sendRedirect("jsps/"+remainingPages.get(0));
		}
		else {
			
			((Utente)request.getSession().getAttribute("utente")).addTest( (Test)(request.getSession().getAttribute("test")));
			
			remainingPages=null;
			request.getSession().removeAttribute("remainingPages");
			request.getSession().removeAttribute("test");
			
			PrintWriter out=response.getWriter();
			response.setContentType("text/html");
			out.print("<html><head><title>Test Completato!</title><link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">\r\n" + 
					"</head>\r\n" + 
					"<body><center>\r\n" + 
					"	<br><br><br><br><br><br><br>\r\n" + 
					"	<h1><strong>Test Completato!</strong></h1>\r\n" + 
					"	<br><br><br><br>\r\n" + 
					"	<a href=\"htmls/home.html\"><h3>Vai alla Home</h3></a>\r\n" + 
					"	<br>\r\n" + 
					"	<a href=\"../LogOut\"><h3>LogOut</h3></a>\r\n" + 
					"</body></center></html>");
		}
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	protected void setAllPages(ArrayList<String> allPages) {
		allPages.add("senseAnnotation.jsp");
    	allPages.add("translationAnnotation.jsp");
    	allPages.add("translationValidation.jsp");
    	allPages.add("wordAnnotation.jsp");
    	allPages.add("definitionAnnotation.jsp");
    	allPages.add("myAnnotation.jsp");
    	allPages.add("senseValidatio.jsp");
	}
	
	protected void corrector(HttpServletRequest request, HttpServletResponse response) {
		Test t=(Test)request.getSession().getAttribute("test");
		
		definitionAnnotationCorrector(request, response, t);
		myAnnotationCorrector(request, response, t);
		senseAnnotationCorrector(request, response, t);
		senseValidationCorrector(request, response, t);
		translationAnnotationCorrector(request, response, t);
		translationValidationCorrector(request, response, t);
		wordAnnotationCorrector(request, response, t);
		
		request.getSession().setAttribute("test", t);
	}
	
	protected void definitionAnnotationCorrector(HttpServletRequest request, HttpServletResponse response, Test t) {
		if (request.getParameter("currentPage").equals("definitionAnnotation.jsp")) {
			if (request.getParameter("button").equals("SKIP")){
				t.setDAHD("Nessuna risposta");
				t.setDAWD("Nessuna risposta");
			}
			else {
				t.setDAHD( (request.getParameter("hypernym_definition")=="" ? "Nessuna risposta" : request.getParameter("hypernym_definition") ));
				t.setDAWD( (request.getParameter("word_definition")=="" ? "Nessuna risposta" : request.getParameter("word_definition") ));
			}
		}
	}
	
	protected void myAnnotationCorrector(HttpServletRequest request, HttpServletResponse response, Test t) {
		if (request.getParameter("currentPage").equals("myAnnotation.jsp")) {
			int punteggio=0;
			if (request.getParameter("button").equals("SKIP"))
				t.setMA(punteggio);
			else {
				if (request.getParameter(request.getParameter("correctChoice1"))!=null)
					punteggio++;
				if (request.getParameter(request.getParameter("correctChoice2"))!=null)
					punteggio++;
				if (request.getParameter(request.getParameter("correctChoice3"))!=null)
					punteggio++;
				if (request.getParameter(request.getParameter("correctChoice4"))!=null)
					punteggio++;
				if (request.getParameter(request.getParameter("correctChoice5"))!=null)
					punteggio++;
				if (request.getParameter(request.getParameter("correctChoice6"))!=null)
					punteggio++;
				t.setMA(punteggio);
			}
		}
	}
	
	protected void senseAnnotationCorrector(HttpServletRequest request, HttpServletResponse response, Test t) {
		if (request.getParameter("currentPage").equals("senseAnnotation.jsp")) {
			int punteggio=0;
			if (request.getParameter("button").equals("SKIP"))
				t.setSA(punteggio);
			else {
				if (request.getParameter(request.getParameter("correctChoice"))!=null)
					punteggio++;
				t.setSA(punteggio);
			}
		}
	}
	
	protected void senseValidationCorrector(HttpServletRequest request, HttpServletResponse response, Test t) {
		if (request.getParameter("currentPage").equals("senseValidatio.jsp")) {
			int punteggio=0;
			if (request.getParameter("button").equals("SKIP"))
				t.setSV(punteggio);
			else {
				if (request.getParameter("SV").equals("no"))
					punteggio++;
				t.setSV(punteggio);
			}
		}
	}
	
	protected void translationAnnotationCorrector(HttpServletRequest request, HttpServletResponse response, Test t) {
		if (request.getParameter("currentPage").equals("translationAnnotation.jsp")) {
			if (request.getParameter("button").equals("SKIP"))
				t.setTA("Nessuna risposta");
			else 
				t.setTA( (request.getParameter("definition")=="" ? "Nessuna risposta" : request.getParameter("definition") ));
		}
	}
	
	protected void translationValidationCorrector(HttpServletRequest request, HttpServletResponse response, Test t) {
		if (request.getParameter("currentPage").equals("translationValidation.jsp")) {
			int punteggio=0;
			if (request.getParameter("button").equals("SKIP"))
				t.setTV(punteggio);
			else {
				if (request.getParameter("translation").equals(request.getParameter("correctChoice")))
					punteggio++;
				t.setTV(punteggio);
			}
		}
	}
	
	protected void wordAnnotationCorrector(HttpServletRequest request, HttpServletResponse response, Test t) {
		if (request.getParameter("currentPage").equals("wordAnnotation.jsp")) {
			if (request.getParameter("button").equals("SKIP"))
				t.setWA("Nessuna risposta");
			else 
				t.setWA( (request.getParameter("definition")=="" ? "Nessuna risposta" : request.getParameter("definition") ));
		}
	}
	
}
