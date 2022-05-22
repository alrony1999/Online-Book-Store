package com.mycompant.ebookstore.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.mycompany.ebookstore.dao.BookDao;
import com.mycompany.ebookstore.dao.CategoryDao;

import com.mycompany.ebookstore.entities.Book;
import com.mycompany.ebookstore.entities.Category;
import com.mycompany.ebookstore.helper.FactoryProvider;

@MultipartConfig
public class BookOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();

			// servlet 2:
			// add category
			// add product
			String op = request.getParameter("operation");
			if (op.trim().equals("addcategory")) {
				// add category
				// fetching category data
				String title = request.getParameter("catTitle");
				String description = request.getParameter("catDescription");

				Category category = new Category();
				category.setCategoryTitle(title);
				category.setCategoryDescription(description);

				// category database save :
				CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
				int catId = categoryDao.saveCategory(category);

				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("message", "Category added successfully : " + catId);
				response.sendRedirect("admin.jsp");
				return;

			} else if (op.trim().equals("addbook")) {
				// add book
				String bName = request.getParameter("bName");
				String bAuthor = request.getParameter("bAuthor");
				String bLanguage =request.getParameter("bLanguage");
				String bDesc = request.getParameter("bDesc");
				int bPrice = Integer.parseInt(request.getParameter("bPrice"));
				int bDiscount = Integer.parseInt(request.getParameter("bDiscount"));

				String id = request.getParameter("catId");
				int catId = Integer.parseInt(id);

				System.out.println(catId);

				int bQuantity = Integer.parseInt(request.getParameter("bQuantity"));
				Part part = request.getPart("bPic");

				Book b = new Book();
				b.setbName(bName);
				b.setbAuthor(bAuthor);
				b.setbLanguage(bLanguage);
				b.setbDesc(bDesc);
				b.setbPrice(bPrice);
				b.setbDiscount(bDiscount);
				b.setbQuantity(bQuantity);
				b.setbPhoto(part.getSubmittedFileName());

				// get category by id
				CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
				Category category = cdao.getCategoryById(catId);
				
				b.setCategory(category);
				
				// get author by id
				/*
				 * AuthorDao adao = new AuthorDao(FactoryProvider.getFactory()); Author author =
				 * adao.getAuthorById(authorId);
				 * 
				 * b.setAuthor(author);
				 */

				// book save....
				BookDao bdao = new BookDao(FactoryProvider.getFactory());
				boolean bId = bdao.saveBook(b);

				String path = request.getRealPath("img") + File.separator + "books" + File.separator
						+ part.getSubmittedFileName();
				System.out.println(path);

				// uploading code...
				try {
					FileOutputStream fos = new FileOutputStream(path);

					InputStream is = part.getInputStream();

					// reading data...
					byte[] data = new byte[is.available()];
					is.read(data);

					// writing the data
					fos.write(data);
					fos.close();
				} catch (Exception e) {
					e.printStackTrace();
				}

				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("message", "Product save success...." + bId);
				response.sendRedirect("admin.jsp");
				return;

			}
			;

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
