package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.BoardDao;
import com.dao.BoardReDao;
import com.dto.BoardDto;
import com.dto.BoardReDto;

@WebServlet("/BoardController2")
public class BoardController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardController2() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
		System.out.println("["+command+"]");
		
		BoardDao dao = new BoardDao();
		BoardReDao redao = new BoardReDao();
		
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
				dispatch("BoardController2?command=writeform",request,response);	
			}
			
		}else if(command.equals("detail")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			
			dao.updatecount(seq);
			System.out.println("seq"+seq);
			BoardDto dto = dao.selectone(seq);
			
			request.setAttribute("dto", dto);
			List<BoardReDto> list = redao.selectAll(seq);
			
			request.setAttribute("ReList", list);
			dispatch("board/boarddetail.jsp",request,response);
			
		}else if(command.equals("replywrite")) {
			int boardnum = Integer.parseInt(request.getParameter("boardnum"));
			String writer = request.getParameter("id");
			String content = request.getParameter("content");
			
			BoardReDto dto = new BoardReDto(boardnum,writer,content);
			
			int res = redao.insert(dto);
			
			if(res>0) {
				//response객체를 포함시켜주는 이유는 printwriter객체를 같이 보내준다.
				jsResponse("댓글 작성 성공","BoardController2?command=detail&seq="+boardnum,response);
				
			}else {
				System.out.println("댓글 작성 실패");
				dispatch("BoardController2?command=detail&seq="+boardnum,request,response);	
			}
	
		}else if(command.equals("updateform")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			BoardDto dto = dao.selectone(seq);
			request.setAttribute("dto", dto);
			dispatch("board/boardupdate.jsp",request,response);
			
		}else if(command.equals("boardupdate")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			
			BoardDto dto = new BoardDto(seq,title,content);
			
			int res = dao.update(dto);
			
			if(res>0) {
				jsResponse("글 수정 성공","BoardController2?command=detail&seq="+seq,response);
			}else {
				dispatch("BoardController2?command=updateform&seq="+seq,request,response);
			}
		}else if(command.equals("delete")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			
			int res = dao.delete(seq);
			
			if(res>0) {
				jsResponse("글 삭제 성공","ViewController?command=boardlist",response);
			}else {
				dispatch("BoardController2?command=detail&seq="+seq,request,response);
			}
			
		}else if(command.equals("redelete")) {
			int reseq = Integer.parseInt(request.getParameter("reseq"));
			int seq = Integer.parseInt(request.getParameter("seq"));
			int res = redao.redelete(reseq);
			
			if(res>0) {
				jsResponse("댓글 삭제 성공","BoardController2?command=detail&seq="+seq,response);
			}else {
				dispatch("BoardController2?command=detail&seq="+seq,request,response);
			}
			
		}
		
		
		
		
		
		
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
