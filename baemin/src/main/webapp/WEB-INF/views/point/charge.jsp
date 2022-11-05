<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/link.jsp" %>

<link rel="stylesheet" href="/css/user/login.css">

<script type="text/javascript" src="/js/util/cookie.js"></script>
<script type="text/javascript" src="/js/point/point.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script async type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>
<body>
    <main>
        <div class="login_box">
            <a href="#"><img src="/img/bamin2.png" alt="이미지" class="bm_img"></a>
                <input type="hidden" value="${userIdn}" id="userIdn">
                <div class="input_aera"><input type="number" id="chargePoint" name="chargePoint"  value="" required placeholder="충전할 금액을 입력해 주세요" maxlength="30" ></div>
                <input value="포인트 충전하기" class="login_btn" onclick="charge_point()" style="text-align: center;">
                <input value="돌아가기" class="login_btn" onclick="location.href='/myPage'" style="text-align: center;">
        </div>
    </main>
</body>
</html>