<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/link.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

    var paymentCode = 0;

    window.onload = function() {
        $("#select").prop('checked', true);
    }

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
            detailAddress : detailAddress,
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
