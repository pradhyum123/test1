/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.coderdao;

import com.coder.entites.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author DELL
 */
public class UserDao {
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
    public User getUSerByEmailAndPassword(String email,String password)
    {
        
        User user=null;
        try{
            String quesry="from User where userEmail =: e and userPassword=: p";
            Session s=this.factory.openSession();
            Query q=s.createQuery(quesry);
            q.setParameter("e",email);
            q.setParameter("p",password);
            
            user=(User)q.uniqueResult();
            s.close();
            
            
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return user;
        
    }
    
}
