package auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

import dao.ProductDao;
@WebServlet("/addproductservlet")
public class addproductservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public addproductservlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse responce) throws ServletException, IOException {
		String pname = request.getParameter("pname");
		String uname = (String)request.getSession().getAttribute("user");
		if(pname==null || pname=="") {responce.sendRedirect("index.jsp");return;}
		ProductDao pd = new ProductDao();
		try {
			pd.addOrder(pname,uname );
			System.out.println("Order added");
			responce.sendRedirect("index.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
