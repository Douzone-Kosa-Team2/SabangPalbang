<%@ page  contentType="text/html; charset=UTF-8"%>
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
					         <table style="width:100%;">
					            <tr>
					               <!-- 처음 이전 12345 다음 맨끝 -->
					               <td colspan="5" class="text-center"><a
					                  class="btn btn-outline-primary btn-sm" href="sabang_detail?sid=${sid}&pageNo=1">처음</a>
					   
					                  <c:if test="${pager.groupNo>1}">
					                     <a class="btn btn-outline-info btn-sm"
					                        href="sabang_detail?sid=${sid}&pageNo=${pager.startPageNo-1}">이전</a>
					                  </c:if> <c:forEach var="i" begin="${pager.startPageNo}"
					                     end="${pager.endPageNo}">
					   
					                     <c:if test="${pager.pageNo!=i}">
					                        <a class="btn btn-outline-success btn-sm"
					                           href="sabang_detail?sid=${sid}&pageNo=${i}">${i}</a>
					                     </c:if>
					                     <c:if test="${pager.pageNo==i}">
					                        <a class="btn btn-outline-danger btn-sm"
					                           href="sabang_detail?sid=${sid}&pageNo=${i}">${i}</a>
					                     </c:if>
					                  </c:forEach> <c:if test="${pager.groupNo<pager.totalGroupNo}">
					                     <a class="btn btn-outline-info btn-sm"
					                        href="sabang_detail?sid=${sid}&pageNo=${pager.endPageNo+1}">다음</a>
					                  </c:if> <a class="btn btn-outline-primary btn-sm"
					                  href="sabang_detail?sid=${sid}&pageNo=${pager.totalPageNo}">맨끝</a></td>
					            </tr>
					         </table>
      					</div>
						</td>
						<td>
							<button onclick="ask()" type="button" class="btn btn-dark">작성하기</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>