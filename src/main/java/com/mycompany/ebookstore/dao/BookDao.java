package com.mycompany.ebookstore.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.mycompany.ebookstore.entities.Book;

public class BookDao {

	private SessionFactory factory;

	public BookDao(SessionFactory factory) {
		this.factory = factory;
	}

	public boolean saveBook(Book book) {
		boolean f = false;
		try {

			Session session = this.factory.openSession();
			Transaction tx = session.beginTransaction();
			session.save(book);

			tx.commit();
			session.close();
			f = true;
		} catch (Exception e) {
			e.printStackTrace();
			f = false;
		}
		return f;
	}

	// get all books
	public List<Book> getAllBooks() {
		Session s = this.factory.openSession();
		Query query = s.createQuery("from Book");
		List<Book> list = query.list();
		return list;

	}

	// get all books of given category
	public List<Book> getAllBooksById(int cid) {
		Session s = this.factory.openSession();
		Query query = s.createQuery("from Book as b where b.category.categoryId =: id");
		query.setParameter("id", cid);
		List<Book> list = query.list();
		return list;

	}
	public List<Book> getAllBookByLn(String language) {
		Session s = this.factory.openSession();
		Query query = s.createQuery("from Book where bLanguage =: ln");
		query.setParameter("ln",language);
		List<Book> list = query.list();
		return list;

	}
	
	
	public List<Book> getBookById(int bid) {
		Session s = this.factory.openSession();
		Query query = s.createQuery("from Book b where b.bId =: id");
		query.setParameter("id", bid);	
		List<Book> list=query.list();
		return list;	
	}
	
	

}