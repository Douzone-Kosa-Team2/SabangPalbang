<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- 팔방 상세 페이지  -->

	<div class="palbang_detail_main">
		<div class="palbang_detail_edit">
			<!-- <img id="heart_img" src="common/images/heart.png" alt="하트"/> -->
			<svg style="margin-top:5px; color:red;" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
				<path d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
			</svg>
			<a class="palbang_detail_edit_update" href="palbang_update">수정</a>
			<a class="palbang_detail_edit_delete" href="palbang_main">삭제</a>

		</div>

		<div class="palbang_detail_header">
			<div class="palbang_detail_header_1">
				<h4>낡은 원룸이 아지트로 | 3가지만 기억하세요!</h4>
			</div>
			<div class="palbang_detail_header_2">
				<h6>해바라기님의 방</h6>
			</div>

		</div>
		<div class="palbang_detail_content">

			<div class="palbang_detail_content_mainImg">
				<img src="resources/images/palbang_detail/palbang_detail_1.jpg">
			</div>
			<!-- 1번 상세 -->
			<div class="palbang_detail_content_space">

				<div class="palbang_detail_content_spaceImg">
					<img src="resources/images/palbang_detail/palbang_detail_1_1.jpg">
				</div>

				<div class="palbang_detail_content_space_txt">
					<p>
						기본 옵션으로 있는 옷장은 고정되어 있어서
						공간이 제한적이었어요.
					</p>
					<p>
						처음에는 침대를 베란다 쪽으로 붙여서 활용할 수 있는 공간을 최대한으로 하기로 했어요.
					</p>
					<p>
						원형 테이블을 여기저기 놓아가며 남는 공간을 쓸 수 있어 좋았어요.
					</p>

				</div>

			</div>
			<!-- 2번 상세 -->
			<div class="palbang_detail_content_space">

				<div class="palbang_detail_content_spaceImg">
					<img src="resources/images/palbang_detail/palbang_detail_1_2.jpg">
				</div>

				<div class="palbang_detail_content_space_txt">
					<p>
						메트리스는 기본으로 흰색이다 보니
						깔끔하게 어울리는 남색 계열의
						침대를 선택했어요 .
					</p>
					<p>
						단색이 주는 안정감이 좋답니다.
					</p>

				</div>

			</div>
			<!-- 3번 상세 -->
			<div class="palbang_detail_content_space">

				<div class="palbang_detail_content_spaceImg">
					<img src="resources/images/palbang_detail/palbang_detail_1_3.jpg">
				</div>

				<div class="palbang_detail_content_space_txt">
					<p>
						글라돔은 트레이를 빼서 쟁반으로 사용할 수 있어서 좋았어요.
					</p>
					<p>
						할 말이 없네요..
					</p>
					<p>
						원형 테이블을 여기저기 놓아가며 남는 공간을 쓸 수 있어 좋았어요.
					</p>

				</div>

			</div>
		</div>

	</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>