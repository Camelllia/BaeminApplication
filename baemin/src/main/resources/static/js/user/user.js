$(".updating").click(function () {
    swal("업데이트 준비 중 입니다");
})

$("#logoutBtn").click(function () {
    location.href = "/logout";
})

var ready = function() {
    alert("준비중입니다.");
}

var logout = function() {
    location.href = "/logout";
}

var login = function() {

    var userEmail = $("#userEmail").val();
    var userPw = $("#userPw").val();

    if($("#save_email").is(":checked")) {
        setCookie("saved_email", userEmail);
    } else {
        deleteCookie("saved_email");
    }

    if(userEmail == '') {
        alert("이메일을 입력해주세요.");
        return;
    }

    if(userPw == '') {
        alert("비밀번호를 입력해주세요.");
        return;
    }

    var param = {
        userEmail : userEmail,
        userPw : userPw,
    }

    $.ajax({
        type:"POST",
        url:"/login",
        data:param,
        success:function(response) {

            const result = JSON.parse(response);

            if(result.resultCode == "1") {
                location.href = "/category";
            } else if(result.resultCode == "-50"){
                alert("이메일과 비밀번호를 확인해주세요.");
                return;
            }
        },
        error:function (err) {
            alert("로그인에 실패하였습니다.");
        }
    })
}

var join = function() {

    var userEmail = $("#userEmail").val();
    var userPw = $("#userPw").val();
    var userPwCheck = $("#userPwCheck").val();
    var userNickname = $("#userNickname").val();
    var userPhonenum = $("#userPhonenum").val();

    if(userEmail == '') {
        alert("이메일을 입력해주세요.");
        return;
    }

    if(userPw == '') {
        alert("비밀번호를 입력해주세요.");
        return;
    }

    if(userNickname == '') {
        alert("닉네임을 입력해주세요.");
        return;
    }

    if(userPhonenum == '') {
        alert("전화번호를 입력해주세요.");
        return;
    }

    if(userPw !== userPwCheck) {
        alert("비밀번호가 일치하지 않습니다.");
        return;
    }

    var param = {
        userEmail : userEmail,
        userPw : userPw,
        userPwCheck : userPwCheck,
        userNickname : userNickname,
        userPhonenum : userPhonenum
    }

    $.ajax({
        type:"POST",
        url:"/createAccount",
        data:param,
        success:function(response) {

            const result = JSON.parse(response);

            if(result.resultCode == "1") {
                alert("정상적으로 가입되었습니다.");
                location.href = "/";
            } else if(result.resultCode == "-10"){
                alert("유효하지 않은 이메일입니다.");
                return;
            }
            else if(result.resultCode == "-20"){
                alert("비밀번호가 일치하지 않습니다.");
                return;
            }
            else if(result.resultCode == "-30"){
                alert("동일한 이메일로 가입된 계정이 존재합니다.");
                return;
            }
            else if(result.resultCode == "-40"){
                alert("유효하지 않은 전화번호 형식입니다.");
                return;
            }
        },
        error:function (err) {
            alert("회원가입에 실패하였습니다.");
        }
    })
}

var cancel = function() {
    location.href = '/';
}