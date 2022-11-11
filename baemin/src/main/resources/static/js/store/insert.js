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
                location.href = "/category";
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
