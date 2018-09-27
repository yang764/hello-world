package servlets;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 *  @author: hang yang 
 *	@time: 2018年7月28日 上午9:48:59
 */
public class God extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String parameter = request.getParameter("module");
		request.setAttribute("MOD", parameter);
		if( parameter.equals("baseFilter") ){
			response.setContentType("text/html;charset=utf-8");
			File file = new File("C:/Users/Hang Yang/Desktop/study/eclipse installation/eclipse/workspace/613/WebContent/baseFilter.html");	
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
			byte[] b = new byte[(int)file.length()];
			bis.read(b);			
			response.getOutputStream().write(b);
			response.setHeader("Refresh", "8; url=/613/laoyi3.html");
	
		}else if ( parameter.equals("仿QQ列表分组") ){
			response.setContentType("text/html;charset=utf-8");
			File file = new File("C:/Users/Hang Yang/Desktop/study/eclipse installation/eclipse/workspace/613/WebContent/仿QQ列表分组.html");	
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
			byte[] b = new byte[(int)file.length()];
			bis.read(b);			
			response.getOutputStream().write(b);
			response.setHeader("Refresh", "8; url=/613/laoyi3.html");
			
		} else if ( parameter.equals("ValidateForm") ){
			response.setContentType("text/html;charset=utf-8");
			File file = new File("C:/Users/Hang Yang/Desktop/study/eclipse installation/eclipse/workspace/613/WebContent/ValidateForm.html");	
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
			byte[] b = new byte[(int)file.length()];
			bis.read(b);			
			response.getOutputStream().write(b);
			response.setHeader("Refresh", "8; url=/613/laoyi3.html");
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("到learn");
		learn(request, response);
	}

	private void learn(HttpServletRequest request, HttpServletResponse response) {
		try {
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
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
