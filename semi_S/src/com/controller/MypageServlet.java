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
import com.dao.BoardDao;
import com.dao.BoardReDao;
import com.dao.LoginDao;
import com.dao.PartsDao;
import com.dto.AnswerDto;
import com.dto.BoardDto;
import com.dto.BoardReDto;
import com.dto.FavPcDto;
import com.dto.LoginDto;

@WebServlet("/mypage.do")
public class MypageServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   public MypageServlet() {
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html; charset=UTF-8");
      
      String command = request.getParameter("command");
      
      
      if(command.equals("mypage")) {
   
         //내가 쓴 글
         BoardDao dao = new BoardDao();
         List<BoardDto> list = dao.selectAll();
         request.setAttribute("allList", list);

         
         //내가 쓴 댓글
         BoardReDao rdao = new BoardReDao();
         List<BoardReDto> relist = rdao.selectMyre();
         request.setAttribute("reList", relist);

         //내가 쓴 질문
         AnswerDao adao = new AnswerDao();
         List<AnswerDto> alist = adao.selectAll();
         
         request.setAttribute("aslist", alist);
         
         
         //관리자로 로그인했을때 회원목록
         LoginDao ldao = new LoginDao();
         List<LoginDto> lglist = ldao.selectAll();
         request.setAttribute("lglist", lglist);
         
         //QNA 답글 대기목록
         int[] seq = new int[alist.size()];
         for(int i=0;i<alist.size();i++){
            seq[i]=alist.get(i).getQ_gpnum();
            System.out.println("seq: "+seq[i]);
         }
         
         List<AnswerDto> awlist= adao.qnawaiting(seq);
         request.setAttribute("awlist", awlist);
         
         
         
         RequestDispatcher dispatch = request.getRequestDispatcher("mypage.jsp");
         dispatch.forward(request, response);
         
         
         
      } else if(command.equals("delete")) {

         String deleteid = request.getParameter("id");
         LoginDao ldao = new LoginDao();
         
         int res = ldao.deleteMem(deleteid);
         
         if(res>0) {
            
            jsResponse("회원 탈퇴 성공", "mypage.do?command=mypage", response);
            System.out.println("회원 탈퇴 성공");
            
         } else {
            
            jsResponse("회원 탈퇴 실패 ㅠㅠ ", "mypage.do?command=mypage", response);
            System.out.println("탈퇴 실패~~~~");
         }

      } else if(command.equals("favpc")) {
         
         //pc 보여쥬기
         String id = request.getParameter("id");
         PartsDao pdao = new PartsDao();
         List<FavPcDto> favdto = pdao.selectAll2();
//         System.out.println(favdto);
         request.setAttribute("favdto", favdto);
         
         RequestDispatcher dispatch = request.getRequestDispatcher("favpc.jsp");
         dispatch.forward(request, response);
      } else if(command.equals("deletepc")) {
         
         int favnum = (Integer.parseInt(request.getParameter("favnum")));
         PartsDao pdao = new PartsDao();
         int res = pdao.deletepc(favnum);
         
         if(res>0) {
            jsResponse("찜한 pc를 삭제하였습니다!", "mypage.do?command=favpc", response);
            System.out.println("pc 삭제 성공");
            
         } else {
            jsResponse("삭제 실패!", "mypage.do?command=favpc", response);
            System.out.println("pc 삭제 실패");
            
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