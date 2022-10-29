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
    
    var createStore = function() {

        var storeName = $("#storeName").val();
        var storeAddress = $("#storeAddress").val();
        var storePhonenum = $("#storePhonenum").val();
        var storeIntro = $("#storeIntro").val();
        var deleveryTime = $("#deleveryTime").val();
        var deleveryTip = $("#deleveryTip").val();
        var minDelevery = $("#minDelevery").val();
        var categoryNum = $("#categoryState option:selected").val();
        var imgFile = $("#imgFile")[0].files[0];

        
        if(storeName == "" || storeAddress == "" || storePhonenum == "" || storeIntro == "" || deleveryTime == "" || deleveryTip == "" || minDelevery == "" || categoryNum == "") {
            alert("입력되지 않은 내용이 있습니다.");
            return;
        }

        if(imgFile == undefined) {
            alert("매장 사진을 등록해주세요");
            return;
        }

        var formData = new FormData();

        formData.append("storeName", storeName);
        formData.append("storeAddress", storeAddress);
        formData.append("storePhonenum", storePhonenum);
        formData.append("storeIntro", storeIntro);
        formData.append("deleveryTime", deleveryTime);
        formData.append("deleveryTip", deleveryTip);
        formData.append("minDelevery", minDelevery);
        formData.append("categoryNum", categoryNum);
        formData.append("imgFile", imgFile);
        formData.append("fileName", imgFile.name);
        
        $.ajax({
            type:"POST",
            url:"/createStore",
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
                alert("매장 등록에 실패하였습니다.");
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
        <a href="/"><img src="/img/bamin2.png" alt="이미지" class="bm_img"></a>
        <form id="reviewForm" enctype="multipart/form-data" name="reviewForm">
            <input type="hidden" id="storeIdn" value="${storeIdn}"/>

            <h2>배달의 민족 매장등록</h2>

            <form id="reviewForm" enctype="multipart/form-data" name="reviewForm">
                <div class="input_aera">
                    <input type="text" name="email" class="email" id="storeName" placeholder="매장명을 입력해 주세요" >
                </div>
    
                <div class="input_aera">
                    <input type="text" class="password1" name="password" id="storeAddress" placeholder="매장주소를 입력해 주세요">
                </div>
    
                <div class="input_aera">
                    <input type="text" name="email" class="email" id="storePhonenum" placeholder="매장번호를 입력해 주세요" >
                </div>
    
                <div class="input_aera">
                    <input type="text" name="email" class="email" id="storeIntro" placeholder="매장소개를 입력해 주세요" >
                </div>
    
                <div class="input_aera">
                    <input type="number" name="email" class="email" id="minDelevery" placeholder="최소주문금액을 입력해 주세요" >
                </div>
    
                <div class="input_aera">
                    <input type="number" class="password1" name="password" id="deleveryTip" placeholder="배달팁을 입력해 주세요">
                </div>
    
                <div class="input_aera">
                    <input type="number" class="password1" name="password" id="deleveryTime" placeholder="예상배달시간을 입력해 주세요">
                </div>
    
                <div class="input_aera">
                    <input type="text" class="password2" maxlength="20" id="selectCategoryName" placeholder="카테고리를 선택해주세요" disabled>
                    <select name="category" id="categoryState" class="pl" onchange="selectCategory()">
                        <option value="0" selected>선택</option>
                        <option value="100" >피자</option>
                        <option value="101" >치킨</option>
                        <option value="102" >패스트푸드</option>
                        <option value="103" >분식</option>
                        <option value="104" >카페/디저트</option>
                    </select>
                </div>
    
                <div class="input_aera">
                    <div class="input-file">
                        <input type="text" readonly="readonly" class="file-name" id="file-name"/>
                        <input type="file" name="imgFile" id="imgFile" class="file-upload" />
                        <label for="imgFile" class="file-label" id="imgFileLabel">사진 업로드</label>
                      </div>
                </div>
            </form>

            <input value="매장등록" class="login_btn" onclick="createStore()" style="text-align: center;">
            <input value="돌아가기" class="login_btn" onclick="location.href='/myPage'" style="text-align: center;">
        </form>
    </div>

</main>
</body>
</html>
