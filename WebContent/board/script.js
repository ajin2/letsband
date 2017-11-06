/**
 * 			/board/script.js
 */

var loginpleaseerror = "로그인 후에 이용한 서비스 입니다. \n로그인 후 이용해주세요";
var nullerror = "회원이시면 로그인, 비회원이면 회원가입을 하신 후 이용해주세요.";
var foldererror = "다운받을 파일이 존재하지 않습니다. \n잠시 후 다시 시도해주세요.";
var delete_ok_error = "삭제가 완료되었습니다.";
var delete_no_error = "삭제에 실패했습니다. \n잠시 후 다시 시도하세요.";

var delete_sure = "정말 삭제하시겠습니까?";
var delete_content_ok = "삭제가 완료되었습니다.";
var delete_content_no = "삭제에 실패했습니다.\n잠시 후 다시 시도하세요.";

var subjecterror = "제목을 입력하세요";
var contenterror = "내용을 입력하세요";
var modifyerror = "글수정에 실패했습니다\n잠시 후 다시 시도하세요";

function erroralert(msg){
	alert(msg);
	history.back();
}

function gatherwritefocus() {
	gatherwriteform.subject.focus();
}

function gatherwritecheck() {
	if(!gatherwriteform.subject.value) {
		alert(subjecterror);
		gatherwriteform.subejct.focus();
		return false;
	} else if(!gatherwriteform.content.value) {
		alert(contenterror);
		gatherwriteform.content.focus();
		return false;
	}
}

function gathermodifyfocus() {
	gathermodifyform.subject.focus();
}

function gathermodifycheck() {
	if(!gathermodifyform.subject.value) {
		alert(subjecterror);
		gathermodifyform.subejct.focus();
		return false;
	} else if(!gathermodifyform.content.value) {
		alert(contenterror);
		gathermodifyform.content.focus();
		return false;
	}
}

function checkDelete() {
	var check = confirm(delete_sure);
	if(check == true) {
		return true;
	} else {
		return false;
	}
}