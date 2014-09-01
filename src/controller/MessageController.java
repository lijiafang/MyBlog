package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;
public class MessageController extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("GBK");
		request.setCharacterEncoding("GBK");
		PrintWriter out = response.getWriter();

		
		String type=request.getParameter("type");
		if("test".equals(type)){
			/*MessageBO messageBO=new MessageBO();
			messageBO.test();*/
			String message = new String(request.getParameter("message").getBytes("iso-8859-1"),"gb2312");
			String friendName = new String(request.getParameter("friendName").getBytes("iso-8859-1"),"gb2312");
			String who=request.getParameter("who");
			out.write(message);
			//String friendName=request.getParameter("friendName");
			//String message=request.getParameter("message");
			/*MessageBO messageBO=new MessageBO();
			boolean b=messageBO.addMessage(who, friendName, message);*/
		}
		if("add".equals(type)){
			String message = new String(request.getParameter("message").getBytes(),"gb2312");
			//String friendName = new String(request.getParameter("friendName").getBytes("iso-8859-1"),"gb2312");
			String who=request.getParameter("who");
			String friendName=request.getParameter("friendName");
			//String message=request.getParameter("message");
			//System.out.println(message);
			MessageBO messageBO=new MessageBO();
			String b=messageBO.addMessage(who, friendName, message);
			out.print(b);
		}
		if("show".equals(type)){
			MessageBO messageBO=new MessageBO();
			ArrayList al=messageBO.showMessage();
			request.setAttribute("message", al);
			request.getRequestDispatcher("/message.jsp").forward(request, response);
		}
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
