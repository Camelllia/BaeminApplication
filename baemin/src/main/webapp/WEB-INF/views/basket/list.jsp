<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/link.jsp" %>

<script type="text/javascript" src="/js/basket/basket.js"></script>
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
</script>
<link rel="stylesheet" href="/css/modal.css">
<link rel="stylesheet" href="/css/admin/admin.css" >
<link rel="stylesheet" href="/css/store/detail.css">
<link rel="stylesheet" href="/css/user/login.css">
<link rel="stylesheet" href="/css/basket/table.css">
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<main>
    <input type="hidden" value="${orderType}" id="orderType"/>
    <section>
        <div class="today">
  				<span>
  					<span>장바구니</span>
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
                    <th>가게명</th>
                    <th>메뉴명</th>
                    <th>가격</th>
                    <th>옵션</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="basketList" items="${basketLists}" varStatus="status">
                    <tr>
                        <td>${basketList.rowNum}</td>
                        <td>${basketList.storeName}</td>
                        <td>${basketList.menuName}</td>
                        <td>${basketList.menuPrice}</td>
                        <td>
                            <button class="sort_name reverse" onclick="deleteBasket(${basketList.basketIdn});">X</button>
                        </td>
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

        </div>
        <div class="login_box">
            <c:if test="${not empty basketLists}">
                <h2>총 결제 금액 : <fm:formatNumber value="${baksetInfo.totalPrice}" pattern="###,###"/>원</h2>
                <input value="주문하기" class="login_btn" onclick="location.href='/order/${storeIdn}'" style="width: 100%; text-align: center;">
                <input value="돌아가기" class="login_btn" onclick="location.href='/store/detail/${storeIdn}'" style="width: 100%; text-align: center;">
            </c:if>
            <c:if test="${empty basketLists}">
                <h2>장바구니에 메뉴를 담아주세요</h2>
                <input value="돌아가기" class="login_btn" onclick="location.href='/store/detail/${storeIdn}'" style="width: 100%; text-align: center;">
            </c:if>
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
