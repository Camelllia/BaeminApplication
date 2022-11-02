<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/link.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/js/order/order.js"></script>
<script type="text/javascript">

    var paymentCode = 0;

    window.onload = function() {
        $("#select").prop('checked', true);
    }
</script>
<link rel="stylesheet" href="/css/order/select.css">
<link rel="stylesheet" href="/css/user/login.css">
</head>
<body>
<main>
    <div class="login_box"> 
        <input type="hidden" id="storeIdn" value="${storeIdn}">
        <input type="hidden" id="orderPrice" value="${basketInfo.paymentPrice}">
        <input type="hidden" id="userPoint" value="${basketInfo.userPoint}">
        <a href="#"><img src="/img/bamin2.png" alt="이미지" class="bm_img"></a>
        <form action="/join" method="post" >
            <div class="input_aera">
                <div class="select">
                    <h2 style="display: inline;">결제 방식 선택 : </h2> 
                    <input type="radio" id="select" name="shop" onclick="selectPointPayType()"><label for="select">배민페이</label>
                    <input type="radio" id="select2" name="shop" onclick="selectDirectPayType()"><label for="select2">현장결제</label>
               </div>
            </div>

            <div class="input_aera">
                <input type="number" class="password1" name="orderPrice" id="paymentPoint" maxlength="20"  placeholder="사용하실 포인트를 입력해주세요 - 사용 가능 금액 : ${basketInfo.userPoint}P">
            </div>

            <div class="input_aera">
                <div class="select">
                    <input type="text" class="password2" maxlength="20" id="userAddressMain" placeholder="주소를 선택해주세요" disabled>
                    <input type="text" class="password2" maxlength="20" id="detailAddress" placeholder="상세 주소를 입력해주세요">
                    <input type="radio" id="kakaoAddress" name="shop" onclick="selectKakaoAddress()"><label for="kakaoAddress">주소찾기</label>
                </div>
            </div>

            <div class="input_aera">
                <input type="text" class="password2" maxlength="20" id="selectCouponName" placeholder="쿠폰을 선택해주세요" disabled>
                <select name="coupon" id="couponState" class="pl" onchange="selectCoupon()">
                    <option value="0" selected>미선택</option>
                    <c:forEach items="${couponLists}" var="couponList">
                        <option value="${couponList.discountAmount}" value2="${couponList.couponIdn}">${couponList.couponName}</option>    
                    </c:forEach>
                </select>
            </div>

            <div class="input_aera">
                <h2>주문금액 : <fm:formatNumber value="${basketInfo.totalPrice}" pattern="###,###" />원&nbsp;&nbsp;배달팁 : <fm:formatNumber value="${basketInfo.deleveryTip}" pattern="###,###" />원</h2>
                <h2 id="couponDisplay">할인금액 : 0원</h2>
                <input type="hidden" value="0" id="couponAmount">
                <input type="hidden" value="0" id="couponIdn">
                <h2 id="totalDisplay">총 결제금액 : <fm:formatNumber value="${basketInfo.paymentPrice}" pattern="###,###" />원</h2>
            </div>

            <input value="주문하기" class="login_btn" style="text-align: center;" onclick="order()">
            <input value="돌아가기" class="login_btn" style="text-align: center;" onclick="location.href='/basketList/${storeIdn}'">
        </form>
    </div>

</main>
</body>
</html>
