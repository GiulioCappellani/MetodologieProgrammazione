package tags;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.tagext.TagSupport;

public class PagesUpdateTag extends TagSupport{
private static final long serialVersionUID = 1L;

	private String currentPage;
	
	public int doStartTag() {
		HttpServletRequest request=(HttpServletRequest) pageContext.getRequest();
		ArrayList<String> remainingPages=(ArrayList<String>) request.getSession().getAttribute("remainingPages");
		remainingPages.remove(currentPage);
		request.getSession().setAttribute("remainingPages", remainingPages);
		
		return SKIP_BODY;
	}
	
	public int doEndTag() {
		return EVAL_PAGE;
	}

	public String getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(String currentPage) {
		this.currentPage = currentPage;
	}
}
