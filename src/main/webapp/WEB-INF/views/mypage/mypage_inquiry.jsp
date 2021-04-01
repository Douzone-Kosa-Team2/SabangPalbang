<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>



<script>

	$(function() {
		console.log("success");
		getList(${userNickName}, 1);
	});
	
	const getList = (userNickName, pageNo) => {
		console.log("success2");
		const args = {url:"userInquiryList",method:"get"}
		if(pageNo){
			args.data = {userNickName, pageNo};
		}
		$.ajax(args)
		.then(data => {
			console.log("success3");
			$("#userInquiry").html(data);
		});
		
	};
	
	
</script>

 <!-- 마이페이지 메뉴 헤더 -->
 <div class="mypage_header">
        <a class="mypage_header_memberInfo" href="mypage_memberInfo">회원 정보</a>
        <a class="mypage_header_orderInfo" href="mypage_orderlist">주문 내역</a>
        <a class="mypage_header_inquiryInfo" href="mypage_inquiry">내가 쓴 문의글</a>
 </div>


 
 <!-- 마이페이지 > 내가 쓴 문의글 -->
<%-- <c:if test="${loginmember_email == member.member_email}"> --%>
 <div class="sabang_detail_3" id="userInquiry">

	<br />
</div>
<%-- </c:if> --%>



   

<%@ include file="/WEB-INF/views/common/footer.jsp"%>