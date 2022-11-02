var insertBasket = function(index) {
	var storeIdn = $("#storeIdn").val();
	var menuName = $("#menuName"+index).html();
	var menuPrice = $("#menuPrice"+index).val();

	var param = {
		menuName : menuName,
		menuPrice : menuPrice,
		storeIdn : storeIdn
	}

	if(menuName == '' || menuPrice == '' || storeIdn == '') {
		alert("정보가 유효하지 않습니다.");
		return;
	}

	$.ajax({
		type:"POST",
		url:"/insertBasket",
		data:param,
		success:function(response) {

			const result = JSON.parse(response);

			if(result.resultCode == "1") {
				alert("상품을 담았습니다.");
			} else if(result.resultCode == "-10"){
				alert("정보가 유효하지 않습니다.");
				return;
			}
		},
		error:function (err) {
			alert("장바구니 담기에 실패하였습니다.");
		}
	})
}