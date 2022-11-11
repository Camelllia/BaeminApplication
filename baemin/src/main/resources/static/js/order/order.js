var order = function() {

    var kakaoAddress = $("#userAddressMain").val();
    var detailAddress = $("#detailAddress").val();
    var paymentPoint = $("#paymentPoint").val();
    var orderPrice = $("#orderPrice").val();
    var storeIdn = $("#storeIdn").val();
    var discountAmount = $("#couponAmount").val();
    var couponIdn = $("#couponIdn").val();
    var paymentType;

    if($('input:radio[id=select2]').is(':checked')) {
        paymentType = 1;
    } else {
        paymentType = 0;
    }

    if(kakaoAddress == '' || detailAddress == '') {
        alert("주소를 입력해주세요.");
        return;
    }

    if(paymentType == 0 && paymentPoint == '') {
        alert("사용하실 포인트를 입력해주세요.");
        return;
    }

    if(paymentType == 1) {
        paymentPoint = orderPrice;
    }

    var param = {
        kakaoAddress : kakaoAddress,
        detailAddress : XSSCheck(detailAddress, 1),
        paymentPoint : paymentPoint,
        orderPrice : orderPrice,
        paymentType : paymentType,
        storeIdn : storeIdn,
        discountAmount : discountAmount,
        couponIdn : couponIdn
    }

    $.ajax({
        type:"POST",
        url:"/createOrder",
        data:param,
        success:function(response) {

            const result = JSON.parse(response);

            if(result.resultCode == "1") {
                alert("주문 성공");
                location.href = "/order/receipt/"+result.orderIdn;
            } else if(result.resultCode == "-10") {
                alert("입력되지 않은 필드가 있습니다.");
                return;
            } else if(result.resultCode == "-20") {
                alert("결제하기 위한 포인트가 부족합니다. \n포인트를 충전해주세요.");
                return;
            }
        },
        error:function (err) {
            alert("회원가입에 실패하였습니다.");
        }
    })
}

var selectKakaoAddress = function() {
    new daum.Postcode({
        oncomplete: function(data) {
            $("#userAddressMain").val(data.address);
            if(paymentCode == 0) {
                $("#select").prop('checked', true);
                selectPointPayType();
            } else {
                $("#select2").prop('checked', true);
                selectDirectPayType();
            }
        }
    }).open();
}

var selectPointPayType = function() {
    var userPoint = $("#userPoint").val();
    var pointHolder = "사용하실 포인트를 입력해주세요 - 사용 가능 금액 : " + userPoint + "P";
    $("#paymentPoint").attr("disabled", false);
    $("#paymentPoint").attr("placeholder", pointHolder);
    paymentCode = 0;
}

var selectDirectPayType = function() {
    $("#paymentPoint").attr("disabled", true);
    $("#paymentPoint").attr("placeholder", "현장에서 결제해주세요");
    paymentCode = 1;

}

var selectCoupon = function() {
    var couponName = $("#couponState option:selected").text();
    var discountValue = $("#couponState option:selected").val();
    var couponIdn = $("#couponState > option:selected").attr("value2");
    if(couponIdn == undefined) {
        couponIdn = 0;
    }
    $("#selectCouponName").val(couponName);
    var discountAmount = discountValue.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
    $("#couponDisplay").html("할인금액 : " + discountAmount + "원");
    var totalPrice = $("#orderPrice").val();
    totalPrice = totalPrice - discountValue;
    var dispalyTotalPrice = totalPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
    $("#totalDisplay").html("총 결제금액 : " + dispalyTotalPrice + "원");
    $("#couponAmount").val(discountValue);
    $("#couponIdn").val(couponIdn);
}

var pagePrev = function() {
    var curPageNum = parseInt($("#curPageNum").val());
    var orderType = $("#orderType").val();
    var prevPageNum = curPageNum - 1;
    location.href = '/orderList/orderType=' + orderType + '&pageNum=' + prevPageNum;
}

var pageNext = function() {
    var curPageNum = parseInt($("#curPageNum").val());
    var orderType = $("#orderType").val();
    var nextPageNum = curPageNum + 1;
    location.href = '/orderList/orderType=' + orderType + '&pageNum=' + nextPageNum;
}