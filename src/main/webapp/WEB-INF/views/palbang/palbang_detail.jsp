<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- 팔방 상세 페이지  -->
<script>
	$(function() {
		console.log("document ready");
		showLikeBtn(${palbang.palbang_id});
	});
	
	const showLikeBtn = (palbang_id) => {
		console.log("showLikeBtn()");
		$.ajax({
			url:"isLikeBtnClick",
			data: {palbang_id, ${_csrf.parameterName}:"${_csrf.token}"}, 
			method:"post"
		})
		.then(data => {
			console.log("success3");
			if(data.result == 0){ // 좋아요를 안눌렀을때 
				$("#svg1").show();
	           	$("#svg2").hide(); 
			}else{ 
	           	$("#svg1").hide();
              	$("#svg2").show(); 
			}
		});
	};

   function addLike(palbang_id) {
	   console.log("addLike()");
       $.ajax({
          url: "likeUp",
          data: {palbang_id, ${_csrf.parameterName}:"${_csrf.token}"}, 
          method: "post"       
       })
       .then(data => {
	      	if(data.result == "goLogin"){ // AuthController에서 넘어온 결과 
	      		location.href = "loginForm"; // 로그인 페이지로 요청 
	      	}else if(data.result == "success"){ // PalbangController에서 넘어온 결과 
	      		$("#svg1").hide();
	           	$("#svg2").show(); 
	      	}
       });
   }
   
   function deleteLike(palbang_id){
	   console.log("deleteLike()");
       $.ajax({
          url: "likeDown",
          data: {palbang_id, ${_csrf.parameterName}:"${_csrf.token}"}, 
          method: "post"       
       })
       .then(data => {
    	   	if(data.result == "goLogin"){ // AuthController에서 넘어온 결과 
         		location.href = "loginForm"; // 로그인 페이지로 요청 
         	}else if(data.result == "success"){ // PalbangController에서 넘어온 결과 
         		$("#svg1").show();
              	$("#svg2").hide(); 
         	}
       });
   }
</script>

<div class="palbang_detail_main">

	<div class="palbang_detail_edit">
		<!-- <img id="heart_img" src="common/images/heart.png" alt="하트"/> -->

			<svg id="svg1" onclick="addLike(${palbang.palbang_id})"
				style="margin-top: 7px; color: red;"
				xmlns="http://www.w3.org/2000/svg" width="20" height="20"
				fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
		            <path
					d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z" />
		    </svg>
			<svg id="svg2" onclick="deleteLike(${palbang.palbang_id})"
				style="margin-top: 7px; color: red;"
				xmlns="http://www.w3.org/2000/svg" width="20" height="20"
				fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
		            <path fill-rule="evenodd"
					d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" />
		    </svg>
		<sec:authorize access="isAuthenticated()">
			<c:if test="${email == 1}">
				<a class="palbang_detail_edit_update" href="palbang_update">수정</a>
				<a class="palbang_detail_edit_delete" href="palbang_main">삭제</a>
			</c:if>
		</sec:authorize>
	</div>

	<div class="palbang_detail_header">
		<div class="palbang_detail_header_1">
			<h4>${palbang.palbang_title}</h4>
		</div>
		<div class="palbang_detail_header_2">
			<h6>${palbang.palbang_nickname}님의방</h6>
		</div>

	</div>
	<div class="palbang_detail_content">

		<div class="palbang_detail_content_mainImg">
			<img src="resources/images/palbang_post/${palbang.palbang_imgoname}">
		</div>
		<!-- 1번 상세 -->
		<c:forEach var="palbangdetail" items="${palbanglist}">
			<div class="palbang_detail_content_space">

				<div class="palbang_detail_content_spaceImg">
					<img
						src="resources/images/palbang_detail/${palbangdetail.palbang_dimgsname}">
				</div>

				<div class="palbang_detail_content_space_txt">
					<p>${palbangdetail.palbang_explain}</p>
				</div>

			</div>
		</c:forEach>
	</div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>