<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<script type="text/JavaScript">


$(document).ready(function(){
	//초기값
	EasyDropDownInit();

});
/**
 * 숫자만 입력
 * EX) 해당 inputBox의 onkeydown CallBack으로 등록
 * onkeydown="return $.onlyNumber();"
 * @returns boolean
 */
function onlyNumber() {
		if(window.event.shiftKey){
			return false;
		}
		 if ((window.event.keyCode == 8) || (window.event.keyCode == 9) || (window.event.keyCode == 46)) { //백스페이스키와  tab, del키는 먹게한다.
	      window.event.returnValue=true;
		 } else if ((window.event.keyCode >= 96) && (window.event.keyCode <= 105)) { //숫자패드는 먹게 한다.
		 		window.event.returnValue=true;
	   } else if( (window.event.keyCode<48) || (window.event.keyCode>57) ) {
	      window.event.returnValue=false;
	  }
	}

function checkEmail(email) {
   var arrMatch = email.match(/^(\".*\"|[A-Za-z0-9_-]([A-Za-z0-9_-]|[\+\.])*)@(\[\d{1,3}(\.\d{1,3}){3}]|[A-Za-z0-9][A-Za-z0-9_-]*(\.[A-Za-z0-9][A-Za-z0-9_-]*)+)$/);
         if (arrMatch == null) {
              return false;
         }
             var arrIP = arrMatch[2].match(/^\[(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})\]$/);
         if (arrIP != null) {
                  for (var i = 1; i <= 4; i++) {
                            if (arrIP[i] > 255) {
                                 return false;
                            }
                  }
          }
          return true;
}

function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}


function OpenCheckIDWindow()
{
	var userid = UserInfoForm.memberId.value;
    var check = /^([a-zA-z]){1}([0-9a-zA-Z])+$/; /*문자,숫자만 조합*/

    if (userid.length < 4 || userid.length > 12) {
        alert("아이디는 4자이상 12자이하로 입력해주세요.");
		document.UserInfoForm.memberId.focus();작
        return;
    }
    if (!check.test(userid)) {
		alert("아이디는 첫글자는 영문으로 시작 후 \n영문,숫자 조합으로 4자이상 12자이하로 입력해주세요.");
		document.UserInfoForm.memberId.focus();
        return;
    }

	var win=window.open('/member/tobe_mem_ok_pop.asp?memberid='+document.UserInfoForm.memberId.value,'CheckIDWin','width=390,height=200, resizable=0, scrollbars=no');
	win.focus();
}
function isDate (value)
{
	return ( !isNaN (new Date(value).getYear())) ;
}

function memsend(form) {
	if(form.m_name.value=="") {alert("이름을 입력해주세요.");form.m_name.focus();return;}
	//if(!checkSpecialChar(form.m_name.value)) {alert("특수문자는 입력 할수 없습니다.");form.m_name.focus();return;}
	if(form.m_birth.value=="") {alert("생년월일을 입력해주세요.");form.m_birth.focus();return;}
	if(isDate(form.m_birth.value)) {alert("올바른 생년월일을 입력해주세요.");form.m_birth.focus();return;}
	if(0 <= form.memberId.value.length && form.memberId.value.length < 4) {alert("\n사용자 ID를 4자 이상 입력해 주시기 바랍니다.");form.memberId.focus();return;}
	if(0 <= form.m_pw.value.length && form.m_pw.value.length < 4) {alert("\n비밀 번호를 4자 이상 입력해 주세요.");form.m_pw.focus();return;}
	if(0 <= form.m_pwre.value.length && form.m_pwre.value.length < 4) {alert("\n확인 비밀번호를 4자 이상 입력해 주세요.");form.m_pwre.focus();return;}
	if(form.m_pw.value != form.m_pwre.value) {alert("\n비밀번호와 확인 비밀번호가 틀립니다. 정확히 입력해 주세요.");form.m_pw.focus();return;}
	if(form.m_email.value=="") {alert("\nemail을 입력해 주세요.");form.m_email.focus();return;}
	if(!checkEmail(form.m_email.value)){alert("\nemail 형식이 틀렸습니다.");form.m_email.focus();return;}

	/* 2014-10-10 YTEom : 요청으로 인해 삭제
	if( (form.m_tel1.value!="" && (form.m_tel2.value=="" || form.m_tel3.value=="")) || (form.m_tel2.value!="" && (form.m_tel1.value=="" || form.m_tel3.value=="")) || (form.m_tel3.value!="" && (form.m_tel1.value=="" || form.m_tel2.value=="")) ) {
		alert("\n전화번호를 정확히 입력해 주세요.");form.m_tel1.focus();return;
	}
	*/

	/* 2015-05-12 YTEom : 요청으로 인해 삭제
	if(form.isAuthPhone.value != "Y") {
		alert("휴대폰 인증을 진행해 주세요.");
		return;
	}
	*/
	if(form.m_celcom.value=="" || form.m_cel1.value=="" || form.m_cel2.value=="" || form.m_cel3.value=="") {
		alert("\n휴대폰 번호를 입력해 주세요.");form.m_cel1.focus();return;
	}



  /* 2014-10-10 YTEom : 요청으로 인해 삭제
	if(form.m_post1.value=="" || form.m_post2.value=="" || form.m_addr1.value=="") {
		alert("\n우편번호와 기본주소를 입력해 주세요.");
		return;
	}
	if(form.m_addr2.value=="") {alert("\n상세주소를 입력해 주세요.");form.m_addr2.focus();return;}
  */
    if (form.news_check.checked == true) { form.news_check.value = 1; }
    else { form.news_check.value = 0; }
	form.submit();
}

