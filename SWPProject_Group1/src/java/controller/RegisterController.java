/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.PassengerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.account;
import EnCrypt.BCrypt;

/**
 *
 * @author My Asus
 */
public class RegisterController extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
    AccountDAO accDAO = new AccountDAO();
    List<account> listacc = accDAO.getAllAccount();
    PassengerDAO passengerDAO = new PassengerDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        request.getRequestDispatcher("register.jsp").forward(request, response);

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
        Boolean checkusername = false;
        HttpSession session = request.getSession();
        String name = request.getParameter("name").replaceAll("\\s+", " ").trim();
        String phone = request.getParameter("phone").trim();
        String email = request.getParameter("email").trim();
        String age = request.getParameter("age").trim();
        String address = request.getParameter("address").replaceAll("\\s+", " ").trim();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        try {
            for (account o : listacc) {
                if (username.equals(o.getUsername())) {
                    request.setAttribute("annoutment", "Username Already Exsits");
                    checkusername = true;
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                } else if (email.equals(o.getEmail())) {
                    request.setAttribute("annoutment", "Email already registered");
                    checkusername = true;
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                } else if (username.contains(" ")) {
                    request.setAttribute("annoutment", "username cannot Contain White-Space Characters");
                    checkusername = true;
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                } else if(phone.equals(o.getPhoneNumber())){
                    request.setAttribute("annoutment", "Phone Number is already Registered");
                    checkusername = true;
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                }

            }
            if (!password.endsWith(repassword)) {
                request.setAttribute("annoutment", "Password and Re-Type Passsword does not match!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
            if(password.length()<8){
                request.setAttribute("annoutment", "Password Much have the lenght of 8 or more");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
            if( !password.matches(".*[A-Za-z].*")){
                request.setAttribute("annoutment", "Password much contain atleast 1 character");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
            if (checkusername.equals(false) && password.equals(repassword) && password.length()>=8  && password.matches(".*[A-Za-z].*")) {
                passengerDAO.insertPassengerInformation(name, email, age, address, phone);
                String cryptPassword = BCrypt.hashpw(password, BCrypt.gensalt());
                accDAO.registerAccount(phone, username, cryptPassword, email, 3, passengerDAO.getLastPassenger().getPassengerID());
                request.setAttribute("annoutment", "Register Successful");
            }

            request.getRequestDispatcher("login.jsp").forward(request, response);
        } catch (ServletException | IOException | NumberFormatException e) {
            System.out.println(e);
        }
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
