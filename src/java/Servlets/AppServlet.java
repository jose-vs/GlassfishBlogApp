/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Entities.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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
    private User userObj;
    private HttpSession session;

    @PersistenceContext
    private EntityManager entityManager;

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

        /**
         * TODO: check if this exists in the database then save it to the
         * session
         */
        if (entityManager != null) {
            Query query
                    = entityManager.createQuery("SELECT u FROM User u WHERE u.uName='"
                            + uName + "' AND u.psw='" + psw + "'");

            userObj = (User) query.getSingleResult();
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
        try {
            processRequest(request, response);
        } catch (NoResultException e) {

            logger.info("_________________BRUH___________________");
            request.setAttribute("error", "Invalid username or password");
            request.getRequestDispatcher("/login.jsp").forward(request, response);

        }

        User user = new User(uName, psw, name);
        request.setAttribute("User", user);
        session.setAttribute("User", user);
        RequestDispatcher dispatcher = getServletContext().
                getRequestDispatcher("/home.jsp");
        dispatcher.forward(request, response);

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
        try {
            processRequest(request, response);
        } catch (NoResultException e) {

            entityManager.createNativeQuery("INSERT INTO User (username, password, name) VALUES (?,?,?)")
                    .setParameter(1, uName)
                    .setParameter(2, psw)
                    .setParameter(3, name)
                    .executeUpdate();

            User user = new User(uName, psw, name);
            request.setAttribute("User", user);
            session.setAttribute("User", user);
            RequestDispatcher dispatcher = getServletContext().
                    getRequestDispatcher("/home.jsp");
            dispatcher.forward(request, response);
        }

        logger.info("_________________BRUH___________________");
        request.setAttribute("error", "User already exists");
        request.getRequestDispatcher("/signup.jsp").forward(request, response);
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
