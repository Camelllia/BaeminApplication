<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/link.jsp" %>
<script type="text/javascript">
    
</script>
<link rel="stylesheet" href="/css/user/login.css">
</head>
<body>
<main>
    <div class="login_box">
        <a href="/"><img src="/img/bamin2.png" alt="이미지" class="bm_img"></a>

            <h2>배달의 민족 영수증</h2>
            <div class="input_aera">
                <c:if test="${orderInfo.paymentType eq 0}">
                    <input type="text" class="email" value="결제방식 : 배민페이" disabled>
                </c:if>
                <c:if test="${orderInfo.paymentType eq 1}">
                    <input type="text" class="email" value="결제방식 : 현장결제" disabled>
                </c:if>
            </div>

            <div class="input_aera">
              <input type="text" class="email" value="결제금액 : ${orderInfo.orderPrice}" disabled>
            </div>

            <div class="input_aera">
              <input type="text" class="email" value="배달받으실 곳 : ${orderInfo.orderAddress}" disabled>
            </div>

            <div class="input_aera">
              <input type="text" class="email" value="주문하신 곳 : ${orderInfo.storeName}" disabled>    
            </div>

            <div class="input_aera">
              <input type="text" class="email" value="주문일시 : ${orderInfo.regDate}" disabled>                    
            </div>

            <input value="리뷰작성" class="login_btn" onclick="location.href='/review/form/${orderInfo.storeIdn}'" style="text-align : center">
            <input value="확인" class="login_btn" onclick="location.href='/category'" style="text-align : center">
    </div>

</main>
</body>
</html>