/**
 *  특수문자 체크(공백 허용) 수정 - onewool2
 * @param str : 문자열
 * @returns {Boolean}
 */
/*function checkSpecialChar(val) {
	var chkChr1 = /[^a-zA-Z0-9가-ㅤㅎㅣㅎㄱ-ㅎ\s]/g;
	if(val.search(chkChr1) == -1) {
		return true;
	} else {
		return false;
	}
}*/

function findzip(url){
   var URL = url
   var opt = "width=390,height=400,marginwidth=0,marginheight=0,resizable=0,scrollbars=no";
   var name = "zip";
   window.open(URL,name,opt);
}

 function chkA1(mname){
   var opt = "width=320,height=180,marginwidth=0,marginheight=0,resizable=0,scrollbars=no";
   var name = "A1";
   window.open("/member/a1card.asp?m_name="+mname,name,opt);
}

</script>
<script type="text/javascript">
	/*=========================================================================
	  Title    : 핸드폰 인증
	  Author   : YTEom
	  RegDate  : 2014-10-30
	=========================================================================*/
	var AuthPhone = {
		/**
		 * @Title	: 인증번호 전송
		 */
		send : function() {
			var args = arguments;
			var $frmInfo = $("#UserInfoForm");
			var $frmAuth = $("#AuthPhoneForm");

			var celcom	= $("[name=m_celcom]",$frmInfo).val();
			var cel1	= $("[name=m_cel1]",$frmInfo).val();
			var cel2	= $("[name=m_cel2]",$frmInfo).val();
			var cel3	= $("[name=m_cel3]",$frmInfo).val();

			if (celcom == "") { alert("통신사를 선택해 주세요"); $("[name=m_celcom]",$frmInfo).focus(); return };
			if (cel1 == "") { alert("휴대폰 번호를 입력해 주세요"); $("[name=m_cel1]",$frmInfo).focus(); return };
			if (cel2 == "") { alert("휴대폰 번호를 입력해 주세요"); $("[name=m_cel2]",$frmInfo).focus(); return };
			if (cel3 == "") { alert("휴대폰 번호를 입력해 주세요"); $("[name=m_cel3]",$frmInfo).focus(); return };


			$.ajax({
				url: '/common/authphone_ajax_do.asp',
				type: 'POST',
				dataType: 'json',
				data: {cmd: 'send', m_celcom: celcom, m_cel1: cel1, m_cel2: cel2, m_cel3: cel3},
				error: function(xhr, textStatus, errorThrown) {
					console.log("code : " + xhr.status);
				},
				success: function(data, textStatus, xhr) {
					var errmsg = cel1+"-"+cel2+"-"+cel3 +" 으로 인증번호가 발송되었습니다. (통신사 사정에 따라 수신이 지연될 수 있습니다.)";

					if (data.errCheckCode != 0) {
						errmsg = data.errMsg;
						addclass = "off";
					} else {
						addclass = "on";
					}
					$("#auth_send_noti").html(errmsg).removeClass().addClass(addclass);
					$("#authphone_input").show();

					if (data.errCheckCode == 0) {
						$("#authphone_input .authcode").show();
					};

					$("[name=responsedata]", $frmAuth).val(data.responseSeq);
					$("[name=requestdata]", $frmAuth).val(data.requestSeq);
					$("[name=authNum]", $frmInfo).focus();
				}
			});
		},

		/**
		 * @Title	: 인증번호 확인
		 */
		confirm : function() {
			var args = arguments;
			var $frmInfo = $("#UserInfoForm");
			var $frmAuth = $("#AuthPhoneForm");

			$.ajax({
				url: '/common/authphone_ajax_do.asp',
				type: 'POST',
				dataType: 'json',
				data: $frmAuth.serialize(),
				error: function(xhr, textStatus, errorThrown) {
					console.log("code : " + xhr.status);
				},
				success: function(data, textStatus, xhr) {
					var addclass = "off";
					var result = "N";

					if (data.errCheckCode == 0 && data.returnCode == 0000) {
						addclass = "on";
						errmsg = data.errMsgRetCode;

						$("[name=isAuthPhone]",$frmInfo).val("Y");	// 인증 체크

						try	{
							$("[name=m_celcom]",$frmInfo).easyDropDown('disable');
							$("[name=m_cel1]",$frmInfo).easyDropDown('disable');
						} catch (e) {
							/**
							 * https 에서 모든 컨텐츠 표시를 하지 않을경우 easyDropDown 을 사용하지 않게되는 이슈
							 */
							$("[name=m_celcom]",$frmInfo).prop("disabled", true);
							$("[name=m_cel1]",$frmInfo).prop("disabled", true);
						}

						// 입력창 막기
						$("[name=m_cel2]",$frmInfo).prop("disabled", true);
						$("[name=m_cel3]",$frmInfo).prop("disabled", true);
						$("[name=authNum]",$frmInfo).prop("disabled", true);
						$("[name=authNum]+input[type=button]",$frmInfo).prop("disabled", true);

						// disabled 시 파라미터 값이 넘어가지 않으므로 별도의 hidden에 값 처리
						$("[name=m_celcom_confirm]",$frmInfo).val( $("[name=m_celcom]",$frmInfo).val() );
						$("[name=m_cel1_confirm]",$frmInfo).val( $("[name=m_cel1]",$frmInfo).val() );
						$("[name=m_cel2_confirm]",$frmInfo).val( $("[name=m_cel2]",$frmInfo).val() );
						$("[name=m_cel3_confirm]",$frmInfo).val( $("[name=m_cel3]",$frmInfo).val() );

					} else if (data.errCheckCode != 0) {
						errmsg = data.errMsg;
					} else if (data.returnCode != 0000) {
						errmsg = data.errMsgRetCode;
					}
					$("#auth_confirm_noti").html(errmsg).removeClass().addClass(addclass);
				}
			});
		},

		/**
		 * @Title	: 사용자 입력 인증번호를 전송 폼내의 인증번호와 동기화
		 */
		sync : function(val) {
			var $frmAuth = $("#AuthPhoneForm");
			$("[name=authNum]",$frmAuth).val(val);
		}
	}

	/*=========================================================================
		Title     : 이벤트 키코드 값 정규식 체크
		Return    : Boolean
		Tutorial  : isKeyCodeRegExp()
	=========================================================================*/
	function isKeyCodeRegExp () {
		var args = arguments;
		var cmd = args[0];
		var pattern = "";

		switch (cmd) {
			//숫자만
			case "num"     : pattern = /\d/gi; break;
			//숫자,영문
			case "num_eng" : pattern = /\w/gi; break;
			//숫자,영문,특문 _-
			case "num_eng_sp" : pattern = /[\w\d-_]/gi; break;
		}
		result = pattern.test(keyCodeToChar());

		if (!result) {
			( event.preventDefault ) ? event.preventDefault() : event.returnValue = false;
		};
	}
