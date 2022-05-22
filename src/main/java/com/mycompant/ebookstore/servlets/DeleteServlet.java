package com.mycompant.ebookstore.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.mycompany.ebookstore.entities.Book;
import com.mycompany.ebookstore.helper.FactoryProvider;


public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		try
		{
			String id = request.getParameter("book_id").trim();
			int bookId=Integer.parseInt(id);
		
			Session s=FactoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			Book note=(Book)s.get(Book.class, bookId);
			s.delete(note);			
			tx.commit();
			s.close();
			HttpSession httpSession = request.getSession();
			httpSession.setAttribute("message", "Product deleted....");
			response.sendRedirect("adminbookoperation.jsp");
			return;
			//response.sendRedirect("all_notes.jsp");
			
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		
		
		
	}


}
