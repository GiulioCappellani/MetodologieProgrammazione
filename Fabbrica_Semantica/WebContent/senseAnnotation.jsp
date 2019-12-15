<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<%@page import="java.util.*" %>
<%@page import="classes.*" %>
	<%	
		String thisPage="senseAnnotation.html";
	
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
		
		int punteggio=0;
		if (request.getParameter("button").equals("SKIP"))
			t.setSA(punteggio);
		else {
			if (request.getParameter("translation2")!=null)
				punteggio++;
			t.setSA(punteggio);
		}
		
		s.setAttribute("test", t);
		s.setAttribute("remainingPages", remainingPages);
		
		response.sendRedirect( (isEmpty ? "testCompletato.jsp" : remainingPages.get(n) ));
	%>
</body>
</html>