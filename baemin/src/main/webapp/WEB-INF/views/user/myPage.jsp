<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/link.jsp" %>

<link rel="stylesheet" href="/css/layout/nav.css">
<link rel="stylesheet" href="/css/user/myPage.css">

<script type="text/javascript" src="/js/user/user.js"></script>

<%@ include file="/WEB-INF/views/include/header.jsp" %>

<div class="wrap">

    <section class="title">
        <h1>My 배민</h1>
    </section>

    <!-- 콘텐츠 -->
    <main>
        <div class="container">

            <div class="grid_box">
                <div class="login_box">
                    <c:if test="${empty userNickname}">
                        <a href="/"><span>로그인을 해주세요</span></a>
                    </c:if>
                    <c:if test="${!empty userNickname}">
                        <a href="#"><span class="nickname" data-nickname=${userNickname} >${userNickname} 님</span></a>
                        <button type="button" class="logout" onclick="logout()">로그아웃</button>
                    </c:if>
                </div>

                <div>
                    <a href="/point">
	                       	<span class="img_box">
	                       		<img src="/img/icon11.png" alt="포인트">
	                       	</span>
                        <span>포인트 충전</span>
                    </a>
                </div>


                <div>
                    <a class="updating" href="/couponList/orderType=0&stateCode=0&pageNum=1">
	               		  	<span class="img_box">
	                			<img src="/img/icon22.png" alt="쿠폰함">
	               			</span>
                        <span>쿠폰함</span>
                    </a>
                </div>


                <div>
                    <a class="updating" href="/coupon/insert">
	                 		<span class="img_box">
	                 			<img src="/img/icon33.png" alt="쿠폰발급">
	                 		</span>
                        <span>쿠폰발급</span>
                    </a>
                </div>


                <div>
                    <a href="/store/insert">
							<span class="img_box">
								<img src="/img/icon44.png" alt="찜한가게">
							</span>
                        <span>매장등록</span>
                    </a>
                </div>


                <div>
                    <a href="/orderList/orderType=0&pageNum=1">
							<span class="img_box">
								<img src="/img/icon55.png" alt="주문내역">
							</span>
                        <span>주문내역</span>
                    </a>
                </div>


                <div>
                    <a href="/reviewList/pageNum=1">
							<span class="img_box">
								<img src="/img/icon66.png" alt="리뷰관리">
							</span>
                        <span>리뷰관리</span>
                    </a>
                </div>

            </div>
        </div>
    </main>
</div>

<!-- 콘텐츠 -->

<!-- 하단 메뉴 -->
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<!-- 하단 메뉴 -->

<!-- 푸터 -->
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<!-- 푸터 -->
</body>
</html>
