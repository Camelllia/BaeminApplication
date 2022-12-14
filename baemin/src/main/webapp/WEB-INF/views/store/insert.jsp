<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/link.jsp" %>

<script type="text/javascript" src="/js/store/insert.js"></script>
<script type="text/javascript" src="/js/util/XSSCheck.js"></script>
<script type="text/javascript">

    $(document).ready(function() {
        $("#imgFile, #imgFileLabel").change(function() {
        var imgFile = $("#imgFile")[0].files[0];
        
        $("#file-name").val(imgFile.name);
        });
    }); 
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
            <input value="돌아가기" class="login_btn" onclick="location.href='/category'" style="text-align: center;">
        </form>
    </div>

</main>
</body>
</html>
