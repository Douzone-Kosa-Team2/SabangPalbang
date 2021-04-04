<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 


<%@ include file="/WEB-INF/views/common/header.jsp"%>

<script>
	var index ;
	<%--		<div class="palbang_update_main_review_set">
	<div class="palbang_update_main_minus_btn">
		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
			fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
				<path
				d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
				<path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z" />
			</svg>
	</div>
	<div class="palbang_update_main_left">
		<img src="resources/images/palbang_detail/palbang_detail_1_1.jpg"
			width="100%" height="100%">
	</div>
	<div class="palbang_update_main_right">
		<textarea class="right_1 form-control" placeholder="리뷰를 입력하세요."
			name="reviewTxt"> 기본 옵션으로 있는 옷장은 고정되어 있어서 공간이 제한적이었어요. 
처음에는 침대를 베란다 쪽으로 붙여서 활용할 수 있는 공간을 최대한으로 하기로 했어요.      원형 테이블을 여기저기 놓아가며 남는 공간을 쓸 수 있어 좋았어요. 공간이 확실히 넓어지고 탁 트인 느낌이라 답답하지 않았어요.
			</textarea>
	</div>
</div> --%>
	$.when($.ready).then(function(){
		// 디비에 저장된 팔방 디테일을 모두 출력해야 함 
		<%-- reviewSize = ${fn:length(`${palbang.reviews}`)};
		console.log("reviewSize: " + reviewSize);
		--%>
		var arr = `${palbang.reviews}`; // 문자열이라서 객체로 변환해야 되나..? 
	// 문자열임,,, 리스트 객체로 가져오려면.... ?... 
		
		console.log(arr);
	
		//index = reviewSize-1;  // 인덱스 == 리뷰 개수-1 => 0, 1, 2 중 하나 
		for(var i=0; i<3; i++){
			var reviewSet =  "<div id='review_"+i+"'" + "class='palbang_update_main_review_set'>" + 
			"<div class='palbang_update_main_minus_btn'/>" +  
			"<svg onclick=\"removeCol("+i+")\" xmlns=\'http://www.w3.org/2000/svg\' width='30' height='30'" +
			"fill='currentColor' class='bi bi-dash-circle' viewBox='0 0 16 16'>" + 
				"<path d='M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/> " + 
				"<path d='M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z' />" + 
				"</svg></div>" +	
				"<div class='palbang_update_main_left form-control'>" +
				"<input type='file' name='reviews["+i+"].pdattach'>" +
				"<h5 class='palbang_create_reviewSet_left_1' style='color: gray;'>이미지 업로드</h5>" +
				"<div class='palbang_update_main_right'>" +
				"<svg xmlns=\"http://www.w3.org/2000/svg\" width='50' height='50'" +
				"fill='currentColor' class='bi bi-image' viewBox='0 0 16 16'>" +
				"<path d='M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z' />" +
				"<path d='M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z' />" +
				"</svg></div></input></div><div class='palbang_create_reviewSet_right'>"+ 
				"<input type='text' style='height: 100%; text-align: center;' class='form-control' placeholder='리뷰를 입력하세요.' name='reviews["+index+"].palbang_explain' /></div></div>";
						
			$('#div_reviews').append(reviewSet);
		}
		
	});

	function addCol() {
		console.log("addCol() method");
		
		if(index < 2){
			index += 1;
			var reviewSet =  "<div id='review_"+index+"'" + "class='palbang_create_reviewSet'>" + 
			"<div class='palbang_create_reviewSet_minusBtn'/>" +  
			"<svg onclick=\"removeCol("+index+")\" xmlns=\'http://www.w3.org/2000/svg\' width='30' height='30'" +
			"fill='currentColor' class='bi bi-dash-circle' viewBox='0 0 16 16'>" + 
				"<path d='M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/> " + 
				"<path d='M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z' />" + 
				"</svg></div>" +	
				"<div class='palbang_create_reviewSet_left form-control'>" +
				"<input type='file' name='reviews["+index+"].pdattach'>" +
				"<h5 class='palbang_create_reviewSet_left_1' style='color: gray;'>이미지 업로드</h5>" +
				"<div class='palbang_create_reviewSet_left_2'>" +
				"<svg xmlns=\"http://www.w3.org/2000/svg\" width='50' height='50'" +
				"fill='currentColor' class='bi bi-image' viewBox='0 0 16 16'>" +
				"<path d='M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z' />" +
				"<path d='M2.002 1a2 2 0 0 0-2 2v10a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2h-12zm12 1a1 1 0 0 1 1 1v6.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12V3a1 1 0 0 1 1-1h12z' />" +
				"</svg></div></input></div><div class='palbang_create_reviewSet_right'>"+ 
				"<input type='text' style='height: 100%; text-align: center;' class='form-control' placeholder='리뷰를 입력하세요.' name='reviews["+index+"].palbang_explain' /></div></div>";
						
			$('#div_reviews').append(reviewSet);

		}else{
			console.log("error : 최대 3개까지 작성가능합니다!! ");
		}
	} 
	
	function removeCol(idx) {
		console.log("removeCol() method");
		
		if(index > 0){
			$('#review_'+idx).remove();
			index -= 1;
		}else{
			console.log("error : 더 이상 지울 수 없습니다.");
		}
	}

	// validation
	function beforeSend(){
		event.preventDefault();
		console.log("컨트롤러로 넘어가기 전에 validation - 이미지 not null이어야 함 !!!");
		$("form")[0].submit;
	} 
</script>


<!-- palbang_update-->
<br />
<br />
<br />
<br />
<div class="palbang_update">
	<form name="form" method="post" action="palbang_update_form?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
		<div class="palbang_update_title">
			<input class="txt" type="text" placeholder="제목을 입력하세요" name="title" value="${palbang.palbang_title}">
		</div>
		<div class="palbang_update_main_image">
			<!-- 파일 업로드 박스 -->
			<div class="palbang_update_Htag">
				<h4>대표이미지</h4>
			</div>
	
			<div class="palbang_update_main_image_2 input-group mb-3">
				<input type="palbang_update_main_image_2_text" class="form-control"
					placeholder="사진을 첨부하세요" name="thumbnail">
				<div class="input-group-append">
					<button class="btn btn-outline-secondary mb-3" type="button"
						id="button-addon2">사진 수정하기</button>
				</div>
			</div>
		</div>
		<div id="div_reviews">
			<!-- 리뷰세트가 최소 1개에서 최대 3개까지 동적으로 생성되는 곳 -->
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