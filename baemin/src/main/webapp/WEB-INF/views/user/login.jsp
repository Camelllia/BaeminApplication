<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/link.jsp" %>
<script type="text/javascript" src="/js/util/cookie.js"></script>
<script type="text/javascript" src="/js/user/user.js"></script>
<script type="text/javascript">

    window.onload = function () {
        var saved_email = getCookie("saved_email");
        if (saved_email != "" && saved_email != 'undefined' && saved_email != "" && saved_email != 'undefined') {
            $("#userEmail").val(saved_email);
        }
    }
</script>
<link rel="stylesheet" href="/css/user/login.css">
</head>
<body>
<main>
    <div class="login_box">
        <a href="/"><img src="/img/bamin2.png" alt="이미지" class="bm_img"></a>

            <div class="input_aera"><input type="text" id="userEmail" name="username"  value="" required placeholder="이메일을 입력해 주세요" maxlength="30" ></div>
            <div class="input_aera"><input type="password" id="userPw" name="password" value="" required placeholder="비밀번호를 입력해 주세요" maxlength="30"></div>

            <input value="로그인" class="login_btn" onclick="login()">

            <div class="box">
                <div class="continue_login">
                    <label for="save_email">
                        <span>아이디 저장</span>
                        <input type="checkbox" id="save_email" name="remember-me" >
                        <i class="fas fa-check-square"></i>
                    </label>
                </div>

<%--                <div>--%>
<%--                    <span class="id_search"><a href="/find/id">아이디</a></span>--%>
<%--                    <span> ㅣ </span>--%>
<%--                    <span><a href="/find/password">비밀번호 찾기</a></span>--%>
<%--                </div>--%>
            </div>

<%--        <div id="oauth_login">--%>
<%--            <div>--%>
<%--                <a href="/oauth2/authorization/kakao"></a>--%>
<%--            </div>--%>

<%--            <div>--%>
<%--                <a href="/oauth2/authorization/naver"></a>--%>
<%--            </div>--%>

<%--            <div>--%>
<%--                <a href="/oauth2/authorization/google"></a>--%>
<%--            </div>--%>
<%--        </div>--%>

        <div class="join"><a href="/join" >회원 가입하러 가기</a></div>
    </div>
</main>


</body>
</html>