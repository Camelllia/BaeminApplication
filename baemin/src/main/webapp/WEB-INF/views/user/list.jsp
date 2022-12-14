<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/link.jsp" %>
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
        var orderType = $("#orderType").val();
        var prevPageNum = curPageNum - 1;
        location.href = '/memberList/orderType=' + orderType + '&pageNum=' + prevPageNum;
    }

    var pageNext = function() {
        var curPageNum = parseInt($("#curPageNum").val());
        var orderType = $("#orderType").val();
        var nextPageNum = curPageNum + 1;
        location.href = '/memberList/orderType=' + orderType + '&pageNum=' + nextPageNum;
    }

</script>
<link rel="stylesheet" href="/css/admin/admin.css" >
<link rel="stylesheet" href="/css/layout/page.css">
<link rel="stylesheet" href="/css/user/login.css">
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
        <div class="today">
  				<span>
  					<span>회원목록</span>
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
            <button class="year_btn"  id="ot_1" onclick="location.href='/memberList/orderType=1&pageNum=${curPageNum}'">이름순</button>
            <button class="month_btn" id="ot_2" onclick="location.href='/memberList/orderType=2&pageNum=${curPageNum}'">가입일순</button>
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
                    <th>닉네임</th>
                    <th>이메일</th>
                    <th>전화번호</th>
                    <th>포인트</th>
                    <th>가입일</th>
                  </tr>
                </thead>
                <tbody>
                    <c:forEach var="memberList" items="${memberLists}" varStatus="status">
                        <tr>
                            <td>${memberList.rowNum}</td>
                            <td>${memberList.userNickname}</td>
                            <td>${memberList.userEmail}</td>
                            <td>${memberList.userPhonenum}</td>
                            <td>${memberList.userPoint}P</td>
                            <td>${memberList.regDate}</td>
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
                        <li><a href="/memberList/orderType=${orderType}&pageNum=${i}">${i}</a></li>
                    </c:if>
                    <c:if test="${i == curPageNum}">
                        <li><a class="now_page" onclick="return false;" href="/memberList/orderType=${orderType}&pageNum=${i}">${i}</a></li>
                    </c:if>
                </c:forEach>

                <c:if test="${curPageNum ne totalPageNum && totalPageNum != 0}">
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
