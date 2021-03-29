<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!-- 광고 내용 부분 -->
	<div class="advertise_content">
		<c:if test="${adnum == 1}">
			<img src="resources/images/advertise/advertise1.png" height="100%"/>
		</c:if>
		<c:if test="${adnum == 2}">
			<img src="resources/images/advertise/advertise2.png" height="100%"/>
		</c:if>
	</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>