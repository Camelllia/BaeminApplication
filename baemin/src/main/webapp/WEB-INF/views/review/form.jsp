<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/link.jsp" %>
<script type="text/javascript">

    $(document).ready(function() {
        $("#imgFile, #imgFileLabel").change(function() {
        var imgFile = $("#imgFile")[0].files[0];
        
        $("#file-name").val(imgFile.name);
        });
    });

    function maxScoreCheck(object){
    if (object.value.length > object.maxLength){
      object.value = object.value.slice(0, object.maxLength);
    }
    if(object.value > 5) {
        object.value = 5;
    } else if(object.value < 0) {
        object.value = 0;
    }
  }
    
    var review = function() {

        var reviewTitle = $("#reviewTitle").val();
        var reviewContent = $("#reviewContent").val();
        var reviewScore = $("#reviewScore").val();
        var storeIdn = $("#storeIdn").val();
        var imgFile = $("#imgFile")[0].files[0];

        if(reviewTitle == "" || reviewContent == "" || reviewScore == "") {
            alert("입력되지 않은 내용이 있습니다.");
            return;
        }
        if(reviewScore > 5 || reviewScore < 0) {
            alert("유효하지 않은 리뷰 점수입니다");
            return;
        }

        var formData = new FormData();

        formData.append("reviewTitle", reviewTitle);
        formData.append("reviewContent", reviewContent);
        formData.append("reviewScore", reviewScore);
        formData.append("storeIdn", storeIdn);
        if(imgFile != undefined) {
            formData.append("imgFile", imgFile);
            formData.append("fileName", imgFile.name);
        }
        
        $.ajax({
            type:"POST",
            url:"/insertReview",
            data:formData,
            contentType : false,
            processData : false,
            success:function(response) {

                const result = JSON.parse(response);

                if(result.resultCode == "1") {
                    alert("정상적으로 등록되었습니다.");
                    location.href = "/store/detail/"+storeIdn;
                }
                if(result.resultCode == "-10") {
                    alert("리뷰 점수는 5점 이하로 입력해주세요");
                    return;
                } else if(result.resultCode == "-20") {
                    alert("리뷰 제목 및 내용을 입력해주세요.");
                    return;
                } else if(result.resultCode == "-30") {
                    alert("매장 정보를 찾을 수 없습니다.");
                    return;
                } else if(result.resultCode == "-40") {
                    alert("유효하지 않은 파일 확장자입니다. \nPNG 형식의 파일을 업로드해 주세요.");
                    return;
                } 
				
            },
            error:function (err) {
                console.log(err);
                alert("리뷰 작성에 실패하였습니다.");
            }
        })
    }
</script>
<link rel="stylesheet" href="/css/review/input.css">
<link rel="stylesheet" href="/css/user/login.css">
</head>
<body>
<main>
    <div class="login_box">
        <a href="/"><img src="/img/bamin2.png" alt="이미지" class="bm_img"></a>
        <form id="reviewForm" enctype="multipart/form-data" name="reviewForm">
            <input type="hidden" id="storeIdn" value="${storeIdn}"/>
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
