/**
 * 회원관리
 */

var iderror = "아이디를 입력하세요.";
var confirmerror = "중복확인을 하지 않았습니다.";
var passwderror = "비밀번호를 입력하세요.";
var repasswderror = "비밀번호가 다릅니다.";
var nameerror = "이름을 입력하세요.";
var juminerror = "주민등록번호를 입력하세요.";
var telerror = "전화번호를 입력하세요.";
var emailerror = "이메일이 형식에 맞지 않습니다.";
var emailnoerror = "이메일을 입력하세요.";
var zipcodeerror = "우편번호를 입력하세요.";
var adderror = "주소를 입력하세요.";
var ziperror = "읍/면/동 을 입력하세요.";
var emailconfirm_false = "이메일 인증을 해주세요.";
var senderror = "이메일이 전송되었습니다.";

var inputerror = "회원가입에 실패했습니다. \n잠시 후 다시시도하세요.";
var loginiderror = "입력하신 아이디가 없습니다.";
var loginpasserror = "입력하신 비밀번호가 다릅니다.";
var deleteerror = "회원탈퇴에 실패했습니다. \n잠시 후 다시시도하세요.";
var emailconfirmerror = "인증번호가 일치하지 않습니다.";
var emailconfirm = "인증에 성공했습니다.";
var finderror = "아이디 / 비밀번호 찾기에 실패했습니다. \n잠시 후 다시시도하세요.";
var delete_ok_error = "회원탈퇴가 성공적으로 완료되었습니다. \n계속하시려면 확인을 눌러주세요. \n취소버튼을 누르면 메인으로 이동합니다.";
var deleteconfirm = "회원을 탈퇴하시겠습니까?";
var returnValue = "false";


function erroralert(msg){
	alert(msg);
	history.back();
}

////////////////////////////////////////////////////////////////////////////// 중복확인 
function confirmid() {
	if(!inputform.id.value) {
		alert(iderror);
		return;
	}
	var url = "Band_Logon_confirmId.do?id=" + inputform.id.value;
	open(url, "confirm", "scrollbars=no, menubar=no, status=no, width=600px, height=400px");
}

function confirmfocus(){
	confirmform.id.focus();
}

function confirmcheck(){
	if(!confirmform.id.value){
		alert(iderror);
		return false;
	}
}

function setid(id){
	opener.document.inputform.id.value = id;	// open 을 사용해서 연 창
	window.close();		// 자기 자신
	opener.document.inputform.passwd.focus();
	opener.document.inputform.confirm.value = "1";
}


//////////////////////////////////////////////////////////////////////////////우편번호 검색

function sample2_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
        	var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { 
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R'){
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            document.getElementById('sample2_postcode').value = data.zonecode; 
            document.getElementById('sample2_address').value = fullAddr;

            element_layer.style.display = 'none';
        },
        width : '100%',
        height : '100%',
        maxSuggestItems : 5
    }).embed(element_layer);

    element_layer.style.display = 'block';

    initLayerPosition();
}

function initLayerPosition(){
    var width = 300; //우편번호서비스가 들어갈 element의 width
    var height = 400; //우편번호서비스가 들어갈 element의 height
    var borderWidth = 5; //샘플에서 사용하는 border의 두께

    element_layer.style.width = width + 'px';
    element_layer.style.height = height + 'px';
    element_layer.style.border = borderWidth + 'px solid';
    element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
    element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
}

function closeDaumPostcode() {
    // iframe을 넣은 element를 안보이게 한다.
    element_layer.style.display = 'none';
}

////////////////////////////////////////////////////////////////////////////// 회원수정
function viewfocus(){
	// passwd 란에 포커스
	viewform.passwd.focus();
}

