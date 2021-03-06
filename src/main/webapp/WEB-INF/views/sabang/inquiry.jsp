<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script>
console.log(${sid});
function ask(sid){
	window.open("pop_ask?sid=${sid}","사방팔방 문의하기","status=no ,location=no, directoryies=no, resizable=no, scrollbars=yes, titlebar=no");
	console.log("sabang Id: "+sid);
	
}
function showInq(inquiry_id){
	console.log("inquiry_id : " + inquiry_id);
	window.open("pop_ask_content?inquiry_id="+inquiry_id+"&sid=${sid}","문의사항","status=no ,location=no, directoryies=no, resizable=no, scrollbars=yes, titlebar=no");
}

</script>
<style>
.check_inq:hover {
	color: white;
	background-color: #00B0F0;
	cursor: pointer;
}
</style>

<div class="sabang_detail_3_div_table">
	<table class="table inquiry_table" id="sabang_inquiry_table">
		<thead class="thead-light">
			<tr>
				<th scope="col">번호</th>
				<th scope="col">문의종류</th>
				<th scope="col">답변상태</th>
				<th scope="col">제목</th>
				<th scope="col">문의자</th>
				<th scope="col">등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${fn:length(inquiryList) > 0}">
				<c:forEach var="inquiry" items="${inquiryList}">
					<tr class="check_inq" onclick="showInq(${inquiry.inquiry_id})">
						<td scope="row">${inquiry.inquiry_id}</td>
						<td>${inquiry.inquiry_type}</td>
						<td>${inquiry.inquiry_ansstate}</td>
						<td>${inquiry.inquiry_title}</td>
						<td>${inquiry.inquiry_writer}</td>
						<td><fmt:formatDate value="${inquiry.inquiry_date}"
								pattern="YYYY.MM.dd" /></td>
					</tr>
				</c:forEach>

				<tr style="border-bottom: hidden;">
					<td colspan="2"></td>
					<td scope="row" colspan="3" style="text-align: center;">
						<!-- <a href="">1</a> <a href="">2</a> <a href="">3</a> -->
						<div>
							<table style="width: 100%;">
								<tr>
									<!-- 처음 이전 12345 다음 맨끝 -->
									<td colspan="5" class="text-center">
										<div class="d-flex">
											<div class="flex-grow-1">
												<button class="btn btn-outline-primary btn-sm"
													onclick="getList(${sid},1)">처음</button>

												<c:if test="${inquiry_pager.groupNo>1}">
													<button class="btn btn-outline-info btn-sm"
														onclick="getList(${sid},${inquiry_pager.startPageNo-1})">이전</button>
												</c:if>

												<c:forEach var="i" begin="${inquiry_pager.startPageNo}"
													end="${inquiry_pager.endPageNo}">

													<c:if test="${inquiry_pager.pageNo!=i}">
														<button class="btn btn-outline-success btn-sm"
															onclick="getList(${sid},${i})">${i}</button>
													</c:if>
													<c:if test="${inquiry_pager.pageNo==i}">
														<button class="btn btn-outline-danger btn-sm"
															onclick="getList(${sid},${i})">${i}</button>
													</c:if>
												</c:forEach>

												<c:if test="${inquiry_pager.groupNo<pager.totalGroupNo}">
													<button class="btn btn-outline-info btn-sm"
														onclick="getList(${sid},${inquiry_pager.endPageNo+1})">다음</button>
												</c:if>

												<button class="btn btn-outline-primary btn-sm"
													onclick="getList(${sid},${inquiry_pager.totalPageNo})">맨끝</button>
											</div>
										</div>
									</td>
								</tr>
							</table>
						</div>
					</td>
			</c:if>

			<c:if test="${fn:length(inquiryList) == 0}">
				<tr style="border-bottom:hidden;">
					<td colspan="6"><p style="text-align: center; font-size: 20px; margin: 100px; color: grey;">
						<span style="color: #00B0F0;"> 문의 내역</span>이 없습니다
					</p></td>
				</tr>
			</c:if>
			<tr style="border:hidden;">
				<td colspan="5" >
				</td>
				<td>
					<button onclick="ask(${sid})" type="button" class="btn btn-dark">작성하기</button>
				</td>
			</tr>
		</tbody>
	</table>
</div>

