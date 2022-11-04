<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<!-- 자체 로그인과 네이버 로그인 페이지. -->

<%
	String clientId = "0Gz87VHMqCp3feOSP6rD";//애플리케이션 클라이언트 아이디값"
	String redirectURI = URLEncoder.encode("http://localhost:9096/SpringWeb/", "UTF-8");
	SecureRandom random = new SecureRandom();
	String state = new BigInteger(130, random).toString();
	String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";//인증과정에 대한 구분값. 디폴트 : code
	apiURL += "&client_id=" + clientId;//클라이언트id
	apiURL += "&redirect_uri=" + redirectURI;//콜백uri
	apiURL += "&state=" + state;//상태토큰
	session.setAttribute("state", state);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<link href="resources/css/login.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<div id="login-layout">
		<%@ include file="header_include.jsp"%>
		
		<div class="container">
			<header id="loginHeader">
			  	<h1>Login</h1>
			</header>
			<section class="mx-auto border" style="padding:80px 0px 40px 0px;">
				<div id="loginForm">
				   	<div>
					   	<div class="input-group mb-3">
							<div class="input-group-prepend">
				        		<span class="input-group-text">EMAIL</span>
				        	</div>
				      		<input type="text" class="form-control" placeholder="Email" id="email" name="email">
				    	</div>
				    	<div class="input-group mb-3">
							<div class="input-group-prepend">
				        		<span class="input-group-text">PW</span>
				        	</div>
				      		<input type="text" class="form-control" placeholder="Password" id="pw" name="pw">
				    	</div>
				   </div>
				    <button type="button" onclick="loginCheck()" class="btn btn-primary mb-2">Go MyWeb</button>
			    </div>
			
			    <div style="text-align: center; margin-top:20px; clear:both;">
					<a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
			    </div>
			</section>	  
		</div>
		
		<%@ include file="footer_include.jsp"%>	
	</div>
</body>
<script>
	/* 로그인 아이디 빈칸 방지 */
	var loginId;
	if(!("${sessionScope.loginId}">0)) {
		loginId=0;
	}
	
	/* 로그인 된 상태면 메인페이지로 */
	if(loginId>0) {
		window.location.href="index";
	}
	
	/* 자체 로그인 */
	function loginCheck(){
		if(email.value==""){
			alert("email을 입력해 주세요.");
		}
		if(pw.value==""){
			alert("pw를 입력해주세요.");
		} 
		
		if(email.value!="" && pw.value!=""){
			var loginData = {
				email:email.value,
				pw:pw.value
			}
			//로그인 체크
			$.ajax({
				url:"http://localhost:9096/SpringWeb/member",
				type:"post",
				data:JSON.stringify(loginData),
				contentType:"application/json; charset=utf-8;",//보내는 데이터가 JSON이라는 뜻
				dataType:"json",
				success:function(data) { 
					if(data!=0){
						alert("로그인에 성공했습니다.");
						location.href="http://localhost:9096/SpringWeb/index";
					} else {
						alert("로그인에 실패했습니다. 다시 로그인해주세요.");
					}
				}
			});
		}
	}
	
</script>
</html>