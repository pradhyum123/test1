/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.coder.helper;

import java.util.HashMap;
import java.util.Map;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

/**
 *
 * @author DELL
 */
public class Helper {
    public static String getby10words(String desc){
        String[] str=desc.split(" ");
        if(str.length>10){
            String res="";
            for(int i=0; i<10;i++)
            {
                res=res+str[i]+" ";
            }
            return(res+"...");
        }else{
            return (desc+"...");
        }
    
}
    

public static Map<String,Long> getcount(SessionFactory factory){
Session s=factory.openSession();

String q1="select count(*)from User";
String q2="select count(*)from Product";
Query query=s.createQuery(q1);
Query query2=s.createQuery(q2);
        Long usercount = (Long)query.list().get(0);
        Long productcount = (Long)query2.list().get(0);
        Map<String,Long> map=new HashMap<>();
        map.put("usercount",usercount);
        map.put("productcount",productcount);
s.close();
return map;
}
}