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

public class Update extends HttpServlet {
	
	private HashMap<String, String> paramMap = new HashMap<String, String>();
	private String un;
	private String pw;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String lt = request.getParameter("update");
		System.out.println(lt);
		
		if(lt == null){
			System.out.println("null");
			doGet(request,response);
		} else {
			LoginAfter.inr = 1; 
			
			System.out.println("------------");
			System.out.println(request.getHeader("Referer"));
			regist(request, response);
		}
		
	}
	
	private void regist(HttpServletRequest request, HttpServletResponse response) {
		un = LoginUser.parameter;
		System.out.println("-------"+un);
		String le = request.getParameter("update");	
		if(le.equals("阶段二")){
			System.out.println("jin");
			le = "一般";
		}else if(le.equals("阶段三")){
			le = "大神";
		}
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {			
				conn = JDBCUtils.getConnection();
					
				String sql = "update user set level= ? where username = ?";

				ps = conn.prepareStatement(sql);

				ps.setString(1, le);
				ps.setString(2, un);

				ps.executeUpdate();

				request.getRequestDispatcher("/LoginAfter").forward(request, response);
							
		} catch (Exception e) {
			e.printStackTrace();
		} finally {			
			JDBCUtils.close(conn, ps, null);
		}			
	}
}
