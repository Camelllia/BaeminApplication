var createCoupon = function() {

    var couponName = $("#couponName").val();
    var discountAmount = $("#discountAmount").val();

    if(couponName == '' || discountAmount == '') {
        alert("공백인 내용이 있습니다.");
        return;
    }

    var param = {
        couponName : couponName,
        discountAmount : discountAmount
    }

    $.ajax({
        type:"POST",
        url:"/createCoupon",
        data:param,
        success:function(response) {
            const result = JSON.parse(response);
            if(result.resultCode == "1") {
                alert("쿠폰이 발급되었습니다. (유효기간은 일주일입니다)");
            } else if(result.resultCode == "-10"){
                alert("입력값이 유효하지 않습니다.");
                return;
            }
        },
        error:function (err) {
            alert("에러가 발생했습니다");
        }
    })
}