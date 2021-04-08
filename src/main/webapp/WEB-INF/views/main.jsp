<%@ page  contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<script>

		var adIndex = 0;
		window.onload = function init() {
			var sec = 3000;
			var ads = document.querySelectorAll(".main_advertise_content");
			var adBtn = document.querySelectorAll(".main_advertise_movePage");
			var size = adBtn.length;
			for(k=0;k<size;k++){
				adBtn[k].style.position = "absoulte";
				adBtn[k].style.left = "47%";
				adBtn[k].style.top = "60%";
			}
			setInterval(function () {

				ads[adIndex].style.display = "inline";
				showSlides(adIndex);
				adIndex++;
				if (adIndex == 3) {
					adIndex = 0;
				}

			}, sec);
		};

		function showSlides(n) {

			for (i = 0; i < 3; i++) {
				if (i == n) {
					document.querySelectorAll(".main_advertise_content")[i].style.display = "inline";
				}
				else {
					document.querySelectorAll(".main_advertise_content")[i].style.display = "none";
				}
			}
		}
		function movePage(num) {
			showSlides(num);
		}

	</script>
	<!-- 메인 상세 페이지  -->

	<div class="main_main">
		<!-- 광고  -->
		<div class="main_advertise">
			<div class="main_advertise_content" id="main_advertise_img1">
				<a href="/sabangpalbang/advertisePage?adnum=2">
					<img src="resources/images/main/main_ad_2.png" width="1400px"/>
				</a>

				<div class="main_advertise_movePage">
					<a id="main_advertise_page1" class="btn btn-primary" onclick="movePage(0)"></a>
					<a id="main_advertise_page2" class="btn btn-secondary" onclick="movePage(1)"></a>
					<a id="main_advertise_page3" class="btn btn-secondary" onclick="movePage(2)"></a>
				</div>
			</div>
			<div class="main_advertise_content" id="main_advertise_img2">
				<a href="/sabangpalbang/advertisePage?adnum=1">
					<img src="resources/images/main/main_ad_3.png" width="1400px"/>
				</a>
				<div class="main_advertise_movePage">
					<a id="main_advertise_page1" class="btn btn-secondary" onclick="movePage(0)"></a>
					<a id="main_advertise_page2" class="btn btn-primary" onclick="movePage(1)"></a>
					<a id="main_advertise_page3" class="btn btn-secondary" onclick="movePage(2)"></a>
				</div>
			</div>
			<div class="main_advertise_content" id="main_advertise_img3">
				<a href="/sabangpalbang/advertisePage?adnum=1">
					<img src="resources/images/main/main_ad_4.png" width="1400px" />
				</a>
				<div class="main_advertise_movePage">
					<a id="main_advertise_page1" class="btn btn-secondary" onclick="movePage(0)"></a>
					<a id="main_advertise_page2" class="btn btn-secondary" onclick="movePage(1)"></a>
					<a id="main_advertise_page3" class="btn btn-primary" onclick="movePage(2)"></a>
				</div>
			</div>

		</div>
		<br>
		<!-- 사방 -->
		<div class="main_sabang">
			<div class="main_sabang_title">
				<div class="main_sabang_title_name">
					<h4 style="font-family: 'Cafe24Dangdanghae'; font-size:1.5em">사방</h4>
					<h6>모든 스타일과 예산에 맞는 방을 구경해보세요.</h6>
				</div>
				<div class="main_sabang_title_more">
					<a href="/sabangpalbang/sabang_main" style="font-family: 'Cafe24Dangdanghae';">더보기</a>
				</div>
			</div>
			
			<div class="main_sabang_content">
				<c:forEach var="sabang" items="${slist}">
				<div class="main_sabang_content_1">
					<a href="sabang_detail?sid=${sabang.sabang_id}">
						<div class="main_sabang_content_1_img">
							<img src="resources/images/sabang_post/${sabang.sabang_imgoname}" width="450px" style="border-radius: 5%; overflow: hidden;">
						</div>
						<div class="main_sabang_content_1_detail">
						<br>
							<p style="font-size:1.5em">${sabang.sabang_name}</p>
						</div>
					</a>
				</div>
				</c:forEach>
			</div>
		</div>
		<!-- 팔방 -->
		<div class="main_palbang">
			<div class="main_palbang_title">
				<div class="main_palbang_title_name">
					<h4 style="font-family: 'Cafe24Dangdanghae'; font-size:1.5em">팔방</h4>
					<h6>나의 방을 공유해보고, 다른 사람들의 방을 구경해보세요.</h6>
				</div>
				<div class="main_palbang_title_more">
					<a href="/sabangpalbang/palbang_main" style="font-family: 'Cafe24Dangdanghae';">더보기</a>
				</div>
			</div>
			<div class="main_palbang_content">
				<c:forEach var="palbang" items="${plist}">
				<div class="main_palbang_content_1">
					<a href="palbang_detail?pid=${palbang.palbang_id}">
						<div class="main_palbang_content_1_img">
							<img src="resources/images/palbang_post/${palbang.palbang_imgoname}" width="450px" style="border-radius: 5%; overflow: hidden;">
						</div>
						<div class="main_palbang_content_1_detail">
						<br>
							<p style="font-size:1.5em">${palbang.palbang_title}</p>
						</div>
					</a>
				</div>
				</c:forEach>
			</div>

		</div>
	</div>
<style>
.main_sabang_content_1_img { 
	overflow: hidden; 
	}
.main_sabang_content_1_img  img {
    -webkit-transform:scale(1);
    -moz-transform:scale(1);
    -ms-transform:scale(1); 
    -o-transform:scale(1);  
    transform:scale(1);
    -webkit-transition:.3s;
    -moz-transition:.3s;
    -ms-transition:.3s;
    -o-transition:.3s;
    transition:.3s;
}
.main_sabang_content_1_img:hover img {
    -webkit-transform:scale(1.1);
    -moz-transform:scale(1.1);
    -ms-transform:scale(1.1);   
    -o-transform:scale(1.1);
    transform:scale(1.1);
}


.main_palbang_content_1_img { 
	overflow: hidden; 
	}
.main_palbang_content_1_img  img {
    -webkit-transform:scale(1);
    -moz-transform:scale(1);
    -ms-transform:scale(1); 
    -o-transform:scale(1);  
    transform:scale(1);
    -webkit-transition:.3s;
    -moz-transition:.3s;
    -ms-transition:.3s;
    -o-transition:.3s;
    transition:.3s;
}
.main_palbang_content_1_img:hover img {
    -webkit-transform:scale(1.1);
    -moz-transform:scale(1.1);
    -ms-transform:scale(1.1);   
    -o-transform:scale(1.1);
    transform:scale(1.1);
}

</style>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>