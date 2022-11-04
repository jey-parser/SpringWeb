<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- 
	게시글 조회, 수정, 삭제 페이지
	mode에 따라 다른 기능을 함.
 -->

<html>
<head>
	<meta charset="UTF-8">
	<title>${boardDetail.title}</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<link href="../resources/css/detail.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<div id="boardDetail-layer">
		<%@ include file="header_include.jsp"%>
		
		<section id="postArea" class="column" >
			<form action="${pageContext.request.contextPath}/board/detail?mode=edit" method="post">
				<input type="hidden" id="bno" name="bno" value="${boardDetail.bno}"/>
				<h1><input type="text" id="title" class="display-5" value="${boardDetail.title}" name="title"/></h1>
				<div id="dateTime">${boardDetail.dateTime}</div>
				<div id="subTitle">
					<div id="chkBox" class="row" style="visibility:hidden">
						<div class="custom-control custom-checkbox mb-3" id="chk1">
							<input type="checkbox" class="custom-control-input" id="secreat" name="secreat"/>
							<label class="custom-control-label" for="secreat">비밀글</label>
						</div>
						<div class="custom-control custom-checkbox mb-3" id="chk2">
							<input type="checkbox" class="custom-control-input" id="hide" name="hide"/>
							<label class="custom-control-label" for="hide">작성자 숨김</label>
						</div>
					</div>
					<div id="writer">${boardDetail.writer}</div>
				</div>
				<textarea rows="30" name="content" id="content">${boardDetail.content}</textarea>
				<button type="submit" class="btn-style" id="editBtn" onclick="return textCnt()">edit</button>
				<button type="button" class="btn-style" id="delBtn" onclick="delBoard()">delete</button>
			</form>
		</section>
		
		<%@ include file="footer_include.jsp"%>	
	</div>
</body>
<script>
	var mode = "<%=request.getAttribute("mode")%>";
	if(mode=="edit"){
		//chkBox editBtn delBtn 숨김 해제
		chkBox.style.visibility="hidden";
		editBtn.style.visibility="visible";
		delBtn.style.visibility="visible";
	} else if(mode=="admin"){
		//delBtn 해제		
		chkBox.style.visibility="visible";
		editBtn.style.visibility="hidden";
		delBtn.style.visibility="visible";
	} else {
		//chkBox editBtn delBtn 숨김
		chkBox.style.visibility="hidden";
		editBtn.style.visibility="hidden";
		delBtn.style.visibility="hidden";
	}
	
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
	
	function delBoard(){ 
		if(confirm("게시글을 삭제하시겠습니까?")) {
			location.href="del/${boardDetail.bno}";
		}
	}
</script>
</html>
