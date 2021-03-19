<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- palbang_update-->
	<br /><br /><br /><br />
	<div class="palbang_update">
		<div class="palbang_update_title">
			<input class="txt" type="text" placeholder="제목을 입력하세요" name="title">
		</div>
		<div class="palbang_update_main_image">
			<!-- 파일 업로드 박스 -->
			<div class="palbang_update_Htag">
				<h4>대표이미지</h4>
			</div>

			<div class="palbang_update_main_image_2 input-group mb-3">
				<input type="palbang_update_main_image_2_text" class="form-control" placeholder="사진을 첨부하세요" name="thumbnail">
				<div class="input-group-append">
					<button class="btn btn-outline-secondary mb-3" type="button" id="button-addon2">사진 수정하기</button>
				</div>
			</div>
		</div>
		<div class="palbang_update_main_review_set">
			<div class="palbang_update_main_minus_btn">
				<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor"
					class="bi bi-dash-circle" viewBox="0 0 16 16">
					<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
					<path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z" />
				</svg>
			</div>
			<div class="palbang_update_main_left">
				<img src="resources/images/palbang_detail_1_1.jpg" width="100%" height="100%">
			</div>
			<div class="palbang_update_main_right">
				<textarea class="right_1 form-control" placeholder="리뷰를 입력하세요." name="reviewTxt"> 기본 옵션으로 있는 옷장은 고정되어 있어서 공간이 제한적이었어요. 
처음에는 침대를 베란다 쪽으로 붙여서 활용할 수 있는 공간을 최대한으로 하기로 했어요.      원형 테이블을 여기저기 놓아가며 남는 공간을 쓸 수 있어 좋았어요. 공간이 확실히 넓어지고 탁 트인 느낌이라 답답하지 않았어요.
				</textarea>
			</div>
		</div>
		<div class="palbang_update_main_add_set">
			<div class="palbang_update_main_add_img">
				<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
					class="bi bi-plus-circle" viewBox="0 0 16 16">
					<path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
					<path
						d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
				</svg>
			</div>
			<div class="palbang_update_main_add_txt">
				<button class="palbang_update_main_b_a">추가하기</button>
			</div>
		</div>
		<hr style="width:85%; text-align:center; margin: auto;" />
		<div class="submit_btn">
			<a href="palbang_main">
				<button type="submit" class="btn btn-outline-dark">취소</button>
			</a>
			<a href="palbang_main">
				<button type="submit" class="btn btn-outline-primary">수정</button>
			</a>

		</div>
	</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>