<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import="com.dao.LoginDao" %>
<%@ page import="com.dto.LoginDto" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	List<LoginDto> list = (List<LoginDto>)request.getAttribute("id"); 
%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/logostyle.css">
<body>
<header>
    <!--? Header Start -->
    <div class="header-area header-transparent">
        <div class="main-header header-sticky">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <!-- Logo -->
                    <div class="col-xl-2 col-lg-2 col-md-1">
                       <div class="no-drag">
                            <div>
                               <a href="${pageContext.request.contextPath}/ViewController?command=index"><img src="${pageContext.request.contextPath}/assets/img/logo/gc.png"></a>
                            </div>
                       </div>
                    </div>
                <div class="col-xl-9 col-lg-10">
			<div class="main-menu black-menu menu-bg-white d-none d-lg-block">
				<div class="hamburger hamburger--collapse">
					<div class="hamburger-box">
						<div class="hamburger-inner"></div>
					</div>
				</div>
				<nav class="hamburger-menu">
					<ul id="navigation">
						<li><a href="${pageContext.request.contextPath}/ViewController?command=index">Home</a></li>
						<li>
							<a href="#">Tutorial</a>
							<ul class="submenu">
                                            <li><a href="${pageContext.request.contextPath}/ViewController?command=wordcho">초급</a></li>
                                            <li><a href="${pageContext.request.contextPath}/ViewController?command=wordmid">중급</a></li>
							</ul>
						</li>
						<li>
							<a href="#">Guide</a>
							<ul class="submenu">
                                            <li><a href="${pageContext.request.contextPath}/ViewController?command=pcrec">PC 추천</a></li>
                                            <li><a href="${pageContext.request.contextPath}/map.jsp">조립업체 추천</a></li>
							</ul>
						</li>
						<li>
							<a href="#">Community</a>
							<ul class="submenu">
                                            <li><a href="${pageContext.request.contextPath}/ViewController?command=QNAlist">Q&A</a></li>
                                            <li><a href="${pageContext.request.contextPath}/ViewController?command=itnews">IT news</a></li>
                                            <li><a href="${pageContext.request.contextPath}/ViewController?command=boardlist">자유게시판</a></li>
							</ul>
						</li>
						<li>
							<%
								if(session.getAttribute("login")==null || session.getAttribute("login").equals(null)) {
							%>
								<a href="#">Info</a>
								<ul class="submenu">
									<li><a href="${pageContext.request.contextPath}/login.do?command=loginform">Login</a></li>
                                  	<li><a href="${pageContext.request.contextPath}/login.do?command=registform">Join</a></li>
                                </ul>
							<%
								} else {
							%>
								<a href="#">Info</a>
								<ul class="submenu">
									<li><a href="${pageContext.request.contextPath}/login.do?command=logout">Logout</a></li>
									<li><a href="${pageContext.request.contextPath}/mypage.do?command=mypage">My Page</a></li>
								</ul>
							<%		
									
								}
							%>
						</li>
					</ul>
				</nav>
			</div>
		</div>
                    <!-- Mobile Menu -->
                    <div class="col-12">
                        <div class="mobile_menu d-block d-lg-none"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Header End -->
</header>
</body>
</html>