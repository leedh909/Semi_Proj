<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<%@ page import="com.dto.GuideViewDto"%>
<%@ page import ="com.dao.PartsDao"%>
<%@ page import ="com.dto.GuideViewDto"%>
<%@ page import ="com.dto.GraphicDto"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
<title> GRAPHCORE | PC추천 </title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
	<link rel="stylesheet" href="assets/css/logostyle.css">
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<style type="text/css">
		.low_all{
			width: 100%;
		}
		.low_img{
			float:left;
			
			padding: 10px;
		
		}
		.low_detail{
			float:right;
			width:650px;
			height:350px;
			padding-top: 10px;
		
		}
		.content{
			clear: both;
		}
		li{
			padding-bottom: 20px;
		}
		tr{
			text-align: center;
		}.modalCpuName{
			cursor:pointer;
		}
		.modalMainboardName{
			cursor:pointer;
		}
		.modalRamName{
			cursor:pointer;
		}
		.modalGpuName{
			cursor:pointer;
		}
		.modalSsdName{
			cursor:pointer;
		}
		.modalCoolerName{
			cursor:pointer;
		}
		.modalPowerName{
			cursor:pointer;
		}
		.modalCaseName{
			cursor:pointer;
		}
		.imgHover{
			cursor:pointer;
			width:50px;
			height:50px;
		}
		.changeName{
			border:none; 
			width:400px; 
			text-align:center;
			
		}
		.changePrice{
			border:none; 
			width:200px; 
			text-align:center;
		}
		.choosebutton{
		   background-color:transparent;
		   	 border:0px transparent; 
		   	 color:black; 
		   	 padding-right:100px;
		   			cursor:pointer;
		}
	     .levelbutton{
	     background-color:transparent; 
	      border:0px transparent; 
	      padding-right:150px;
	      cursor:pointer;
	      }
	</style>
	<script type="text/javascript">

	$(function(){
		var defi = document.getElementById('hideOption1').value;
		if(defi == "1"){
			$("#choose").show();
		}else{
			$("#choose").hide();
		}
	});
	
	$(function(){
			var ho = document.getElementById('hideOption').value;
			if(ho == "high"){
				$("#v_low").hide();
				$("#v_mid").hide();
			}else if(ho == "low"){
				$("#v_mid").hide();
				$("#v_high").hide();
				$("#HighEnd").hide();
			}else if(ho =="mid"){
				$("#v_low").hide();
				$("#v_high").hide();
				$("#HighEnd").hide();
			}
		});

	
		var ssdPh;
		var ramP;
		var cpuP;
		var mainP;
		var ramP;
		var gpuP;
		var ssdP;
		var coolP; 
		var powerP;
		var caseP;

	$(function(){
		
		$('.changeName').prop('readonly', true);
		$('.changePrice').prop('readonly', true);
		cpuP = document.getElementById('changeCpuPrice').value;
		mainP = document.getElementById('changeMainboardPrice').value;
		ramP = document.getElementById('resP').value;
		gpuP = document.getElementById('changeGpuPrice').value;
		ssdP = document.getElementById('ssdP').value;
		coolP = document.getElementById('changeCoolerPrice').value;
		powerP = document.getElementById('changePowerPrice').value;
		caseP = document.getElementById('changeCasePrice').value;
		

		$(document).ready(function(){
			ramP = document.getElementById('resP').value;
			var ct = document.getElementById('ramcount').value;
			document.getElementById('resP').value = ramP*ct;
			ramP = document.getElementById('resP').value;

			document.getElementById('total').value = 1*(cpuP*1+mainP*1+ramP*1+gpuP*1+ssdP*1+coolP*1+powerP*1+caseP*1);
		});
				

		$("#ramcount").click(function(){
				ramP = document.getElementById('ramP').value;
				var ct = document.getElementById('ramcount').value;
				document.getElementById('resP').value = ct * ramP;
				var nRamP = document.getElementById('resP').value;
				document.getElementById('total').value = 1*(cpuP*1+mainP*1+nRamP*1+gpuP*1+ssdP*1+coolP*1+powerP*1+caseP*1);
			});
		
		$("#ramcount").keyup(function(){
			var ct = document.getElementById('ramcount').value;
			if(ct>10){
				alert("10개 이상은 선택할 수 없습니다.");
				document.getElementById('ramcount').value =10;
				ct=10;
			}
			document.getElementById('resP').value = ct * ramP;
			var nRamP = document.getElementById('resP').value;

			document.getElementById('total').value = 1*(cpuP*1+mainP*1+nRamP*1+gpuP*1+ssdP*1+coolP*1+powerP*1+caseP*1);

		});
		
		
		$("#ssdcount").click(function(){
				ssdPh = document.getElementById('ssdPh').value;
				var ct = document.getElementById('ssdcount').value;
				document.getElementById('ssdP').value = ct * ssdPh;	
				var nSsdP = document.getElementById('ssdP').value;

				document.getElementById('total').value = 1*(cpuP*1+mainP*1+ramP*1+gpuP*1+nSsdP*1+coolP*1+powerP*1+caseP*1);
			});
		$("#ssdcount").keyup(function(){
			var ct = document.getElementById('ssdcount').value;
			if(ct>10){
				alert("10개 이상은 선택할 수 없습니다.");
				document.getElementById('ssdcount').value =10;
				ct=10;
			}
			document.getElementById('ssdP').value = ct * ssdP;
			var nSsdP = document.getElementById('ssdP').value;
			
			document.getElementById('total').value = 1*(cpuP*1+mainP*1+ramP*1+gpuP*1+nSsdP*1+coolP*1+powerP*1+caseP*1);
		});
		
		document.getElementById('total').value = 1*(cpuP*1+mainP*1+ramP*1+gpuP*1+ssdP*1+coolP*1+powerP*1+caseP*1);
	});
	//-------------------------모달...------------------------

	$(document).ready(function(){
		
		cpuP = document.getElementById('changeCpuPrice').value;
		mainP = document.getElementById('changeMainboardPrice').value;
		ramP = document.getElementById('resP').value;
		gpuP = document.getElementById('changeGpuPrice').value;
		ssdP = document.getElementById('ssdP').value;
		coolP = document.getElementById('changeCoolerPrice').value;
		powerP = document.getElementById('changePowerPrice').value;
		caseP = document.getElementById('changeCasePrice').value;
		
		//cpu 시작
	    $(".myModal1").click(function(){
	    	
    	var getClass="#"+$(this).attr("class");
    	
	        $(getClass).modal();
	        $(".modalCpuName").hover(
	            	function(){
	            		$(this).css("color","red");
	    	        	$(this).click(function(){
	    	        		var name = this.innerText;
	    					var price =$(this).parents().next().children(".modalCpuPrice").text();
	    					document.getElementById('changeCpu').value= name;
	    					document.getElementById('changeCpuPrice').value = price;
	    					var nCpuP = price;
	    					document.getElementById('total').value = 1*(nCpuP*1+mainP*1+ramP*1+gpuP*1+ssdP*1+coolP*1+powerP*1+caseP*1);

	    					
	    					 $("#myModal1").modal('hide');
	    				});
	            	},function(){
	            		$(this).css("color","black");
	            	}
	            	);
	    });
		
		//main시작
	    $(".myModal2").click(function(){
	    	
	    	var getClass="#"+$(this).attr("class");
	    	
		        $(getClass).modal();
		        $(".modalMainboardName").hover(
		            	function(){
		            		$(this).css("color","red");
		    	        	$(this).click(function(){
		    	        		var name = this.innerText;
		    					var price =$(this).parents().next().children(".modalMainboardPrice").text();
		    					document.getElementById('changeMainboard').value= name;
		    					document.getElementById('changeMainboardPrice').value = price;
		    					var nMainP = price;
		    					document.getElementById('total').value = 1*(cpuP*1+nMainP*1+ramP*1+gpuP*1+ssdP*1+coolP*1+powerP*1+caseP*1);
		    					 $("#myModal2").modal('hide');
		    				});
		            	},function(){
		            		$(this).css("color","black");
		            	}
		            	);
		    });
		//ram시작
		$(".myModal3").click(function(){
			ssdP = document.getElementById('ssdP').value;

			    	var getClass="#"+$(this).attr("class");
			    	
				        $(getClass).modal();
				        $(".modalRamName").hover(
				            	function(){
				            		$(this).css("color","red");
				    	        	$(this).click(function(){
				    	        		var name = this.innerText;
				    					var price =$(this).parents().next().children(".modalRamPrice").text();
				    					document.getElementById('changeRam').value= name;
				    					document.getElementById('resP').value = price;
				    					document.getElementById('ramP').value = price;
				    					
				    					document.getElementById('ramcount').value = 1;	
				    					var nRamP = price;
				    					document.getElementById('total').value = 1*(cpuP*1+mainP*1+nRamP*1+gpuP*1+ssdP*1+coolP*1+powerP*1+caseP*1);
				    					$("#myModal3").modal('hide');
				    				});
				            	},function(){
				            		$(this).css("color","black");
				            	}
				            	);
				    });
		//gpu시작
		$(".myModal4").click(function(){
	    	
	    	var getClass="#"+$(this).attr("class");
	    	
		        $(getClass).modal();
		        $(".modalGpuName").hover(
		            	function(){
		            		$(this).css("color","red");
		    	        	$(this).click(function(){
		    	        		var name = this.innerText;
		    					var price =$(this).parents().next().children(".modalGpuPrice").text();
		    					document.getElementById('changeGpu').value= name;
		    					document.getElementById('changeGpuPrice').value = price;
		    					var nGpuP = price;
		    					
		    					document.getElementById('total').value = 1*(cpuP*1+mainP*1+ramP*1+nGpuP*1+ssdP*1+coolP*1+powerP*1+caseP*1);
		    					
		    					 $("#myModal4").modal('hide');
		    				});
		            	},function(){
		            		$(this).css("color","black");
		            	}
		            	);
		    });
		
		//ssd 시작
		$(".myModal5").click(function(){
			ramP = document.getElementById('resP').value;

			    	var getClass="#"+$(this).attr("class");
			    	
				        $(getClass).modal();
				        $(".modalSsdName").hover(
				            	function(){
				            		$(this).css("color","red");
				    	        	$(this).click(function(){
				    	        		var name = this.innerText;
				    					var price =$(this).parents().next().children(".modalSsdPrice").text();
				    					document.getElementById('changeSsd').value= name;
				    					document.getElementById('ssdP').value = price;
				    					document.getElementById('ssdPh').value = price;
				    					document.getElementById('ssdcount').value = 1;
				    					var nSsdP = price;
				    					document.getElementById('total').value = 1*(cpuP*1+mainP*1+ramP*1+gpuP*1+nSsdP*1+coolP*1+powerP*1+caseP*1);
				    					 $("#myModal5").modal('hide');

				    	        	});
				            	},function(){
				            		$(this).css("color","black");
				            	}
				            	);
				    });
		//cooler 시작
		$(".myModal6").click(function(){
	    	
	    	var getClass="#"+$(this).attr("class");
	    	
		        $(getClass).modal();
		        $(".modalCoolerName").hover(
		            	function(){
		            		$(this).css("color","red");
		    	        	$(this).click(function(){
		    	        		var name = this.innerText;
		    					var price =$(this).parents().next().children(".modalCoolerPrice").text();
		    					document.getElementById('changeCooler').value= name;
		    					document.getElementById('changeCoolerPrice').value = price;
		    					var nCoolP = price;
		    					document.getElementById('total').value = 1*(cpuP*1+mainP*1+ramP*1+gpuP*1+ssdP*1+nCoolP*1+powerP*1+caseP*1);
		    					 $("#myModal6").modal('hide');
		    				});
		            	},function(){
		            		$(this).css("color","black");
		            	}
		            	);
		    });
		
		//power 시작
		$(".myModal7").click(function(){
			    	
			    	var getClass="#"+$(this).attr("class");
			    	
				        $(getClass).modal();
				        $(".modalPowerName").hover(
				            	function(){
				            		$(this).css("color","red");
				    	        	$(this).click(function(){
				    	        		var name = this.innerText;
				    					var price =$(this).parents().next().children(".modalPowerPrice").text();
				    					document.getElementById('changePower').value= name;
				    					document.getElementById('changePowerPrice').value = price;
				    					var nPowerP = price;
				    					document.getElementById('total').value = 1*(cpuP*1+mainP*1+ramP*1+gpuP*1+ssdP*1+coolP*1+nPowerP*1+caseP*1);
				    					 $("#myModal7").modal('hide');
				    				});
				            	},function(){
				            		$(this).css("color","black");
				            	}
				            	);
				    });
		
		//case 시작
		$(".myModal8").click(function(){
			    	
			    	var getClass="#"+$(this).attr("class");
			    	
				        $(getClass).modal();
				        $(".modalCaseName").hover(
				            	function(){
				            		$(this).css("color","red");
				    	        	$(this).click(function(){
				    	        		var name = this.innerText;
				    					var price =$(this).parents().next().children(".modalCasePrice").text();
				    					document.getElementById('changeCase').value= name;
				    					document.getElementById('changeCasePrice').value = price;
				    					var nCaseP = price;
				    					document.getElementById('total').value = 1*(cpuP*1+mainP*1+ramP*1+gpuP*1+ssdP*1+coolP*1+powerP*1+nCaseP*1);
				    					 $("#myModal8").modal('hide');
				    				});
				            	},function(){
				            		$(this).css("color","black");
				            	}
				            	);
				    });
		
	});//---------------------------------모달 끝----------------------------

	</script>
	
