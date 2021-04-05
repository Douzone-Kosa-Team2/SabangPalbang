<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 


<%@ include file="/WEB-INF/views/common/header.jsp"%>


<!-- palbang_update-->
<br />
<br />
<br />
<br />
<div class="palbang_update">
	<form name="form" method="post" action="palbang_update_form?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
		<div class="palbang_create_title">
			<input class="palbang_create_txt" type="text" value="${palbang.palbang_title}" name="palbang_title">
		</div>
		<div class="palbang_create_mainImage">
			<!-- 파일 업로드 박스 -->
			<h4 class="palbang_create_mainImage_img">대표이미지</h4>
			<div class="input-group mb-3">
				<input type="file" class="form-control" name="pattach" placeholder="사진을 첨부하세요" >
			</div>
		</div>
		<div class="palbang_detail_content">
		<div id="div_reviews">
			<!-- 리뷰세트가 최소 1개에서 최대 3개까지 동적으로 생성되는 곳 -->
			<c:forEach var="review" items="${palbang.reviews}">
				
				<%-- <div class='palbang_create_reviewSet_minusBtn'/>
					<svg onclick="removeCol("+index+")" xmlns=\'http://www.w3.org/2000/svg\' width='30' height='30'"
				
				<div class="palbang_detail_content_space">
					<div class="palbang_detail_content_spaceImg">
						<img src="resources/images/palbang_detail/${review.palbang_dimgoname}">
					</div>
					<div class="palbang_detail_content_space_txt">
						<p>${review.palbang_explain}</p>
					</div>
				</div> --%>
			</c:forEach>
<!-- 			
			"<div id='review_"+index+"'" + "class='palbang_create_reviewSet'>" + 
		"<div class='palbang_create_reviewSet_minusBtn'/>" +  
		"<svg onclick=\"removeCol("+index+")\" xmlns=\'http://www.w3.org/2000/svg\' width='30' height='30'" +
		"fill='currentColor' class='bi bi-dash-circle' viewBox='0 0 16 16'>" + 
			"<path d='M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/> " + 
			"<path d='M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z' />" + 
			"</svg></div>" +	
			"<div class='palbang_create_reviewSet_left form-control d-flex flex-column' style='padding:0px;'>" +
			"<div id='image_container_"+index+"'" + "style='height:100%;'>" + 
			"<input type='file'  class='form-control' name='reviews["+index+"].pdattach'>" +
			"</div>" +
			"</div><div class='palbang_create_reviewSet_right'>"+ 
			"<input type='text' style='height: 100%; text-align: center;' class='form-control' placeholder='리뷰를 입력하세요.' name='reviews["+index+"].palbang_explain' /></div></div>";
					 -->
		</div>
		</div>
		<div class="palbang_update_main_add_set">
			<div class="palbang_update_main_add_img">
				<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
					fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
						<path
						d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
						<path
						d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
					</svg>
			</div>
			<div class="palbang_update_main_add_txt">
				<button type="button" class="palbang_update_main_b_a" onclick="addCol()">추가하기</button>
			</div>
		</div>
		<hr style="width: 85%; text-align: center; margin: auto;" />
		<div class="submit_btn">
			<button type="button" onclick="location.href='palbang_main'" class="btn btn-outline-dark"> 취소</button>  
			<button type="submit" onclick="beforeSend()" class="btn btn-outline-primary">수정</button>  
		</div>
	</form>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>