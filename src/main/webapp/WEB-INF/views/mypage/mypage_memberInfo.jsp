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


        <form>
            <div class="mypage_memInfo_signinInput">
                <div class="mypage_memInfo_signinInput_label">이메일</div>

                <div class="mb-3 mypage_memInfo_signinInput_bind">
                    <input type="email" class="form-control" id="exampleFormControlInput1" value="af7078@naver.com"
                        name="email">
                </div>
                <br />
                <div class="mypage_memInfo_signinInput_label">비밀번호</div>
                <div>영문+숫자+특수기호 8자리 이상으로 구성하여야 합니다.</div>
                <div class="mb-3">
                    <input type="text" class="form-control" id="inputPassword" placeholder="비밀번호" name="password">
                </div>
                <br />
                <div class="mypage_memInfo_signinInput_label">비밀번호 확인</div>
                <div class="mb-3">
                    <input type="password" class="form-control" id="inputPassword" placeholder="비밀번호 확인">
                </div>
                <br />
                <div class="mypage_memInfo_signinInput_label">이름</div>
                <div class="mb-3">
                    <input type="text" class="form-control" id="inputPassword" placeholder="조민상" name="name">
                </div>
                <br />
                <div class="mypage_memInfo_signinInput_label">연락처</div>
                <div class="mb-3 mypage_memInfo_signinInput_bind">
                    <select name="tel_pre">
                        <option value="" disabled="">선택해주세요.</option>
                        <option selected="" value="010">010</option>
                        <option value="011">011</option>
                        <option value="017">017</option>
                        <option value="02">02</option>
                    </select>
                    <input type="tel" class="form-control" id="exampleFormControlInput1" value="85507078"
                        name="tel_suf">

                </div>
                <br />

                <div class="mypage_memInfo_signinInput_label">주소</div>
               
                    <div class="mb-3 mypage_memInfo_signinInput_bind">
                        <input type="text" class="form-control" id="exampleFormControlInput1" value="24120"
                            name="zipCode">
                        <input type="button" class="form-control" id="exampleFormControlInput1" value="우편번호 찾기">

                    </div>
               

                <div>
                    <input type="text" class="form-control" id="exampleFormControlInput1" value="의정부시 오목로 252"
                        name="zipDetail1">
                </div>
                <div>
                    <input type="text" class="form-control" id="exampleFormControlInput1" value="202-1004"
                        name="zipDetail2">
                </div>


                <br />

                <div>별명</div>
                <div>다른 유저와 겹치지않는 별명을 입력해주세요, (2~15자)</div>
                <div class="mb-3 mypage_memInfo_signinInput_bind">
                    <input type="text" class="form-control" id="inputPassword" placeholder="Jomsang" name="nickname">
                </div>
                <div style="text-align: center;">
                    <button type="button" class="btn btn-primary btn-lg">회원 정보 수정</button>
                </div>
            </div>
        </form>

    </div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>