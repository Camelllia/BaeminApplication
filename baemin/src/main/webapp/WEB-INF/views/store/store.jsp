<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/link.jsp" %>

<link rel="stylesheet" href="/css/store/store.css">
<link rel="stylesheet" href="/css/store/store-li.css">
<link rel="stylesheet" href="/css/layout/nav.css">
<script type="text/javascript">
    window.onload = function () {
        var categoryNum = $("#categoryNum").val();
        var orderType = $("#orderType").val();

        if(categoryNum == 100) {
            $("#ca_100").css('color', '#222222');
        } else if(categoryNum == 101) {
            $("#ca_101").css('color', '#222222');
        } else if(categoryNum == 102) {
            $("#ca_102").css('color', '#222222');
        } else if(categoryNum == 103) {
            $("#ca_103").css('color', '#222222');
        } else if(categoryNum == 104) {
            $("#ca_104").css('color', '#222222');
        }

        if(orderType == 0) {
            $("#ot_0").css('color', '#af8865');
            $("#ot_0").css('background', '#ddd');
        } else if(orderType == 1) {
            $("#ot_1").css('color', '#af8865');
            $("#ot_1").css('background', '#ddd');
        } else if(orderType == 2) {
            $("#ot_2").css('color', '#af8865');
            $("#ot_2").css('background', '#ddd');
        } else if(orderType == 3) {
            $("#ot_3").css('color', '#af8865');
            $("#ot_3").css('background', '#ddd');
        }

    }
</script>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

    <!-- 콘텐츠 -->
    <main>
        <div class="container">
            <div class="category" data-category="${category}">
                <ul>
                    <li data-category ='100' onclick="location.href='/store/categoryNum=100&orderType=0'"><span id="ca_100">피자</span></li>
                    <li data-category ='101' onclick="location.href='/store/categoryNum=101&orderType=0'"><span id="ca_101">치킨</span></li>
                    <li data-category ='102' onclick="location.href='/store/categoryNum=102&orderType=0'"><span id="ca_102">패스트푸드</span></li>
                    <li data-category ='103' onclick="location.href='/store/categoryNum=103&orderType=0'"><span id="ca_103">분식</span></li>
                    <li data-category ='104' onclick="location.href='/store/categoryNum=104&orderType=0'"><span id="ca_104">카페/디저트</span></li>
                </ul>
            </div>
            <input type="hidden" value="${categoryNum}" id="categoryNum"/>
            <input type="hidden" value="${orderType}" id="orderType"/>
           <div class="option">
                <ul>    
                	<li data-sort="기본순" id="ot_0"><a href="/store/categoryNum=${categoryNum}&orderType=0">기본순</a></li>
                    <li data-sort="배달 빠른 순" id="ot_1"><a href="/store/categoryNum=${categoryNum}&orderType=1">배달팁 낮은 순</a></li>
                    <li data-sort="배달팁 낮은 순" id="ot_2"><a href="/store/categoryNum=${categoryNum}&orderType=2">배달 빠른 순</a></li>
                    <li data-sort="최소 주문 금액 순" id="ot_3"><a href="/store/categoryNum=${categoryNum}&orderType=3">최소 주문 금액 순</a></li>
                    <li data-sort="매장등록" id="ot_4"><a href="/store/insert">매장등록</a></li>
                </ul> 
           </div>

            <div class="box">
				<c:if test="${empty storeList }">
					<img class="temp_img" alt="이미지" src="/img/temp2.png">
					<style>main .box {background: #F6F6F6; max-width: 100%; }</style>
				</c:if>

                <ul class="store">
                	<c:forEach items="${storeList}" var="storeList">
                    	<%@ include file="/WEB-INF/views/store/store-li.jsp" %>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </main>
     <!-- 콘텐츠 -->

    <!-- 하단 메뉴 -->
    <%@ include file="/WEB-INF/views/include/nav.jsp" %>
    <!-- 하단 메뉴 -->

    <!-- 푸터 -->
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    <!-- 푸터 -->

	<script type="text/javascript" src="/js/store/store.js" ></script>
    
</body>
</html>