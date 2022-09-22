<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/link.jsp" %>
<script type="text/javascript">
    var join = function() {

        var userEmail = $("#userEmail").val();
        var userPw = $("#userPw").val();

        if(userEmail == '') {
            alert("이메일을 입력해주세요.");
            return;
        }

        if(userPw == '') {
            alert("비밀번호를 입력해주세요.");
            return;
        }

        var param = {
            reporterEmail : XSSCheck(reporterEmail, 1),
            reportPw : XSSCheck(reportPw, 1)
        }

        $.ajax({
            type:"POST",
            url:"/selectTargetReport",
            data:param,
            success:function (response) {
				const result = JSON.parse(response);
				if(result.resultCode == 1) {
                	$(".popup__report--confirm-3").append(dynamicReport);
				} else {
					alert("제보 찾기에 실패하였습니다.");
				}
                
            },
            error:function (err) {
                alert("제보 찾기에 실패하였습니다.");
            }
        })
    }
</script>
<link rel="stylesheet" href="/css/user/login.css">
</head>
<body>
<main>
    <div class="login_box">
        <a href="/"><img src="/img/bamin2.png" alt="이미지" class="bm_img"></a>
        <form action="/join" method="post" >
            <div class="input_aera">
                <input type="text" name="email" class="email" id="userEmail" placeholder="이메일을 입력해 주세요" >
                <span class="msg_box">${errorMsg.email }</span>
            </div>

            <div class="input_aera">
                <input type="password" class="password1" name="password" id="userPw" maxlength="20"  placeholder="비밀번호를 입력해 주세요">
            </div>

            <div class="input_aera">
                <input type="password" class="password2" maxlength="20" id="userPwCheck" placeholder="비밀번호를 한번더 입력해 주세요">
                <span class="msg_box">${errorMsg.password }</span>
            </div>

            <div class="input_aera">
                <input type="text" class="nickname" name="nickname" maxlength="20" id="userNickname"  placeholder="사용하실 닉네임을 입력해 주세요">
                <span class="msg_box">${errorMsg.nickname }</span>
            </div>

            <div class="input_aera">
                <input type=number name="phone" value="" class="phone" id="userPhonenum" placeholder="전화번호를 010-1234-5678 형식으로 입력해 주세요" maxlength="11" >
                <span class="msg_box">${errorMsg.phone }</span>
            </div>

            <input type="submit" value="회원가입" class="login_btn" onclick="join()">
        </form>
    </div>

</main>
</body>
</html>
