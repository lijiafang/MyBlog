package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;

public class LogController extends HttpServlet {

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
		response.setCharacterEncoding("gbk");
		request.setCharacterEncoding("gbk");
		PrintWriter out = response.getWriter();
		
		String type=request.getParameter("type");
		if("add".equals(type)){
			String title=request.getParameter("title");
			String theme=request.getParameter("theme");
			String log=request.getParameter("log");
			
			MyLogBO newLog=new MyLogBO();
			out.print(newLog.addLog(title,theme,log));
		}
		if("show".equals(type)){
			String category=request.getParameter("category");
			MyLogBO showLogBO=new MyLogBO();
			ArrayList al=showLogBO.showLog(category);
			request.setAttribute("log", al);
			if("feeling".equals(category)){
				request.getRequestDispatcher("/feeling.jsp").forward(request, response);
			}
			if("study".equals(category)){
				request.getRequestDispatcher("/study.jsp").forward(request, response);
			}
		}
		if("detail".equals(type)){
			String title=request.getParameter("title");
			String theme=request.getParameter("theme");
			String logTxt=request.getParameter("logTxt");
			String time=request.getParameter("time");
			
			request.setAttribute("title", title);
			request.setAttribute("theme", theme);
			request.setAttribute("logTxt", logTxt);
			request.setAttribute("time", time);
			
			request.getRequestDispatcher("/detail.jsp").forward(request, response);
		}
		if("homepage".equals(type)){
			MyLogBO logBO=new MyLogBO();
			ArrayList al=logBO.get();
			request.setAttribute("log", al);
			request.getRequestDispatcher("/blog.jsp").forward(request, response);
		}
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
