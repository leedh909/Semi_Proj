package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.dao.BoardDao;
import com.board.dto.BoardDto;

@WebServlet("/BoardController")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("["+command+"]");
		
		BoardDao dao = new BoardDao();
		
		if(command.equals("writeform")) {
			response.sendRedirect("board/boardwrite.jsp");
			
		}else if(command.equals("boardwrite")) {
			
			String writer = request.getParameter("writer");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			BoardDto dto = new BoardDto(writer,title,content);
			
			int res = dao.insert(dto);
			
			if(res>0) {
				//response객체를 포함시켜주는 이유는 printwriter객체를 같이 보내준다.
				jsResponse("글 작성 성공","ViewController?command=boardlist",response);
				
			}else {
				dispatch("BoardController?command=writeform",request,response);
				
			}
			
		}else if(command.equals("detail")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			System.out.println("seq"+seq);
			BoardDto dto = dao.selectone(seq);
			
			request.setAttribute("dto", dto);
			dispatch("board/boarddetail.jsp",request,response);
			
		}
		
		/*else if(command.equals("updateform")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			MyMVCDto dto = biz.selectOne(seq);
			request.setAttribute("dto", dto);
			dispatch("boardupdate.jsp",request,response);
			
		}else if(command.equals("boardupdate")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			
			MyMVCDto dto = new MyMVCDto(seq,title,content);
			
			boolean res = biz.update(dto);
			
			if(res) {
				jsResponse("글 수정 성공","controller.do?command=detail&seq="+seq,response);
			}else {
				dispatch("controller.do?command=updateform&seq="+seq,request,response);
			}
		}else if(command.equals("delete")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			
			boolean res = biz.delete(seq);
			
			if(res) {
				jsResponse("글 삭제 성공","controller.do?command=list",response);
			}else {
				dispatch("controller.do?command=delete&seq="+seq,request,response);
			}
			
		}*/
		
		
		
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
		
	}
	
	private void jsResponse(String msg, String url,HttpServletResponse response) throws IOException {
		
		String s="<script type='text/javascript'>"+"alert('"+msg+"');"+"location.href='"+url+"';"+"</script>";
		
		PrintWriter out = response.getWriter();
		out.print(s);
		
		
	}

}
