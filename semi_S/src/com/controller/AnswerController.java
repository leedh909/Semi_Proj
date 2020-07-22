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

import com.dao.AnswerDao;
import com.dto.AnswerDto;

@WebServlet("/answer.do")
public class AnswerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AnswerController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
	
		String command = request.getParameter("command");
		System.out.printf("{%s}\n",command);
	
		AnswerDao dao = new AnswerDao();
		
		if(command.equals("list")) {
			List<AnswerDto> list = dao.selectAll();
			
			request.setAttribute("list", list);
			dispatch("QNAlist.jsp",request,response);
			
		}else if(command.equals("qnawriteform")) {
			
			response.sendRedirect("QNA/QNAwrite.jsp");
				
		}else if(command.equals("qnawrite")) {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String id = request.getParameter("id");
			
			AnswerDto dto = new AnswerDto();
			dto.setTitle(title);
			dto.setContent(content);
			dto.setId(id);
			
			int res = dao.insert(dto);
			
			if(res>0) {
				jsResponse("글 등록 성공","answer.do?command=list",response);
				
			}else {
				dispatch("answer.do?command=qnawriteform", request, response);
			}
		}else if(command.equals("detail")) {
			int qnanum = Integer.parseInt(request.getParameter("qnanum"));
			
			dao.updatecount(qnanum);
			
			System.out.println("qnanum"+qnanum);
			AnswerDto dto = dao.selectOne(qnanum);
			
			request.setAttribute("dto", dto);
			dispatch("QNA/QNAdetail.jsp", request, response);
			
		}else if(command.equals("updateform")) {
			int qnanum = Integer.parseInt(request.getParameter("qnanum"));
			AnswerDto dto = dao.selectOne(qnanum);
			request.setAttribute("dto", dto);
			dispatch("QNA/QNAupdate.jsp",request,response);
			
		}else if(command.equals("qnaupdate")) {
			int qnanum = Integer.parseInt(request.getParameter("qnanum"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			AnswerDto dto = new AnswerDto(qnanum, title, content);
			
			int res = dao.update(dto);
			
			if(res>0) {
				jsResponse("글 수정 성공","answer.do?command=detail&qnanum="+qnanum,response);
			}else {
				dispatch("answer.do?command=updatefrom&qnanum="+qnanum,request,response);
			}
		}else if(command.equals("delete")) {
			int qnanum = Integer.parseInt(request.getParameter("qnanum"));
			
			int res = dao.delete(qnanum);
			
			if(res>0) {
				jsResponse("글 삭제 성공","answer.do?command=list",response);
			}else {
				dispatch("answer.do?command=detail&qnanum="+qnanum,request,response);
			}
		}else if(command.equals("answerform")) {
			int parentboardno = Integer.parseInt(request.getParameter("parentboardno"));
			AnswerDto dto = dao.selectOne(parentboardno);
			
			request.setAttribute("parent", dto);
			dispatch("QNA/answerwrite.jsp", request, response);
			
			
		}else if(command.equals("answerwrite")) {
			
			int parentboardno = Integer.parseInt( request.getParameter("parentboardno") );
			String id = request.getParameter("id");
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			//
			AnswerDto parent = dao.selectOne(parentboardno);
			int parentgroupno = parent.getQ_gpnum();
			int parentgroupsq = parent.getQ_gpseq();
			int parenttabletab = parent.getTabletab();
			
			//update
			int updateRes = dao.updateAnswer(parentgroupno, parentgroupsq);
			if(updateRes>0) {
				System.out.println("순서 변경 성공");
			}else {
				System.out.println("순서 변경 실패 or 변경 글 없음");
			}
			//insert
			AnswerDto dto = new AnswerDto(0,id,parentgroupno,parentgroupsq,parenttabletab,title,content,null);
			int res = dao.insertAnswer(dto);
			
			if(res>0) {
				response.sendRedirect("answer.do?command=list");
			}else {
				response.sendRedirect("answer.do?command=detail&qnanum="+parentboardno);
			}
			
	
	}
	}
	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
         String s="<script type='text/javascript'>"+"alert('"+msg+"');"+"location.href='"+url+"';"+"</script>";
		
		  PrintWriter out = response.getWriter();
		  out.print(s);
		
		
	}

	private void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

