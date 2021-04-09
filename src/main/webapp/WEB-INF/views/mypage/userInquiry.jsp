<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<script>
function showInq2(sid,inquiry_id){
	console.log("sabang_id : " + sid);
	console.log("inquiry_id : " + inquiry_id);
	window.open("pop_ask_content?inquiry_id="+inquiry_id+"&sid="+sid,"문의사항","status=no ,location=no, directoryies=no, resizable=no, scrollbars=yes, titlebar=no");
}

</script>
<style>
.check_inq:hover {
	color: white;
	background-color: #00B0F0;
	cursor: pointer;
}
</style>
<c:if test="${fn:length(inquiryList) == 0}">
	<p style="text-align: center; font-size: 20px; margin: 200px; color: grey;">
		<sec:authentication property="name" />님의 <span style="color: #00B0F0;"> 문의 </span> 내역이 없습니다
	</p>
</c:if>

<c:if test="${fn:length(inquiryList) > 0}">
	<div>
		<table class="table">
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
				<c:forEach var="inquiry" items="${inquiryList}">
					<tr class="check_inq" onclick="showInq2(${inquiry.inquiry_sabangid},${inquiry.inquiry_id})">
						<td scope="row">${inquiry.inquiry_id}</td>
						<td>${inquiry.inquiry_type}</td>
						<td style="color: #adb5bd;">${inquiry.inquiry_ansstate}</td>
						<td>${inquiry.inquiry_title}</td>
						<td>${inquiry.inquiry_writer}</td>
						<td><fmt:formatDate value="${inquiry.inquiry_date}"
								pattern="YYYY.MM.dd" /></td>
					</tr>
				</c:forEach>
				<tr style="border-bottom: hidden;">
					<td colspan="2"></td>
					<td scope="row" colspan="3" style="text-align: center;">
						<div>
							<table style="width: 100%;">
								<tr>  
									<!-- 처음 이전 12345 다음 맨끝 -->
									<td colspan="5" class="text-center">
										<div class="d-flex">
											<div class="flex-grow-1">
												<button class="btn btn-outline-primary btn-sm"
													onclick="getList(`${member_nickname}`,1)">처음</button>
		
												<c:if test="${mypage_inquiry_pager.groupNo>1}">
													<button class="btn btn-outline-info btn-sm"
														onclick="getList(`${member_nickname}`,${mypage_inquiry_pager.startPageNo-1})">이전</button>
												</c:if>

												<c:forEach var="i"
													begin="${mypage_inquiry_pager.startPageNo}"
													end="${mypage_inquiry_pager.endPageNo}">

													<c:if test="${mypage_inquiry_pager.pageNo!=i}">
														<button class="btn btn-outline-success btn-sm"
															onclick="getList(`${member_nickname}`,${i})">${i}</button>
													</c:if>
													<c:if test="${mypage_inquiry_pager.pageNo==i}">
														<button class="btn btn-outline-danger btn-sm"
															onclick="getList(`${member_nickname}`,${i})">${i}</button>
													</c:if>
												</c:forEach>

												<c:if
													test="${mypage_inquiry_pager.groupNo<pager.totalGroupNo}">
													<button class="btn btn-outline-info btn-sm"
														onclick="getList(`${member_nickname}`,${mypage_inquiry_pager.endPageNo+1})">다음</button>
												</c:if>

												<button class="btn btn-outline-primary btn-sm"
													onclick="getList(`${member_nickname}`,${mypage_inquiry_pager.totalPageNo})">맨끝</button>
											</div>


										</div>
									</td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</c:if>
