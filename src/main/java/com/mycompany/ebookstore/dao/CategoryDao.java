package com.mycompany.ebookstore.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.mycompany.ebookstore.entities.Category;

public class CategoryDao {

    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }
    //save the category to db
    public int saveCategory(Category cat)
    {
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
       int catId = (Integer) session.save(cat);
        tx.commit();
        session.close();
        return catId;
    }
    
    public List<Category> getCategories()
    {
        
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Category");
        List<Category> list = query.list();
        return list;
    }
    
    public Category getCategoryById(int cId)
    {
        Category cat=null;
        try{
            Session session = this.factory.openSession();
            cat = session.get(Category.class, cId);
            session.close();
            
        }catch (Exception e){
            e.printStackTrace();
        }
        return cat;
    }

}

