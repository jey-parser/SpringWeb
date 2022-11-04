<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.jh.dto.*" %>   

<!-- 상단 메뉴 및 프로필 -->

<%
	session.getAttribute("memberInfoList");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<a href="${pageContext.request.contextPath}/index"><div id="pageT"><h1>MyBoardProject</h1></div></a>
	
	<div class="btn-group float-right" id="btnGroup"></div>
	
	<nav id="header_menubar" class="navbar navbar-expand-sm navbar-dark"> <!-- 메뉴바 -->
		<ul class="navbar-nav">
			<li class="nav-item"><!-- 현재 있는 곳에 active -->
				<a class="nav-link" href="gallery">Gallery</a>
			</li>
			<li class="nav-item">
			    <a class="nav-link" href="${pageContext.request.contextPath}/board?page=1">List</a>
			</li>
			<li class="nav-item">
			    <a class="nav-link" href="chat">Chat</a>
			</li>
		</ul>
		<!-- 로그인 하면 숨김 해제 -->
		<div id="header_profile"></div>
	</nav>
</body>
<script>
	var g_d;
	var loginId ="${sessionScope.loginId}";

	//로그인 여부에 따라 화면 바꾸기
	//function login_State(){
	window.onload = function(){
		
		if(loginId > 0){//로그인 상태일때	
			$.ajax({
				url:"${pageContext.request.contextPath}/member/info",
				type:"get",
				data:{"loginId":"${sessionScope.loginId}"},
				contentType:"application/json; charset=utf-8;",
				datatype:"json",
				success:function(data){

					var btn = '<button type="button" class="btn btn-primary" onclick=\"location.href=\'${pageContext.request.contextPath}/logout\'\" id="isLogin">logout</button>'
					    +'<button type="button" class="btn btn-primary" onclick=\"location.href=\'${pageContext.request.contextPath}/myPage\'\" id="myPage">myPage</button>'
					    +'<button type="button" class="btn btn-primary" onclick=\"location.href=\'${pageContext.request.contextPath}/myPost\'\" id="myPost">myPost</button>';			
					
					var member = '<div id="profile-div">'
						+'<img id="memberProfile" src="${memberInfoList[0].profilePic}" alt="profile" class="rounded-circle" style="width:40px;">'
						+'<p id="memberName">${memberInfoList[0].name}</p>'
						+'</div>';
						
				    btnGroup.innerHTML=btn;
					header_profile.innerHTML=member;
				}
			})
	 	} else {//로그아웃 상태일때
			var btn = '<button type="button" class="btn btn-primary" onclick=\"location.href=\'${pageContext.request.contextPath}/login\'\" id="isLogin">login</button>'
			    +'<button type="button" class="btn btn-primary" onclick=\"location.href=\'${pageContext.request.contextPath}/signUp\'\" id="signUp">sign up</button>';	 		
			    
			btnGroup.innerHTML=btn;
			
			var header_Btn = header_menubar.querySelectorAll("a");
			for(var i = 0; i < header_Btn.length; i++) {
				header_Btn[i].addEventListener("click", function(e) {
					alert("로그인 후 사용 가능합니다.");
					e.preventDefault();//페이지 이동 막음(이벤트 중지)
				});
			}
		}
	}
</script>
</html>