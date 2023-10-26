/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.coderdao;

import com.coder.entites.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author DELL
 */
public class Categorydao {
    private SessionFactory factory;

    public Categorydao(SessionFactory factory) {
        this.factory = factory;
    }
        
       public int saveCategory(Category cat)
       {
        Session s = this.factory.openSession();
      Transaction tx=s.beginTransaction(); 
        
      int catId=(int)s.save(cat);
      tx.commit();
       s.close();
        return catId;
       }
       public List<Category> getCategories(){
        Session os = this.factory.openSession();
        Query cs = os.createQuery("from Category");
        List<Category> list = cs.list();
        return list;
       }
              public Category getcategorybyId(int cid){
                  Category cat=null;
                  try{
                      Session os = this.factory.openSession();
                       cat = os.get(Category.class, cid);
                       os.close();
                    
                      
                  }catch(Exception e){
                      e.printStackTrace();
                  }
        return cat;
                  
                      
              }
    }
    

