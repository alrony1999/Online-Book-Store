package com.mycompant.ebookstore.servlets;


import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.mycompany.ebookstore.entities.Book;
import com.mycompany.ebookstore.helper.FactoryProvider;

@MultipartConfig
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			
			String id = request.getParameter("book_id");
			int bId = Integer.parseInt(id.trim());
			System.out.println(bId);

			String bName = request.getParameter("bName");
			int bPrice = Integer.parseInt(request.getParameter("bPrice"));
			int bDiscount = Integer.parseInt(request.getParameter("bDiscount"));
			int bQuantity = Integer.parseInt(request.getParameter("bQuantity"));
			
			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();
			
			Book b = s.get(Book.class, bId);

			b.setbName(bName);
			b.setbPrice(bPrice);
			b.setbDiscount(bDiscount);
			b.setbQuantity(bQuantity);

			tx.commit();
			s.close();

			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("message", "Book Edited successfully");
			response.sendRedirect("adminbookoperation.jsp");
			return;

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
