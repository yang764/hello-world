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
 * Servlet implementation class Quiz
 */
@SuppressWarnings("serial")
public class Quiz extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int i = 1;
		int count = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		while(request.getParameter(""+i) != null){
			
			String ans = request.getParameter(""+i);
			
			try{
				conn = JDBCUtils.getConnection();
				String sql = "select * from quiz where id=? and answer=?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, i);
				ps.setString(2, ans);
				rs = ps.executeQuery();
				
				if(rs.next()){						
					count++;
				} 
				
			} catch (Exception e) {
				e.printStackTrace();
			} finally {			
				JDBCUtils.close(conn, ps, rs);
			}
			i++;		
		}
		request.setAttribute("COUNT", Math.ceil(((double)count/(double)(i-1))*100));
		request.getRequestDispatcher("/grade.jsp").forward(request, response);	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
