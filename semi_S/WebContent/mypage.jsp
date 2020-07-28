<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
    
<%@ page import="java.util.List" %>
<%@ page import="com.dto.BoardDto" %>
<%@ page import="com.dto.BoardReDto" %>
<%@ page import="com.dto.LoginDto" %>
<%@ page import="com.dto.AnswerDto" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> COMQUEST | MY PAGE </title>
<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

<!-- CSS here -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/css/slicknav.css">
<link rel="stylesheet" href="assets/css/flaticon.css">
<link rel="stylesheet" href="assets/css/hamburgers.min.css">
<link rel="stylesheet" href="assets/css/gijgo.css">
<link rel="stylesheet" href="assets/css/animate.min.css">
<link rel="stylesheet" href="assets/css/animated-headline.css">
<link rel="stylesheet" href="assets/css/magnific-popup.css">
<link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="assets/css/themify-icons.css">
<link rel="stylesheet" href="assets/css/slick.css">
<link rel="stylesheet" href="assets/css/nice-select.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/table.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
</script>
<style type="text/css">
   .table_th{
      padding: 20px 30px;
      border-bottom: 1px solid;
      font-size: 20pt;
   }
   #registform{
      display: table;
      margin-left:auto;
      margin-right: auto;
   }
   .boardtitle{
      color: blue;
   }
   .qnatitle {
      color: blue;
   }
   .buttonset1{
	  	border-radius: 5px;
		background-color: red;
		color:white;
		border:none;
		cursor:pointer;
   }
</style>
    
</head>
<%
   List<BoardDto> list = (List<BoardDto>)request.getAttribute("allList");
   List<BoardReDto> relist = (List<BoardReDto>)request.getAttribute("reList");
   List<LoginDto> lglist = (List<LoginDto>)request.getAttribute("lglist");
   List<AnswerDto> aslist = (List<AnswerDto>)request.getAttribute("aslist");   
   String id = String.valueOf(session.getAttribute("login"));
   
   List<AnswerDto> awlist = (List<AnswerDto>)request.getAttribute("awlist");   
   
