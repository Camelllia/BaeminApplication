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

    formData.append("reviewTitle", XSSCheck(reviewTitle, 1));
    formData.append("reviewContent", XSSCheck(reviewContent, 1));
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

function maxScoreCheck(object) {
    if (object.value.length > object.maxLength){
        object.value = object.value.slice(0, object.maxLength);
    }
    if(object.value > 5) {
        object.value = 5;
    } else if(object.value < 0) {
        object.value = 0;
    }
}

var deleteReview = function(reviewIdn) {

    if(reviewIdn == "") {
        alert("미확인된 리뷰입니다.");
        location.href = location.href;
    }

    var param = {
        reviewIdn : reviewIdn
    }

    $.ajax({
        type:"POST",
        url:"/deleteReview",
        data:param,
        success:function(response) {

            const result = JSON.parse(response);

            if(result.resultCode == "1") {
                alert("삭제되었습니다.");
                location.href = location.href;
            } else if(result.resultCode == "-50"){
                alert("미확인된 리뷰입니다.");
                location.href = location.href;
            }
        },
        error:function (err) {
            alert("리뷰 삭제에 실패하였습니다.");
        }
    })
}