function viewcheck(viewemail1, viewemail2){
	// passwd 란에 값이 없으면 경고
	if(!viewform.passwd.value || !viewform.repasswd.value){
		alert(passwderror);
		viewform.passwd.focus();
		return false;
	}
	// passwd repasswd 다르면 경고
	else if(viewform.passwd.value != viewform.repasswd.value){
		alert(repasswderror);
		viewform.passwd.focus();
		return false;
	}
	// 이메일 란은 두 칸 모두 @가 있으면 경고
	if(!viewform.email1.value || !viewform.email2.value){
		alert(emailerror);
		viewform.email1.focus();
		return false;
	}
	if((viewform.email1.value != viewemail1) || (viewform.email2.value != viewemail2)){
		if(viewform.emailconfirm_value.value == "1"){
			return true;
		}
		viewform.emailconfirm_value.value == "0";
		alert(emailconfirm_false);
		viewform.email1.focus();
		return false;
	}
	if(viewform.emailconfirm_value.value == "0"){
		alert(emailconfirm_false);
		viewform.email1.focus();
		return false;
	}
	if(viewform.email1.value.indexOf("@") != -1 || viewform.email2.value.indexOf("@") != -1){
		alert(emailerror);
		viewform.email1.focus();
		return false;
	}
}

////////////////////////////////////////////////////////////////////////////////// 이메일
function emailcheck(email1, email2, emailvalue){
	if(!inputform.email1.value){
		alert(emailerror);
		inputform.email1.focus();
		return false;
	} 
	if(!inputform.email1.value || !inputform.email2.value){ 
		alert(emailerror);
		inputform.email1.focus();
		return;
	} if(inputform.email1.value){
			if(inputform.email2.value==0){
				// 직접입력
				if(inputform.email1.value.indexOf("@")==-1){
					alert(emailerror);
					inputform.email1.focus();
					return false;
				}
			}else{
				// 선택입력
				if(inputform.email1.value.indexOf("@")!=-1){
					alert(emailerror);
					inputform.email1.focus();
					return false;
				}
			}
		}
    // 인증을 위해 새창으로 이동
	var url="Band_Logon_emailcheck.do?email1="+email1+"&email2="+email2+"&emailvalue="+emailvalue;
	open(url,"emailwindow", "statusbar=no, scrollbar=no, menubar=no, width=600, height=400" );
}

function confirmemail(emailconfirm_value, authNum, emailvalue){
    // 입력한 값이 없거나, 인증코드가 일지하지 않을 경우
	if(!emailconfirm_value || emailconfirm_value != authNum){
		alert(emailconfirmerror);
		emailconfirm_value="";
		self.close();
    // 인증코드가 일치하는 경우
	}else if(emailconfirm_value==authNum){
		alert(emailconfirm);
		emailconfirm_value="";
		self.close();
		if(emailvalue == "0"){
			opener.document.inputform.emailconfirm_value.value = "1";
		} else if(emailvalue == "1"){
			opener.document.viewform.emailconfirm_value.value = "1";
		}
	}
}

////////////////////////////////////////////////////////////////////////////////// 메인
function mainfocus(){
	mainform.id.focus();
}
 
//
function maincheck(){
	if(!mainform.id.value){	// 값이 없냐
		alert(iderror);
		mainform.id.focus();
		return false;
	} else if(!mainform.passwd.value){
		alert(passwderror);
		mainform.passwd.focus();
		return false;
	}
}
///////////////////////////////////////////////////////////////////////////////// 아이디 비밀번호 찾기
function findfocus(){
	findform.name.focus();
}

function findpfocus(){
	findform.id.focus();
}
 

function findcheck(){
	if(!findform.name.value){	// 값이 없냐
		alert(nameerror);
		findform.name.focus();
		return false;
	} else if(!findform.email.value){
		alert(emailnoerror);
		findform.email.focus();
		return false;
	}
}

function findpcheck(){
	if(!findform.name.value){	// 값이 없냐
		alert(nameerror);
		findform.name.focus();
		return false;
	} else if(!findform.email.value){
		alert(emailnoerror);
		findform.email.focus();
		return false;
	} else if(!findform.id.value){
		alert(iderror);
		findform.id.focus();
		return false;
	}
}