</script>
<!-- 본문영역 -->
	<div class="inner">
		<div class="tit_area">
			<h2>회원가입</h2>
			<p class="location"><span class="here">회원가입</span> &lt; HOME</p>
		</div>
		<p><img src="/resources/images/member/img_join.gif" alt="" /></p>
		<ul class="join_step">
			<li><img src="/resources/images/member/step_join01.gif" alt="step1.약관동의" /></li>
			<li class="on"><img src="/resources/images/member/step_join03_on.gif" alt="step2.정보입력" /></li>
			<li><img src="/resources/images/member/step_join04.gif" alt="step3.가입완료" /></li>
		</ul>

<form id="UserInfoForm" name="UserInfoForm" method="post" action="/member/tobe_mem_info_insert.asp">
<input type="hidden" name="isAuthPhone" value="N">
<input type="hidden" name="m_celcom_confirm" value="">
<input type="hidden" name="m_cel1_confirm" value="">
<input type="hidden" name="m_cel2_confirm" value="">
<input type="hidden" name="m_cel3_confirm" value="">
		<h3 class="mt30">정보<span class="point">입력</span></h3>
			<table class="write">
				<colgroup>
					<col width="23%" />
					<col width="*" />
				</colgroup>
				<tr>
					<th>이름</th>
					<td><input type="text" name="m_name" size="14" maxlength="12"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="text" name="m_birth" size="10" maxlength="8" style="width:258px;" onkeydown="return onlyNumber();"/> <span class="ex_msg">YYYYMMDD</span></td>
				</tr>
				<tr>
					<th>회원 아이디</th>
					<td><input type="text" name="memberId" size="15" maxlength="12" onkeydown="if((event.keyCode==13)) javascript:OpenCheckIDWindow();" onkeypress="isKeyCodeRegExp('num_eng_sp')" style="width:258px;ime-mode:disabled" />
					<a href="javascript:OpenCheckIDWindow();" ><img src="/resources/images/member/btn_id_check.gif" alt="아이디 중복확인" /></a> <span class="ex_msg">영문이나 숫자 4~12자</span></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="m_pw" size="15" maxlength="12" style="width:258px;" /></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="m_pwre" size="15" maxlength="12" style="width:258px;" /></td>
				</tr>
				<tr>
					<th>이메일 주소</th>
					<td><input name="m_email" type="text" size="22" maxlength="30" style="width:258px;"></td>
				</tr>
				<!-- 2014-10-10 YTEom : 요청으로 인해 삭제
				<tr>
					<th>전화번호</th>
					<td>
						<select class="dropdown" name="m_tel1">
							<option value="" selected><font size="-1">선택</font></option>
                      
							<option value="02">02</option>
                      
							<option value="031">031</option>
                      
							<option value="032">032</option>
                      
							<option value="033">033</option>
                      
							<option value="041">041</option>
                      
							<option value="042">042</option>
                      
							<option value="043">043</option>
                      
							<option value="051">051</option>
                      
							<option value="052">052</option>
                      
							<option value="053">053</option>
                      
							<option value="054">054</option>
                      
							<option value="055">055</option>
                      
							<option value="061">061</option>
                      
							<option value="062">062</option>
                      
							<option value="063">063</option>
                      
							<option value="064">064</option>
                      
							<option value="070">070</option>
                      
							<option value="010">010</option>
                      
						</select> -
						<input type="text" name="m_tel2" size="4" maxlength="4" style="width:113px;" /> -
						<input type="text" name="m_tel3" size="4" maxlength="4" style="width:113px;" />
					</td>
				</tr>
				-->
				<tr>
					<th>휴대폰 번호</th>
					<td>
						<select class="dropdown" name="m_celcom">
							<option value="">통신사선택</option>
							<option value="1">SKT</option>
							<option value="2">KT</option>
							<option value="3">LGT</option>
							<option value="4">KCT</option>
						</select>
						<select class="dropdown" name="m_cel1">
							<option value="" selected><font size="-1">선택</font></option>
                      
							<option value="010">010</option>
                      
							<option value="011">011</option>
                      
							<option value="016">016</option>
                      
							<option value="017">017</option>
                      
							<option value="018">018</option>
                      
							<option value="019">019</option>
                      
						</select> -
						<input type="text" name="m_cel2" size="4" maxlength="4" style="width:113px;" /> -
						<input type="text" name="m_cel3" size="4" maxlength="4" style="width:113px;" />

						<!-- 2015-05-12 YTEom : 요청으로 인해 삭제
						<input type="button" value="인증번호전송" class="btn_phoneconfirm" onclick="AuthPhone.send()">
						-->

						<div id="authphone_input" class="authphone_input">
							<ul>
								<li id="auth_send_noti"><!-- 인증번호 발송 결과 메세지 --></li>
								<li class="authcode"><span style="margin-right:8px;">인증번호 입력</span> <input type="text" name="authNum" maxlength="5" value="" onkeyup="AuthPhone.sync(this.value)"> <input type="button" value="확인" class="btn_phoneconfirm" onclick="AuthPhone.confirm()"></li>
								<li id="auth_confirm_noti"><!-- 인증 결과 메세지 --></li>
							</ul>
						</div>


					</td>

				</tr>
				
				<tr>
					<th>메일/문자 수신 여부</th>
					<td>
						<input type="checkbox" id="news_check" name="news_check" checked /><label for="news_check">메일/문자 수신 동의</label>
						<p class="ex_msg">펜션GoGo메일 및 문자 수신에 동의하시면 다양한 혜택을 가장 먼저 확인하실 수 있습니다. </p>
					</td>
				</tr>
          </tr>
          </table>
		</form>

		<!-- 휴대폰 인증을 위한 폼 -->
		<form id="AuthPhoneForm" name="AuthPhoneForm" method="post" action="">
			<input type="hidden" name="cmd" value="confirm">
			<input type="hidden" name="responsedata" value="">
			<input type="hidden" name="requestdata" value="">
			<input type="hidden" name="authNum" value="">
		</form>

		<div class="btn_c">
			<a href="javascript:memsend(this.UserInfoForm);"><img src="/resources/images/common/btn_ok2.gif" alt="확인" /></a>
			<a href="http://www.wooripension.com"><img src="/resources/images/common/btn_cancel.gif" alt="취소" /></a>
		</div>
	</div>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>