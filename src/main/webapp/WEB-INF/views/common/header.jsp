<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.item1 { grid-area: 1 / 1 / 2 / 2;   grid-gap: 10px;}
.item2 { grid-area: 1 / 2 / 2 / 3;   grid-gap: 20px;}
.item3 { grid-area: 1 / 3 / 2 / 4;   grid-gap: 50px;}
.item4 { grid-area: 1 / 4 / 2 / 5;   grid-gap: 3px;}
.item5 { grid-area: 1 / 5 / 2 / 6;   grid-gap: 3px;}
/* .item6 { grid-area: 1 / 6 / 2 / 7;   grid-gap: 3px;} */
/* .item7 { grid-area: 1 / 7 / 2 / 8;   grid-gap: 3px;} */

.grid-container {
  display: grid;
  grid-template-columns: auto auto auto auto auto;
  grid-gap: 12px;
  padding: 10px;
}

.grid-container > div {
  background-color: yellow;
  text-align: center;
  padding: 20px 0;
}
</style>
</head>
<link rel="stylesheet" href="resources/bootstrap-4.6.0-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/main_4989.css">
<link rel="stylesheet" href="resources/css/main_4989_2.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="resources/jquery/jquery-3.5.1.min.js"></script>
<script src="resources/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js"></script>
<script src="resources/bootstrap-4.6.0-dist/js/bootstrap.min.js"></script>
<body>
	<!-- 헤더부분 -->
	<div class="grid-container">
	  <div class="item1">
			<a class="logo"  href="/sabangpalbang/main">사방팔방</a>
	  </div>
	  <div class="item2">
	  	<div class="header_menu">
			<a class="header_menu_item" href="/sabangpalbang/sabang_main">사방</a> 
			<a class="header_menu_item" href="/sabangpalbang/palbang_main">팔방</a>
		  </div>
	  </div>
	  <div class="item3">
		  <div href="/sabangpalbang/sabang_search">
				<input type="text" class="header_search_input input-group mb-3 mt-5 form-control rounded-pill"
					style="background-color: #e9ecef;" placeholder="             내 예산에 맞는 방 찾기">
		 </div> 
	  </div>
	  <div class="item4">
	  	<div class="header_cart">
			<a href="/sabangpalbang/shopping_basket"><img src="resources/images/trolley.png" height="30px"/></a>
		</div>
	  </div>
	  <div class="item5">
	 	 <div class="header_logIn">
			<a class="header_logIn_item" href="/sabangpalbang/login">로그인 </a> 
			<a class="header_logIn_item" href="/sabangpalbang/signin">회원가입</a>
		</div>
	  </div> 
<!-- 	  <div class="item7">
	    	
	  </div> -->
	</div>
	<hr/>
	
	<!-- <div class="header">
		<div class="header_logo">
			<a class="logo" href="#" onclick="location.href='/sabangpalbang/main'"> 사방 팔방 </a>

		</div>
		<div class="header_menu">
			<a class="header_menu_item" href="#" onclick="location.href='/sabangpalbang/sabang_main'"> 
				사방
			</a> 
			<a class="header_menu_item" href="#" onclick="location.href='/sabangpalbang/palbang_main'">
				팔방
			</a>
		</div>

		<div class="header_search" href="#" onclick="location.href='/sabangpalbang/sabang_search'">
			<input type="text" class="header_search_input input-group mb-3 mt-5 form-control rounded-pill"
				style="background-color: #e9ecef;" placeholder="             내 예산에 맞는 방 찾기">
		</div>


		<div class="header_cart">
			<a href="#" onclick="location.href='/sabangpalbang/shopping_basket'">
				<img src="resources/images/trolley.png" height="30px" />
			</a>
		</div>

		<div class="header_logIn">
			<a class="header_logIn_item" href="#" onclick="location.href='/sabangpalbang/login'">
				 로그인 
				</a> 
			<a class="header_logIn_item" href="#" onclick="location.href='/sabangpalbang/signin'">
				회원가입 
			</a>
		</div>
	</div>

 -->