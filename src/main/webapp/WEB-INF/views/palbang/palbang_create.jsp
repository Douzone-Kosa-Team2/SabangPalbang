<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<script>
	var index;
	
	$.when($.ready).then(function(){
		// 처음 로드될 때는 하나의 리뷰 세트가 있어야 함 
		index = 0;
	
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

	// 등록 버튼 눌렀을 때 사진 없으면 등록 못하게 validation 해줘야 함 
	function beforeSend(){
		event.preventDefault();
		console.log("컨트롤러로 넘어가기 전에 validation - 이미지 not null이어야 함 !!!");
		$("form")[0].submit;
		
	} 
</script>

<!-- palbang_create -->
<br />
<br />
<br />
<br />
<div class="palbang_create_main">
	<form name="form" method="post" action="palbang_create_form?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
		<div class="palbang_create_title">
			<input class="palbang_create_txt" type="text" placeholder="제목을 입력하세요" name="palbang_title">
		</div>
		<div class="palbang_create_mainImage">
			<!-- 파일 업로드 박스 -->
			<h4 class="palbang_create_mainImage_img">대표이미지</h4>
			<div class="input-group mb-3">
				<input type="file" class="form-control" placeholder="사진을 첨부하세요" name="pattach">
			</div>
		</div>
		<div id="div_reviews">
			<!-- 리뷰세트가 최소 1개에서 최대 3개까지 동적으로 생성되는 곳 -->
		</div>
		<div class="palbang_create_reviewSet_addSet"> <!--  추가하기 버튼을 누르면 위에 저 한 세트가 생겨야 한다.  -->
				<div class="palbang_create_reviewSet_addSet_addImg">
					<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25"
						fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
						<path
							d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
						<path
							d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
					</svg>
				</div>
				<div class="palbang_create_reviewSet_addSet_addTxt">
					<button type="button" class="palbang_create_reviewSet_btn" onclick="addCol()">추가하기</button>
				</div>
		</div>
		<hr style="width: 85%; text-align: center; margin: auto;" />
		<div class="palbang_create_reviewSet_submit">
			<button type="button" onclick="location.href='palbang_main'" class="btn btn-outline-dark"> 취소</button>  <!-- 팔방 메인 페이지로 이동함  -->
			<button type="submit" onclick="beforeSend()" class="btn btn-outline-primary">등록</button>  <!--  컨트롤러로 폼이 넘어감 insert -->
		</div>
	</form>
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>