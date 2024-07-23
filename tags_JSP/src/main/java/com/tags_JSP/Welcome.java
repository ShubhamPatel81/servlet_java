package com.tags_JSP;

import javax.swing.text.html.HTML.Tag;

import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.JspWriter;
import jakarta.servlet.jsp.tagext.TagSupport;

public class Welcome extends TagSupport{

	@Override
	public int doStartTag() throws JspException {
		
		try {
			
			JspWriter out = pageContext.getOut();
			out.print("<h1>Hello, Golu</h1>");
			
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return SKIP_BODY;
	}
	
	

}