%>
<body>
   <div>
      <jsp:include page="header.jsp" />
   </div>
   
   <div class="slider-area2">
        <div class="slider-height2 d-flex align-items-center">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap hero-cap2 pt-70 text-center">
                            <h2>My Page</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Hero End -->
   <br>
   <form action="mypage.do" method="post" id="mypage" >
   <%
      if(!session.getAttribute("login").equals("ADMIN") ) {
   
   %>
         <div style="padding:50px" align="center">
            <h1><%=id %> 님 환영합니다</h1>
         </div>
         
         <div style="padding:50px">
            <h1 align="center"><a href="mypage.do?command=favpc">내가 찜한 pc 보기!!</a></h1>
         </div>   

         <div style="padding:100px;">
            <h1 align="center">내가 쓴 글 </h1>
            <table border="0">
               <col width="50px"><col width="300px">
               <col width="100px"><col width="100px"><col width="50px"> 
               <thead>
                  <th class="table_th">NO</th>
                  <th class="table_th">제목</th>
                  <th class="table_th">작성자</th>
                  <th class="table_th">날짜</th>
                  <th class="table_th">조회수</th>
               </thead>
               <%
                  for(BoardDto dto:list) {
                     System.out.println("글: "+session.getAttribute("login") + "=" + dto.getWriter());
                     if(session.getAttribute("login").equals(dto.getWriter())) {
                        System.out.println("login:" + session.getAttribute("login") + "==" + dto.getWriter());
               %>
                     <tr>
                        <td><%=dto.getSeq() %></td>
                        <td><a class="boardtitle" href="BoardController2?command=detail&seq=<%=dto.getSeq()%>"> <%=dto.getTitle() %></a></td>
                        <td><%=dto.getWriter() %></td>
                        <td><%=dto.getRegdate() %></td>
                        <td><%=dto.getVcount() %></td>
                        
                     </tr>
               <%
                     System.out.println("글 출력 완료");
                     }
                  }
                  
               %>
               
            </table>

         </div>
            
         <div style="padding:100px;">
            <h1 align="center">내가 쓴 댓글 </h1>
            <table border="0">
               <col width="30px">
               <col width="300px"><col width="100px"><col width="50px"> 
               <thead>
                  <th class="table_th">글 번호</th>
                  <th class="table_th">내용</th>
                  <th class="table_th">작성자</th>
                  <th class="table_th">날짜</th>
                  
               </thead>
               <%
                  System.out.println("댓글 목록: " + relist);
                  for(BoardReDto redto: relist) {
                     System.out.println("댓글: " + session.getAttribute("login") + "=" + redto.getWriteid());
                     if(session.getAttribute("login").equals(redto.getWriteid())) {
                        System.out.println("login:" + session.getAttribute("login") + "==" + redto.getWriteid());
               %>
                     <tr>
                        <td><%=redto.getBoardnum() %></td>
                        <td><a class="boardtitle" href="BoardController2?command=detail&seq=<%=redto.getBoardnum()%>"><%=redto.getContent() %></a></td>
                        <td><%=redto.getWriteid() %></td>
                        <td><%=redto.getRegdate() %></td>
                        
                     </tr>
               <%
                     }
                  }
         
               %>
               
            </table>
         </div>
         
         <div style="padding:100px;">
            <h1 align="center">나의 질문 </h1>
            <table border="0">
               <col width="30px"><col width="300px">
               <col width="30px"><col width="100px"><col width="50px"> 
               <thead>
                  <th class="table_th">질문 번호</th>
                  <th class="table_th">내용</th>
                  <th class="table_th">작성자</th>
                  <th class="table_th">작성일</th>
                  <th class="table_th">조회수</th>
                  
               </thead>
               <%
                  System.out.println("질문 목록: " + aslist);
                  for(AnswerDto asdto: aslist) {
                     
                     System.out.println("질문: " + session.getAttribute("login") + "=" + asdto.getId());
                     if(session.getAttribute("login").equals(asdto.getId())) {
                     System.out.println("login:" + session.getAttribute("login") + "==" + asdto.getId());
               %>
      
                     <tr>
                        <td><%=asdto.getQnanum() %></td>
                        <td><a class="qnatitle" href="answer.do?command=detail&qnanum=<%=asdto.getQnanum()%>"><%=asdto.getContent() %></a></td>
                        <td><%=asdto.getId() %></td>
                        <td><%=asdto.getRegdate() %></td>
                        <td><%=asdto.getVcount() %></td>
                        
                     </tr>
               <%
                     }
                  }
         
               %>
               
            </table>
         </div>
   <%
      } else if(session.getAttribute("login").equals("ADMIN")) {
   %>
         <div style="padding:50px" align="center">
            <h1>관리자 계정입니다 </h1>
         </div>
      
         <div style="padding:100px;">
            <h1 align="center">회원 목록</h1>
            <table border="0">
               <col width="100px"><col width="100px"><col width="100px"><col width="50px"><col width="50px">
               <thead>
                  <th class="table_th">ID</th>
                  <th class="table_th">NAME</th>
                  <th class="table_th">EMAIL</th>
                  <th class="table_th">ROLE</th>
                  <th class="table_th">탈퇴</th>
                  
               </thead>
               <%
                  for(LoginDto ldto: lglist) {
                     System.out.println("회원: " + session.getAttribute("login") + "=" + ldto.getId());
               %>
                     <tr>
                        <td><%=ldto.getId() %></td>
                        <td><%=ldto.getName() %></td>
                        <td><%=ldto.getEmail() %></td>
                        <td><%=ldto.getRole() %></td>
                        <td ><input type="button" value="탈퇴!" class="buttonset1"
                           onclick="location.href='mypage.do?command=delete&id=<%=ldto.getId() %>'" ></td>
                     </tr>
               <%
                  }
         
               %>
               
            </table>
         </div>
         <div style="padding:100px;">
            <h1 align="center">Q&A 답변 대기글 </h1>
            <table border="0">
               <col width="30px"><col width="300px">
               <col width="30px"><col width="100px"><col width="50px"> 
               <thead>
                  <th class="table_th">질문 번호</th>
                  <th class="table_th">내용</th>
                  <th class="table_th">작성자</th>
                  <th class="table_th">작성일</th>
                  <th class="table_th">조회수</th>
                  
               </thead>
               <%
                  System.out.println("qna 목록: " + awlist);
                  for(AnswerDto awdto: awlist) {
               %>
                     <tr>
                        <td><%=awdto.getQnanum() %></td>
                        <td><a class="qnatitle" href="answer.do?command=detail&qnanum=<%=awdto.getQnanum()%>"><%=awdto.getContent() %></a></td>
                        <td><%=awdto.getId() %></td>
                        <td><%=awdto.getRegdate() %></td>
                        <td><%=awdto.getVcount() %></td>
                        
                     </tr>
               <%
                     
                  }
         
               %>
               
            </table>
         </div>
            
         <div style="padding:100px;">
            <h1 align="center">내가 쓴 댓글 </h1>
            <table border="0">
               <col width="30px"><col width="30px">
               <col width="100px"><col width="100px"><col width="50px"> 
               <thead>
                  <th class="table_th">댓글 번호</th>
                  <th class="table_th">글 번호</th>
                  <th class="table_th">내용</th>
                  <th class="table_th">작성자</th>
                  <th class="table_th">날짜</th>
                  
               </thead>
               <%
                  System.out.println("댓글 목록: " + relist);
                  for(BoardReDto redto: relist) {
                     System.out.println("댓글: " + session.getAttribute("login") + "=" + redto.getWriteid());
                     if(session.getAttribute("login").equals(redto.getWriteid())) {
                        System.out.println("login:" + session.getAttribute("login") + "==" + redto.getWriteid());
               %>
      
                     <tr>
                        <td><%=redto.getSeq() %></td>
                        <td><%=redto.getBoardnum() %></td>
                        <td><%=redto.getContent() %></td>
                        <td><%=redto.getWriteid() %></td>
                        <td><%=redto.getRegdate() %></td>
                        
                     </tr>
               <%
                     }
                  }
         
               %>
               
            </table>
         </div>
      <%
      }
      %>
   </form>
    <div> 
      <jsp:include page="footer.jsp" />
   </div>
   <!-- Scroll Up -->
    <div id="back-top" >
        <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
    </div>

    <!-- JS here -->

    <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
    <!-- Jquery, Popper, Bootstrap -->
    <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="./assets/js/popper.min.js"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
    <!-- Jquery Mobile Menu -->
    <script src="./assets/js/jquery.slicknav.min.js"></script>

    <!-- Jquery Slick , Owl-Carousel Plugins -->
    <script src="./assets/js/owl.carousel.min.js"></script>
    <script src="./assets/js/slick.min.js"></script>
    <!-- One Page, Animated-HeadLin -->
    <script src="./assets/js/wow.min.js"></script>
    <script src="./assets/js/animated.headline.js"></script>
    <script src="./assets/js/jquery.magnific-popup.js"></script>

    <!-- Date Picker -->
    <script src="./assets/js/gijgo.min.js"></script>
    <!-- Nice-select, sticky -->
    <script src="./assets/js/jquery.nice-select.min.js"></script>
    <script src="./assets/js/jquery.sticky.js"></script>
    
    <!-- counter , waypoint,Hover Direction -->
    <script src="./assets/js/jquery.counterup.min.js"></script>
    <script src="./assets/js/waypoints.min.js"></script>
    <script src="./assets/js/jquery.countdown.min.js"></script>
    <script src="./assets/js/hover-direction-snake.min.js"></script>

    <!-- contact js -->
    <script src="./assets/js/contact.js"></script>
    <script src="./assets/js/jquery.form.js"></script>
    <script src="./assets/js/jquery.validate.min.js"></script>
    <script src="./assets/js/mail-script.js"></script>
    <script src="./assets/js/jquery.ajaxchimp.min.js"></script>
    
    <!-- Jquery Plugins, main Jquery -->   
    <script src="./assets/js/plugins.js"></script>
    <script src="./assets/js/main.js"></script>
    
    </body>
</body>
</html>
