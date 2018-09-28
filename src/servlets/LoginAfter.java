package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import review.JDBCUtils;

/**
 *  @author: hang yang 
 *	@time: 2018年7月27日 下午12:41:09
 */
public class LoginAfter extends HttpServlet {
	private static final long serialVersionUID = 4L;
	static public int inr = 0; 	
	public static HttpServletRequest requ;
	public static HttpServletResponse resp;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {	
		login(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("at LoginAfter doPost()");
		doGet(request, response);
	}

	private void login(HttpServletRequest request, HttpServletResponse response) {

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			String un = request.getParameter("username");
			String pw = request.getParameter("password");
			if(un == null){
				un = Entrance.map.get("username");	
			}
			if(pw == null){
				pw = Entrance.map.get("password");	
			}
										
			conn = JDBCUtils.getConnection();

			String sql = "select * from user where username=? and password=?";

			ps = conn.prepareStatement(sql);

			ps.setString(1, un);
			ps.setString(2, pw);

			rs = ps.executeQuery();

			if(rs.next()){				
				if(rs.getString("level") == null){					
					request.getRequestDispatcher("/Entrance").forward(request, response);
				}else if(rs.getString("level").equals("rookie")){
					if(inr == 1){
						request.setAttribute("username", un);
						request.setAttribute("password", pw);
						requ = request;
						resp = response;
						request.getRequestDispatcher("/Xiaobai").forward(request, response);
					}else{
						HttpSession session = request.getSession();
						Integer count = (Integer)session.getAttribute("counter");
						if(count == null){
							count = 1;
							session.setAttribute("counter", count);
							request.setAttribute("COUNT", count);
						} else {
							session.setAttribute("counter", count+1);
							request.setAttribute("COUNT", count+1);
						}
						request.getRequestDispatcher("/xiaobai.jsp").forward(request, response);
					}

				}else if(rs.getString("level").equals("normal")){
					if(inr == 1){
						request.setAttribute("username", un);
						request.setAttribute("password", pw);
						requ = request;
						resp = response;
						request.getRequestDispatcher("/Normal").forward(request, response);
					}else{
						HttpSession session = request.getSession();
						Integer count = (Integer)session.getAttribute("counter");
						if(count == null){
							count = 1;
							session.setAttribute("counter", count);
							request.setAttribute("COUNT", count);
						} else {
							session.setAttribute("counter", count+1);
							request.setAttribute("COUNT", count+1);
						}
						
						request.getRequestDispatcher("/normal.jsp").forward(request, response);
					}

				}else if(rs.getString("level").equals("god")){
					if(inr == 1){
						request.setAttribute("username", un);
						request.setAttribute("password", pw);
						requ = request;
						resp = response;
						request.getRequestDispatcher("/God").forward(request, response);
					}else{
						HttpSession session = request.getSession();
						Integer count = (Integer)session.getAttribute("counter");
						if(count == null){
							count = 1;
							session.setAttribute("counter", count);
							request.setAttribute("COUNT", count);
						} else {
							session.setAttribute("counter", count+1);
							request.setAttribute("COUNT", count+1);
						}
						
						request.getRequestDispatcher("/god.jsp").forward(request, response);
					}					
				}

			}else{
				request.getRequestDispatcher("/login_fail.html").forward(request, response);	
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {			
			JDBCUtils.close(conn, ps, rs);
		}	
	}
}