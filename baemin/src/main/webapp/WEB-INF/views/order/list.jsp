<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/link.jsp" %>

<link rel="stylesheet" href="/css/admin/admin.css" >
<link rel="stylesheet" href="/css/user/login.css">
<link rel="stylesheet" href="/css/layout/page.css">

<script type="text/javascript" src="/js/order/order.js"></script>
<script type="text/javascript">
    window.onload = function () {
        var orderType = $("#orderType").val();
        //style="background: rgba(163, 159, 159, 0.425);"

        if(orderType == 0) {
            $("#ot_0").css('background', 'rgba(163, 159, 159, 0.425)');
        } else if(orderType == 1) {
            $("#ot_1").css('background', 'rgba(163, 159, 159, 0.425)');
        }
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
    <input type="hidden" value="${orderType}" id="orderType"/>
    <input type="hidden" value="${curPageNum}" id="curPageNum"/>
    <section>
        <div>
  			<span>
                <h2 style="text-align: center;">주문목록</h2>
  			</span>
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
            <button class="year_btn"  id="ot_0" onclick="location.href='/orderList/orderType=0&pageNum=${curPageNum}'">주문일순</button>
            <button class="year_btn"  id="ot_1" onclick="location.href='/orderList/orderType=1&pageNum=${curPageNum}'">주문금액순</button>
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
                    <th>주문하신 가게명</th>
                    <th>주문금액</th>
                    <th>배달받으신 곳</th>
                    <th>결제형식</th>
                    <th>결제일</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="orderList" items="${orderLists}" varStatus="status">
                    <tr>
                        <td>${orderList.rowNum}</td>
                        <td>${orderList.storeName}</td>
                        <td>${orderList.orderPrice}</td>
                        <td>${orderList.orderAddress}</td>
                        <td>
                            <c:if test="${orderList.paymentType eq 0}">
                                배민페이
                            </c:if>
                            <c:if test="${orderList.paymentType eq 1}">
                                현장결제
                            </c:if>
                        </td>
                        <td>${orderList.regDate}</td>
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
        <ul class="page_box">
            <c:if test="${curPageNum ne 1}">
                <li><a onclick="pagePrev()">이전</a></li>
            </c:if>
        
            <c:forEach begin="1" end="${totalPageNum}" var="i">
                <c:if test="${i != curPageNum }">
                    <li><a href="/orderList/orderType=${orderType}&pageNum=${i}">${i}</a></li>
                </c:if>
                <c:if test="${i == curPageNum}">
                    <li><a class="now_page" onclick="return false;" href="orderList/orderType=${orderType}&pageNum=${i}">${i }</a></li>
                </c:if>
            </c:forEach>
        
            <c:if test="${curPageNum ne totalPageNum}">
                <li><a onclick="pageNext()">다음</a></li>
            </c:if>
        </ul>
        <div class="login_box">
            <input value="돌아가기" class="login_btn" onclick="location.href='/myPage'" style="width: 100%; text-align: center;">
        </div>
    </section>

    <section class="detail other_detail">
        <div>
            <h3 class="sales_today_detail_title">
                <span id="other_detail_date"></span>
                <span>
						<button class="sort_name reverse">이름순</button>
						<button class="sort_price reverse">가격순</button>
					</span>
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
