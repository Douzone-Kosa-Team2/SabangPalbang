<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="resources/bootstrap-4.6.0-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/main_4989.css">
<link rel="stylesheet" href="resources/css/main_4989_2.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<script src="resources/jquery/jquery-3.5.1.min.js"></script>
<script src="resources/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js"></script>
<script src="resources/bootstrap-4.6.0-dist/js/bootstrap.min.js"></script>

<style>
.errorsession{
	color: red;
	text-align: right;
	font-size: 0.3em;
}
</style>
<body onload="window.resizeTo(830,650)"
	onresize="window.resizeTo(830,650)">
	<div class="pop_ask_main">
		<div class="d-flex justify-content-center align-items-center">
			<div class="card m-3" style="width: 80%; text-align: center;">
				<img src="resources/images/sabang_post/${sabang.sabang_imgoname}"
					class="card-img-top" alt="sabang_img">
				<div class="card-body">
					<div class="pop_ask_header">
						<h4>문의작성</h4>
					</div>
					<hr>
					<form method="post" id="askform" onsubmit="return validate()"
						novalidate action="addInquiry">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" /> <input type="hidden"
							name="inquiry_sabangid" value="${sabang.sabang_id}" />

						<div class="pop_ask_table">

							<div class="pop_ask_type">
								<div class="pop_ask_menu">문의 유형</div>

								<select class="pop_ask_box" name="inquiry_type"
									id="inquiry_type">
									<option selected="" value="" disabled="">문의 유형 선택</option>
									<option value="상품정보">상품정보</option>
									<option value="배송정보">배송정보</option>
									<option value="환불/교환">환불/교환</option>
								</select>
								
							</div>
							<div class="errorsession" id="errorType"></div>
							<div class="pop_ask_prod">
								<div class="pop_ask_menu">문의 상품</div>
								<div
									style="width: 100%; border-style: solid; border-width: 1px;">${sabang.sabang_name}</div>
								
							</div>
							<div class="errorsession"></div>
							<div class="pop_ask_human">
								<div class="pop_ask_menu">문의자</div>
								<input type="text" class="pop_ask_box"
									value="${member.member_nickname}" name="inquiry_writer"
									id="inquiry_writer" readonly />
								
							</div>
							<div class="errorsession"></div>
							<div class="pop_ask_tel">
								<div class="pop_ask_menu">전화번호</div>
								<div
									style="width: 100%; border-style: solid; border-width: 1px;">${member.member_phone}</div>
								
							</div>
							<div class="errorsession"></div>
							<div class="pop_ask_email">
								<div class="pop_ask_menu">이메일</div>
								<div
									style="width: 100%; border-style: solid; border-width: 1px;">${member.member_email}</div>
								
							</div>
							<div class="errorsession"></div>
							<div class="pop_ask_title">
								<div class="pop_ask_menu">제목</div>
								<input type="text" class="pop_ask_box" value=""
									placeholder="제목을 입력해주세요." name="inquiry_title"
									id="inquiry_title" />
								
							</div>
							<div class="errorsession" id="errorTitle"></div>
							<div class="pop_ask_content">
								<div class="pop_ask_menu">문의 내용</div>
								<textarea placeholder="내용을 입력해주세요." class="pop_ask_box"
									name="inquiry_explain" id="inquiry_explain"></textarea>
								
							</div>
							<div class="errorsession" id="errorContent"></div>
						</div>

						<div class="pop_ask_btn">
							<button class="pop_ask_btn_cancel" onclick="cancel()">취소</button>
							<button class="pop_ask_btn_create" type="submit">작성하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
function validate(){
	var result = true;

	$("#errorType").html("");
	$("#errorTitle").html("");
	$("#errorContent").html("");
	
	const inquiry_type = $("#inquiry_type").val();

	const inquiry_title = $("#inquiry_title").val();
	const inquiry_explain = $("#inquiry_explain").val();
	
	console.log(inquiry_type);
	console.log(inquiry_title);
	console.log(inquiry_explain);
	
	if(inquiry_type === null){
		result = false;
		$("#errorType").html("문의 유형을 체크해 주세요.");
	}

	if(inquiry_title === ""){
		result = false;
		$("#errorTitle").html("제목을 입력해 주세요.");
	} else if(inquiry_title.length < 2) {
		result = false;
		$("#errorTitle").html("제목을 2자이상 입력해 주세요.");
	} else if(inquiry_title.length > 50) {
		result = false;
		$("#errorTitle").html("제목을 50자 이하로 입력해 주세요.");
	}

	if(inquiry_explain === ""){
		result = false;
		$("#errorContent").html("내용을 입력해 주세요.");
	} else if(inquiry_explain.length < 2) {
		result = false;
		$("#errorContent").html("내용을 2자이상 입력해 주세요.");
	} else if(inquiry_explain.length > 1000) {
		result = false;
		$("#errorContent").html("내용을 1000자 이하로 입력해 주세요.");
	}
	
	return result;
}

const cancel = () => { /* 취소하기 버튼 클릭 시 */
	window.close();
};
</script>
