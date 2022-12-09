<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/link.jsp" %>
<script type="text/javascript" src="/js/user/user.js"></script>
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
                <input type="text" name="phone" value="" class="phone" id="userPhonenum" placeholder="전화번호를 '010-1234-5678' 형식으로 입력해 주세요" maxlength="20" >
                <span class="msg_box">${errorMsg.phone }</span>
            </div>

            <input value="회원가입" class="login_btn" onclick="join()">
            <input value="취소" class="login_btn" onclick="cancel()">
        </form>
    </div>

</main>
</body>
</html>
