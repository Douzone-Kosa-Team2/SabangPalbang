<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
 
  <!-- 마이페이지 메뉴 헤더 -->
 <div class="mypage_header">
        <a class="mypage_header_memberInfo" href="mypage_memberInfo">회원 정보</a>
        <a class="mypage_header_orderInfo" href="mypage_orderlist">주문 내역</a>
        <a class="mypage_header_inquiryInfo" href="mypage_inquiry">내가 쓴 문의글</a>
 </div>
 
<!-- 마이페이지 > 내가 쓴 문의글 -->

   <div class="mypage_inquiry">
    <div class="mypage_inquiry_main">
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
             <tr>
                <td scope="row">1</td>
                <td>반품/취소/교환</td>
                <td style="color: #adb5bd;">검토중</td>
                <td>반품/취소 문의입니다.</td>
                <td>이채정</td>
                <td>2021.03.10</td>
             </tr>
             <tr>
                <td scope="row">2</td>
                <td>상품</td>
                <td style="color: #00BFFF;">답변완료</td>
                <td>상품 문의입니다.</td>
                <td>이채정</td>
                <td>2021.03.09</td>
             </tr>
             <tr>
                <td scope="row">3</td>
                <td>반품/취소/교환</td>
                <td style="color: #00BFFF;">답변완료</td>
                <td>배송 문의입니다.</td>
                <td>이채정</td>
                <td>2021.03.08</td>
             </tr>
             <tr>
                <td scope="row">4</td>
                <td>반품/취소/교환</td>
                <td style="color: #adb5bd;">검토중</td>
                <td>반품/취소 문의입니다.</td>
                <td>이채정</td>
                <td>2021.03.07</td>
             </tr>
             <tr>
                <td scope="row">5</td>
                <td>상품</td>
                <td style="color: #00BFFF;">답변완료</td>
                <td>상품 문의입니다.</td>
                <td>이채정</td>
                <td>2021.03.06</td>
             </tr> 
        
          </tbody>
       </table>
    </div>
    <br />
 </div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>