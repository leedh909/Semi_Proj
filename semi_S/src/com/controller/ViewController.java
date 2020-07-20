package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.BoardDao;
import com.dto.BoardDto;

@WebServlet("/ViewController")
public class ViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ViewController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
	
		String command = request.getParameter("command");
		System.out.println("viewcontroller["+command+"]");
		
		if(command.equals("index")) {
			response.sendRedirect("index.jsp");
		}else if(command.equals("wordcho")) {
			response.sendRedirect("wordcho.jsp");
		}else if(command.equals("wordmid")) {
			response.sendRedirect("wordmid.jsp");
		}else if(command.equals("boardlist")) {
			
			BoardDao dao = new BoardDao();
			List<BoardDto> list = dao.selectAll();
			request.setAttribute("allList", list);
			RequestDispatcher dispath = request.getRequestDispatcher("boardlist.jsp");
			
			dispath.forward(request, response);
			
		}else if(command.equals("pcrec")) {
			response.sendRedirect("pcrec.jsp");
			
		}else if(command.equals("lowspec")) {
			response.sendRedirect("Low_Spec.jsp");
		}else if(command.equals("itnews")) {
			response.sendRedirect("It_news.jsp");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
