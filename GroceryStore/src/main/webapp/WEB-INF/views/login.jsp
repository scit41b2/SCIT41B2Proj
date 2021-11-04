<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="resources/Style.css">
<script src="resources/js/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	$('#submit').on('click',function(){
		if(logintovertify()) {
			$('#loginform').submit();
		} else {
			alert("필요한 부분을 입력해 주세요");
		}
	});
	$('#signup').on('click',function(){
		location.href='signup';
	});
	$('#id').on('keyup',loginidvertify);
	$('#pw').on('keyup',loginpwvertify);
});

function loginidvertify(){
	let id = $('#id').val().trim();
	if(id==''){
		$('#id_ver_exp').html('아이디를 입력해주세요');
		highlight_on('#input_id_box');
	} else {
		$('#id_ver_exp').html('&nbsp;');
		highlight_off('#input_id_box');
	}
}

function loginpwvertify(){
	let pw = $('#pw').val().trim();
	if(pw==''){
		$('#pw_ver_exp').html('비밀번호를 입력해주세요');
		highlight_on('#input_pw_box');
	} else {
		$('#pw_ver_exp').html('&nbsp;');
		highlight_off('#input_pw_box');
	}
}

function logintovertify(){
	let id = $('#id').val().trim();
	if(id==''){
		$('#id_ver_exp').html('아이디를 입력해주세요');
		highlight_on('#input_id_box');
		return false;
	}
	
	let pw = $('#pw').val().trim();
	if(pw==''){
		$('#pw_ver_exp').html('비밀번호를 입력해주세요');
		highlight_on('#input_pw_box');
		return false;
	}
	
	return true;
}

function highlight_on(boxid){
	$(boxid).css({
		"box-shadow" : "inset 5px 5px 13px #FE5454,inset -5px -5px 13px #ffffff"
	});
}

function highlight_off(boxid){
	$(boxid).css({
		"box-shadow" : "inset 5px 5px 13px #bebebe,inset -5px -5px 13px #ffffff"
	});
}
</script>
</head>
<body>
    <div class="wrapper">
        <div class="main_box">
            <div class="login_intro">
                로그인
            </div>
            <form id="loginform" method="post" action="login" autocomplete="off">
            <div class="login_input_box">
                <p class="input_exp">아이디</p>
                <div class="input_type_box" id="input_id_box">
                    <input class="input_type" type="text" id="id" name="acc_id"><br>
                </div>
                <p class="input_exp input_ver_exp" id="id_ver_exp">&nbsp;</p>
                <p class="input_exp">비밀번호</p>
                <div class="input_type_box" id="input_pw_box">
                    <input class="input_type" type="password" id="pw" name="acc_pw"><br>
                </div>
                <p class="input_exp input_ver_exp" id="pw_ver_exp">&nbsp;</p>
            </div>
            <p class="input_exp input_ver_exp">${message}</p>
            <div class="button" id="submit">
                로그인
            </div>
            <hr>
            <div class="button" id="signup">
                회원가입
            </div>
            </form>
        </div>
        <div class="end"></div>
    </div>
</body>
</html>