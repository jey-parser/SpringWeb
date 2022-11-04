<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- 새 글 작성 페이지 -->

<html>
<head>
	<meta charset="UTF-8">
	<title>새 글 작성</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<link href="resources/css/post.css" rel="stylesheet" type="text/css"/>
</head>

<body>
	<div id="post-layer">
		<%@ include file="header_include.jsp"%>
		
		<section id="postArea" class="column" >
			<form action="${pageContext.request.contextPath}/board/detail?mode=post" method="post">
				<input type="hidden" id="writer" name="writer" value="${memberInfoList[0].name}"/>
				<input type="hidden" id="memberId" name="member_id" value="<%=session.getAttribute("loginId")%>"/>
				<h1><input type="text" id="title" class="display-5" name="title"/></h1>
				<textarea rows="30" name="content" id="content"></textarea>
				<button type="submit" id="postBtn" onclick="return textCnt()">post</button>
			</form>
		</section>
		
		<%@ include file="footer_include.jsp"%>	
	</div>
</body>
<script>
	function textCnt(){
		var title_text = title.value.length;
		var content_text = content.value.length;
	
		if(title_text==0){
			alert("제목을 입력하세요.");
			return false;
		}
		if(content_text==0){
			alert("내용을 입력하세요.");
			return false;
		}
		return true;
	}
	
</script>
</html>
