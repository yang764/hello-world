package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import review.JDBCUtils;

/**
 *  @author: hang yang 
 *	@time: 
 */

public class RegistUser1 extends HttpServlet {
	private static final long serialVersionUID = 2L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
		System.out.println("at RegistUser1 doGet()");		
		regist(request, response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//如果xxx.jsp或xxx.html里面form表单提交方式为post/POST, 则调用"action="后面Servlet的doPost()方法;
		//不同Servlet之间的request转发转的是同一个request对象，所以如果之前从jsp或html是POST提交的request,
		//再被转发到别的Servlet时就同样会调用doPost(),直至转到下一个jsp或html后提交一个新的request。
		
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
			System.out.println("at RegistUser1 regist()");
			request.getRequestDispatcher("/login.html").forward(request, response);
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {			
			JDBCUtils.close(conn, ps, null);
		}			
	}
}