function findpasswdcheck(){
	if(!findform.passwd.value){
		alert(passwderror);
		findform.passwd.focus();
		return false;
	} else if(!findform.repasswd.value){
		alert(passwderror);
		findform.repasswd.focus();
		return false;
	} else if(findform.passwd.value != findform.repasswd.value){
		alert(repasswderror);
		findform.repasswd.focus();
		return false;
	}
}

///////////////////////////////////////////////////////////////////////////////// 회원가입
function inputfocus(){
	inputform.id.focus();
}

// 아이디 비밀번호 이름 주민1 주민2는 not null이다
// passwd와 repasswd는 같아야 한다.
function inputcheck(){
	if(inputform.confirm.value == "0"){
		alert(confirmerror);
		inputform.id.focus();
		return false;
	}if(inputform.emailconfirm_value.value == "0"){
		alert(emailconfirm_false);
		inputform.email1.focus();
		return false;
	} else if(!inputform.id.value){	// 값이 없냐
		alert(iderror);
		inputform.id.focus();
		return false;
	} else if(!inputform.passwd.value){
		alert(passwderror);
		inputform.passwd.focus();
		return false;
	} else if(!inputform.repasswd.value){
		alert(passwderror);
		inputform.repasswd.focus();
		return false;
	} else if(inputform.passwd.value != inputform.repasswd.value){
		alert(repasswderror);
		inputform.repasswd.focus();
		return false;
	} else if(!inputform.name.value){
		alert(nameerror);
		inputform.name.focus();
		return false;
	} else if(!inputform.email1.value){
		alert(emailerror);
		inputform.email1.focus();
		return false;
	} 
	if(!inputform.email1.value || !inputform.email2.value){ 
		alert(emailerror);
		inputform.email1.focus();
		return;
	} if(inputform.email1.value){
			if(inputform.email2.value==0){
				// 직접입력
				if(inputform.email1.value.indexOf("@")==-1){
					alert(emailerror);
					inputform.email1.focus();
					return false;
				}
			}else{
				// 선택입력
				if(inputform.email1.value.indexOf("@")!=-1){
					alert(emailerror);
					inputform.email1.focus();
					return false;
				}
			}
		}
	
	if(!inputform.postcode.value){
		alert(zipcodeerror);
		inputform.postcode.focus();
		return false;
	} else if(!inputform.address.value){
		alert(adderror);
		inputform.address.focus();
		return false;
	} 
}

//////////////////////////////////////////////////////////////////////////////// 회원탈퇴
function passwdfocus(){
	passwdform.passwd.focus();
}


function passwdcheck(){
	if(!passwdform.passwd.value){
		alert(passwderror);
		passwdform.passwd.focus();
		return false;
	}
}


/////////////////////////////////////////////////////////////////////////////// key
function nextjumin2(){
	if(inputform.jumin1.value.length == 6){
		inputform.jumin2.focus();
	}
}

function nexttel1(){
	if(inputform.jumin2.value.length == 7){
		inputform.tel1.focus();
	}
}

function nexttel2(){
	if(inputform.tel1.value.length == 3){
		inputform.tel2.focus();
	}
}

function nexttel3(){
	if(inputform.tel2.value.length == 4){
		inputform.tel3.focus();
	}
}

function nextemail1(){
	if(inputform.tel3.value.length == 4){
		inputform.email1.focus();
	}
}
//////////////////////////////////////////////////////////////
function vnexttel2(){
	if(viewform.tel1.value.length == 3){
		viewform.tel2.focus();
	}
}
function vnexttel3(){
	if(viewform.tel2.value.length == 4){
		viewform.tel3.focus();
	}
}
function vnextemail1(){
	if(viewform.tel3.value.length == 4){
		viewform.email1.focus();
	}
}


