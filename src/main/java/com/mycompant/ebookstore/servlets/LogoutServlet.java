package com.mycompant.ebookstore.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
        	response.setContentType("text/html");
			PrintWriter out = response.getWriter();
         
			/*
			 * HttpSession httpSession = request.getSession();
			 * httpSession.removeAttribute("current-user");
			 * response.sendRedirect("login.jsp");
			 */
        }catch (Exception e) {
			e.printStackTrace();
		}
    }

}
