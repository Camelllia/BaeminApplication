<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/link.jsp" %>
<script type="text/javascript">
    var insertReview = function() {
        var reviewTitle = $("#reviewTitle").val();
        var reviewContent = $("#reviewContent").val();
        var reviewScore = $("#reviewScore").val();
        var storeIdn = $("#storeIdn").val();
        //const imageInput = $("#reviewFile")[0];

        if(storeIdn == '') {
            location.href = "/category";
        }
        
        if(reviewTitle == '') {
            alert("제목을 입력해주세요.");
            return;
        }

        if(reviewContent == '') {
            alert("내용을 입력해주세요.");
            return;
        }

        if(reviewScore == '') {
            alert("점수를 입력해주세요.");
            return;
        }

        //alert(imageInput.files);

        var param = {
            reviewTitle : reviewTitle,
            reviewContent : reviewContent,
            reviewScore : reviewScore
            //imgFile : imageInput.files
        }

        $.ajax({
            type:"POST",
            url:"/insertReview",
            processData: false,
            contentType: false,
            data:param,
            success:function(response) {
			
                console.log(response);

                const result = JSON.parse(response);
                
                if(result.resultCode == "1") {
                	alert("정상적으로 작성되었습니다.");
                    location.href = "/";
				} else if(result.resultCode == "-10"){
					alert("리뷰 점수를 올바르게 입력해주세요.");
                    return;
				} else if(result.resultCode == "-20"){
					alert("리뷰 제목 및 내용을 입력해주세요.");
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
    /* input file type */
.input-file {
  display: inline-block;
}

.input-file [type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  border: 0 none;
}
.input-file .file-label {
  display: inline-block;
  min-width: 53px;
  height: 27px;
  line-height: 24px;
  padding: 0 10px;
  border-radius: 2px;
  font-size: 13px;
  background-color: #333;
  color: #fff;
  text-align: center;
}
.input-file .file-name {
  width: 300px;
  background: #f5f5f5;
  height: 27px;
  line-height: 26px;
  text-indent: 5px;
  border: 1px solid #bbb;
}
</style>
<link rel="stylesheet" href="/css/user/login.css">
</head>
<body>
<main>
    <input type="hidden" value="${storeIdn}"/>
    <div class="login_box">
        <a href="/"><img src="/img/bamin2.png" alt="이미지" class="bm_img"></a>
        <form action="/insertReview" method="post" enctype="multipart/form-data">
            <div class="input_aera">
                <input type="text" name="email" class="email" id="reviewTitle" placeholder="리뷰 제목을 입력해 주세요" >
                <span class="msg_box">${errorMsg.email }</span>
            </div>

            <div class="input_aera">
                <input type="text" class="password1" name="password" id="reviewContent" maxlength="20"  placeholder="리뷰 내용을 입력해 주세요">
            </div>

            <div class="input_aera">
                <input type="number" class="password2" maxlength="1" id="reviewScore" placeholder="별점을 입력해주세요(최대 5점)">
                <span class="msg_box">${errorMsg.password }</span>
            </div>

            <div class="input_aera">
                <div class="input-file">
                    <input type="text" readonly="readonly" class="file-name" />
                    <label for="reviewFile" class="file-label">사진 업로드</label>
                    <input type="file" name="" id="reviewFile" class="file-upload" />
                  </div>
            </div>

            <!-- <div class="input_aera">
                <input type="text" name="phone" value="" class="phone" id="userPhonenum" placeholder="전화번호를 010-1234-5678 형식으로 입력해 주세요" maxlength="20" >
                <span class="msg_box">${errorMsg.phone }</span>
            </div> -->

            <input value="리뷰작성" class="login_btn" onclick="insertReview();"/>
            <input value="돌아가기" class="login_btn" onclick="location.href='/store/detail/${storeIdn}'"/>
        </form>
    </div>

</main>
</body>
</html>
