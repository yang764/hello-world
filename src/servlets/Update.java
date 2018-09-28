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
 *	@time: 2018年7月27日 下午12:40:57
 */

@SuppressWarnings("serial")
public class Update extends HttpServlet {
	private String un;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String lt = request.getParameter("update");
		System.out.println("at Update doPost()");
		
		if(lt == null){
			System.out.println("at Update doPost(), updated level is: null");
			doGet(request,response);
		}else{
			LoginAfter.inr = 1; 	
			System.out.println("------------");
			System.out.print("at Update doPost(), Referer is: ");
			System.out.println(request.getHeader("Referer"));
			regist(request, response);
		}		
	}
	
	private void regist(HttpServletRequest request, HttpServletResponse response) {
		un = LoginUser.parameter;
		String le = request.getParameter("update");	
		if(le.equals("next level!")){
			le = "normal";
		}else if(le.equals("next level!!")){
			le = "god";
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