<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- palbang_create -->
	<br/><br/><br/><br/>
	<div class="palbang_create_main">
	 	   <form method="post"
    			action="addPalbang?${_csrf.parameterName}=${_csrf.token}"
     			enctype="multipart/form-data">
		<div class="palbang_create_title">
			<input class="palbang_create_txt" type="text" placeholder="제목을 입력하세요" name="palbang_title">
		</div>
		<div class="palbang_create_mainImage">
			<!-- 파일 업로드 박스 -->
			<h4 class="palbang_create_mainImage_img">대표이미지</h4>
			<div class="input-group mb-3">
				<input type="file" class="form-control" placeholder="사진을 첨부하세요" name="palbang_imgoname">
				
			  </div>
		</div>
		<div class="palbang_create_reviewSet">
			<div class="palbang_create_reviewSet_minusBtn">
				<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
					<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
					<path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
				  </svg>
			</div>
			<div class="palbang_create_reviewSet_left form-control">
			<input type="file" name="palbang_dimgoname">
				<h5 class="palbang_create_reviewSet_left_1" style="color: gray;">이미지 업로드</h5>
				<div class="palbang_create_reviewSet_left_2">
					<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-image" viewBox="0 0 16 16">
						<path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
						<path d="M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z"/>
					</svg>
				</div>
			</input>
			</div>
			<div class="palbang_create_reviewSet_right">
				<input type="text" style="height:100%; text-align:center;" class="form-control" placeholder="리뷰를 입력하세요." name="reviewTxt"/>
			</div>
		</div>
		<div class="palbang_create_reviewSet_addSet">
			<div class="palbang_create_reviewSet_addSet_addImg">
				<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
					<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
					<path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
				</svg> 
			</div>
			<div class="palbang_create_reviewSet_addSet_addTxt">
				<button class="palbang_create_reviewSet_btn" onclick="addCol">추가하기</button>
			</div>
		</div>
		<hr style="width:85%; text-align:center; margin: auto;"/>
		<div class="palbang_create_reviewSet_submit">
		
			<button class="btn btn-outline-dark" href="palbang_main">취소</button>
			<button type="submit" class="btn btn-outline-primary">등록</button>
		
		</div>
		</form>
	</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>