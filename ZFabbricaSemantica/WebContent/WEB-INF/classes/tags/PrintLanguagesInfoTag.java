package tags;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;
import javax.servlet.jsp.tagext.TagSupport;

import beans.Test;
import beans.Utente;

public class PrintLanguagesInfoTag extends TagSupport {
	private static final long serialVersionUID = 1L;
	
	private Utente u;
	
	public int doStartTag() {
		
		u=(Utente)pageContext.getSession().getAttribute("utente");
		ArrayList<String> linguePreferite=(ArrayList<String>)u.getLinguePreferite();
		ArrayList<String> lingueAggiuntive=(ArrayList<String>)u.getLingueAggiuntive();
		
		String info="<br><br><br><br><br><h2><strong>Le tue informazioni</strong></h2><br>\r\n" + 
				"	<br><br>\r\n" + 
				"	<h3>Email: "+u.getEmail()+ 
				"	<br><br>\r\n" + 
				"	Lingue Preferite: ";
		
		for (int i=0; i<linguePreferite.size(); i++)
			info+=" "+linguePreferite.get(i)+(i==linguePreferite.size()-1 ? " " : ", ");
		
		info+="<br><br>Lingue Aggiuntive: ";
		
		for (int i=0; i<lingueAggiuntive.size(); i++)
			info+=" "+lingueAggiuntive.get(i).split("-")[0]+" "+lingueAggiuntive.get(i).split("-")[1]+(i==lingueAggiuntive.size()-1 ? " " : ", ");
		
		info+="</h3>";
		
		JspWriter out=pageContext.getOut();
		
		try {
			out.print(info);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return SKIP_BODY;
	}
	
	public int doEndTag() { return EVAL_PAGE; }
}
