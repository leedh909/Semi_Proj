<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.dto.BoardDto" %>
<%@ page import="com.dto.BoardReDto" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title> GRAPHCORE | 자유게시판 </title>
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon.ico">

	<!-- CSS here -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/owl.carousel.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/slicknav.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/hamburgers.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/gijgo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/animate.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/animated-headline.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/magnific-popup.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fontawesome-all.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/themify-icons.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/slick.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/nice-select.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/posts.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/logostyle.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/table.css">
</head>
<style type="text/css">
	.table_th{
		padding: 20px 30px;
		font-size: 20pt;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#reply_V").hide();
	$(".reply_B").click(function(){
		$("#reply_V").show();
	});
	$("#reply_C").click(function(){
		$("#reply_V").hide();
	});
	
});

</script>
<%
	BoardDto dto = (BoardDto)request.getAttribute("dto");
	System.out.print(dto.toString());
	List<BoardReDto> list = (List<BoardReDto>)request.getAttribute("ReList");
	System.out.print(list);
	String id = String.valueOf(session.getAttribute("login"));
	
%>
<body>
	<!-- ? Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="${pageContext.request.contextPath}/assets/img/logo/gcB.png" alt="">
                </div>
            </div>
        </div>
    </div>
	<div> 
		<jsp:include page="../header.jsp" />
	</div>
	<main>
	<!--? Hero Start -->
    <div class="slider-area2">
        <div class="slider-height2 d-flex align-items-center">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap hero-cap2 pt-70 text-center">
                            <h2>자유게시판-상세정보</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div style="padding: 40px; padding-right: 200px;padding-left: 200px;">
	<table border="3" >
		<col width="100px"><col width="600px;">
		 
		<tr>
			<th class="table_th">NO</th>
			<td>${dto.seq}</td>
		</tr>
		<tr>
			<th class="table_th">DATE</th>
			<td>${dto.regdate}</td>
		</tr>
		<tr>
			<th class="table_th">WRITER</th>
			<td>${dto.writer}</td>
		</tr>
		<tr>
			<th class="table_th">TITLE</th>
			<td>${dto.title}</td>
		</tr>
		<tr>
			<th class="table_th">내용</th>
			<td><textarea rows="20" cols="100" name="content" readonly="readonly">${dto.content }</textarea> </td>
		</tr>
		<tr>
			<td colspan="2" align="right">				
				
				<%
					if(session.getAttribute("login")==null || session.getAttribute("login").equals(null)) {
				%>
					<input type="button" value="목록" onclick="location.href='${pageContext.request.contextPath}/ViewController?command=boardlist'">
				<%
					}else if(session.getAttribute("login").equals("ADMIN")||session.getAttribute("login").equals(dto.getWriter()) ){
				%>
					<input type="button" value="답글" class="reply_B">
					<input type="button" value="수정" onclick="location.href='${pageContext.request.contextPath}/BoardController2?command=updateform&seq=<%=dto.getSeq()%>'">
					<input type="button" value="삭제" onclick="location.href='${pageContext.request.contextPath}/BoardController2?command=delete&seq=<%=dto.getSeq()%>'">
					<input type="button" value="목록" onclick="location.href='${pageContext.request.contextPath}/ViewController?command=boardlist'">
				<%
					}else {
				%>
						<input type="button" value="답글" class="reply_B">
						<input type="button" value="목록" onclick="location.href='${pageContext.request.contextPath}/ViewController?command=boardlist'">
				<%		
					}
				%>
				
			</td>
		</tr>
	</table>
	<div style="padding: 40px" id="reply_V">
	<form action="${pageContext.request.contextPath}/BoardController2" method="post">
		<input type="hidden" name="command" value="replywrite">
		<input type="hidden" name="boardnum" value="${dto.seq}">
		<table border="3" >
			<col width="100px"><col width="100%">
			 
			<tr>
				<th class="table_th">WRITER</th>
				<td><input type="text" name="id" value="<%=id%>" readonly="readonly"></td>
			</tr>
			<tr>
				<th class="table_th">CONTENT</th>
				<td><textarea rows="10" cols="100" name="content"></textarea> </td>
			</tr>
			<tr>
				<td colspan="2" align="right">				
					<input type="submit" value="작성" >
					<input type="button" value="취소" id="reply_C">					
				</td>
			</tr>
		</table>
	</form>
	</div>
	
	<div style="padding:30px; height:600px;">
		<table >
			<%
				if(list.size()==0){
			%>
				<tr>
					<td colspan="3">-----답글이 존재하지 않습니다.-----</td>
				</tr>
			<%
				}else{
						for(BoardReDto redto:list){
			%>
					<tr>
						<th class="table_th" style="width:50px; font-size: 12pt;">WRITER</th>
						<td style="width:100px;"><%=redto.getWriteid() %></td>
						<th class="table_th" style="width:50px; font-size: 12pt;">DATE</th>
						<td style="width:200px;"><%=redto.getRegdate() %></td>
						
						<td></td>
					</tr>
					<tr>
						<th class="table_th" style="width:50px; font-size: 12pt;">CONTENT</th>
						<td colspan="4"><%=redto.getContent() %></td>
					</tr>
					<tr>
						<td colspan="5" align="right">
				
						<%
							if(session.getAttribute("login")==null || session.getAttribute("login").equals(null)) {
						%>
							
						<%
							}else if(session.getAttribute("login").equals("ADMIN")||session.getAttribute("login").equals(redto.getWriteid()) ){
						%>
							<input type="button" value="삭제" onclick="location.href='${pageContext.request.contextPath}/BoardController2?command=redelete&reseq=<%=redto.getSeq()%>&seq=<%=dto.getSeq()%>'">
						<%
							}
						%>
						</td>
					</tr>
					
					
			<%
					}
				}
			%>
		</table>
	</div>
	</div>
	</main>
	<div> 
		<jsp:include page="../footer.jsp" />
	</div>
	<!-- Scroll Up -->
    <div id="back-top" >
        <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
    </div>

    <!-- JS here -->

    <script src="${pageContext.request.contextPath}/assets/js/vendor/modernizr-3.5.0.min.js"></script>
    <!-- Jquery, Popper, Bootstrap -->
    <script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <!-- Jquery Mobile Menu -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.slicknav.min.js"></script>

    <!-- Jquery Slick , Owl-Carousel Plugins -->
    <script src="${pageContext.request.contextPath}/assets/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/slick.min.js"></script>
    <!-- One Page, Animated-HeadLin -->
    <script src="${pageContext.request.contextPath}/assets/js/wow.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/animated.headline.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.magnific-popup.js"></script>

    <!-- Date Picker -->
    <script src="${pageContext.request.contextPath}/assets/js/gijgo.min.js"></script>
    <!-- Nice-select, sticky -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.sticky.js"></script>
    
    <!-- counter , waypoint,Hover Direction -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.counterup.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/waypoints.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.countdown.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/hover-direction-snake.min.js"></script>

    <!-- contact js -->
    <script src="${pageContext.request.contextPath}/assets/js/contact.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.form.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/mail-script.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.ajaxchimp.min.js"></script>
    
    <!-- Jquery Plugins, main Jquery -->	
    <script src="${pageContext.request.contextPath}/assets/js/plugins.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
</body>
</html>