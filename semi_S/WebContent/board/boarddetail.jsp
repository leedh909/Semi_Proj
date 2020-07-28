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
    <title> COMQUEST | 자유게시판 </title>
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

	#detailform {
		display:table;
		margin-left:auto;
		margin-right:auto;
		text-align:left;
	}
	
	.table_th{
		padding: 10px 10px;
		font-size: 20px;
		text-align:left;
	}
	
	.tr {
		background-color:none;
		border-bottom:2px solid;
		border-color:gray;
		opacity:0.3;
	}
	
	#size {
		font-size:15px;
	}
	#size2 {
		font-size:18px;
	}
	#titleSize {
		font-size:25px;
	}
	
	#replyform{
		padding: 10px 10px;
		text-align:left;
		font-size:18pt;
	}
	.table_rp{
		padding: 8px 8px;
		font-size: 18px;
		text-align:left;
	}
	#view{
		background:white;
	}
	.buttonset1{
		border-radius: 5px;
		background-color: skyblue;
		color:white;
		border:none;
		cursor:pointer;
	}
	.buttonset2{
		border-radius: 5px;
		background-color: red;
		color:white;
		border:none;
		cursor:pointer;
	}
	.buttonset3{
		border-radius: 5px;
		background-color: gray;
		color:white;
		border:none;
		cursor:pointer;
	}

</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">


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
    
    <div style="padding: 30px" id="detailform">
		 
			<div class="table_th">
				<span id="titleSize" style="padding-right:80px; font-weight:bolder;">${dto.title}</span><br>
				<span id="size" style="padding-right:15px;">${dto.writer}</span>
				<span id="size">${dto.regdate}</span>
			</div>
		<div class="tr">
		</div>
		<div>
			<div class="table_th">
				<textarea id="size2" rows="10" cols="100" name="content" readonly="readonly" style="float:left; padding-right:35px; border:none; resize:none;" >${dto.content }</textarea>
			</div>
		</div>
		
	<div style="padding:30px; height:auto;">
			<table id ="view">
			<col width="200">
			<col width="700">
			<col width="150">
			<%
				if(list.size()==0){
			%>
				<tr>
					<td colspan="4">-----답글이 존재하지 않습니다.-----</td>
				</tr>
			<%
				}else{
						for(BoardReDto redto:list){
			%>
					<tr>
						<th class="table_th" style="width:50px; font-size: 12pt;"><%=redto.getWriteid() %></th>
						<td style="width:100px;"><%=redto.getContent() %></td>
						<td style="width:200px;"><%=redto.getRegdate() %></td>
						<td colspan="4" align="right">
				
						<%
							if(session.getAttribute("login")==null || session.getAttribute("login").equals(null)) {
						%>
							
						<%
							}else if(session.getAttribute("login").equals("ADMIN")||session.getAttribute("login").equals(redto.getWriteid()) ){
						%>
							<a style="cursor:pointer; color:gray; " onclick="location.href='${pageContext.request.contextPath}/BoardController2?command=redelete&reseq=<%=redto.getSeq()%>&seq=<%=dto.getSeq()%>'">삭제</a>
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
	<div style="padding:10px">
	<form action="${pageContext.request.contextPath}/BoardController2" method="post" id="replyform">
		<input type="hidden" name="command" value="replywrite">
		<input type="hidden" name="boardnum" value="${dto.seq}">
			 <span>리플 작성</span>
			<div class="tr">
			</div>
				<div class="table_rp">
					<input type="text" size="10" style="float:left; font-size:15pt;" name="id" value="<%=id%>" readonly="readonly">
					&nbsp;&nbsp;&nbsp;
					<textarea rows="3" cols="90" name="content" style="resize:none;"></textarea>
				</div>
			<div class="tr">
			</div>
			<div>
				<div align="right">	
					<input style="padding:1px 10px; font-size:18px" type="submit" class="buttonset1" value="작성" >
					<div class="tr" style="padding-bottom:20px;">
			</div>					
				</div>
			</div>
			
	</form>
	</div>
	<div>
				
			<div align="right" style="padding-right:20px;">				
				<%
					if(session.getAttribute("login")==null || session.getAttribute("login").equals(null)) {
				%>
					<input style="padding:3px 15px;" type="button" value="목록" class="buttonset3" onclick="location.href='${pageContext.request.contextPath}/ViewController?command=boardlist'">
				<%
					}else if(session.getAttribute("login").equals("ADMIN")||session.getAttribute("login").equals(dto.getWriter()) ){
				%>
					<input style="padding:3px 15px;" type="button" value="수정" class="buttonset1" onclick="location.href='${pageContext.request.contextPath}/BoardController2?command=updateform&seq=<%=dto.getSeq()%>'">
					<input style="padding:3px 15px;" type="button" value="삭제" class="buttonset2" onclick="location.href='${pageContext.request.contextPath}/BoardController2?command=delete&seq=<%=dto.getSeq()%>'">
					<input style="padding:3px 15px;" type="button" value="목록" class="buttonset3" onclick="location.href='${pageContext.request.contextPath}/ViewController?command=boardlist'">
				<%
					}else {
				%>
						<input style="padding:3px 15px;" type="button" value="목록" class="buttonset3" onclick="location.href='${pageContext.request.contextPath}/ViewController?command=boardlist'">
				<%		
					}
				%>
				
			</div>
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