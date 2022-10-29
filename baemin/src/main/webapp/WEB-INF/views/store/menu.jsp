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
    
    var createMenu = function() {

        var menuName = $("#menuName").val();
        var menuPrice = $("#menuPrice").val();
        var storeIdn = $("#storeIdn").val();
        var imgFile = $("#imgFile")[0].files[0];
        
        if(menuName == "" || menuPrice == "") {
            alert("입력되지 않은 내용이 있습니다.");
            return;
        }

        if(imgFile == undefined) {
            alert("메뉴 사진을 등록해주세요");
            return;
        }

        var formData = new FormData();

        formData.append("menuName", menuName);
        formData.append("menuPrice", menuPrice);
        formData.append("storeIdn", storeIdn);
        formData.append("imgFile", imgFile);
        formData.append("fileName", imgFile.name);
        
        $.ajax({
            type:"POST",
            url:"/createMenu",
            data:formData,
            contentType : false,
            processData : false,
            success:function(response) {

                const result = JSON.parse(response);

                if(result.resultCode == "1") {
                    alert("정상적으로 등록되었습니다.");
                    location.href = location.href;
                } else if(result.resultCode == "-20") {
                    alert("입력되지 않은 내용이 있습니다.");
                } else if(result.resultCode == "-30") {
                    alert("사진은 PNG 형식으로 등록해주세요.");
                }
            },
            error:function (err) {
                console.log(err);
                alert("메뉴 등록에 실패하였습니다.");
            }
        })
    }

    var selectCategory = function() {
        var categoryState = $("#categoryState option:selected").text();
        if(categoryState == '선택') {
            $("#selectCategoryName").val("카테고리를 선택해주세요");    
        } else {
            $("#selectCategoryName").val(categoryState);
        }
    }
</script>
<link rel="stylesheet" href="/css/review/input.css">
<link rel="stylesheet" href="/css/user/login.css">
<link rel="stylesheet" href="/css/order/select.css">
</head>
<body>
<main>
    <div class="login_box">
        <a href="#"><img src="/img/bamin2.png" alt="이미지" class="bm_img"></a>
        <form id="reviewForm" enctype="multipart/form-data" name="reviewForm">
            <input type="hidden" id="storeIdn" value="${storeInfo.storeIdn}"/>

            <h2>배달의 민족 메뉴등록</h2>
            <h2>- ${storeInfo.storeName} -</h2>

            <form id="reviewForm" enctype="multipart/form-data" name="reviewForm">
                <div class="input_aera">
                    <input type="text" name="email" class="email" id="menuName" placeholder="메뉴명을 입력해 주세요" >
                </div>
    
                <div class="input_aera">
                    <input type="number" class="password1" name="password" id="menuPrice" placeholder="가격을 입력해 주세요">
                </div>
    
                <div class="input_aera">
                    <div class="input-file">
                        <input type="text" readonly="readonly" class="file-name" id="file-name"/>
                        <input type="file" name="imgFile" id="imgFile" class="file-upload" />
                        <label for="imgFile" class="file-label" id="imgFileLabel">사진 업로드</label>
                      </div>
                </div>
            </form>

            <input value="메뉴등록" class="login_btn" onclick="createMenu()" style="text-align: center;">
            <input value="돌아가기" class="login_btn" onclick="location.href='/category'" style="text-align: center;">
        </form>
    </div>

</main>
</body>
</html>
