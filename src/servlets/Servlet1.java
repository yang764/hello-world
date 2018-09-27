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
 *	@time: 2018��7��27�� ����12:40:50
 *	��Ҫ��Servlet������Ļ���������￪ʼ��
 */
public class Servlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("USER", getUsername(request));/*��getUsername�������صĽ��set��USER��
		��ǰ�˿���ͨ��EL���ʽ��$USER����ȡ*/
		
		//request�����ת����ʽ����ҳ��ת��MainPage.jsp
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

			cn = JDBCUtils.getConnection();	//��ȡ���ݿ�����
			String sql = "select * from user"; //selectΪ��ѯ�� updateΪ�޸�
			pt = cn.prepareStatement(sql);
			rs = pt.executeQuery();   //ִ��sql,���ؽ����rs

			while(rs.next()){  //rs.next(), �����������ָ��, ÿ������ָһ������
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
