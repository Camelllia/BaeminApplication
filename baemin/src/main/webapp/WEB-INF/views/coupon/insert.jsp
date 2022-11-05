<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/link.jsp" %>

<link rel="stylesheet" href="/css/user/login.css">

<script type="text/javascript" src="/js/util/cookie.js"></script>
<script type="text/javascript" src="/js/coupon/coupon.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>

</head>
<body>
    <main>
        <div class="login_box">
            <a href="#"><img src="/img/bamin2.png" alt="이미지" class="bm_img"></a>
                <h2>배달의 민족 쿠폰발급</h2>
                <div class="input_aera">
                    <input type="text" id="couponName" name="couponName"  value="" required placeholder="쿠폰 이름을 입력해 주세요" maxlength="30" >
                    <input type="number" id="discountAmount" name="discountAmount"  value="" required placeholder="할인금액을 입력해 주세요" maxlength="30" >
                </div>
                <input value="쿠폰 발급하기" class="login_btn" onclick="createCoupon()" style="text-align: center;">
                <input value="돌아가기" class="login_btn" onclick="location.href='/myPage'" style="text-align: center;">
        </div>
    </main>
</body>
</html>