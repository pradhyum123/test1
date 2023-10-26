/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.coder1;

import com.coder.helper.FactoryProvider;
import com.coder.entites.Category;
import com.coder.entites.Product;
import com.coderdao.Categorydao;
import com.coderdao.ProductDao;
import java.io.File;
import java.io.FileInputStream;
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


@MultipartConfig


public class ProductOperation extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String r=request.getParameter("operation");
            if(r.trim().equals("addcategory")){
                
                
                String t=request.getParameter("catTitle");
                String d=request.getParameter("catDescription");
                
               Category c =new Category();
               c.setCategoryTitle(t);
               c.setCategoryDescription(d);
                Categorydao cdao = new Categorydao(FactoryProvider.getFactory());
                int CatId=cdao.saveCategory(c);
                HttpSession s = request.getSession();
                s.setAttribute("message", "Category added successfully"+CatId);
                response.sendRedirect("Admin.jsp");
                return;
               
            }else if(r.trim().equals("addproduct")){
                
                String n=request.getParameter("pName");
                String des=request.getParameter("pDesc");
                int pr=Integer.parseInt(request.getParameter("pPrice"));
                int d=Integer.parseInt(request.getParameter("pDiscount"));
                int q=Integer.parseInt(request.getParameter("pQuantity"));
                int cid=Integer.parseInt(request.getParameter("catId"));
                Part part=request.getPart("pPic");
                 Product p=new Product();
                 p.setpName(n);
                 p.setpDesc(des);
                p.setpPrice(pr);
                p.setpDiscount(d);
               p.setpQuantity(q);
               p.setpPhoto(part.getSubmittedFileName());
              
               Categorydao dao=new Categorydao(FactoryProvider.getFactory());
                Category cat = dao.getcategorybyId(cid);
              p.setC(cat);
              
              ProductDao dau=new ProductDao(FactoryProvider.getFactory());
             dau.saveproduct(p);
             String path=request.getRealPath("img")+File.separator+"product"+File.separator+part.getSubmittedFileName();
             System.out.println(path);
             try{
                 
             
             FileOutputStream fos=new FileOutputStream(path);
             InputStream is= part.getInputStream();
             byte data[]=new byte[is.available()];
             is.read(data);
             
             fos.write(data);
             fos.close();
             }catch(Exception e){
                 e.printStackTrace();
             }
             
             out.println("Product save Successfully...");
             HttpSession s = request.getSession();
                s.setAttribute("message", "Product is added successfully...");
                response.sendRedirect("Admin.jsp");
                return;
               
              
               
            }
            
            
//            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