</head>
<body>
	<!-- ? Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="assets/img/logo/gcB.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <!-- Preloader Start -->
    <div> 
		<jsp:include page="header.jsp" />
	</div>
    <!-- header end -->
    <main>
    <!--? Hero Start -->
    <div class="slider-area2">
        <div class="slider-height2 d-flex align-items-center">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap hero-cap2 pt-70 text-center">
                        
 <!-- ------------------------------------------------------------------------ -->	
                            <h2 id="v_low">PC 추천 - 저사양</h2>
                            <h2 id="v_mid">PC 추천 - 중사양</h2>
                            <h2 id="v_high">PC 추천 - 고사양</h2>
<!-- ------------------------------------------------------------------------ -->	
                            
                        </div>          
                    </div>	
                </div>
            </div>
        </div>
        
 <!-- ------------------------------------------------------------------------ -->	
        
                        <div class="title"  align="center">
		                        <button class="levelbutton" 
		                        	onclick="location.href='${pageContext.request.contextPath}/spec.jsp?command=lowspec&spec=low'" >
									<h1 style="color:white; font-size:30px;">LOW</h1>
								</button>
		                   		<button class="levelbutton"
		                        	onclick="location.href='${pageContext.request.contextPath}/spec.jsp?command=lowspec&spec=mid'" >
									<h1 style="color:white; font-size:30px;">MID</h1>
								</button>
								<button style="cursor:pointer; background-color:transparent;  border:0px transparent;" 
		                        	onclick="location.href='${pageContext.request.contextPath}/spec.jsp?command=lowspec&spec=high'" >
									<h1 style="color:white; font-size:30px;">HIGH</h1>
								</button>	
                        </div>	
                        		
