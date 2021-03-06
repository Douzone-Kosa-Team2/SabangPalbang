<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<script>
var index = ${fn:length(palbang.reviews)}-1;
var count = ${fn:length(palbang.reviews)};

function generateReviewSet(index){
   	return  "<div id='review_"+index+"'" + "class='palbang_create_reviewSet'>" + 
   		"<div class='palbang_create_reviewSet_minusBtn'/>" +  
   		"<svg onclick=\"removeCol("+index+")\" xmlns=\'http://www.w3.org/2000/svg\' width='30' height='30'" +
   		"fill='currentColor' class='bi bi-dash-circle' viewBox='0 0 16 16'>" + 
   		   "<path d='M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z'/> " + 
   		   "<path d='M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z' />" + 
   		   "</svg></div>" +   
   		   "<div class='palbang_create_reviewSet_left form-control d-flex flex-column' style='padding:0px;width:60%; '>" +
   		   "<div id='image_container_"+index+"'" + "style='height:100%;'>" + 
   		   "<input type='file' class='form-control class_img' name='reviews["+index+"].pdattach'>" +
   		   "<input type='text' style='height: 100%; text-align: center;' class='form-control class_review'"+
   		   "placeholder='리뷰를 입력하세요.' name='reviews["+index+"].palbang_explain'/></div></div>";	
   } 


function addCol() {
     if(count < 3){
    	$("#errorReview").empty();
        index += 1;
        count += 1;
        var reviewSet = generateReviewSet(index);
        $('#div_reviews').append(reviewSet);
     }else{
    	$("#errorReview").html("리뷰 글은 최대 3개까지 작성 가능합니다.");
     }
} 
  
function removeCol(idx) {
     if(count > 1){
    	$("#errorReview").empty();
        $('#review_'+idx).remove();
        count -= 1;
     }else{
    	 $("#errorReview").html("더 이상 삭제할 수 없습니다.");
     }
}

// 수정버튼 눌렀을 때 validation 
   function beforeSend(){
      event.preventDefault();
      
      $("#errorTitle").html('');
      $("#errorMainImg").html('');
      $("#errorDetailImg").html('');
      $("#errorReview").html('');
      
      var isValidTitle = true;
      var isValidMainImg = true;
      var isValidDetailImg = true;
      var isValidReview = true;
      
      // 제목 validation
      var title = $("#palbang_title").val();
      if(title === ''){
    	  $("#errorTitle").html("제목은 반드시 입력해야 합니다.");
    	  isValidTitle = false;
      }
      
      // 대표 이미지 validation
      var img = $("#pattach").val();
      if(img === ''){
    	  $("#errorMainImg").html("대표 이미지를 반드시 첨부해야 합니다.");
    	  isValidMainImg = false;
      }
      
      // 디테일 이미지 validation
      var imgs = $(".class_img");
      var len1 = $(".class_img").length;
      for(var i=0; i<len1; i++){
    	  if(imgs.get(i).value === ''){
    		  $("#errorDetailImg").html("모든 이미지를 반드시 첨부해야 합니다.");
    		  isValidDetailImg = false;
    		  break;
    	  }
      }
      
     // 댓글 validation 
      var reviews = $(".class_review");
      var len2 = $(".class_review").length;
      for(var i=0; i<len2; i++){
    	  if(reviews.get(i).value === ''){
    		  $("#errorReview").html("모든 리뷰글은 반드시 입력해야 합니다.");
    		  isValidReview = false;
    		  break;
    	  }
      }
      
      if(isValidTitle && isValidMainImg && isValidDetailImg && isValidReview){
    	  $("#target").submit();
      }
   } 
</script>
<!-- palbang_update-->
<br />
<br />
<br />
<br />
<div class="palbang_create_main">
	<form id="target" name="form" method="post"
		action="palbang_update_form?${_csrf.parameterName}=${_csrf.token}"
		enctype="multipart/form-data">
		<input type="hidden" name="palbang_id" value="${palbang.palbang_id}"/>
		<input type="hidden" name="palbang_nickname" value="${palbang.palbang_nickname}"/>
		<input type="hidden" name="palbang_likecount" value="${palbang.palbang_likecount}"/>
		<input type="hidden" name="palbang_viewcount" value="${palbang.palbang_viewcount}"/>
		<div class="palbang_create_title">
			<input class="palbang_create_txt" style="width:40%;"  type="text"
				value="${palbang.palbang_title}" name="palbang_title" id="palbang_title">
		</div>
		<div class="palbang_create_mainImage"  style="margin-left:20em; width:50%;">
			<!-- 파일 업로드 박스 -->
			<h4 class="palbang_create_mainImage_img">대표이미지</h4>
			<div class="input-group mb-3">
				<input type="file" class="form-control" name="pattach" id="pattach">
			</div>
		</div>
		<div id="errorTitle" style="color:red;font-size:0.8em;"></div>
	    <div id="errorMainImg" style="color:red;font-size:0.8em;"></div>
	    <div id="errorDetailImg" style="color:red;font-size:0.8em;"></div>
	    <div id="errorReview" style="color:red;font-size:0.8em;"></div>
	    
		<div id="div_reviews">
			<!-- 리뷰세트가 최소 1개에서 최대 3개까지 동적으로 생성되는 곳 -->
			<c:forEach var="review" items="${palbang.reviews}" varStatus="status">
				<input type="hidden" name="reviews[${status.index}].palbang_detailno" value="${review.palbang_detailno}"/>
				<input type="hidden" name="reviews[${status.index}].palbang_id" value="${review.palbang_id}"/>
				<div id="review_${status.index}" class="palbang_create_reviewSet">
					<div class="palbang_create_reviewSet_minusBtn">
						<svg onclick="removeCol(${status.index})"
							xmlns="http://www.w3.org/2000/svg\" width="30" height="30"
							fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
							<path
								d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
							<path
								d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z" />
							</svg>
					</div>
					<div class="palbang_create_reviewSet_left form-control d-flex flex-column"
						style='padding: 0px; width: 60%;'>
						<div id="image_container_${status.index}"
							style="height: 100%; background-color: yellow;">
							<input type="file" class="form-control class_img"
								name="reviews[${status.index}].pdattach"> 
							<input
								id="rev_${status.index}" type="text"
								style="height: 100%; text-align: center;" class="form-control class_review"
								name="reviews[${status.index}].palbang_explain" />
							<script>$("#rev_"+${status.index}).val(`${review.palbang_explain}`);</script>
						</div>
					</div>
				</div>
			</c:forEach>
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
		<div class="submit_btn">
			<button type="button" onclick="location.href='palbang_main'"
				class="btn btn-outline-dark">취소</button>
			<button type="submit" onclick="beforeSend()"
				class="btn btn-outline-primary">수정</button>
		</div>
	</form>
</div>
<br>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>