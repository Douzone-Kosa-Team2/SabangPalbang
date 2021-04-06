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


<body onload="window.resizeTo(830,650)"
	onresize="window.resizeTo(830,650)">
	<div class="pop_ask_main">
		<div class="pop_ask_header">
			<h4>문의 내용</h4>
		</div>
		<hr>
		<div class="pop_ask_table">
			<div class="pop_ask_type">
				<div class="pop_ask_menu">문의 유형</div>
				<p>${selectedInq.inquiry_id}</p>
				<p>${selectedInq.inquiry_sabangid}</p>
				<p>${selectedInq.inquiry_type}</p>
				<p>${selectedInq.inquiry_ansstate}</p>
				<p>${selectedInq.inquiry_title}</p>
				<p>${selectedInq.inquiry_writer}</p>
				<p>${selectedInq.inquiry_date}</p>
				<p>${selectedInq.inquiry_explain}</p>
				<p>${selectedInq.inquiry_anscontent}</p>

			</div>
<%-- <div class="sabang_detail_3_div_table">
	<table class="table inquiry_table" id="sabang_inquiry_table">
		<thead class="thead-light">
			<tr>
				<th scope="col">번호</th>
				<th scope="col">문의종류 <svg xmlns="http://www.w3.org/2000/svg"
						width="16" height="16" fill="currentColor"
						class="bi bi-arrow-down-circle" viewBox="0 0 16 16">
	  						<path fill-rule="evenodd"
							d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v5.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V4.5z" />
						</svg>
				</th>
				<th scope="col">답변상태 <svg xmlns="http://www.w3.org/2000/svg"
						width="16" height="16" fill="currentColor"
						class="bi bi-arrow-down-circle" viewBox="0 0 16 16">
	  						<path fill-rule="evenodd"
							d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v5.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V4.5z" />
						</svg>
				</th>
				<th scope="col">제목</th>
				<th scope="col">문의자</th>
				<th scope="col">등록일</th>
			</tr>
		</thead>
	
		<tbody>
			
					
					<tr class="check_inq" onclick="showInq(${inquiry.inquiry_id})">
						<td scope="row">${inquiry.inquiry_id}</td>
						<td>${inquiry.inquiry_type}</td>
						<td>${inquiry.inquiry_ansstate}</td>
						<td>${inquiry.inquiry_title}</td>
						<td>${inquiry.inquiry_writer}</td>
						<td><fmt:formatDate value="${inquiry.inquiry_date}"
								pattern="YYYY.MM.dd" /></td>
					</tr> --%>
					</div>
	</div>
</body>
<script>

const cancel = () => { /* 취소하기 버튼 클릭 시 */
	//window.opener.location.href="sabang_detail"; 
	window.close();
};

const confirm = () => {  /* 작성하기 버튼 클릭 시 - 문의창에서 입력받은 것들 요청경로에 파라미터로 넘겨줘야 함  */
	//$("askform").attr("action", "addInquiry");
	console.log("과정1");
	$("askform")[0].submit;
	console.log("과정2");
	/* var queryString = $("form[name=askform]").serialize() ;
	console.log("과정1");
	$.ajax({
		type : 'post',
        url : 'addInquiry',
        data : queryString
	}); */
	/* .then(data => {
		console.log("과정3");
		

	});
	 */
	window.opener.location.reload();
	window.close();
};

</script>
