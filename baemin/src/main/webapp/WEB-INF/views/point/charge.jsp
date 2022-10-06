<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/link.jsp" %>
<script type="text/javascript" src="/js/util/cookie.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script async type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">

    var charge_point = function () {

        // getter
        var IMP = window.IMP;
        IMP.init('imp63445053');
        var money = $("#chargePoint").val();
        
        if(money == '') {
            alert("금액을 입력해주세요.");
            return;
        }
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card', //생략 가능
            merchant_uid: "order_no_0003", // 상점에서 관리하는 주문 번호
            name : '주문명 : 결제',
            amount : money,
            buyer_email : 'iamport@siot.do',
            buyer_name : '구매자이름',
            buyer_tel : '010-1234-5678',
            buyer_addr : '서울특별시 강남구 삼성동',
            buyer_postcode : '123-456'
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                // msg += '고유ID : ' + rsp.imp_uid;
                // msg += '상점 거래ID : ' + rsp.merchant_uid;
                // msg += '결제 금액 : ' + rsp.paid_amount;
                // msg += '카드 승인번호 : ' + rsp.apply_num;
                $.ajax({
                    type: "POST", 
                    url: "/point/charge", //충전 금액값을 보낼 url 설정
                    data: {
                        "amount" : money
                    },
                });
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
            }
            //alert(msg);
            document.location.href= location.href;
        });
    };

</script>
<link rel="stylesheet" href="/css/user/login.css">
</head>
<body>
    <main>
        <div class="login_box">
            <a href="/"><img src="/img/bamin2.png" alt="이미지" class="bm_img"></a>

                <div class="input_aera"><input type="number" id="chargePoint" name="chargePoint"  value="" required placeholder="충전할 금액을 입력해 주세요" maxlength="30" ></div>
                <input value="포인트 충전하기" class="login_btn" onclick="charge_point()" style="text-align: center;">

                <!-- <div class="box">
                    <div class="continue_login">
                        <label for="save_email">
                            <span>아이디 저장</span>
                            <input type="checkbox" id="save_email" name="remember-me" >
                            <i class="fas fa-check-square"></i>
                        </label>
                    </div>
                </div> -->
        </div>
    </main>
</body>
</html>