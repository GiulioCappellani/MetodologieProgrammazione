package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/BackHomeServlet")
public class BackHomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public BackHomeServlet() {    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getSession().setAttribute("remainingPages", null);
		response.sendRedirect("htmls/home.html");
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
}
