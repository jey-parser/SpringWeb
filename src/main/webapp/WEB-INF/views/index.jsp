<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- 
	메인 페이지
	사용자가 업로드한 사진을 슬라이드로 보여줌.(진행중)
 -->

<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>

<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<link href="resources/css/index.css" rel="stylesheet" type="text/css">
	<title>메인화면</title>
</head>
<script>
	
	
	
</script>
<body>
	<div>
		<%@ include file="header_include.jsp"%>
		
		<section class="mx-auto" style="clear:both; margin: 0 auto; width:65%; border-radius:10px;">    
		<div id="indexPictures" class="carousel slide" data-ride="carousel">
			
			<!-- Indicators -->
			<ul class="carousel-indicators">
			  <li data-target="#indexPictures" data-slide-to="0" class="active"></li>
			  <li data-target="#indexPictures" data-slide-to="1"></li>
			  <li data-target="#indexPictures" data-slide-to="2"></li>
			</ul>
			
			<!-- The slideshow -->
			<div class="carousel-inner">
			  <div class="carousel-item active">
			    <img src="resources/images/coffee.jpg" alt="coffee">
			  </div>
			  <div class="carousel-item">
			    <img src="resources/images/observation-deck.jpg" alt="deck">
			  </div>
			</div>
			
			<!-- Left and right controls -->
			  <a class="carousel-control-prev" href="#indexPictures" data-slide="prev">
			    <span class="carousel-control-prev-icon"></span>
			  </a>
			  <a class="carousel-control-next" href="#indexPictures" data-slide="next">
			    <span class="carousel-control-next-icon"></span>
			  </a>
			</div>
		</section> 
		
		<%@ include file="footer_include.jsp"%>	
	</div>	  
	<script>
		/* $(function(){      // 이미지 슬라이드 컨트롤를 사용하기 위해서는 carousel를 실행해야한다.      
			$('#carousel-example-generic').carousel({        
				// 슬리아딩 자동 순환 지연 시간        
				// false면 자동 순환하지 않는다.        
				interval: false,        // hover를 설정하면 마우스를 가져대면 자동 순환이 멈춘다.        
				pause: "hover",        // 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복        
				wrap: true,        // 키보드 이벤트 설정 여부(?)        
				keyboard : true	  
			}).css("position","");	
		});   */
		
	</script>
</body>
</html>