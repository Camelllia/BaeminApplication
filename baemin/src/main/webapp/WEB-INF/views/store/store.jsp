<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/link.jsp" %>

<link rel="stylesheet" href="/css/store/store.css">
<link rel="stylesheet" href="/css/store/store-li.css">

<%@ include file="/WEB-INF/views/include/header.jsp" %>

    <!-- 콘텐츠 -->
    <main>
        <div class="container">
            <div class="category" data-category="${category }">
                <ul>
                    <li data-category ='100' onclick="location.href='/store/100/${address1 }'"><span>피자</span></li>
                    <li data-category ='101' onclick="location.href='/store/101/${address1 }'"><span>치킨</span></li>
                    <li data-category ='102' onclick="location.href='/store/102/${address1 }'"><span>패스트푸드</span></li>
                    <li data-category ='103' onclick="location.href='/store/103/${address1 }'"><span>분식</span></li>
                    <li data-category ='104' onclick="location.href='/store/104/${address1 }'"><span>카페/디저트</span></li>
                </ul>
            </div>

			<input type="hidden" value="${address1 }" class="address1">

           <div class="option">
                <ul>    
                	<li data-sort="기본순">기본순</li>
                    <li data-sort="배달 빠른 순">배달팁 낮은 순</li>
                    <li data-sort="배달팁 낮은 순">배달 빠른 순</li>
                    <li data-sort="최소 주문 금액 순">최소 주문 금액 순</li>
                </ul> 
           </div>

            <div class="box">
				
				<c:if test="${empty storeList }">
					<img class="temp_img" alt="이미지" src="/img/temp2.png">
					<style>main .box {background: #F6F6F6; max-width: 100%; }</style>
				</c:if>

                <ul class="store">
                	<c:set var="store_admin" value="/store" />
                	<c:forEach items="${storeList }" var="storeList">
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