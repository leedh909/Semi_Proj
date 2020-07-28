<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>    
    
<%@ page import="java.util.List" %>
<%@ page import="com.dto.FavPcDto" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> COMQUEST | 찜한 PC </title>
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
		text-align:left;
		padding: 20px 30px;
		border-bottom: 1px solid;
		font-size: 20pt;
	}
	.favd {
		color: black;
	}
	div#backbtn{
		text-align:center;
	}
	.tr {
		background-color:none;
		border-bottom:2px solid;
		border-color:gray;
		opacity:0.3;
	}
	.buttonset1{
		border-radius: 5px;
		background-color: red;
		color:white;
		border:none;
		cursor:pointer;
	}
	.buttonset2{
		border-radius: 5px;
		background-color: skyblue;
		color:white;
		border:none;
		cursor:pointer;
	}
</style>
    
</head>
<%
	List<FavPcDto> list = (List<FavPcDto>)request.getAttribute("favdto");
	String id = String.valueOf(session.getAttribute("login"));
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
                            <h2>찜한 PC</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Hero End -->
	<br>
	<div style="width:1200px; padding-left:500px;">
	
	<form action="mypage.do?command=favpc" method="post" id="favpc">
        <div style="padidng:30px;" >
        <h1 align="center"><%=id %> 님의 PC 목록</h1><br><br>
    
		<%
			for(FavPcDto dto : list) {
				if(session.getAttribute("login").equals(dto.getId())) {
					

		%>   
    		<h2></h2>
	    	<table border="0">
            	<col width="300px"><col width="100px"><col width="100px">
				<thead>
					<tr>
						<th class="table_th">부품명</th>
						<th class="table_th">수량</th>
						<th class="table_th">가격</th>
					</tr>
				</thead>	

				<tr class="favd">
					<td><%=dto.getCpuName() %></td>
					<td>1</td>
					<td><%=dto.getCpuPrice() %></td>
				</tr>
				<tr>
					<td><%=dto.getMbName() %></td>
					<td>1</td>
					<td><%=dto.getMbPrice() %></td>
				</tr>	
				<tr>
					<td><%=dto.getRamName() %></td>
					<td><%=dto.getRamAmount() %></td>
					<td><%=dto.getRamPrice() %></td>
				</tr>
				<tr>	
					<td><%=dto.getGraphicName() %></td>
					<td>1</td>
					<td><%=dto.getGraphicPrice() %></td>
				</tr>
				<tr>	
					<td><%=dto.getSsdName() %></td>
					<td><%=dto.getSsdAmount() %></td>
					<td><%=dto.getSsdPrice() %></td>
				</tr>
				<tr>	
					<td><%=dto.getCoolName() %></td>
					<td>1</td>
					<td><%=dto.getCoolPrice() %></td>
				</tr>
				<tr>	
					<td><%=dto.getPowerName() %></td>
					<td>1</td>
					<td><%=dto.getPowerPrice() %></td>
				</tr>
				<tr>	
					<td><%=dto.getCaseName() %></td>
					<td>1</td>
					<td><%=dto.getCasePrice() %></td>
				</tr>
					
				<tr class="favd">
					<td></td>
					<th>합계: </th>
					<td><%=dto.getTotalPrice() %></td>
				</tr>	
				<tr class="favd">
					<td></td>
					<td></td>
					<td><input type="button" value="삭제" class="buttonset1" 
					onclick="location.href='mypage.do?command=deletepc&favnum=<%=dto.getFavNum()%>'"></td>	
					<div class="tr">
					</div>
	        </table>
	        <br><br><br>
        <%
				}
			}
        %>
        
       </div> 
       <div id="backbtn">
       		<input type="button" value="뒤로가기" class="buttonset2" onclick="location.href='mypage.do?command=mypage'">
       </div>
       <br><br><br><br>
   </form>
</div>
     
			
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