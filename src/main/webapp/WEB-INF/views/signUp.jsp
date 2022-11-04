<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- 회원 가입 페이지 -->

<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<link href="resources/css/signUp.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="signUp-layer">
		<%@ include file="header_include.jsp"%>	
		
		<div class="container">
			<header><h1>Sign Up</h1></header>
			<section class="mx-auto border" style="padding:80px 0px 40px 0px;">
				
				<form action="member/signUp" method="post" onsubmit="return check()">
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
			    	<div class="input-group mb-3">
						<div class="input-group-prepend">
			        		<span class="input-group-text">NAME</span>
			        	</div>
			      		<input type="text" class="form-control" placeholder="Name" id="name" name="name">
			      		<button type="button" id="nameChk">check</button>
			    	</div>
			    	<div class="input-group mb-3">
						<div class="input-group-prepend">
			        		<span class="input-group-text">BIRTH DATE</span>
			        	</div>
			      		<input type="text" class="form-control" placeholder="Birth date" id="birthDate" name="birthDate">
			    	</div>
			    	<input type="hidden" name="profilePic" value=""/><!-- 사진 넣기 -->
			    	<button type="submit" class="input-group btn btn-primary mb-2">Go MyWeb</button>
				</form>
			</section>	  
		</div>
		
		<%@ include file="footer_include.jsp"%>	
	</div>
</body>
<script>
	$(function(){
		$("#nameChk").click(function(){//이메일 중복 검사 insert하는 곳에서 처리하는 걸로 넘기기
			var name = document.getElementById("name").value;
			if(name==""){
				alert("name을 입력해 주세요.");
			} else {
				$.ajax({
					url:"http://localhost:9096/SpringWeb/member/name",
					type:"get",
					data: {
						"name":name
					},
					contentType:"application/json; charset=utf-8;",
					dataType:"json",
					success:function(data) {
						if(data==0) {
							alert("사용 가능합니다.");
							$("#name").css("border","1px solid #ced4da").css('box-shadow','none').attr("check","true");
						} else {
							alert("중복 입니다.");
							$("#name").css("border","1px solid red").css('box-shadow','rgb(255 0 0 / 30%) 0px 0px 0px 3px').attr("check","false");
						}
					}
				});
			}
		});
	});
	
	function check(){
		if(email.value==""){
			alert("Email을 입력하세요.");
			return false;
		} 
		if(pw.value==""){
			alert("Pw를 입력하세요.");
			return false;
		}
		if(name.value==""){
			alert("Name을 입력하세요.");
			return false;
		} else if(document.getElementById("name").style.border!=""){
			//이름 중복 아니면
			if(document.getElementById("name").getAttribute("check")=="true"){
				if(birthDate.value==""){
					alert("Birth Date를 입력하세요.");
					return false;
				} else {
					return true;
				}
			} else {
				alert("이름 중복 체크를 하세요.");
				return false;
			}
		}
		return false;
	}
</script>
</html>