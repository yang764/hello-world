package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import review.JDBCUtils;

/**
 *  @author: hang yang 
 *	@time: 2018年7月27日 下午12:40:57
 */

public class RegistUser1 extends HttpServlet {
	private static final long serialVersionUID = 2L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("jlkgjskglkdjgkjgg");
		request.setCharacterEncoding("utf-8");
		regist(request, response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);

	}
	
	private void regist(HttpServletRequest request, HttpServletResponse response) {
		String un = request.getParameter("username");
		String pw = request.getParameter("password");
		String le = request.getParameter("level");
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {			
			conn = JDBCUtils.getConnection();
	
			String sql = "insert into user values(null,?,?,?,?)";
			
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, un);
			ps.setString(2, pw);
			ps.setString(3, le);
			ps.setInt(4, 0);
			ps.executeUpdate();
			System.out.println("login");
			request.getRequestDispatcher("/login.html").forward(request, response);
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {			
			JDBCUtils.close(conn, ps, null);
		}			
	}
}
