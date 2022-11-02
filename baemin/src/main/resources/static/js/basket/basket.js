var deleteBasket = function(basketIdn) {

    if(basketIdn == "") {
        alert("미확인된 상품입니다.");
        location.href = location.href;
    }

    var param = {
        basketIdn : basketIdn
    }

    $.ajax({
        type:"POST",
        url:"/deleteBasket",
        data:param,
        success:function(response) {

            const result = JSON.parse(response);

            if(result.resultCode == "1") {
                alert("삭제되었습니다.");
                location.href = location.href;
            } else if(result.resultCode == "-20"){
                alert("미확인된 상품입니다.");
                location.href = location.href;
            }
        },
        error:function (err) {
            alert("상품 삭제에 실패하였습니다.");
        }
    })
}