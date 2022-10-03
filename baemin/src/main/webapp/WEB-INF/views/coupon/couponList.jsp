<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/link.jsp" %>
<script type="text/javascript">
    window.onload = function () {
        var orderType = $("#orderType").val();
        var stateCode = $("#stateCode").val();

        if(orderType == 1) {
            $("#ot_1").css('background', 'rgba(163, 159, 159, 0.425)');
        }
        if(stateCode == 1) {
            $("#ot_2").css('background', 'rgba(163, 159, 159, 0.425)');
        }
    }
</script>
<link rel="stylesheet" href="/css/admin/admin.css" >
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
    <input type="hidden" value="${stateCode}" id="stateCode"/>
    <section>
        <div class="today">
  				<span>
  					<span>쿠폰목록</span>	
  				</span>
                <button style="float: right;" class="year_btn" onclick="location.href='/myPage'">마이페이지</button>
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
            <button class="year_btn"  id="ot_1" onclick="location.href='/couponList/orderType=1&stateCode=0'">지급일순</button>
            <button class="month_btn" id="ot_2" onclick="location.href='/couponList/orderType=0&stateCode=1'">유효한 쿠폰만</button>
            <button class="month_btn" id="ot_3" onclick="location.href='/couponList/orderType=0&stateCode=0'">모두 해제</button>
            <button class="month_btn" id="ot_4" onclick="location.href='/couponList/orderType=1&stateCode=1'">모두 선택</button>
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
                    <th>쿠폰명</th>
                    <th>할인금액</th>
                    <th>지급일</th>
                    <th>만료일</th>
                    <th>사용여부</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="couponList" items="${couponLists}" varStatus="status">
                    <tr>
                        <td>${couponList.rowNum}</td>
                        <td>${couponList.couponName}</td>
                        <td>${couponList.discountAmount}원</td>
                        <td>${couponList.regDate}</td>
                        <td>${couponList.endDate}</td>
                        <td>
                            <c:if test="${couponList.useYn eq 0}">
                                미사용
                            </c:if>
                            <c:if test="${couponList.useYn eq 1}">
                                사용완료
                            </c:if>
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
    </section>
     
</main>
<!-- 하단 메뉴 -->
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<!-- 하단 메뉴 -->  


<script src="/js/admin/admin.js"></script>
</body>
</html>
