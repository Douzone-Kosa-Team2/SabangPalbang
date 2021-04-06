<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="sabang_detail_3_div_table">
	<table class="table">
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
			<c:forEach var="inquiry" items="${inquiryList}">

				<tr>
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
					<!-- <a href="">1</a> <a href="">2</a> <a href="">3</a> -->
					<div>
						<table style="width: 100%;">
							<tr>
								<!-- 처음 이전 12345 다음 맨끝 -->
								<td colspan="5" class="text-center">
									<div class="d-flex">
										<div class="flex-grow-1">
											<button class="btn btn-outline-primary btn-sm"
												onclick="getList(`${anickname}`,1)">처음</button>

											<c:if test="${mypage_inquiry_pager.groupNo>1}">
												<button class="btn btn-outline-info btn-sm"
													onclick="getList(`${anickname}`,${mypage_inquiry_pager.startPageNo-1})">이전</button>
											</c:if>

											<c:forEach var="i" begin="${mypage_inquiry_pager.startPageNo}"
												end="${mypage_inquiry_pager.endPageNo}">

												<c:if test="${mypage_inquiry_pager.pageNo!=i}">
													<button class="btn btn-outline-success btn-sm"
														onclick="getList(`${anickname}`,${i})">${i}</button>
												</c:if>
												<c:if test="${mypage_inquiry_pager.pageNo==i}">
													<button class="btn btn-outline-danger btn-sm"
														onclick="getList(`${anickname}`,${i})">${i}</button>
												</c:if>
											</c:forEach>

											<c:if test="${mypage_inquiry_pager.groupNo<pager.totalGroupNo}">
												<button class="btn btn-outline-info btn-sm"
													onclick="getList(`${anickname}`,${mypage_inquiry_pager.endPageNo+1})">다음</button>
											</c:if>

											<button class="btn btn-outline-primary btn-sm"
												onclick="getList(`${anickname}`,${mypage_inquiry_pager.totalPageNo})">맨끝</button>
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