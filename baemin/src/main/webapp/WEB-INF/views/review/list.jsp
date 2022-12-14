<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/link.jsp" %>

<link rel="stylesheet" href="/css/modal.css">
<link rel="stylesheet" href="/css/admin/admin.css" >
<link rel="stylesheet" href="/css/store/detail.css">
<link rel="stylesheet" href="/css/user/login.css">
<link rel="stylesheet" href="/css/layout/page.css">

<script type="text/javascript" src="/js/review/review.js"></script>
<script type="text/javascript">
    window.onload = function () {
        var orderType = $("#orderType").val();
        //style="background: rgba(163, 159, 159, 0.425);"

        if(orderType == 1) {
            $("#ot_1").css('background', 'rgba(163, 159, 159, 0.425)');
        } else if(orderType == 2) {
            $("#ot_2").css('background', 'rgba(163, 159, 159, 0.425)');
        }
    }

    var pagePrev = function() {
        var curPageNum = parseInt($("#curPageNum").val());
        var prevPageNum = curPageNum - 1;
        location.href = '/reviewList/pageNum=' + prevPageNum;
    }

    var pageNext = function() {
        var curPageNum = parseInt($("#curPageNum").val());
        var nextPageNum = curPageNum + 1;
        location.href = '/reviewList/pageNum=' + nextPageNum;
    }
</script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<style>
    table {
        width: 100%;
        border: 1px solid #444444;
        border-collapse: collapse;
    }
    th, td {
        border: 1px solid #444444;
        text-align: center;
    }
</style>
<main>
    <input type="hidden" value="${curPageNum}" id="curPageNum"/>
    <section>
        <div class="today">
  				<span>
  					<span>리뷰 관리</span>
  					<span id="today"></span>
  				</span>

            <!-- <button>상세보기</button> -->

        </div>

    </section>

    <section class="detail today_detail">
        <div>
            <h3 class="sales_today_detail_title">
                <span>매출 상세</span>
                <span>

				</span>
            </h3>

            <div class="sales_today_detail">
                <div>메뉴</div>
                <div>수량</div>
                <div>가격</div>
            </div>
        </div>
    </section>


    <section class="graph_section" onselectstart="return false;" >
        <div class="box">
            <!-- <button class="year_btn"  id="ot_1" onclick="location.href='/memberList/orderType=1'">이름순</button>
            <button class="month_btn" id="ot_2" onclick="location.href='/memberList/orderType=2'">가입일순</button> -->
            <!-- <button class="week_btn">이번 주 매출</button>
            <input type="month"name="date" id="date">
            <button class="other_month_search">검색</button> -->
            <div>
                <br>
            </div>

            <table>
                <thead>
                <tr>
                    <th>NO</th>
                    <th>제목</th>
                    <th>내용</th>
                    <th>별점</th>
                    <th>가게명</th>
                    <th>등록일</th>
                    <th>옵션</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="reviewList" items="${reviewLists}" varStatus="status">
                    <tr>
                        <td>${reviewList.rowNum}</td>
                        <td>${reviewList.reviewTitle}</td>
                        <td>${reviewList.reviewContent}</td>
                        <td>
                            <c:forEach begin="0" end="4" var="i">
									<c:choose>
										<c:when test="${reviewList.reviewScore > i }">
											<i class="far fas fa-star"></i>
										</c:when>
									<c:otherwise>
										<i class="far fa-star"></i>
									</c:otherwise>
								</c:choose>
							</c:forEach>
                        </td>
                        <td>${reviewList.storeName}</td>
                        <td>${reviewList.regDate}</td>
                        <td><button class="sort_name reverse" onclick="deleteReview(${reviewList.reviewIdn});">삭제</button></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="graph_box">
                <ul>
                </ul>

                <div class="graph_background">
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
            </div>
            <ul class="page_box">
                <c:if test="${curPageNum ne 1}">
                    <li><a onclick="pagePrev()">이전</a></li>
                </c:if>
            
                <c:forEach begin="1" end="${totalPageNum}" var="i">
                    <c:if test="${i != curPageNum }">
                        <li><a href="/reviewList/pageNum=${i}">${i}</a></li>
                    </c:if>
                    <c:if test="${i == curPageNum}">
                        <li><a class="now_page" onclick="return false;" href="/reviewList/pageNum=${i}">${i}</a></li>
                    </c:if>
                </c:forEach>
            
                <c:if test="${curPageNum ne totalPageNum}">
                    <li><a onclick="pageNext()">다음</a></li>
                </c:if>
            </ul>
            <div class="login_box">
                <input value="돌아가기" class="login_btn" onclick="location.href='/myPage'" style="width: 100%; text-align: center;">
            </div>
        </div>
    </section>

    <section class="detail other_detail">
        <div>
            <h3 class="sales_today_detail_title">
                <span id="other_detail_date"></span>
                <!-- <span>
					<button class="sort_name reverse">이름순</button>
					<button class="sort_price reverse">가격순</button>
				</span> -->
            </h3>
            <div class="sales_today_detail">
                <div>메뉴</div>
                <div>수량</div>
                <div>가격</div>
            </div>
        </div>
    </section>

</main>

<script src="/js/admin/admin.js"></script>
</body>
</html>
