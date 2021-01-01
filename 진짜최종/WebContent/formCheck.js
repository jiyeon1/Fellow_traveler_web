/**
 * 아이디와 비밀번호가 입력되었는지 체크
 */

function loginCheck(obj){
	if(!obj.id.value || obj.id.value.trim().length==0){
		alert("아이디를 입력해 주세요!");
		obj.id.value = "";
		obj.id.focus();
		return false;
	}
	if(!obj.password.value || obj.password.trim().length==0){
		alert("비밀번호를 입력해 주세요!");
		obj.password.value="";
		obj.password.focus();
		return false;
	}
	return true;
}

function joinCheck(obj){
	if(!obj.id.value || obj.id.value.trim().length == 0){
		alert("아이디가 입력되지 않았습니다.");
		obj.id.value = "";
		obj.id.focus();
		return false;
	}
	if(!obj.password.value || obj.password.value.trim().length == 0){
		alert("비밀번호가 입력되지 않았습니다.");
		obj.password.value = "";
		obj.password.focus();
		return false;
	}
	if(!obj.name.value || obj.name.value.trim().length == 0){
		alert("이름이 입력되지 않았습니다.");
		obj.name.value = "";
		obj.name.focus();
		return false;
	}
	if(!obj.std.value || obj.std.value.trim().length == 0){
		alert("학번이 입력되지 않았습니다.");
		obj.std.value = "";
		obj.std.focus();
		return false;
	}
}