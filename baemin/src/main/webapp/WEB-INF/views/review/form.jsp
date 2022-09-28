<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/link.jsp" %>
<script type="text/javascript">
    var review = function() {

        var reviewTitle = $("#reviewTitle").val();
        var reviewContent = $("#reviewContent").val();
        var reviewScore = $("#reviewScore").val();
        var storeIdn = $("#storeIdn").val();
        var userPhonenum = $("#userPhonenum").val();

        var param = {
            reviewTitle : reviewTitle,
            reviewContent : reviewContent,
            reviewScore : reviewScore,
            storeIdn : storeIdn,
            userPhonenum : userPhonenum
        }

        $.ajax({
            type:"POST",
            url:"/insertReview",
            data:param,
            success:function(response) {
			
                const result = JSON.parse(response);
				
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
        <form action="/insertReview" method="post" >
            <input type="hidden" id="storeIdn" value="${storeIdn}"/>
            <div class="input_aera">
                <input type="text" name="email" class="email" id="reviewTitle" placeholder="이메일을 입력해 주세요" >
                <span class="msg_box">${errorMsg.email }</span>
            </div>

            <div class="input_aera">
                <input type="text" class="password1" name="password" id="reviewContent" smaxlength="20"  placeholder="비밀번호를 입력해 주세요">
            </div>

            <div class="input_aera">
                <input type="number" class="password2" maxlength="1" id="reviewScore" placeholder="비밀번호를 한번더 입력해 주세요">
                <span class="msg_box">${errorMsg.password }</span>
            </div>

            <input value="리뷰작성" class="login_btn" onclick="review()">
        </form>
    </div>

</main>
</body>
</html>
