<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script type="text/javascript" src="/resources/js/base64.js"></script>
<script type="text/JavaScript">
<!--
/*
function check(){
var f = document.form1;
	if(f.m_id.value == ""){
		alert('아이디를 입력해주세요');
		f.m_id.focus();
		return;
	}
	if(f.m_pw.value == ""){
		alert('비밀번호를 입력해주세요');
		f.m_pw.focus();
		return;
	}
	f.submit();
}
*/

// 2015-07-27 YTEom : 휴면계정 체크 기능 추가
function check(){


	var f = document.form1;
	var f2 = document.form2;
	var $f = $(document.form1);

	if(f.m_id.value == ""){
		alert('아이디를 입력해주세요');
		f.m_id.focus();
		return;
	}
	if(f.m_pw.value == ""){
		alert('비밀번호를 입력해주세요');
		f.m_pw.focus();
		return;
	}

	if($(".login_captcha").css('visibility')=="visible"){ //
		if(!(grecaptcha.getResponse(objGrecaptcha))){
			alert("<로봇이 아닙니다>에 체크하고 다시 시도 해주세요.");
			return;
		}
	}

	$.ajax({
		url: 'https://www.wooripension.com/tobe_restid_check_ajax_do.asp',
		type: 'POST',
		dataType: 'jsonp',
		data: { m_id: Base64.encode(f.m_id.value), m_pw: Base64.encode(f.m_pw.value), gotourl: f.gotourl.value },
		error: function(xhr) {
			console.log("code : " + xhr.status);
		},
		success: function (data) {
			// console.log(data.result);
			switch (data.status) {
				case "1" :
					if(data.result>4){
						grecaptcha.reset(objGrecaptcha);
						$(".login_captcha").css({visibility: 'visible'});
					}else{
						alert(data.msg);
					}
					break;
				case "2" :
					if(data.result>4){
						grecaptcha.reset(objGrecaptcha);
						$(".login_captcha").css({visibility: 'visible'});
					}else{
						alert(data.msg);
					}
					break;
				case "3" :
					var popwidth = 500;
					var popheight = 319;

					OpenWin("500", "319", "", "/member/popRestAccount.asp?m_id="+Base64.encode(f.m_id.value)+"&gotourl="+f.gotourl.value, "no", "0", "0");
					break;

				default :
					f2.enc_m_id.value = Base64.encode(f.m_id.value);
					f2.enc_m_pw.value = Base64.encode(f.m_pw.value);
					f2.submit();
			}
		},
	});
}

// 2015-07-27 YTEom : 휴면계정 체크 기능 추가
/*
function check(){
	var f = document.form1;
	var $f = $(document.form1);

	if(f.m_id.value == ""){
		alert('아이디를 입력해주세요');
		f.m_id.focus();
		return;
	}
	if(f.m_pw.value == ""){
		alert('비밀번호를 입력해주세요');
		f.m_pw.focus();
		return;
	}
	// url: '/tobe_restid_check_ajax_do.asp',
	$.ajax({
		url: 'https://www.wooripension.com/tobe_restid_check_ajax_do.asp',
		type: 'POST',
		dataType: 'jsonp',
		data: $f.serialize(),
		error: function(xhr) {
			console.log("code : " + xhr.status);
		},
		success: function (data) {
			switch (data.status) {
				case "1" :
				case "2" :
					alert(data.msg);
					break;

				case "3" :
					var popwidth = 500;
					var popheight = 319;

					OpenWin("500", "319", "", "/member/popRestAccount.asp?m_id="+f.m_id.value+"&gotourl="+f.gotourl.value, "no", "0", "0");
					break;

				default :
					f.submit();
			}
		},
	});
}
*/

var objGrecaptcha
var onloadCallback = function() {
    objGrecaptcha = grecaptcha.render(document.getElementById('recaptcha'), {
      'sitekey' : '6Lck-BUTAAAAAPqpHtd4Y1eDeVU5zil9LTJl-q18'
    });
};
//-->
</SCRIPT>

<!-- 본문영역 -->
	<form id="form2" name="form2" action="member/login_ok.asp" method="post">
		<input type="hidden" name="gotourl" value="/search/reserve_search.asp?pension_code=w0101193">
		<input type="hidden" name="enc_m_id" value="">
		<input type="hidden" name="enc_m_pw" value="">
	</form>
	<div class="login_inner">
		<h2>회원 <span class="point">로그인</span><span class="sub_txt">펜션GoGo 회원으로 가입하시면 많은 혜택이 있습니다.</span></h2>
		<div class="login_box">
			<form id="form1" name="form1" method ="post">
			<input type="hidden" name="gotourl" value="/search/reserve_search.asp?pension_code=w0101193">
			<div class="fl">
				<dl>
					<dt>아이디</dt>
					<dd><input type="text" name="m_id" maxlength="20"/></dd>
					<dt>비밀번호</dt>
					<dd><input type="password" name="m_pw" maxlength="20" onkeydown="if((event.keyCode==13)) javascript:check();"/></dd>
					<dd class="btn"><a href="javascript:check()"><img src="/resources/images/common/btn_login.gif" alt="로그인" /></a></dd>
				</dl>
				<!-- 2016.01.26 구글 리캡차 -->
				<div class="login_captcha">
					비밀번호를 5회 이상 틀리셨을 경우,정보보호를 위해 아래<br /> 자동입력방지 박스에 체크해주셔야 합니다.<br />
					비밀번호를 잊어버리셨다면 <비밀번호 찾기>를 이용해주세요.
					<div>
					    <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit"
					        async defer>
					    </script>
						<div class="g-recaptcha" id="recaptcha"></div><!--  data-type="image" -->
					</div>
				</div>
				<p class="login_util">
					<a href="http://www.wooripension.com/member/tobe_woori_m.asp"><img src="/resources/images/member/mem_join.gif" alt="회원가입" /></a>
					<!-- Http Https 보안 프로토콜 문제로 임시로 적용. -->
					<a href="https://www.wooripension.com/member/tobe_join_4.asp"><img src="/resources/images/member/mem_find.gif" alt="아이디/비밀번호 찾기" /></a>
				</p>
				<ul class="dot_list">
					<li>회원님의 아이디와 비밀번호를 정확하게 입력해 주세요.</li>
					<li>아이디 또는 비밀번호를 잊어버리신 경우, <span class="blue">[아이디 / 비밀번호 찾기]</span>버튼을 눌러 <br />주세요.</li>
					<li>회원가입 후 예약하실 경우, 전체 금액의 <span class="blue">2%가 마일리지로 적립</span>이 되며, 적립된 <br />금액은 현금처럼 사용하실 수 있습니다.</li>
				</ul>
			</div>
			</form>
			<div class="fr">
				<p><a href="http://www.wooripension.com/event/event_detail.asp?idx=39"><img src="/resources/images/dummy/login_banner.jpg" alt="" /></a></p>
			</div>
		</div>
	</div>
	<!-- // 본문영역 -->
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	
