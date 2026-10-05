/* package com.user.servlet;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@SuppressWarnings("serial")
@WebServlet("/register")
public class RegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			String check = req.getParameter("check");
			
//			System.out.println(name+" "+email+" "+phno+" "+check);
			
			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password);
			
			HttpSession session = req.getSession();
			
			if(check != null) {
				UserDAOImpl dao = new UserDAOImpl(DBConnect.getCon());//inject
				
				boolean f2 = dao.checkUser(email);
				
				if(f2) {
					
					boolean f = dao.userRegister(us);
					
					if(f) {
						session.setAttribute("succMsg","User Registered Successfully.....");
						resp.sendRedirect("register.jsp");
						
//						System.out.println("User Registered Successfully.....");
					}else {
						session.setAttribute("failedMsg","Something Wrong on Server.....!");

						resp.sendRedirect("register.jsp");

//						System.out.println("Something Wrong on Server.....");
					}
					
				}else {
					
					session.setAttribute("failedMsg","User Already Exist try another Email id.....");

					resp.sendRedirect("register.jsp");
				}
			}else {
				
				session.setAttribute("failedMsg","Please Check Agree Terms & Conditions...!");

				resp.sendRedirect("register.jsp");
				
//				System.out.println("Please Check Agree Terms & Conditions");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
*/


package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@SuppressWarnings("serial")
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        try {
            String name = req.getParameter("fname");
            String email = req.getParameter("email");
            String phno = req.getParameter("phno");
            String password = req.getParameter("password");
            String check = req.getParameter("check");

            // Remove unnecessary spaces
            if (name != null) {
                name = name.trim();
            }

            if (email != null) {
                email = email.trim().toLowerCase();
            }

            if (phno != null) {
                phno = phno.trim();
            }

            // ---------------- BASIC VALIDATION ----------------

            if (name == null || name.isEmpty()) {
                session.setAttribute("failedMsg", "Please enter your full name.");
                resp.sendRedirect("register.jsp");
                return;
            }

            // Name should contain only letters and spaces
            if (!name.matches("^[A-Za-z ]{2,50}$")) {
                session.setAttribute("failedMsg",
                        "Name should contain only letters and spaces.");
                resp.sendRedirect("register.jsp");
                return;
            }

            // ---------------- EMAIL VALIDATION ----------------

            // Gmail only
//            String emailRegex = "^[A-Za-z0-9._%+-]+@gmail\\.com$";
            String emailRegex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$";

            if (email == null || !email.matches(emailRegex)) {
                session.setAttribute("failedMsg",
                        "Please enter a valid Gmail address.");
                resp.sendRedirect("register.jsp");
                return;
            }

            // ---------------- PHONE VALIDATION ----------------

            // Exactly 10 digits and starts with 6, 7, 8 or 9
            if (phno == null || !phno.matches("^[6-9][0-9]{9}$")) {
                session.setAttribute("failedMsg",
                        "Please enter a valid 10-digit mobile number.");
                resp.sendRedirect("register.jsp");
                return;
            }

            // Reject numbers such as:
            // 0000000000, 1111111111, 2222222222, etc.
            if (phno.matches("^(\\d)\\1{9}$")) {
                session.setAttribute("failedMsg",
                        "Mobile number cannot contain the same digit repeatedly.");
                resp.sendRedirect("register.jsp");
                return;
            }

            // ---------------- PASSWORD VALIDATION ----------------

            /*
             * Password must contain:
             * At least 8 characters
             * At least one letter
             * At least one number
             * At least one special character
             */
//            String passwordRegex =
//                    "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";
//
//            if (password == null || !password.matches(passwordRegex)) {
//                session.setAttribute("failedMsg",
//                        "Password must be at least 8 characters and contain "
//                        + "a letter, a number and a special character.");
//                resp.sendRedirect("register.jsp");
//                return;
//            }
            
         // ---------------- PASSWORD VALIDATION ----------------

         // Minimum 8 characters
         // Allows letters, numbers and special characters

         if (password == null || password.length() < 8) {

             session.setAttribute(
                     "failedMsg",
                     "Password must contain at least 8 characters.");

             resp.sendRedirect("register.jsp");
             return;
         }
            

            // ---------------- TERMS & CONDITIONS ----------------

            if (check == null) {
                session.setAttribute("failedMsg",
                        "Please agree to the Terms & Conditions.");
                resp.sendRedirect("register.jsp");
                return;
            }

            // ---------------- CREATE USER ----------------

            User us = new User();

            us.setName(name);
            us.setEmail(email);
            us.setPhno(phno);
            us.setPassword(password);

            UserDAOImpl dao = new UserDAOImpl(DBConnect.getCon());

            // Check whether email already exists
            boolean emailAvailable = dao.checkUser(email);

            if (emailAvailable) {

                boolean registered = dao.userRegister(us);

                if (registered) {

                    session.setAttribute(
                            "succMsg",
                            "User Registered Successfully.....");

                } else {

                    session.setAttribute(
                            "failedMsg",
                            "Something went wrong on the server.....!");
                }

            } else {

                session.setAttribute(
                        "failedMsg",
                        "User Already Exists. Try another Email ID.....");
            }

            resp.sendRedirect("register.jsp");

        } catch (Exception e) {

            e.printStackTrace();

            session.setAttribute(
                    "failedMsg",
                    "Something went wrong. Please try again.");

            resp.sendRedirect("register.jsp");
        }
    }
}

