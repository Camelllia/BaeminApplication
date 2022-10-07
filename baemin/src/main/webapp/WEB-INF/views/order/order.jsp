<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/link.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

    var pointHolder;

    window.onload = function() {
        pointHolder = $("#orderPrice").attr("placeholder");
    }

    var order = function() {

        var userEmail = $("#userEmail").val();
        var userPw = $("#userPw").val();
        var userPwCheck = $("#userPwCheck").val();
        var userNickname = $("#userNickname").val();
        var userPhonenum = $("#userPhonenum").val();

        if(userEmail == '') {
            alert("이메일을 입력해주세요.");
            return;
        }

        if(userPw == '') {
            alert("비밀번호를 입력해주세요.");
            return;
        }

        if(userNickname == '') {
            alert("닉네임을 입력해주세요.");
            return;
        }

        if(userPhonenum == '') {
            alert("전화번호를 입력해주세요.");
            return;
        }

        if(userPw !== userPwCheck) {
            alert("비밀번호가 일치하지 않습니다.");
            return;
        }

        var param = {
            userEmail : userEmail,
            userPw : userPw,
            userPwCheck : userPwCheck,
            userNickname : userNickname,
            userPhonenum : userPhonenum
        }

        $.ajax({
            type:"POST",
            url:"/insertUserAccount",
            data:param,
            success:function(response) {
			
                const result = JSON.parse(response);
				
                if(result.resultCode == "1") {
                	alert("정상적으로 가입되었습니다.");
                    location.href = "/";
				} else if(result.resultCode == "-10"){
					alert("유효하지 않은 이메일입니다.");
                    return;
				}
                else if(result.resultCode == "-20"){
					alert("비밀번호가 일치하지 않습니다.");
                    return;
				}
                else if(result.resultCode == "-30"){
					alert("동일한 이메일로 가입된 계정이 존재합니다.");
                    return;
				}
                else if(result.resultCode == "-40"){
					alert("유효하지 않은 전화번호 형식입니다.");
                    return;
				}
            },
            error:function (err) {
                alert("회원가입에 실패하였습니다.");
            }
        })
    }

    var kakaoAddress = function() {
            new daum.Postcode({
                oncomplete: function(data) {
                    $("#userAddressMain").val(data.address);
                }
            }).open();
    }

    var selectPointPayType = function() {
        $("#orderPrice").attr("disabled", false);
        $("#orderPrice").attr("placeholder", pointHolder);
    }

    var selectDirectPayType = function() {
        $("#orderPrice").attr("disabled", true);
        $("#orderPrice").attr("placeholder", "현장에서 결제해주세요");

    }
</script>
<link rel="stylesheet" href="/css/order/select.css">
<link rel="stylesheet" href="/css/user/login.css">
</head>
<body>
<main>
    <div class="login_box">
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
                <input type="number" class="password1" name="orderPrice" id="orderPrice" maxlength="20"  placeholder="사용하실 포인트를 입력해주세요 - 사용 가능 금액 : ${basketInfo.userPoint}P">
            </div>

            <div class="input_aera">
                <div class="select">
                    <input type="text" class="password2" maxlength="20" id="userAddressMain" placeholder="주소를 선택해주세요" disabled>
                    <input type="radio" id="select3" name="shop" onclick="kakaoAddress()"><label for="select3">주소찾기</label>
                </div>
                <input type="text" class="password2" maxlength="20" id="userAddressDetail" placeholder="상세 주소를 입력해주세요">
            </div>

            <div class="input_aera">
                <h2>주문금액 : <fm:formatNumber value="${basketInfo.totalPrice}" pattern="###,###" />원&nbsp;&nbsp;배달팁 : <fm:formatNumber value="${basketInfo.deleveryTip}" pattern="###,###" />원</h2>
                <h2>총 결제금액 : <fm:formatNumber value="${basketInfo.paymentPrice}" pattern="###,###" />원</h2>
            </div>

            <input value="주문하기" class="login_btn" style="text-align: center;" onclick="order()">
        </form>
    </div>

</main>
</body>
</html>
