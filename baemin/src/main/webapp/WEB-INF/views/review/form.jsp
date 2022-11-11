<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/link.jsp" %>

<link rel="stylesheet" href="/css/review/input.css">
<link rel="stylesheet" href="/css/user/login.css">

<script type="text/javascript" src="/js/review/review.js"></script>
<script type="text/javascript" src="/js/util/XSSCheck.js"></script>
<script type="text/javascript">

    $(document).ready(function() {
        $("#imgFile, #imgFileLabel").change(function() {
        var imgFile = $("#imgFile")[0].files[0];
        
        $("#file-name").val(imgFile.name);
        });
    });

</script>

</head>
<body>
<main>
    <div class="login_box">
        <a href="/"><img src="/img/bamin2.png" alt="이미지" class="bm_img"></a>
        <form id="reviewForm" enctype="multipart/form-data" name="reviewForm">
            <input type="hidden" id="storeIdn" value="${storeIdn}"/>

            <h2>배달의 민족 리뷰작성</h2>
            <div class="input_aera">
                <input type="text" name="email" class="email" id="reviewTitle" placeholder="리뷰 제목을 입력해 주세요" >
                <span class="msg_box">${errorMsg.email }</span>
            </div>

            <div class="input_aera">
                <input type="text" class="password1" name="password" id="reviewContent" maxlength="20"  placeholder="리뷰 내용을 입력해 주세요">
            </div>

            <div class="input_aera">
                <input type="number" class="password2" maxlength="1" id="reviewScore" placeholder="별점을 입력해주세요(최대 5점)" oninput="maxScoreCheck(this)">
                <span class="msg_box">${errorMsg.password }</span>
            </div>

            <div class="input_aera">
                <div class="input-file">
                    <input type="text" readonly="readonly" class="file-name" id="file-name"/>
                    <input type="file" name="imgFile" id="imgFile" class="file-upload" />
                    <label for="imgFile" class="file-label" id="imgFileLabel">사진 업로드</label>
                  </div>
            </div>

            <input value="리뷰작성" class="login_btn" onclick="review()">
            <input value="돌아가기" class="login_btn" onclick="location.href='/store/detail/${storeIdn}'">
        </form>
    </div>

</main>
</body>
</html>
