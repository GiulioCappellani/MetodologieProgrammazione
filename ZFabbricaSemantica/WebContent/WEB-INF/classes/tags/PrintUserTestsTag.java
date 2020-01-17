package tags;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import beans.Test;
import beans.Utente;

public class PrintUserTestsTag extends BodyTagSupport{
	private static final long serialVersionUID = 1L;
	
	private Utente u;
	private ArrayList<Test> tests;
	
	private int testsNumber;
	private int counter;
	
	public int doStartTag() {
		
		u=(Utente)pageContext.getSession().getAttribute("utente");
		tests=(ArrayList<Test>)u.getTests();
		
		JspWriter out=pageContext.getOut();
		
		try {
			out.print("<br><br><br>\r\n" + 
					"	<h2><strong>I tuoi Test</strong></h2>\r\n" + 
					"	<br><br><br>");
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		if (tests.isEmpty()){
			try {
				out.print("<h5>Nessun test effettuato<br>\r\n" + 
						"			Vai alla home per iniziarne subito uno!</h5>\r\n" + 
						"			<br><br>");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return SKIP_BODY;
		}
		else {
			testsNumber=tests.size();
			counter=0;
			return EVAL_BODY_BUFFERED;
		}
			
	}
	
	public void setBodyContent() {}
	
	public void doInitBody() {}
	
	public int doAfterBody() {
		
		if (counter<testsNumber) {
			Test t=tests.get(counter);
			counter++;
			try {
				getBodyContent().print("<h3>Test"+counter+"</h3><br>\r\n" + 
						"		<br>\r\n" + 
						"		<table border=\"5\" cellspacing=\"5\" cellpadding=\"5\" align=\"center\">\r\n" + 
						"			<tr><th><center>Sezione</center></th><th><center>Punteggio/Risposta</center></th></tr>\r\n" + 
						"			<tr><th><center>Definition Annotation<br>(Word Definition)</center></th><td><center>"+t.getDAWD()+"</center></td></tr>\r\n" + 
						"			<tr><th><center>Definition Annotation<br>(Hypernym Definition)</center></th><td><center>"+t.getDAHD()+"</center></td></tr>\r\n" + 
						"			<tr><th><center>My Annotation</center></th><td><center>"+t.getMA()+"/6</center></td></tr>\r\n" + 
						"			<tr><th><center>Sense Annotation</center></th><td><center>"+t.getSA()+"/1</center></td></tr>\r\n" + 
						"			<tr><th><center>Sense Validation</center></th><td><center>"+t.getSV()+"/1</center></td></tr>\r\n" + 
						"			<tr><th><center>Translation Annotation</center></th><td><center>"+t.getTA()+"</center></td></tr>\r\n" + 
						"			<tr><th><center>Translation Validation</center></th><td><center>"+t.getTV()+"/1</center></td></tr>\r\n" + 
						"			<tr><th><center>Word Annotation</center></th><td><center>"+t.getWA()+"</center></td></tr>\r\n" + 
						"		</table>\r\n" + 
						"		<br><br>");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return EVAL_BODY_AGAIN;
		}
		else {
			try {
				getBodyContent().writeOut(getPreviousOut());
			} catch (IOException e) {
				e.printStackTrace();
			}
			return SKIP_BODY;
		}
	}
	
	public int doEndTag() { return EVAL_PAGE; }

}
