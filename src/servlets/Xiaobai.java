package servlets;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




/**
 *  @author: hang yang 
 *	@time: 2018��7��28�� ����9:48:59
 */
public class Xiaobai extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String parameter = request.getParameter("module");
		
		if( parameter.equals("�ڵ��CRUD") ){
			response.setContentType("text/html;charset=utf-8");
			File file = new File("C:/Users/Hang Yang/Desktop/study/eclipse installation/eclipse/workspace/613/WebContent/�ڵ��CRUD.html");	
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
			byte[] b = new byte[(int)file.length()];
			bis.read(b);			
			response.getOutputStream().write(b);
			response.setHeader("Refresh", "8; url=/613/laoyi1.html");
					
		}else if ( parameter.equals("���ص�") ){
			response.setContentType("text/html;charset=utf-8");
			File file = new File("C:/Users/Hang Yang/Desktop/study/eclipse installation/eclipse/workspace/613/WebContent/mydemo.html");	
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
			byte[] b = new byte[(int)file.length()];
			bis.read(b);			
			response.getOutputStream().write(b);
			response.setHeader("Refresh", "8; url=/613/laoyi1.html");
			
		}else if ( parameter.equals("��������������") ){
			response.setContentType("text/html;charset=utf-8");
			File file = new File("C:/Users/Hang Yang/Desktop/study/eclipse installation/eclipse/workspace/613/WebContent/��������������.html");	
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
			byte[] b = new byte[(int)file.length()];
			bis.read(b);			
			response.getOutputStream().write(b);
			response.setHeader("Refresh", "8; url=/613/laoyi1.html");
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("��learn");
		learn(request, response);
	}

	private void learn(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			Integer count = (Integer)session.getAttribute("counter");
			
			if(count == null){	
				System.out.println("llll");
				count = 1;
				session.setAttribute("counter", count);
				request.setAttribute("COUNT", count);
				
			} else {
				System.out.println("ppppppppppp");
				session.setAttribute("counter", count+1);
				System.out.println(count);
				request.setAttribute("COUNT", count+1);
			}
					
			request.getRequestDispatcher("/xiaobai.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}


	}
}