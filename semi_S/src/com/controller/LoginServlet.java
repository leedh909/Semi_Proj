package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.LoginDao;
import com.dto.LoginDto;

@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String command = request.getParameter("command");
//		System.out.println("[command: " + command + "]");
		
		LoginDto ldto = new LoginDto();
		LoginDao ldao = new LoginDao();
		
		
		
		
		if(command.equals("loginform")) {
			response.sendRedirect("login.jsp");
		} else if(command.equals("login")) {
			
			
			
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			ldto = ldao.login(id, pw);
			
			if(pw.equals(ldto.getPw())) {
				
				if(ldto.getRole().equals("Y")) {
					System.out.println("login success (" + ldto.getId() + ")");
					request.getSession().setAttribute("login", id);
					
					jsResponse("관리자 로그인 성공!!", "index.jsp", response);
	//				response.sendRedirect("index.jsp");
					System.out.println(id);
					
				} else if(ldto.getRole().equals("N")) {
					System.out.println("login success (" + ldto.getId() + ")");
					request.getSession().setAttribute("login", id);
					jsResponse(ldto.getName() + " 님 환영합니다~", "index.jsp", response);
					System.out.println(id);
					
				}
			} else {
				jsResponse("비밀번호가 틀렸습니다.", "login.jsp", response);
			}
			
			
			
		} else if(command.equals("registform")) {
			response.sendRedirect("registform.jsp");
			
		} else if(command.equals("regist")) {
			
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String pw = request.getParameter("pw");
			String email = request.getParameter("email");
			
			ldto = new LoginDto();
			ldto.setId(id);
			ldto.setName(name);
			ldto.setPw(pw);
			ldto.setEmail(email);
			
			ldao = new LoginDao();
			
			int res = ldao.registUser(ldto);
			
			if(res>0) {
				jsResponse("회원가입 성공!!", "login.do?command=loginform", response);
				System.out.println("회원가입 성공!!");
				
			} else {
				jsResponse("회원가입 실패 ㅠㅠ", "login.do?command=registform", response);
				System.out.println("회원가입 실패!!");
			}
			
		} else if(command.equals("logout")) {
			
			request.getSession().invalidate(); 		//세션에 작성된 정보 삭제 
			response.sendRedirect("index.jsp");
			System.out.println("logout success");
			
			
		} else if(command.equals("idchk")) {
			
			String id = request.getParameter("id");
			String res = ldao.idchk(id);
			boolean idnotused = true;
			if(res != null) {
				idnotused = false;
			}
			
			response.sendRedirect("idchk.jsp?idnotused="+idnotused);
			
		} else if(command.equals("mypage")) {
			response.sendRedirect("mypage.jsp");
			
		} else if(command.equals("kakaologin")) {
			
			String pw = request.getParameter("id");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String id = email.split("@")[0]+"@k";
			
			String chk = ldao.idchk(id);
			
			if(chk!=null) {
				request.getSession().setAttribute("login", id);
				System.out.println(id);
				jsResponse(name + " 님 환영합니다~(카카오로 로그인하셨습니다.!)", "index.jsp", response);
				
			}else {
				
				ldto = new LoginDto();
				ldto.setId(id);
				ldto.setName(name);
				ldto.setPw(pw);
				ldto.setEmail(email);
				
				ldao = new LoginDao();
				
				int res = ldao.registUser(ldto);
				
				if(res>0) {
					request.getSession().setAttribute("login", id);
					System.out.println(id);
					jsResponse(name + " 님 환영합니다~(카카오로 로그인하셨습니다.)", "index.jsp", response);
					System.out.println("회원가입 성공!!");
					
				} else {
					jsResponse("회원가입 실패 ㅠㅠ", "login.do?command=loginform", response);
					System.out.println("회원가입 실패!!");
					
				}
				
			}
		}else if(command.equals("naverlogin")) {
			
			String pw = request.getParameter("id");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String id = email.split("@")[0]+"@n";
			
			System.out.println(pw);
			System.out.println(name);
			System.out.println(email);
			System.out.println(id);
			
			String chk = ldao.idchk(id);
			
			if(chk!=null) {
				request.getSession().setAttribute("login", id);
				System.out.println(id);
				jsResponse(name + " 님 환영합니다~(네이버로 로그인하셨습니다.!)", "index.jsp", response);
				
			}else {
				
				ldto = new LoginDto();
				ldto.setId(id);
				ldto.setName(name);
				ldto.setPw(pw);
				ldto.setEmail(email);
				
				ldao = new LoginDao();
				
				int res = ldao.registUser(ldto);
				
				if(res>0) {
					request.getSession().setAttribute("login", id);
					System.out.println(id);
					jsResponse(name + " 님 환영합니다~(네이버로 로그인하셨습니다.)", "index.jsp", response);
					System.out.println("회원가입 성공!!");
					
				} else {
					jsResponse("회원가입 실패 ㅠㅠ", "login.do?command=loginform", response);
					System.out.println("회원가입 실패!!");
					
				}
				
			}
			
		}else if(command.equals("facebooklogin")) {
			
			String pw = request.getParameter("id");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String id = email.split("@")[0]+"@f";
			
			System.out.println(pw);
			System.out.println(name);
			System.out.println(email);
			System.out.println(id);
			
			String chk = ldao.idchk(id);
			
			if(chk!=null) {
				request.getSession().setAttribute("login", id);
				System.out.println(id);
				jsResponse(name + " 님 환영합니다~(페이스북으로 로그인하셨습니다.!)", "index.jsp", response);
				
			}else {
				
				ldto = new LoginDto();
				ldto.setId(id);
				ldto.setName(name);
				ldto.setPw(pw);
				ldto.setEmail(email);
				
				ldao = new LoginDao();
				
				int res = ldao.registUser(ldto);
				
				if(res>0) {
					request.getSession().setAttribute("login", id);
					System.out.println(id);
					jsResponse(name + " 님 환영합니다~(페이스북으로 로그인하셨습니다.)", "index.jsp", response);
					System.out.println("회원가입 성공!!");
					
				} else {
					jsResponse("회원가입 실패 ㅠㅠ", "login.do?command=loginform", response);
					System.out.println("회원가입 실패!!");
					
				}
				
			}
		}
		
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}


	private void jsResponse(String msg, String url, HttpServletResponse response) throws IOException {
		String s = "<script type='text/javascript'>" + "alert('"+msg+"');"
						+"location.href='"+url+"';" + "</script>";
		
		PrintWriter out = response.getWriter();
		out.print(s);
	}
}
