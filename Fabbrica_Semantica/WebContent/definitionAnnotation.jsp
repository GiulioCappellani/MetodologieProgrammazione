<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>
<body>
<%@page import="java.util.*" %>
<%@page import="classes.*" %>
	<%	
		String thisPage="definitionAnnotation.html";
	
		HttpSession s=request.getSession();
	
		ArrayList<String> remainingPages=(ArrayList<String>)s.getAttribute("remainingPages");
		
		remainingPages.remove(thisPage);
		
		boolean isEmpty=remainingPages.isEmpty();
		
		Random r=new Random();
		int n=0;
		
		if (isEmpty==false)
			if (remainingPages.size()>1)
				n=r.nextInt(remainingPages.size()-1);
		
		Test t=(Test)s.getAttribute("test");
		
		if (request.getParameter("button").equals("SKIP")){
			t.setDAHD("Nessuna risposta");
			t.setDAWD("Nessuna risposta");
		}
		else {
			t.setDAHD( (request.getParameter("hypernym_definition")==null ? "Nessuna risposta" : request.getParameter("hypernym_definition") ));
			t.setDAWD( (request.getParameter("word_definition")==null ? "Nessuna risposta" : request.getParameter("word_definition") ));
		}
		
		s.setAttribute("test", t);
		s.setAttribute("remainingPages", remainingPages);
		
		response.sendRedirect( (isEmpty ? "testCompletato.jsp" : remainingPages.get(n) ));
	%>
	
</body>
</html>