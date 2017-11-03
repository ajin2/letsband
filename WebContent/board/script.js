/**
 * 
 */

var loginpleaseerror = "로그인 후에 이용한 서비스 입니다. \n로그인 후 이용해주세요";
var nullerror = "회원이시면 로그인, 비회원이면 회원가입을 하신 후 이용해주세요.";
var foldererror = "다운받을 파일이 존재하지 않습니다. \n잠시 후 다시 시도해주세요.";

function erroralert(msg){
	alert(msg);
	history.back();
}

function gatherwritefocus() {
	gatherwriteform.subject.focus();
}