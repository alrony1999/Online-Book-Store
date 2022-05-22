package com.mycompant.ebookstore.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mycompany.ebookstore.dao.UserDao;
import com.mycompany.ebookstore.entities.User;
import com.mycompany.ebookstore.helper.FactoryProvider;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();

			// coding area

			String email = request.getParameter("email");
			String password = request.getParameter("password");

			// validation
			// authentication user
			UserDao userDao = new UserDao(FactoryProvider.getFactory());
			User user = userDao.getUserByEmailAndPassword(email, password);
			HttpSession httpSession = request.getSession();

			if (user == null) {

				httpSession.setAttribute("message", "Invalid Details !! Try with another one");
				response.sendRedirect("login.jsp");
				return;

			} else {
				out.println("<h1>Welcome" + user.getUserName() + "</h1");
				// login
				httpSession.setAttribute("current-user", user);
				if (user.getUserType().equals("admin")) {
					// admin.jsp
					response.sendRedirect("admin.jsp");
				} else if (user.getUserType().equals("normal")) {
					// normaluser.jsp
					response.sendRedirect("index.jsp");
				} else {
					out.println("We have not indentified user type");
				}

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
