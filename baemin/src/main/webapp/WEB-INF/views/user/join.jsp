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
                <input type="text" name="phone" value="" class="phone" id="userPhonenum" placeholder="전화번호를 010-1234-5678 형식으로 입력해 주세요" maxlength="20" >
                <span class="msg_box">${errorMsg.phone }</span>
            </div>

            <input value="회원가입" class="login_btn" onclick="join()">
        </form>
    </div>

</main>
</body>
</html>
