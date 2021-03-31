<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

     <!-- 마이페이지 메뉴 헤더 -->
    <div class="mypage_header">
        <a class="mypage_header_member_info" href="mypage_memberInfo">회원 정보</a>
        <a  href="mypage_orderlist">주문 내역</a>
        <a  href="mypage_inquiry">내가 쓴 문의글</a>
    </div> 


<!-- 회원 정보 페이지 -->

    <div class="mypage_memInfo_main">

        <form method="post" action="updateMember"> 
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        	<input type="hidden" name="member_id" value="${member.member_id}"/>
            <div class="mypage_memInfo_signinInput">
                <div class="mypage_memInfo_signinInput_label">이메일</div>

                <div class="mb-3 mypage_memInfo_signinInput_bind">
                    <input type="email" class="form-control" id="member_email" value="${member.member_email}"
                        name="member_email" readonly>
                </div>
                <br />
                <div class="mypage_memInfo_signinInput_label">비밀번호</div>
                <div><small>영문+숫자+특수기호 8자리 이상으로 구성하여야 합니다.</small></div>
                <div class="mb-3">
                    <input type="text" class="form-control" id="member_pw" placeholder="비밀번호" name="member_pw">
                </div>
                <br />
                <div class="mypage_memInfo_signinInput_label">비밀번호 확인</div>
                <div class="mb-3">
                    <input type="password" class="form-control" id="member_pwcheck" placeholder="비밀번호 확인" name="member_pwcheck">
                </div>
                <br />
                <div class="mypage_memInfo_signinInput_label">이름</div>
                <div class="mb-3">
                    <input type="text" class="form-control" id="member_name" placeholder="조민상" name="member_name" value="${member.member_name}">
                </div>
                <br />
                <div class="mypage_memInfo_signinInput_label">연락처</div>
                <div class="mb-3 mypage_memInfo_signinInput_bind">
                    
                    <input type="tel" class="form-control" id="member_phone" value="${member.member_phone}"
                        name="member_phone">

                </div>
                <br />

                <div class="mypage_memInfo_signinInput_label">주소</div>
               
                <div class="mb-3 mypage_memInfo_signinInput_bind">
                    <input type="text" class="form-control" id="zipcode" value="${member.zipcode}"
                            name="zipcode">
                    <input type="button" class="form-control" id="findaddress" value="우편번호 찾기" name="findaddress">

                </div>           

                <div>
                    <input type="text" class="form-control" id="roadaddress" value="${member.roadaddress}"
                       		name="roadaddress">
                </div>
                <div>
                   	<input type="text" class="form-control" id="detailaddress" value="${member.detailaddress}"
                        	name="detailaddress">
               	</div>


                <br />

                <div>별명</div>
                <div><small>다른 유저와 겹치지않는 별명을 입력해주세요, (2~15자)</small></div>
                <div class="mb-3 mypage_memInfo_signinInput_bind">
                    <input type="text" class="form-control" id="member_nickname" placeholder="${member.member_nickname}" name="member_nickname" readonly>
                </div>
                <div style="text-align: center;">
                    <button type="submit" class="btn btn-primary btn-lg">회원 정보 수정</button>
                </div>
            </div>
        </form>

    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>