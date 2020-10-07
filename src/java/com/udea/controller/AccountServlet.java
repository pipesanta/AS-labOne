/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.udea.controller;

import com.udea.ejb.AccountFacadeLocal;
import com.udea.ejb.CourseFacadeLocal;
import com.udea.ejb.StudentFacadeLocal;
import com.udea.entity.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author USER
 */
public class AccountServlet extends HttpServlet {

    @EJB
    private CourseFacadeLocal courseFacade;

    @EJB
    private StudentFacadeLocal studentFacade;

    @EJB
    private AccountFacadeLocal accountFacade;
    
    List<Course> courseList = new ArrayList<Course>();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        

        try {
            /* TODO output your page here. You may use following sample code. */
            String action = request.getParameter("action");
            String url = null;

            Account a = null;
            Student student = null;
            
            
            System.out.println("ACTION SELECCIONADA --> " + action );

            switch (action) {

                case "test_DB":
                    Boolean respons = accountFacade.checkLogin("las", "123");
                    System.out.println("DIO ALGO --> " + respons);
                    break;

                case "list":
                    List<Account> findAll = accountFacade.findAll();
                    request.getSession().setAttribute("accounts", findAll);
                    url = "listAccounts.jsp";
                    break;
                    
                case "studentList":
                    List<Student> findAllStudents = (List<Student>) studentFacade.findAll();
                    request.getSession().setAttribute("studentList", findAllStudents);
                    System.out.println(findAllStudents.size());
                    System.out.println( findAllStudents.get(0).getFullname() );
                    // findAllStudents.forEach(item-> System.out.println(item.getId()));
                    url = "studentList.jsp";
                    break;
                    
                case "searchStudents":
                    String toSearch = request.getParameter("documentId");
                    Student s = studentFacade.find(toSearch);
                    List<Student> findAllStudents_1 = new ArrayList<>();
                    findAllStudents_1.add(s);
                    
                    request.getSession().setAttribute("studentItem", s);
                    
                    System.out.println("-------" + toSearch );
                    
                    url="studentList.jsp";                   
                    
                    break;

                case "login":
                    String u = request.getParameter("username");
                    String p = request.getParameter("password");
                                        
                    boolean checkLogin = accountFacade.checkLogin(u, p);
                    if (checkLogin) {
                        request.getSession().setAttribute("login", u);
                        // request.getSession().setAttribute("login_admin", u);
                        url = "index.jsp";
                    } else {
                        url = "login.jsp?error=1";
                    }
                    break;

                case "insert":
                    a = new Account();
                    a.setUsername(request.getParameter("username"));
                    a.setPassword(request.getParameter("password"));
                    a.setEmail(request.getParameter("email"));
                    accountFacade.create(a);
                    url = "login.jsp";
                    break;

                case "delete":
                    String id = request.getParameter("username");
                    a = accountFacade.find(Integer.valueOf(id));
                    accountFacade.remove(a);
                    url = "AccountServlet?action=list";
                    break;

                case "deleteStudent":
                    
                    break;
                case "logout":
                    request.getSession().removeAttribute("login");
                    url = "login.jsp";
                    break;
                    
                case "insertStudent":
                    student = new Student();
                    student.setId(request.getParameter("documentId"));                    
                    student.setFullname(request.getParameter("name"));
                    student.setPassword(request.getParameter("password"));
                    student.setPhoto(request.getParameter("photo"));
                    
                    System.out.println(student);
                    
                    studentFacade.create(student);
                    
                    student = studentFacade.find(request.getParameter("documentId"));
                    request.getSession().setAttribute("userDetails", student);
                  
                    url = "studentDetails.jsp?id=" + request.getParameter("documentId");                
                    
                    break;
                    
                case "updatePhoto":
                    
                    System.out.println("ACTUALIZANDO LA FOTO");
                    
                    String newPhoto = request.getParameter("newPhoto");
                    Student studentToUpdate = (Student) request.getSession().getAttribute("userDetails");
                    
                    studentToUpdate.setPhoto(newPhoto);
                    
                    studentFacade.edit(studentToUpdate);
                    
                    request.getSession().setAttribute("userDetails", studentToUpdate);
                    
                    
                    url = "studentDetails.jsp?id=" + studentToUpdate.getId();
                    
                    break;
                    
                case "viewStudentData":
                    String studentID = request.getParameter("id");
                    System.out.println("#############  CONSULTAR DATA DE :" + studentID );
                    
                    
                    student = studentFacade.find(studentID);
                    System.out.println(student);
                    System.out.println(student.getFullname() );
                    
                    request.getSession().setAttribute("userDetails", student);
                    url= url = "studentDetails.jsp?id=" + studentID;
                                        
                    break;
                               
                case "courseList":
                    courseList = courseFacade.findAll();
                    
                    request.getSession().setAttribute("courseList", courseList);
                    
                    
                    url="courseList.jsp";
                        
                    
                    break;
                case "deleteCourse":
                    String courseId = request.getParameter("courseId");
                    System.out.println("ELIMINAR EL CURSO" + courseId);
                    
                    Course courseToDelete = null;
                    
                    for (Course c : courseList) {
                        if (c.getCourseid().equals(courseId)) {
                            courseToDelete = c;
                        }
                    }
                    
                    courseList.remove(courseToDelete);
                    courseFacade.remove(courseToDelete);
                    
                    request.getSession().setAttribute("courseList", courseList);
                    
                    
                    url="courseList.jsp";
                    
                    break;
                    
                case "createCourse":
                    String courdeId = request.getParameter("courseId");
                    String courseName = request.getParameter("courseName");
                    String credits = request.getParameter("credits");
                    
                    Course course = new Course(courdeId, courseName );
                    course.setCredits( Integer.parseInt(credits));
                    
                    courseFacade.create(course);
                    
                    courseList.add(course);
                    System.out.println("SIZE DE LA LISTA" + courseList.size() );
                    
                    request.getSession().setAttribute("courseList", courseList);
                    
                    
                    
                    url="courseList.jsp";
                    
                    break;
                case "changeStudentListMode":
                    String mode = null;
                    if( request.getParameter("insert") != null){
                        mode = "INSERT";
                    }
                    if(request.getParameter("listing") != null){
                        mode = "LISTING";
                    }
                    request.getSession().setAttribute("studentModeList", mode);
                    
                    url = "studentList.jsp";
                    break;
                    
                default:
                    System.out.println("NO SE RECONCE LA ACCION" + action);
                    url = "pageNotFound.jsp";
                    break;
            }

            System.out.println("IR A URL ..." + url);
            
            if(url != null){
                System.out.println("YENDO A URL ..." + url);
                response.sendRedirect(url);
            }
            

        } finally {
            out.close();
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
