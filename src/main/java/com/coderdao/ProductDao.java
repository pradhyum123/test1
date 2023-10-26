/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.coderdao;

import com.coder.entites.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author DELL
 */
public class ProductDao {

    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }

    public boolean saveproduct(Product p) {
        boolean f = false;
        try {
            Session ost = this.factory.openSession();
            Transaction tx = ost.beginTransaction();
            ost.save(p);

            tx.commit();
            ost.close();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
            f = false;
        }
        return f;
    }
    //product of all product

    public List<Product> getAllProduct() {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Product");
        List<Product> list = query.list();
        return list;
    }

    //get all Product of  catergory
    public List<Product> getAllProductId(int cid) {
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Product as p where p.c.categoryId =: id");
        query.setParameter("id",cid);
        List<Product> list = query.list();
        return list;
    }
}
