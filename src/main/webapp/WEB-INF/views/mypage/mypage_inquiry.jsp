<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>


<!-- 마이페이지 메뉴 헤더 -->
<div class="mypage_header">
	<a class="mypage_header_memberInfo" href="mypage_memberInfo_check">회원
		정보</a> <a class="mypage_header_orderInfo" href="mypage_orderlist">주문
		내역</a> <a class="mypage_header_inquiryInfo" href="mypage_inquiry">내가 쓴
		문의글</a>
</div>


<!-- 마이페이지 > 내가 쓴 문의글 -->
<div class="d-flex justify-content-center p-2">
	<br />
		<div class="mt-1 mr-2" id="userInquiry">
				<br />
		</div>
</div>


<script>
console.log("success");
	$(function() {
		console.log("success2");
		getList(`${anickname}`, 1);
	});
	
	const getList = (anickname, pageNo) => {
		console.log("success3");
		const args = {url:"userInquiryList",method:"get"}
		if(pageNo){
			args.data = {anickname, pageNo};
		}
		$.ajax(args)
		.then(data => {
			console.log("success4");
			$("#userInquiry").html(data);
		});
		
	};
	
	
</script>



<%@ include file="/WEB-INF/views/common/footer.jsp"%>