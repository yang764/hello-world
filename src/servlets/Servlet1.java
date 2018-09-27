package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pojo.UsernAme;
import review.JDBCUtils;

/**
 *  @author: hang yang 
 *	@time: 2018年7月27日 下午12:40:50
 *	主要的Servlet，后面的活动都是由这里开始的
 */
public class Servlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("USER", getUsername(request));/*将getUsername（）返回的结果set给USER，
		在前端可以通过EL表达式“$USER”获取*/
		
		//request对象的转发方式，网页跳转到MainPage.jsp
		request.getRequestDispatcher("/login.html").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);

	}

	public List<UsernAme> getUsername(HttpServletRequest request){

		Connection cn = null;
		PreparedStatement pt = null;
		ResultSet rs = null;

		List<UsernAme> odList = new ArrayList<UsernAme>();
		try{

			cn = JDBCUtils.getConnection();	//获取数据库连接
			String sql = "select * from user"; //select为查询， update为修改
			pt = cn.prepareStatement(sql);
			rs = pt.executeQuery();   //执行sql,返回结果集rs

			while(rs.next()){  //rs.next(), 遍历结果集的指针, 每次往下指一行数据
				UsernAme us = new UsernAme();
				us.setUserName(rs.getString("username"));
				us.setPassWord(rs.getString("password"));
				odList.add(us);				
			}

		}catch(Exception e){

			e.printStackTrace();

		}finally{

			JDBCUtils.close(cn, pt, rs);

		}
		return odList;
	}
}
