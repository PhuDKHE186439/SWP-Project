/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.ticket;

import dal.AccountDAO;
import dal.CompartmentDAO;
import dal.TrainDAO;
import dal.seatDAO;
import dal.ticketClassDAO;
import dal.ticketDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.account;
import model.seat;
import model.ticketClass;
import model.train;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import model.compartment;

/**
 *
 * @author admin
 */
public class ticketCreate extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ticketCreate</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ticketCreate at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        ticketClassDAO td=new ticketClassDAO();
        List<ticketClass> listTicket=td.getAll();
        TrainDAO tdd=new TrainDAO();
        List<train> listTrain=tdd.getAllTrain();
        seatDAO sd=new seatDAO();
        List<seat> listSeat=sd.getAll();
        CompartmentDAO cd=new CompartmentDAO();
        List<compartment> listCompartment=cd.getAll();
        request.setAttribute("compartment", listCompartment);
        request.setAttribute("seat", listSeat);
        request.setAttribute("train", listTrain);
        request.setAttribute("ticket", listTicket);
       request.getRequestDispatcher("ticketCreate.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        Object object=request.getSession().getAttribute("AccID");
        int passengerId=-1;
        if(object!=null){
            passengerId=(int)object;
        }
        AccountDAO ad=new AccountDAO();
        account ac=ad.getAccountByID(passengerId);
       String ticketClassID=request.getParameter("Category");
       String TrainID=request.getParameter("train");
       String seat=request.getParameter("seat");
       String compartNmber=request.getParameter("CompartNumber");
       String date=request.getParameter("date");
       String compartment=request.getParameter("compartment");
       SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
         Date sqlDate=null;
        try {
            java.util.Date utilDate = dateFormat.parse(date);
            
           sqlDate= new Date(utilDate.getTime());
            
            
        } catch (Exception e) {
            e.printStackTrace(); 
        }
       ticketDAO td=new ticketDAO();
       int ticketId=td.getTotal()+10;
       td.insertTicket(ticketId,passengerId, Integer.parseInt(ticketClassID), Integer.parseInt(compartNmber),Integer.parseInt(seat),Integer.parseInt(compartment),sqlDate);
       response.sendRedirect("Menu.jsp");
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