<!-- ------------------------------------------------------------------------ -->	

                        
    </div>
   <br><br>
   <!-- 사양별 태그 -->
   <section style="height:650px;">   
   	 <!-- Section Tittle -->
   	 <article id="title" align="center">
   	 	<%
		String sp = request.getParameter("spec");
   	 	String id = String.valueOf(session.getAttribute("login"));
   	 	String no = request.getParameter("no");
 
		%>

  <!-- ------------------------------------------------------------------------ -->	
   	  <div>
          <div class="title" align="center"  >
			<button class="choosebutton"
						onclick="location.href='${pageContext.request.contextPath}/ViewController?command=lowspec&spec=<%=sp%>&no=1'" ><h1>CHOOSE 1</h1></button> 
			<button class="choosebutton" 
						onclick="location.href='${pageContext.request.contextPath}/ViewController?command=lowspec&spec=<%=sp%>&no=2'"><h1>CHOOSE 2</h1></button>
			<button class="choosebutton"
						onclick="location.href='${pageContext.request.contextPath}/ViewController?command=lowspec&spec=<%=sp%>&no=3'"><h1>CHOOSE 3</h1></button>
			<button class="choosebutton"
						onclick="location.href='${pageContext.request.contextPath}/ViewController?command=lowspec&spec=<%=sp%>&no=4'" id="HighEnd" ><h1>HIGH-END</h1></button>
			<input type="hidden" id="hideOption" value=<%=sp%>>
			<input type="hidden" id="hideOption1" value="${def}">
		  </div>
      </div>
   	 </article>
   	  <!-- ------------------------------------------------------------------------ -->	
   	<br>
   	
   	
	<div class="container" id="choose">
   	   <div class="low_all">
       	<p class="low_img">
       		 <img src="assets/images/${dto.catPic}" width="500px;" height="500px;">
       	</p>
       	
       	<div class="low_detail" style="height:500px;">
       	<sction>
         <div style="padding-left:10px;">
          <div class="single_sidebar_widget post_category_widget" style="width:600px; float:left;">
            <ul class="list cat-list">
        <!-- ------------------------------------------------------------------------ -->	
            
            <form action ="ViewController" method="post" id="favsave">
            	<input type="hidden" name="command" value="favsave">
                <input type="hidden" name="id" value="<%=id%>">
                <input type="hidden" name="spec" value="<%=sp%>">
                <input type="hidden" name="no" value="<%=no%>">
            <!-- ------------------------------------------------------------------------ -->	
                
            
               <table boarder="0">
               <col width="75">
               <col width="500">
               <col width="100">
               <col width="200">
			<tr style="text-align:center">
				<th></th>
				<th>부품명</th>
				<th>수량</th>
				<th>가격</th>
			</tr>	
				<tr>
					<td><a data-toggle="modal" id="cpu" class="myModal1" ><img src="assets/images/choice1.png" id="cpuImg" class="imgHover"></a></td>
					<td><input type="text"  class="changeName" id ="changeCpu" name="cpuname" value="${dto.cpu}"></td>
					<td>1</td>
					<td><input type="text"  class="changePrice" id ="changeCpuPrice" name="cpuprice" value="${dto.cpuPrice}"></td>
				</tr>
				<tr>
					<td><a data-toggle="modal" id="mainboard" class="myModal2"><img src="assets/images/choice2.png" class="imgHover" ></a></td>
					<td><input type="text"  class="changeName" id ="changeMainboard" name="mainname" value="${dto.mainboard}"></td>
					<td>1</td>
					<td><input type="text"  class="changePrice" id ="changeMainboardPrice" name="mainprice" value="${dto.mainboardPrice}"></td>
				</tr>
				<tr>
					<td><a data-toggle="modal" id="ram" class="myModal3"><img src="assets/images/choice3.png" class="imgHover" ></a></td>
					<td><input type="text"  class="changeName" id ="changeRam" name="ramname" value="${dto.ram}"></td>
					<td> <input style="width:50px;" id="ramcount" type="number" name="ramamount" min="0" max="10" step="1" value="${dto.ramAmount}"> </td>
					<td> <input style="width:80px; text-align:center;  border:none;" type="text" id="resP" 
												class="changePrice" name="ramprice" value="${dto.ramPrice}"></td>
					<input type="hidden" id="ramP" value="${dto.ramPrice}">
					
				</tr>
				<tr>
					<td><a data-toggle="modal" id="gpu" class="myModal4"><img src="assets/images/choice4.png" class="imgHover" ></a></td>
					<td><input type="text"  class="changeName" id ="changeGpu" name="gpuname" value="${dto.gpu}"></td>
					<td>1</td>
					<td><input type="text"  class="changePrice" id ="changeGpuPrice" name="gpuprice" value="${dto.gpuPrice}"></td>
				</tr>
				<tr>
					<td><a data-toggle="modal" id="ssd" class="myModal5"><img src="assets/images/choice5.png" class="imgHover" ></a></td>
					<td><input type="text"  class="changeName" id ="changeSsd" name="ssdname" value="${dto.ssd}"></td>
					<td><input style="width:50px;" id=ssdcount type="number" min="0" max="10" step="1" name="ssdamount"value="${dto.ssdAmount}"></td>
					<td><input style="width:80px; text-align:center;  border:none;" type="text" id="ssdP" 
												class="changePrice" name="ssdprice" value="${dto.ssdPrice}"></td>
					<input type="hidden" id="ssdPh" value="${dto.ssdPrice}">
					
				</tr>
				<tr>
					<td><a data-toggle="modal" id="cooler" class="myModal6"><img src="assets/images/choice6.png" class="imgHover" ></a></td>
					<td><input type="text"  class="changeName" id ="changeCooler" name="coolname" value="${dto.cooler}"></td>
					<td>1</td>
					<td><input type="text"  class="changePrice" id ="changeCoolerPrice" name="coolprice" value="${dto.coolerPrice}"></td>
					
				</tr>	
				<tr>
					<td><a data-toggle="modal" id="power" class="myModal7"><img src="assets/images/choice7.png" class="imgHover" ></a></td>
					<td><input type="text"  class="changeName" id ="changePower" name="powername" value="${dto.power}"></td>
					<td>1</td>
					<td><input type="text"  class="changePrice" id ="changePowerPrice" name="powerprice" value="${dto.powerPrice}"></td>					
				</tr>	
				<tr>
					<td><a data-toggle="modal" id="caseN" class="myModal8"><img src="assets/images/choice8.png" class="imgHover" ></a></td>
					<td><input type="text"  class="changeName" id ="changeCase" name="casename" value="${dto.caseN}"></td>
					<td>1</td>
					<td><input type="text"  class="changePrice" id ="changeCasePrice" name="caseprice" value="${dto.caseNPrice}"></td>
					
				</tr>
				<tr>	
					<td colspan="4" >&nbsp;</td>
				</tr>
				<tr style="border-top: 2px solid;  height:60px;">
					<td></td>
					<td></td>
					<th style="font-size:20px;">합계: </th>
					<td><input type="text" id="total" name="totalprice" style="text-align:center; border:none; width:100px; font-size:20px;" value=""></td>
				</tr>		
				<tr>
				  <!-- ------------------------------------------------------------------------ -->	
					
					<td colspan="4" style="text-align:right; width:100px; padding-right: 70px; height:40px;"><button type="submit" form="favsave" style="width:100px; border:none;"><h2 style="color:black;">저장</h2></button></td>
				
				<!-- ------------------------------------------------------------------------ -->	
					
				</tr>						 
               </table>
              </form>
            </ul>
          </div>
         </div>
        </sction>
       	</div>
       </div>
     </div>
     
     
    
        <!-- ------------------------------Cpumodal----------------------------------- -->
     
     
     	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
		        <h4 class="modal-title" id="myModalLabel1" style=text-align:left>제품 목록</h4>
		      </div>
		      <div class="modal-body">
		        <table>
		        	<col width="50">
	                <col width="500">
	                <col width="200">
				 	<tr style="text-align:center">
						<th></th>
						<th>부품명</th>
						<th>가격</th>
					</tr>
					<c:choose>
						<c:when test="${empty list }">
							<tr>
								<td colspan="3">empty</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="dto" items="${list }">
								<tr>
									<td><img class="modalCpuImg" src="assets/part/CPU/${dto.cpuPic}" width="50px;" height="50px;"></td>
									<td><div class="modalCpuName" >${dto.cpu}</div></td>
									<td><div class="modalCpuPrice">${dto.cpuPrice}</div></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
		        </table>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
		<!------------------------------Cpu modal end ---------------------------------->
		
		<!-- ------------------------------Mainboard modal----------------------------------- -->
     	
     	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
		        <h4 class="modal-title" id="myModalLabel2" style=text-align:left>제품 목록</h4>
		      </div>
		      <div class="modal-body">
		        <table>
		        	<col width="50">
	                <col width="500">
	                <col width="200">
				 	<tr style="text-align:center">
						<th></th>
						<th>부품명</th>
						<th>가격</th>
					</tr>
					<c:choose>
						<c:when test="${empty list }">
							<tr>
								<td colspan="3">empty</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="dto" items="${list }">
								<tr>
									<td><img class="modalMainboardImg" src="assets/part/MAINBOARD/${dto.mainboardPic}" width="50px;" height="50px;" i></td>
									<td><div class="modalMainboardName" >${dto.mainboard}</div></td>
									<td><div class="modalMainboardPrice">${dto.mainboardPrice}</div></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
		        </table>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
		<!------------------------------main modal end ---------------------------------->
		
		<!-- ------------------------------ram modal----------------------------------- -->
     	
     	<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
		        <h4 class="modal-title" id="myModalLabel3" style=text-align:left>제품 목록</h4>
		      </div>
		      <div class="modal-body">
		        <table>
		        	<col width="50">
	                <col width="500">
	                <col width="200">
				 	<tr style="text-align:center">
						<th></th>
						<th>부품명</th>
						<th>가격</th>
					</tr>
					<c:choose>
						<c:when test="${empty list }">
							<tr>
								<td colspan="3">empty</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="dto" items="${list }">
								<tr>
									<td><img class="modalRamImg" src="assets/part/RAM/${dto.ramPic}" width="50px;" height="50px;"></td>
									<td><div class="modalRamName" >${dto.ram}</div></td>
									<td><div class="modalRamPrice">${dto.ramPrice}</div></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
		        </table>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
		<!------------------------------ram modal end ---------------------------------->
		
		<!-- ------------------------------gpu modal----------------------------------- -->
     	
     	<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel4" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
		        <h4 class="modal-title" id="myModalLabel4" style=text-align:left>제품 목록</h4>
		      </div>
		      <div class="modal-body">
		        <table>
		        	<col width="50">
	                <col width="500">
	                <col width="200">
				 	<tr style="text-align:center">
						<th></th>
						<th>부품명</th>
						<th>가격</th>
					</tr>
					<c:choose>
						<c:when test="${empty gList }">
							<tr>
								<td colspan="3">empty</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="dto" items="${gList }">
								<tr>
									<td><img class="modalGpuImg" src="assets/part/GPU/${dto.pic}" width="50px;" height="50px;"></td>
									<td><div class="modalGpuName" >${dto.name}</div></td>
									<td><div class="modalGpuPrice">${dto.price}</div></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
		        </table>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
		<!------------------------------gpu modal end ---------------------------------->
		
		<!-- ------------------------------ssd modal----------------------------------- -->
     	
     	<div class="modal fade" id="myModal5" tabindex="-1" role="dialog" aria-labelledby="myModalLabel5" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
		        <h4 class="modal-title" id="myModalLabel5" style=text-align:left>제품 목록</h4>
		      </div>
		      <div class="modal-body">
		        <table>
		        	<col width="50">
	                <col width="500">
	                <col width="200">
				 	<tr style="text-align:center">
						<th></th>
						<th>부품명</th>
						<th>가격</th>
					</tr>
					<c:choose>
						<c:when test="${empty list }">
							<tr>
								<td colspan="3">empty</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="dto" items="${list }">
								<tr>
									<td><img class="modalSsdImg" src="assets/part/SSD/${dto.ssdPic}" width="50px;" height="50px;"></td>
									<td><div class="modalSsdName" >${dto.ssd}</div></td>
									<td><div class="modalSsdPrice">${dto.ssdPrice}</div></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
		        </table>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
		<!------------------------------ssd modal end ---------------------------------->
		
		<!-- ------------------------------cooler modal----------------------------------- -->
     	
     	<div class="modal fade" id="myModal6" tabindex="-1" role="dialog" aria-labelledby="myModalLabel6" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
		        <h4 class="modal-title" id="myModalLabel6" style=text-align:left>제품 목록</h4>
		      </div>
		      <div class="modal-body">
		        <table>
		        	<col width="50">
	                <col width="500">
	                <col width="200">
				 	<tr style="text-align:center">
						<th></th>
						<th>부품명</th>
						<th>가격</th>
					</tr>
					<c:choose>
						<c:when test="${empty cList }">
							<tr>
								<td colspan="3">empty</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="dto" items="${cList }">
								<tr>
									<td><img class="modalCoolerImg" src="assets/part/COOLER/${dto.pic}" width="50px;" height="50px;"></td>
									<td><div class="modalCoolerName" >${dto.name}</div></td>
									<td><div class="modalCoolerPrice">${dto.price}</div></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
		        </table>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
		<!------------------------------cooler modal end ---------------------------------->
		
		<!-- ------------------------------power modal----------------------------------- -->
     	
     	<div class="modal fade" id="myModal7" tabindex="-1" role="dialog" aria-labelledby="myModalLabel7" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
		        <h4 class="modal-title" id="myModalLabel7" style=text-align:left>제품 목록</h4>
		      </div>
		      <div class="modal-body">
		        <table>
		        	<col width="50">
	                <col width="500">
	                <col width="200">
				 	<tr style="text-align:center">
						<th></th>
						<th>부품명</th>
						<th>가격</th>
					</tr>
					<c:choose>
						<c:when test="${empty list }">
							<tr>
								<td colspan="3">empty</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="dto" items="${list }">
								<tr>
									<td><img class="modalPowerImg" src="assets/part/POWER/${dto.powerPic}" width="50px;" height="50px;"></td>
									<td><div class="modalPowerName" >${dto.power}</div></td>
									<td><div class="modalPowerPrice">${dto.powerPrice}</div></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
		        </table>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
		<!------------------------------power modal end ---------------------------------->
		
		<!-- ------------------------------case modal----------------------------------- -->
     	
     	<div class="modal fade" id="myModal8" tabindex="-1" role="dialog" aria-labelledby="myModalLabel8" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
		        <h4 class="modal-title" id="myModalLabel8" style=text-align:left>제품 목록</h4>
		      </div>
		      <div class="modal-body">
		        <table>
		        	<col width="50">
	                <col width="500">
	                <col width="200">
				 	<tr style="text-align:center">
						<th></th>
						<th>부품명</th>
						<th>가격</th>
					</tr>
					<c:choose>
						<c:when test="${empty list }">
							<tr>
								<td colspan="3">empty</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="dto" items="${list }">
								<tr>
									<td><img class="modalCaseImg" src="assets/part/CASE/${dto.caseNPic}" width="50px;" height="50px;"></td>
									<td><div class="modalCaseName" >${dto.caseN}</div></td>
									<td><div class="modalCasePrice">${dto.caseNPrice}</div></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
		        </table>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
     		<!------------------------------case modal end ---------------------------------->
     		<!------------------------------case modal end ---------------------------------->
     
     <div class="content"></div>
  	</section>
  	<sction class="content">
        
    <sction>
    </main>
    <div class="content"></div>
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
</html>