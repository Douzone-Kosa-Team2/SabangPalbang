<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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


<body onload="window.resizeTo(650,700)"
	onresize="window.resizeTo(650,700)">
	<div class="d-flex justify-content-center align-items-center">
		<div class="card m-3" style="width: 80%; text-align: center;">
			<img src="resources/images/sabang_post/${sabang.sabang_imgoname}"
				class="card-img-top" alt="sabang_img">
			<div class="card-body">
				<h5 class="card-title">${sabang.sabang_name}</h5>

				<table class="table inquiry_table" id="sabang_inquiry_table"
					style="text-align: center; font-family:'Cafe24Dangdanghae';">
					<thead class="thead-light">
						<tr>
							<th scope="col">번호</th>
							<th scope="col">문의종류</th>
							<th scope="col">답변상태</th>
							
							<th scope="col">문의자</th>
							<th scope="col">등록일</th>
						</tr>
					</thead>
					<tbody>
						
						<tr>
							<td scope="row">${selectedInq.inquiry_id}</td>
							<td>${selectedInq.inquiry_type}</td>
							<td>${selectedInq.inquiry_ansstate}</td>
							<td>${selectedInq.inquiry_writer}</td>
							<td><fmt:formatDate value="${selectedInq.inquiry_date}"
									pattern="YYYY.MM.dd" /></td>
						</tr>
						<tr>
							<td scope="col" class="table-primary" colspan='5' style="color:white; font-family: 'Cafe24Dangdanghae'; font-size:1.5em;">제목</td>
						</tr>
						<tr>
							<td  colspan='5'>${selectedInq.inquiry_title}</td>
						</tr>
						<tr>
							<td class="table-info" colspan='5' style="color:white; font-family: 'Cafe24Dangdanghae'; font-size:1.5em;">내 문의글</td>
						</tr>
						<tr>
							<td colspan='5'>
								<div style="width: 70vw;">
									${selectedInq.inquiry_explain}
								</div>
							</td>
						</tr>
						<c:if test="${empty selectedInq.inquiry_anscontent}">
							<tr>
								<td class="table-danger" colspan='5' style="color:white; font-family: 'Cafe24Dangdanghae'; font-size:1.5em;">답변</td>
							</tr>
							<tr>
								<td colspan='5'>아직 답변이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${!empty selectedInq.inquiry_anscontent}">
							<tr>
								<td class="table-success" colspan='5'>답변</td>
							</tr>
							<tr>
								<td colspan='5'>
									<div style="width: 70vw;">
										${selectedInq.inquiry_anscontent}
									</div>
								</td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
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
