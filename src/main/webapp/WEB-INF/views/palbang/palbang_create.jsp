<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<script>
	var index; // 리뷰 인덱스 0, 1, 2 여야 함 .. 개수 안에서 인덱스가 반복되니까.. 
	var count; // 리뷰 개수 1개 - 3개 
	
	var reviewSet =  "<div id='review_"+index+"'" + "class='palbang_create_reviewSet'>" + 
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
				
	
	$.when($.ready).then(function(){
		// 처음 로드될 때는 하나의 리뷰 세트가 있어야 함 
		index = 0;
<<<<<<< HEAD
		count = 0;
	
=======
		count = 1; // 개수 
>>>>>>> branch 'develop' of https://github.com/Douzone-Kosa-Team2/SabangPalbang
		var reviewSet =  "<div id='review_"+index+"'" + "class='palbang_create_reviewSet'>" + 
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
					
		
		console.log(reviewSet);
		$('#div_reviews').append(reviewSet);
	});

	function addCol() {
		console.log("addCol() method");
		
<<<<<<< HEAD
		if(count < 2){
			index += 1;
			count += 1;
			console.log("추가하는 현재 인덱스: " + index);
=======
		if(count < 3){
			index += 1;			
			
>>>>>>> branch 'develop' of https://github.com/Douzone-Kosa-Team2/SabangPalbang
			var reviewSet =  "<div id='review_"+index+"'" + "class='palbang_create_reviewSet'>" + 
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
						
			
			console.log("추가하는 현재 인덱스: " + index);
			console.log(reviewSet);
			$('#div_reviews').append(reviewSet);
			count += 1;
		}else{
			console.log("error : 최대 3개까지 작성가능합니다!! ");
		}
	} 
	
	function removeCol(idx) {
		console.log("removeCol() method");

		var reviewSet =  "<div id='review_"+index+"'" + "class='palbang_create_reviewSet'>" + 
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
					
		
<<<<<<< HEAD
		if(count > 0){
=======
		if(count > 1){
>>>>>>> branch 'develop' of https://github.com/Douzone-Kosa-Team2/SabangPalbang
			console.log("삭제하는 현재 인덱스: " + idx);
			$('#review_'+idx).remove();
<<<<<<< HEAD
=======
			console.log(reviewSet);
>>>>>>> branch 'develop' of https://github.com/Douzone-Kosa-Team2/SabangPalbang
			count -= 1;
		}else{
			console.log("error : 더 이상 지울 수 없습니다.");
		}
	}

	// 등록 버튼 눌렀을 때 사진 없으면 등록 못하게 validation 해줘야 함 
	function beforeSend() {
		event.preventDefault();
		console.log("컨트롤러로 넘어가기 전에 validation - 이미지 not null이어야 함 !!!");
		$("#target").submit();
	} 
	
	function setThumbnail(event) { 
		$("#image_container_"+index).empty();
		var reader = new FileReader(); 
		reader.onload = function(event) { 
			var img = document.createElement("img"); 
			img.setAttribute("src", event.target.result); 
			img.setAttribute("height", "100%"); 
			img.setAttribute("width", "100%"); 
			console.log("index000: ", index);
			document.querySelector("div#image_container_"+index).appendChild(img); 
		}; 
		reader.readAsDataURL(event.target.files[0]);
	}
	
</script>

<!-- palbang_create -->
<br />
<br />
<br />
<br />
<div class="palbang_create_main">
	<form id="target" method="post" action="palbang_create_form?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
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