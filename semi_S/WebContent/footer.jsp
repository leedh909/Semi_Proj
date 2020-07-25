<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBwlNqAEil52XRPHmSVb4Luk18qQG9GqcM&sensor=false&language=ko"></script> 
<style type="text/css">.no-drag {-ms-user-select: none; -moz-user-select: -moz-none; -webkit-user-select: none; -khtml-user-select: none; user-select:none;}</style>

</head>
<body>
<footer>
        <!-- Footer Start-->
        <div class="footer-area footer-padding section-bg" data-background="${pageContext.request.contextPath}/assets/img/gallery/footer_bg.png">
            <div class="container">
            
            <div class="footer-logo text-center mb-90">
            <div class="no-drag">
                <a href="${pageContext.request.contextPath}/ViewController?command=index">
                <img src="${pageContext.request.contextPath}/assets/img/logo/gc.png" alt="" style="float: center;"></a>
                <p style="text-align: center; color: #D8D8D8; ">당신의 편안한 컴퓨터 조립을 위해 기본지식부터 알려드리겠습니다.</p>
                </div>
   	         </div>
            <div class="footer-pera">
                
            </div>
            
            
                    
                <!-- Footer bottom -->
                <div class="footer-bottom">
                    <div class="row">
                        <div class="col-xl-7 col-lg-8 col-md-7">
                            <div class="footer-copy-right">
                                <p>KH정보교육원ㅣ1544-9970ㅣ강남지원 1관 : 서울특별시 강남구 테헤란로14길 6 남도빌딩<br>Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                                </p>                   
                            </div>
                        </div>
                        <div class="col-xl-5 col-lg-4 col-md-5">
                            <div class="footer-copy-right f-right">
                                <!-- social -->
                                <div class="footer-social">
                                    <a href="https://twitter.com/kh_education?lang=ko"><i class="fab fa-twitter"></i></a>
                                    <a href="https://www.facebook.com/khacademy1998/"><i class="fab fa-facebook-f"></i></a>
                                    <a href="https://www.behance.net/search/projects?search=colorLib"><i class="fab fa-behance"></i></a>
                                    <a href="https://www.kheduon.or.kr:454/main/main.kh"><i class="fas fa-globe"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End-->
    </footer>
</body>
</html>