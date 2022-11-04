<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 회원 정보 및 설정 페이지 -->
    
<!DOCTYPE html>
<%
	session.getAttribute("memberInfoList");
%>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이 페이지</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<link href="./resources/css/myPage.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<div id="myPage-layout">
		<%@ include file="header_include.jsp"%>
		<!-- 다크모드 설정 /이름,나이, 닉네임 수정, 비밀번호 수정, 회원틸퇴-->
		
		<div id="outtabox" class="container">
			<h1 style="margin-bottom:30px;">MyPage</h1>
			<div class="container p-3 my-3 border">
				<h3>My Info</h3>
				<button id="open-modal" type="button" class="btn" data-toggle="modal" data-target="#myModal">
			    	Open modal
			    </button>
				
				<!-- The Modal -->
				<div class="modal fade" id="myModal">
					<div class="modal-dialog modal-lg">
					
				    <div class="modal-content">
				    	<!-- Modal Header -->
				        <div class="modal-header">
				            <h4 class="modal-title">MyPage</h4>
				            <button type="button" class="close" data-dismiss="modal">&times;</button>
				        </div>
				        <!-- Modal body -->
				        <div class="modal-body">
				            <div class="border border-left-0 border-right-0 border-top-0 modal-style">
				            	<div class="div-style">Email</div>
				            	<input type="text" id="modal-email" name="email" value="${memberInfoList[0].email}"/>
				            </div>
				            
				            <div class="border border-left-0 border-right-0 modal-style">
					            <div class="div-style">PW</div>
					            <input type="text" id="modal-pw" name="pw"/>
					            <input type="text" id="check-pw" name="pw2"/>
				            </div>
				            
				            <div class="border border-left-0 border-right-0 modal-style">
					            <div class="div-style">Name</div>
					            <input type="text" id="modal-name" name="name" value="${memberInfoList[0].name}"/>
					            <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="findByName()">Check</button>
				            </div>
				            
				            <div class="border border-left-0 border-right-0 modal-style">
					            <div class="div-style">Birth Date</div>
					            <input type="text" id="modal-birthDate" name="birthDate" value="${memberInfoList[0].birthDate}" value="##년 ##월 ##일"/>
				            </div>
				            
							<div class="border border-left-0 border-right-0 border-bottom-0 modal-style">
								<button id="delete" class="div-style btn" onclick="deleteMember()">Delete Me</button>
							</div>
				        </div>
				        <!-- Modal footer -->
				        <div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="saveMember()">Save</button>
				            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				        </div>
				    </div>
				    
				    </div>
				</div><!-- 모달 끝 -->
			</div>
			
			<div class="container p-3 my-3 border">
			    <h2>My First Bootstrap Page</h2>
			    <p>This container has a border and some extra padding and margins.</p>
			</div>
			
			<div class="container p-3 my-3 border" style="display:flex;">
				<h2>Night Mode</h2>
			    <div class="custom-control custom-switch" id="toggle">
				    <input type="checkbox" class="custom-control-input" id="mode" name="mode">
				    <label class="custom-control-label" for="mode"></label>
			    </div>
			</div>
			
			<div class="container p-3 my-3 border">
				<h2>File Upload</h2>
			    	<div class="custom-file mb-3">
				    	<input type="file" class="custom-file-input" id="fileName" name="fileName" onclick="fileUpload()">
				        <label class="custom-file-label" for="fileName">Choose file</label>
			    	</div>
			</div>
		</div>
		<%@ include file="footer_include.jsp"%>	
	</div>
</body>
<script>
	/* 이름 중복확인 */
	function findByName(){
		$.ajax({
			url:"${pageContext.request.contextPath}/member/name",
			type:"get",
			data:{
				"name":document.getElementById("modal-name").value
			},
			contentType:"application/json; charset=UTF-8;",
			dataType:"json",
			success:function(data) {
				if(data==0){
					alert("사용 가능한 이름입니다.");
				} else {
					alert("이미 사용중인 이름입니다.");
				}
			},
			error:function(r,s,e){
				alert("error");
			}
		});
	}
	
	//--------------------------개발중
	//light모드 세팅
	if(${memberInfoList[0].lightMode}==1) {
		$("#mode").attr("checked");
	} 
	
	/* 정보수정 */
	function saveMember(){
		$.ajax({
			url:"${pageContext.request.contextPath}/member/newInfo",
			type:"put",
			data:{
				"name":document.getElementById("modal-name").value,
				"birthDate":document.getElementById("modal-birthDate").value
			},
			contentType:"application/json; charset=UTF-8;",
			dataType:"json",
			success:function(data) {
				
			},
			error:function(r,s,e){
				
			}
		});
	}

	/* 멤버탈퇴 */
	function deleteMember() {
		var del = document.getElementById("delete");
		var pw = document.querySelector("input[name='pw']").value;
		
		if(confirm("회원을 탈퇴하시겠습니까?")) {
			$.ajax({	
				url:"${pageContext.request.contextPath}/member/pw",
				type:"post",
				data:{
					"pw":pw
				},
				contentType:"application/json; charset=UTF-8;",
				dataType:"json",
				success:function(data){
					if(data==0){
						$.ajax({
							url:"${pageContext.request.contextPath}/member/${sessionScope.loginId}",
							type:"delete",
							data:{
								"loginId":"${sessionScope.loginId}"
							},
							contentType:"appplication/json; charset=UTF=8;",
							dataType:"json",
							success:function(data){
								alert("회원 탈퇴 되었습니다. 메인 페이지로 이동합니다.");
								locaiton.href="index";
							},
							error:function(r,s,e){
								alert("다시 한 번 시도해 주세요.");
							}
						});
					}	
				},
				error:function(r,s,e){
					alert("비밀번호가 틀렸습니다. 다시 입력해 주세요.");			
				}		
			});
		}
	}

	//light모드 변경
	/* function updateMode(){
		var toggle = document.querySelector("input[name='mode']").checked;
		if(toggle) {
			
			alert("나이트");
			//나이트모드로			
		} else {
			alert("light");
			//라이트모드로			
		}		
	} */
	
	/* 프로필 사진 변경 */
	/* function fileUpload(){
		var file = document.querySelector("input[name='fileName']").value;
		$.ajax({
			url:"",
			type:"",
			data:{
				
			},
			dataType:"",
			success:function(data) {
				
			},
			error:function(r,s,e){
				
			}
		});
	} */
	
	//파일 업로드
	// Add the following code if you want the name of the file appear on select
	$(".custom-file-input").on("change", function() {
		var fileName = $(this).val().split("\\").pop();
	    $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
	});
</script>
</html>