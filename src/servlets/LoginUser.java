package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import review.JDBCUtils;

/**
 *  @author: hang yang 
 *	@time: 
 */
public class LoginUser extends HttpServlet {
	private static final long serialVersionUID = 3L;
	public static HttpServletRequest req;
	public static HttpServletResponse res;
	public static String parameter;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		req = request;
		res = response;
		parameter = req.getParameter("username");
		if(parameter == null){			
			parameter = (String) req.getAttribute("username");
		}
		
		System.out.println("at LoginUser doGet()");
		
		login(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("at LoginUser doPost()");
		doGet(request, response);
	}

	private void login(HttpServletRequest request, HttpServletResponse response) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			String un = request.getParameter("username");
			String pw = request.getParameter("password");
			if(un == null){
				un = (String) request.getAttribute("username");
			}
			if(pw == null){
				pw = (String) request.getAttribute("password");
			}
					
			conn = JDBCUtils.getConnection();

			String sql = "select * from user where username=? and password=?";

			ps = conn.prepareStatement(sql);

			ps.setString(1, un);
			ps.setString(2, pw);

			rs = ps.executeQuery();

			if(rs.next()){			
				System.out.println("at LoginUser login():"+request.getParameter("username"));
				request.getRequestDispatcher("/LoginAfter").forward(request, response);
			} else {
				request.getRequestDispatcher("/login_fail.html").forward(request, response);	
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {			
			JDBCUtils.close(conn, ps, rs);
		}	
	}
}