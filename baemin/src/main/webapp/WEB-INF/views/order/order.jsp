<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/link.jsp" %>
<script type="text/javascript">
    var join = function() {

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
</script>
<style>
    .select {
    padding: 15px 10px;
}
.select input[type=radio]{
    display: none;
}
.select input[type=radio]+label{
    display: inline-block;
    cursor: pointer;
    height: 24px;
    width: 90px;
    border: 1px solid #333;
    line-height: 24px;
    text-align: center;
    font-weight:bold;
    font-size:13px;
}
.select input[type=radio]+label{
    background-color: #fff;
    color: #333;
}
.select input[type=radio]:checked+label{
    background-color: #333;
    color: #fff;
}
</style>
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
                    <input type="radio" id="select" name="shop"><label for="select">배민페이</label>
                    <input type="radio" id="select2" name="shop"><label for="select2">현장결제</label>
               </div>
            </div>

            <div class="input_aera">
                <input type="number" class="password1" name="password" id="userPw" maxlength="20"  placeholder="사용하실 포인트를 입력해주세요 - 사용 가능 금액 : 5000P">
            </div>

            <div class="input_aera">
                <input type="password" class="password2" maxlength="20" id="userPwCheck" placeholder="배달 받으실 주소를 선택해주세요">
                <span class="msg_box">${errorMsg.password }</span>
            </div>

            <div class="input_aera">
                <h2>주문금액 : 52000&nbsp;&nbsp;배달팁 : 2000</h2>
            </div>

            <input value="주문하기" class="login_btn" style="text-align: center;" onclick="join()">
        </form>
    </div>

</main>
</body>
</html>
