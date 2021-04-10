<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="resources/bootstrap-4.6.0-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/main_4989.css">
<link rel="stylesheet" href="resources/css/main_4989_2.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<script src="resources/jquery/jquery-3.5.1.min.js"></script>
<script src="resources/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js"></script>
<script src="resources/bootstrap-4.6.0-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function enterkey() {
		if (window.event.keyCode == 13) {
			const price = document.getElementById('price').value;
			console.log(price);
			location.href = "/sabangpalbang/sabang_search?price=" + price;
			console.log(price);
		}
	}
	
	function removeSession() {
		console.log("removeSession() 메소드 진입");
		
		/* 세션 지우기 */
		sessionStorage.removeItem("sabang_pager");
		sessionStorage.removeItem("palbang_pager");
		sessionStorage.removeItem("mypage_inquiry_pager");
	}
</script>
<style>
.header_search_input { 
    background-image : url("resources/images/common/search.png")!important; 
    background-position: 18px 10px !important;
    background-size: 15px 15px;
    background-repeat:no-repeat;        
}

.header_search_input:focus {
background-image: none !important;
}


</style>
<body>
	<!-- 헤더 반응형 구현 -->
	<div class="container">
		<div class="nav-scroller py-1 mb-2">
			<nav class="header nav d-flex justify-content-between">
				<div class="header_logo">
					<a class="logo" onclick="removeSession()" href="/sabangpalbang/main"> 사방 팔방 </a>
				</div>
				<div class="header_menu">
					<a class="header_menu_item" onclick="removeSession()"  href="/sabangpalbang/sabang_main">사방</a>
					<a class="header_menu_item" onclick="removeSession()"  href="/sabangpalbang/palbang_main">팔방</a>
				</div>

				<div class="header_search">

					<input type="text" onkeyup="enterkey();"
						class="header_search_input input-group mb-3 mt-5 form-control rounded-pill"
						name="price" id="price" style="background-color: #e9ecef;"
						placeholder="             내 예산에 맞는 방 찾기">
				</div>

				<div class="header_cart">
					<a href="/sabangpalbang/shopping_basket"><img
						src="resources/images/common/trolley.png" height="30px" /></a>
				</div>

				<div class="header_logIn">
					<sec:authorize access="isAnonymous()">
						<a class="header_logIn_item"
							href="${pageContext.request.contextPath}/loginForm">로그인 </a>
						<a class="header_logIn_item"
							href="${pageContext.request.contextPath}/signinForm">회원가입</a>
					</sec:authorize>

					<sec:authorize access="isAuthenticated()">
						<!-- 로그인 인증이 되엇으면 -->
						<form method="post" class="d-inline-block"
							action="${pageContext.request.contextPath}/logout">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}"/>
							<button
								style="border: none; outline: none; background-color: white;"
								class="header_logIn_item">로그아웃</button>
						</form>
						<a class="header_logIn_item"
							href="${pageContext.request.contextPath}/mypage_orderlist">마이페이지</a>
					</sec:authorize>


				</div>
			</nav>
		</div>
		<div class="d-flex justify-content-end">
			<sec:authorize access="isAuthenticated()">
						<!-- 로그인 인증이 되엇으면 -->
						<span class="mr-2">User : <sec:authentication
								property="name" /></span>
			</sec:authorize>
		</div>
	</div>
	<hr />