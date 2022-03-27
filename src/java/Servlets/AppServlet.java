/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Entities.User;
import jakarta.annotation.Resource;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.PersistenceContext;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.transaction.HeuristicMixedException;
import jakarta.transaction.HeuristicRollbackException;
import jakarta.transaction.NotSupportedException;
import jakarta.transaction.RollbackException;
import jakarta.transaction.SystemException;
import jakarta.transaction.UserTransaction;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jcvsa
 */
@WebServlet(name = "AppServlet", urlPatterns
        = {
            "/App"
        })
public class AppServlet extends HttpServlet {

    private Logger logger;
    private String uName;
    private String psw;
    private String name;
    private HttpSession session;

    @PersistenceContext
    private EntityManager entityManager;

    @Resource
    private UserTransaction userTransaction;

    public AppServlet() {
        logger = Logger.getLogger(this.getClass().getName());
    }

    @Override
    public void init() {
        ServletConfig config = getServletConfig();
    }

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
            throws ServletException, IOException, NoResultException {
        response.setContentType("text/html;charset=UTF-8");

        session = request.getSession(true);
        uName = request.getParameter("uname");
        psw = request.getParameter("psw");
        name = "TESTNAME";

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
        User user = entityManager.find(User.class, uName);

        if (user != null && user.getPsw().equals(psw)) {
            request.setAttribute("User", user);
            session.setAttribute("User", user);
            RequestDispatcher dispatcher = getServletContext().
                    getRequestDispatcher("/Home");
            dispatcher.forward(request, response);
            return;
        }

        logger.info("_________________BRUH___________________");
        request.setAttribute("error", "Invalid username or password");
        request.getRequestDispatcher("/login.jsp").forward(request, response);
        
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
        User user = entityManager.find(User.class, uName);

        if (user != null) {
            System.out.println("--------FOUND ME--------");
            request.setAttribute("error", "User already exists");
            request.getRequestDispatcher("/signup.jsp").forward(request, response);
        } else {
            System.out.println("------------------ Registering User ------------------");
            user = new User(uName, psw, name);
            try {
                userTransaction.begin();
                entityManager.persist(user);
                userTransaction.commit();
                return;
            } catch (NotSupportedException | SystemException | RollbackException
                    | HeuristicMixedException | HeuristicRollbackException | SecurityException ex) {
                Logger.getLogger(AppServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

            request.setAttribute("User", user);
            session.setAttribute("User", user);
            RequestDispatcher dispatcher = getServletContext().
                    getRequestDispatcher("/Home");
            dispatcher.forward(request, response);
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
