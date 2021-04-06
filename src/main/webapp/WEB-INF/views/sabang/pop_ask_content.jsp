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
			<table class="table table-bordered">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">First</th>
						<th scope="col">Last</th>
						<th scope="col">Handle</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>Mark</td>
						<td>Otto</td>
						<td>@mdo</td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td>Jacob</td>
						<td>Thornton</td>
						<td>@fat</td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td colspan="2">Larry the Bird</td>
						<td>@twitter</td>
					</tr>
				</tbody>
			</table>
		</div>

		<%-- <form method="post" name="askform" action="addInquiry">
		    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		    <input type="hidden" name="inquiry_sabangid" value="${sabang.sabang_id}"/>
		
			<div class="pop_ask_table">

				<div class="pop_ask_type">
					<div class="pop_ask_menu">문의 유형</div>

					<select class="pop_ask_box" name="inquiry_type">
						<option selected="" value="" disabled="">문의 유형 선택</option>
						<option value="prod_info">상품정보</option>
						<option value="delivery">배송정보</option>
						<option value="change">환불/교환</option>
					</select>
				</div>

				<div class="pop_ask_prod">
					<div class="pop_ask_menu">문의 상품</div>
					<input type="text" class="pop_ask_box" value="${sabang.sabang_name}" readonly/>
				</div>

				<div class="pop_ask_human">
					<div class="pop_ask_menu">문의자</div>
					<input type="text" class="pop_ask_box" value="${member.member_nickname}" 
						name="inquiry_writer" readonly/>
				</div>

				<div class="pop_ask_tel">
					<div class="pop_ask_menu">전화번호</div>
					<input type="tel" class="pop_ask_box" value="${member.member_phone}" readonly/>
				</div>

				<div class="pop_ask_email">
					<div class="pop_ask_menu">이메일</div>
					<input type="email" class="pop_ask_box" value="${member.member_email}" readonly/>
				</div>

				<div class="pop_ask_title">
					<div class="pop_ask_menu">제목</div>
					<input type="text" class="pop_ask_box" value="" placeholder="제목을 입력해주세요." 
						name="inquiry_title" />
				</div>

				<div class="pop_ask_content">
					<div class="pop_ask_menu">문의 내용</div>
					<textarea placeholder="내용을 입력해주세요." class="pop_ask_box" name="inquiry_explain"></textarea>
				</div>

			</div>

			<div class="pop_ask_btn">
				<button class="pop_ask_btn_cancel" onclick="cancel()">취소</button>
				<button class="pop_ask_btn_create" onclick="confirm()">작성하기</button>
			</div>
		</form> --%>
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
