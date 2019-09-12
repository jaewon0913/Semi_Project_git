
function idchk(){
	var doc = document.getElementsByName("id_chk")[0];
	
	if(doc.value.trim() == "" || doc.value == null){
		alert("아이디를 입력해 주세요");
	} else {
		open("member.do?command=idchk&id="+doc.value,"","width=200,height=200");
	}
}

function idchkconfirm(){
	var chk = document.getElementsByName("id_chk")[0].title;
	
	if(chk == "n"){
		alert("아이디 중복체크를 먼저 해주세요");
		$("#text")[0].focus();
	}
}
function passwordlengthchk(){
	var pw_1 = $("#text2").val();
	if(pw_1.length < 6){
		alert("비밀번호 (영문, 숫자 포함 6글자 이상 입력해주세요!");
		var input_pw_1 = document.getElementsByName("pw")[0];
		input_pw_1.value = "";
		$("#text2")[0].focus();
	}
}

function passwordchk(){
	var pw_1 = $("#text2").val();
	var pw_2 = $("#text3").val();
	
	if(pw_1 != pw_2){
		alert("비밀번호가 서로 다릅니다. 다시 입력해주세요.");
		var input_pw_1 = document.getElementsByName("pw")[0];
		var input_pw_2 = document.getElementsByName("pw_chk")[0];
		input_pw_1.value = "";
		input_pw_2.value = "";
		$("#text2")[0].focus();
	}
}
function chk() {
	var fm  = document.new_member;
	if (!fm['agree_chk_new'].checked) {
		alert('약관과 개인정보 보호정책에 모두 동의 해 주셔야 회원가입이 정상적으로 이루어집니다');
        return;
    } else {
       fm.submit();
    }
}