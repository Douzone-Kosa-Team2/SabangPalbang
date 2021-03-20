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
				adBtn[k].style.top = "50%";
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
				<a href="/sabangpalbang/advertisePage">
					<img src="resources/images/main/main_ad_2.png" />
				</a>

				<div class="main_advertise_movePage">
					<a id="main_advertise_page1" class="btn btn-primary" onclick="movePage(0)"></a>
					<a id="main_advertise_page2" class="btn btn-secondary" onclick="movePage(1)"></a>
					<a id="main_advertise_page3" class="btn btn-secondary" onclick="movePage(2)"></a>
				</div>
			</div>
			<div class="main_advertise_content" id="main_advertise_img2">
				<a href="/sabangpalbang/advertisePage">
					<img src="resources/images/main/main_ad_3.png" />
				</a>
				<div class="main_advertise_movePage">
					<a id="main_advertise_page1" class="btn btn-secondary" onclick="movePage(0)"></a>
					<a id="main_advertise_page2" class="btn btn-primary" onclick="movePage(1)"></a>
					<a id="main_advertise_page3" class="btn btn-secondary" onclick="movePage(2)"></a>
				</div>
			</div>
			<div class="main_advertise_content" id="main_advertise_img3">
				<a href="/sabangpalbang/advertisePage">
					<img src="resources/images/main/main_ad_4.png" />
				</a>
				<div class="main_advertise_movePage">
					<a id="main_advertise_page1" class="btn btn-secondary" onclick="movePage(0)"></a>
					<a id="main_advertise_page2" class="btn btn-secondary" onclick="movePage(1)"></a>
					<a id="main_advertise_page3" class="btn btn-primary" onclick="movePage(2)"></a>
				</div>
			</div>

		</div>

		<!-- 사방 -->
		<div class="main_sabang">
			<div class="main_sabang_title">
				<div class="main_sabang_title_name">
					<h4>사방</h4>
					<h6>모든 스타일과 예산에 맞는 방을 구경해보세요.</h6>
				</div>
				<div class="main_sabang_title_more">
					<a href="/sabangpalbang/sabang_main">더보기</a>
				</div>
			</div>
			<div class="main_sabang_content">
				<div class="main_sabang_content_1">
					<a href="/sabangpalbang/sabang_detail">
						<div class="main_sabang_content_1_img">
							<img src="resources/images/main/main_sb_1.png">
						</div>
						<div class="main_sabang_content_1_detail">
							<p>세련된 스튜디오 같은 방</p>
						</div>
					</a>
				</div>
				<div class="main_sabang_content_2">
					<a href="/sabangpalbang/sabang_detail">
						<div class="main_sabang_content_2_img">
							<img src="resources/images/main/main_sb_2.png">
						</div>
						<div class="main_sabang_content_2_detail">
							<p>책 읽고 싶게 만드는 방</p>
						</div>
					</a>

				</div>
				<div class="main_sabang_content_3">
					<a href="/sabangpalbang/sabang_detail">
						<div class="main_sabang_content_3_img">
							<img src="resources/images/main/main_sb_3.png">
						</div>
						<div class="main_sabang_content_3_detail">
							<p>우드톤 가구를 활용한 방</p>
						</div>
					</a>
				</div>

			</div>
		</div>
		<!-- 팔방 -->
		<div class="main_palbang">
			<div class="main_palbang_title">
				<div class="main_palbang_title_name">
					<h4>팔방</h4>
					<h6>나의 방을 공유해보고, 다른 사람들의 방을 구경해보세요.</h6>
				</div>
				<div class="main_palbang_title_more">
					<a href="/sabangpalbang/palbang_main">더보기</a>
				</div>
			</div>
			<div class="main_palbang_content">
				<a href="/sabangpalbang/palbang_detail">
					<div class="main_sabang_content_1">
						<img src="resources/images/main/main_pb_1.png">
					</div>
				</a>
				<a href="/sabangpalbang/palbang_detail">
					<div class="main_sabang_content_2">
						<img src="resources/images/main/main_pb_2.png">
					</div>
				</a>
				<a href="/sabangpalbang/palbang_detail">
					<div class="main_sabang_content_3">
						<img src="resources/images/main/main_pb_3.png">
					</div>
				</a>
			</div>

		</div>
	</div>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>