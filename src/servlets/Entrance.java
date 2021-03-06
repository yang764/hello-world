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
 *	@time: 2018��7��27�� ����12:40:57
 */

public class Entrance extends HttpServlet {
	private static final long serialVersionUID = 2L;
	private String un;
	private String pw;
	public static HashMap<String, String> map = new HashMap<>();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
		un = request.getParameter("username");
		pw = request.getParameter("password");
		
		request.getRequestDispatcher("/level_set.jsp").forward(request, response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String lt = request.getParameter("level");
		System.out.println("at Entrance doPost(),level is: "+lt);
		
		if(lt == null){
			doGet(request,response);
		}else{
			LoginAfter.inr = 1; 		
			System.out.println("------------");
			System.out.print("at Entrance doPost(),Referer is: ");
			System.out.println(request.getHeader("Referer"));
			regist(request, response);
		}
		
	}
	
	private void regist(HttpServletRequest request, HttpServletResponse response) {
		
		String le = request.getParameter("level");	
		 		
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {			
				conn = JDBCUtils.getConnection();
				
				String sql = "update user set level= ? where username = ?";

				ps = conn.prepareStatement(sql);

				ps.setString(1, le);
				ps.setString(2, un);

				ps.executeUpdate();
				
				request.setAttribute("username", un);
				request.setAttribute("password", pw);
				map.put("username", un);
				map.put("password", pw);
						
				request.getRequestDispatcher("/LoginUser").forward(request, response);
							
		} catch (Exception e) {
			e.printStackTrace();
		} finally {			
			JDBCUtils.close(conn, ps, null);
		}			
	}
}