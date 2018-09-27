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
 *	@time: 2018年7月27日 下午12:41:04
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
		byte[] bytes = parameter.getBytes("iso8859-1");
		parameter = new String(bytes, "utf-8");
		System.out.println("logiin");
		System.out.println(parameter);
		
		login(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

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
			byte[] bytes = un.getBytes("iso8859-1");
			un = new String(bytes, "utf-8");
			byte[] bytex = pw.getBytes("iso8859-1");
			pw = new String(bytex, "utf-8");
			System.out.println(un);
			System.out.println(pw);
			
			conn = JDBCUtils.getConnection();

			String sql = "select * from user where username=? and password=?";

			ps = conn.prepareStatement(sql);

			ps.setString(1, un);
			ps.setString(2, pw);

			rs = ps.executeQuery();

			if(rs.next()){			
				System.out.println("78");
				System.out.println("76"+request.getParameter("username"));
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
