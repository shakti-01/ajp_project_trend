package auth;

import dao.*;
import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/signupservlet")
public class signupservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public signupservlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse responce) throws ServletException, IOException {
		try{
			String uname = request.getParameter("username");
			String pass = request.getParameter("userpass");
			userdao ud = new userdao();
			ud.usersignup(uname, pass);
			System.out.println("done signup");
			responce.sendRedirect("login.jsp");
			 
			} catch (Exception e) {
				e.printStackTrace();
			}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
