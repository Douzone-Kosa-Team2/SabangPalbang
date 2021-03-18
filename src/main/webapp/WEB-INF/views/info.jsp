<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>


<script>
		var infoIndex = 0;
		console.log("무야호");
		window.onload = function () {
			console.log("무야호2");
			var sec = 3000;
			var infos = document.querySelectorAll(".info_content_1");
			var infoBtn = document.querySelectorAll(".info_content_movePage");
			var size = infoBtn.length;
			for(k=0;k<size;k++){
				infoBtn[k].style.position = "absoulte";
				infoBtn[k].style.left = "47%";
				infoBtn[k].style.top = "90%";
			}

			setInterval(function () {

				showSlides(infoIndex);
				infoIndex++;
				if (infoIndex == 3) {
					infoIndex = 0;
				}

			}, sec);
		};

		function showSlides(n) {

			for (i = 0; i < 3; i++) {
				if (i == n) {
					document.querySelectorAll(".info_content_1")[i].style.display = "inline";
				}
				else {
					document.querySelectorAll(".info_content_1")[i].style.display = "none";
				}
			}
		}
		function movePage(num) {
			showSlides(num);
		}

</script>
	<!-- 내용 -->

	<div class="info_content">


		<div class="info_content_1" id="info_img1">
			<a href="/sabangpalbang/main">
				<img src="resources/images/info_1.png" />
			</a>

			<div class="info_content_movePage">
				<a id="info_content_page1" class="btn btn-primary" onclick="movePage(0)"></a>
				<a id="info_content_page2" class="btn btn-secondary" onclick="movePage(1)"></a>
				<a id="info_content_page3" class="btn btn-secondary" onclick="movePage(2)"></a>
			</div>
		</div>
		<div class="info_content_1" id="info_img2">
			<a href="sabangpalbang/sabang_main">
				<img src="resources/images/info_2.png" />
			</a>
			<div class="info_content_movePage">
				<a id="info_content_page1" class="btn btn-secondary" onclick="movePage(0)"></a>
				<a id="info_content_page2" class="btn btn-primary" onclick="movePage(1)"></a>
				<a id="info_content_page3" class="btn btn-secondary" onclick="movePage(2)"></a>
			</div>
		</div>
		<div class="info_content_1" id="info_img3">
			<a href="sabangpalbang/palbang_main">
				<img src="resources/images/info_3.png" />
			</a>

			<div class="info_content_movePage">
				<a id="info_content_page1" class="btn btn-secondary" onclick="movePage(0)"></a>
				<a id="info_content_page2" class="btn btn-secondary" onclick="movePage(1)"></a>
				<a id="info_content_page3" class="btn btn-primary" onclick="movePage(2)"></a>
			</div>
		</div>


	</div>



<%@ include file="/WEB-INF/views/common/footer.jsp"%>