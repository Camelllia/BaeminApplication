var charge_point = function () {

    // getter
    var IMP = window.IMP;
    IMP.init('imp63445053');
    var money = $("#chargePoint").val();
    var userIdn = $("#userIdn").val();

    if(money == '') {
        alert("금액을 입력해주세요.");
        return;
    }

    IMP.request_pay({
        pg : 'kakaopay',
        pay_method : 'card', //생략 가능
        merchant_uid: "order_"+ new Date().getTime(), // 주문 번호
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
                url: "/point/charge/"+userIdn, //충전 금액값을 보낼 url 설정
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