<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<!-- 
	게시판 목록 
	페이징처리
-->

<html>
<head>
	<meta charset="UTF-8">
	<title>게시판</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<link href="resources/css/board.css" rel="stylesheet" type="text/css"/>
</head>
<body>	
	<div id="board-layer">
		<%@ include file="header_include.jsp"%>
		
		<div class="container">
		  	<div class="list-group mx-auto">
			    <div class="list-style"><!-- 목록 -->
			    	<span style="margin-left: 14px;">Title</span>
			    	<div>
			    		<span>Writer</span>
			    		<span style="margin-left: 50px;">Date</span>
			    	</div>
			    </div>
			    <c:choose>
				    <c:when test="${empty boardList}">
				    	데이터가 없습니다.
				    </c:when>
				    <c:when test="${!empty boardList}">
				    	<c:forEach var="list" items="${boardList}">
						    <a href="board/<c:out value="${list.bno}"/>" class="list-group-item list-group-item-action">
							    <span class="span-style"><c:out value="${list.title}"/></span>
							    <div style="background-color:transparent">
							    	<span style="margin-right:50px;"><c:out value="${list.writer}"/></span>
							    	<span><c:out value="${list.dateTime}"/></span>
							    </div>
						    </a>
				    	</c:forEach>
				    </c:when>
			    </c:choose>
			</div>
		</div> 
		
		<!-- 페이징 처리 -->
		<ul class="pagination">
		    <li class="page-item"><a class="page-link" href="">Previous</a></li>
		    	<div id="pageBox" style="display: flex;"></div>
			<li class="page-item"><a class="page-link" href="">Next</a></li>
			<li><button type="button" class="btn-style" id="writeBtn" onclick="location.href='post'">Write</button></li>
		</ul>
		
		<%@ include file="footer_include.jsp"%>	
	</div>	
</body>
<script>
	var nav = document.querySelector(".navbar-nav");
	//class 제거, 붙이기
	
	var thisPage = document.querySelector(".nav-item:nth-child(2)");
	//document.thisPage.classList.add("active"); //active 클래스 추가
	
	/* 
	페이징 처리
	pafeNum -> 총 페이지 수
	page -> 페이징 넘버 코드
	totalPage -> 총 페이지 수까지의 출력 코드
	 */
	var pageNum = <%=request.getAttribute("totalPage")%>;
	var totalPage=""; 
	for(var i = 1; i <= pageNum; i++) {
		var page = '<li class="page-item"><a class="page-link" href="board?page='+i+'">'+i+'</a></li>';
		totalPage = totalPage + page;
	}
	document.getElementById("pageBox").innerHTML=totalPage;	
	
</script>
</html>
