<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<head>
<link href="/resources/images/icon/favi.ico" rel="shortcut icon" />
<title>펜션GoGo - 실시간펜션예약사이트</title>

<link href="/resources/css/common.css"  rel="stylesheet" type="text/css"/>
<link href="/resources/css/main.css" rel="stylesheet" type="text/css"/>
<link href="/resources/css/member.css" rel="stylesheet" type="text/css"/>
<link href="/resources/css/flick/jquery-ui-1.8.14.custom.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="/resources/js/jquery-1.7.1.js"></script>
<script type="text/javascript" src="/resources/js/jquery.carouFredSel-6.2.1-packed.js"></script>
<script type="text/javascript" src="/resources/js/design.js"></script>
<script type="text/javascript" src="/resources/js/jquery.cookie.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui-1.8.14.custom.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.highlight-3.js"></script>
<script type="text/javascript" src="/resources/js/jquery.slides.min.js"></script>
<script type="text/javascript" src="/resources/js/function.js"></script>
<script type="text/javascript" src="/resources/js/event.proc.js"></SCRIPT>
<script type="text/javascript" src="/resources/js/sigungu.js"></script>
   
    
<!--2014-12-30 신년인사-->
<script language="javascript">
function notice_getCookie( name ) {
	var nameOfCookie = name + "=";
	var x = 0;
	while ( x <= document.cookie.length ){
    var y = (x+nameOfCookie.length);
    if ( document.cookie.substring( x, y ) == nameOfCookie ) {
      if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
        endOfCookie = document.cookie.length;
      return unescape( document.cookie.substring( y, endOfCookie ) );
    }
    x = document.cookie.indexOf( " ", x ) + 1;
    if ( x == 0 )
      break;
	}
	return "";
}
function notice(){

}
</script>



<style type="text/css">

.ui-autocomplete
{
    height:100px;
    max-height:100px;
    overflow-x:hidden;
    overflw-y:auto;
}

#slides {
	display: none;
	width:216px;
	height:80px;
	float: right;
}

#slides .btn-prev.slidesjs-previous {
	position: absolute;
	top: 14px;
	right: 18px;
	z-index: 100;
}
#slides .btn-next.slidesjs-next {
	position: absolute;
	top: 14px;
	right: 0;
	z-index: 100;
}
</style>


<script language="javascript">

<!--


    jQuery(function ($) {
        $.datepicker.regional['ko'] = {
            closeText: '닫기',
            prevText: '이전달',
            nextText: '다음달',
            currentText: '오늘',
            monthNames: ['1월(JAN)', '2월(FEB)', '3월(MAR)', '4월(APR)', '5월(MAY)', '6월(JUN)',
		'7월(JUL)', '8월(AUG)', '9월(SEP)', '10월(OCT)', '11월(NOV)', '12월(DEC)'],
            monthNamesShort: ['1월(JAN)', '2월(FEB)', '3월(MAR)', '4월(APR)', '5월(MAY)', '6월(JUN)',
		'7월(JUL)', '8월(AUG)', '9월(SEP)', '10월(OCT)', '11월(NOV)', '12월(DEC)'],
            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            dateFormat: 'yy-mm-dd', firstDay: 0,
            isRTL: false
        };
        $.datepicker.setDefaults($.datepicker.regional['ko']);


        $.datepicker.setDefaults({
            minDate: '2018-07-09'
	            , maxDate: '2018-9-30'
            //  , cnangeMonth:true
            //  , changeYear:true
        });

        $("#rersrm_date").datepicker();
        $("#rersrm_date_img").click(function () {
            $('#rersrm_date').trigger('focus');
        });

        autoComplete();


        $("#btnTotalSearch").click(function (e) {
            totSearch();
        });

        $("#tags").keyup(function (e) {
            if (e.keyCode == 13) {
                totSearch();
            }
        });

        listToScroll();

        //우측 상단 슬라이드
		$('#slides').slidesjs({
			play: {
				active: true,
				auto: true,
				interval: 4000,
				swap: true,
				pauseOnHover: true,
				restartDelay: 2500
			}
		});
    });





    //리스트로 스크롤 하게~~
    function listToScroll() {

        var p_position = '';
        var position = null;
        var pageno = '';


        if (!p_position) {
            pageno = parseInt(pageno, 10);
            if (!pageno) {
                return false;
            }
            if (!$(".sMoveToPaging").length) {
                return;
            }
            position = $(".paging").prev();

        }
        else {
            position = $("#" + p_position);
        }

        var offset = position.offset();
        if (offset) {
            var top = offset.top;
            if (top) {
                top = top - 70;
                $('html,body').animate({ scrollTop: top }, 500);
            }
        }
    }

//easydropdown 플러그인을 개별로 적용하기
function easydropdownForSelector(selector) {
	$.easyDropDownSelector = "#" + selector;
	delete EasyDropDownInitInstances[selector];
	EasyDropDownInit();

}

function siteBookmark()
{
	window.external.AddFavorite('http://www.wooripension.com', '믿을 수 있는 대표 펜션예약사이트, 우리펜션');
}

function log_check() {
	alert("로그인후에 사용하실 수 있는 메뉴입니다.\n회원가입후 이용하시면 우리펜션에서 사용하실 수 있는\n사이버머니를 2%적립해드립니다.\n지금바로 가입하세요.");
	return;
}

function ViewPPicture(pcode,rcode,ptype)
{
	OpenWin(802 ,680 ,"Picture","http://www.wooripension.com/pension/tobe_pop.asp?pension_code="+pcode+"&room_code="+rcode+"&p_type="+ptype,"YES",0,0);
}

function autoComplete() {
    var availableTags = null;
    var opts = {
        type: "post"
		    , url: "/common/tobe_autoComplete.asp"
		    , beforeSend: function () {
		    }
		, success: function (data) {

		    availableTags = (data || "").split(",");
		    $("#tags").autocomplete({
		        source: availableTags,
		        open: function () {
		            //alert(this.value);
		            $('li').highlight(this.value);
		        },
		        minLength: 2
		    });
		}
		,error: function (data, status, err) {
		}
		,complete: function () {
		}
    };
    $.ajax(opts);

}

function topGnbMenuOnOff(index) {
    $(".top_gnb_menu").removeClass("on");
    $(".top_gnb_menu[index=" + index + "]").addClass("on");
}

//통합검색
function totSearch(){
	var searchNm = $("#tags").val();
	if(searchNm == ""){
		alert("검색어를 입력해주세요");
		$("#tags").focus();
	}else{
		location.href="http://www.wooripension.com/search/tobe_search_all.asp?searchNm="+encodeURIComponent(encodeURIComponent(searchNm));
	}

}
//-->
</script>

<body onLoad="javascript:notice()">

<div id="wrap">

<div class="top_gnb_util">
	<div class="inner">
		<ul class="fl">
			<li><a href="javascript:siteBookmark()"onFocus="this.blur();" class="favorite">즐겨찾기</a></li>
			<li><a href="javascript:;">가맹점등록</a></li>
			<!-- <li><a href="/company/cooperation.asp">광고문의</a></li> -->
            <li class="end"><a href="javascript:;">펜션존</a></li>
		</ul>
		<ul class="fr">
			 
				<li><a href="/member/login">로그인</a></li>
				<li><a href="/member/mem_input">회원가입</a></li>
				<li><a href="javascript:;">예약확인 및 취소</a></li>
				<li class="end"><a href="javascript:;">고객센터</a></li>
		</ul>
	</div>
</div>

<div class="top_logo">
	<div class="fl_wrap">
		<h1 class="h1_logo">
			<a href="/"><img src="/resources/images/common/woori_logo_180227.png" alt="펜션GoGo"/></a>
	  </h1>
		<div class="search">
				<input type="text" id="tags"/>
        <button type="search" class="search_btn" id="btnTotalSearch" title="검색">
        </button>
		</div>
	</div>
	<!-- 롤링배너 -->
	<div class="fr_banner">
			<div id='slides'><a href='http://bit.ly/pinspot_c' target='_brank'><img src='/resources/images/uploaded_files/main_banner/pinspot.png' alt='상단롤링배너' /></a>
				<a href='http://bit.ly/hanintel_c' target='_brank'><img src='/resources/images/uploaded_files/main_banner/hanintel.png' alt='상단롤링배너' /></a>
				<a href='javascript:;' class='btn-prev slidesjs-previous slidesjs-navigation'><img src='/resources/images/common/btn_prev.gif' alt='NO!' /></a>
				<a href='javascript:;' class='btn-next slidesjs-next slidesjs-navigation'><img src='/resources/images/common/btn_next.gif' alt='NO!' /></a>
			</div>

	</div>
	<!-- // 롤링배너 -->
	<!-- <div class="sidebanner">
	        <ul>
	        	
	        </ul>
	</div> -->
<!-- 사이드바 끝 -->
</div>



<form id="totalSearchForm">
<div class="gnb_menu">
	<div class="gnb_center_wrap">
		<ul>
			<li class="top_gnb_menu first" index="0"><a href="http://www.wooripension.com/local/tobe_sub_main.asp?sidoCode=01&sido_kind=1&gugun_code=02" class="menu1">지역별 펜션</a></li>
			<li class="top_gnb_menu" index="1"><a href="http://www.wooripension.com/search/reserve_search.asp" class="menu2">예약가능 펜션 검색</a></li>
			<li class="top_gnb_menu" index="2"><a href="http://www.wooripension.com/spa/spa_main.asp" class="menu3">스파 팻호텔</a></li>
	    	<li class="top_gnb_menu" index="11"><a href="http://www.wooripension.com/poolvilla/poolvilla_main.asp" class="menu11">풀빌라 펜션</a></li>
	     	<li class="top_gnb_menu" index="4"><a href="http://www.wooripension.com/resort/tobe_mt.asp" class="menu5">워크샵/MT 펜션</a></li>
	        <li class="top_gnb_menu last" index="3"><a href="http://www.wooripension.com/pool/pool_main.asp" class="menu4">수영장 펜션</a></li>
     </ul>
	</div>
</div>
</form>

<script type="text/javascript">
$("#totalSearchForm").bind({
    submit : function(){return false;}
});

</script>
<!--------------------------------- 상단메뉴끝 ------------------------------------------>


<script type="text/javascript">
<!--
	// 쿠키 생성
	function setCookie(cName, cValue, cDay) {
		var expire = new Date();
		expire.setDate(expire.getDate() + cDay);
		cookies = cName + '=' + escape(cValue) + '; path=/ '; // 한글 깨짐을 막기위해 escape(cValue)를 합니다.
		if (typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
		document.cookie = cookies;
	}

	// 쿠키 가져오기
	function getCookie(cName) {
		cName = cName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cName);
		var cValue = '';
		if (start != -1) {
			start += cName.length;
			var end = cookieData.indexOf(';', start);
			if (end == -1) end = cookieData.length;
			cValue = cookieData.substring(start, end);
		}
		return unescape(cValue);
	}



	var mobileKeyWords = new Array('iPhone', 'iPod', 'BlackBerry', 'Android', 'Windows CE', 'LG', 'MOT', 'SAMSUNG', 'SonyEricsson');

	if ("" != "1"){
		for (var word in mobileKeyWords){
			if (navigator.userAgent.match(mobileKeyWords[word]) != null){
				location.href = "http://m.wooripension.com";
				break;
			}
		}
	}
//-->
</script>

<script type="text/javascript">
	$(document).ready(function () {
		mainImg();
	});
</script>
<script type="text/javascript">
	window.name = 'wooripension_main';
	$(function () {
		premium_eventInit();
		//펜션 상세보기
		$("a[pensioncode]").not(".ugency").click(function () {
			var pensioncode = $(this).attr("pensioncode");
			var t = $(this).attr("type");
			openDetailPage(pensioncode);
		});

		//펜션 상세보기
		$("a.ugency[pensioncode]").click(function () {
			var pensioncode = $(this).attr("pensioncode");
			var u_seq_v = $(this).attr("u_seq_v");
			var t = $(this).attr("type");
			openDetailPageUgency(pensioncode, u_seq_v);
		});


		//하단 게시판 이동
		$("a.afterBoard").click(function () {
			var boardId = $(this).attr("boardId");
			ViewBoard('After', 'View', boardId);
		});

		//하단 게시판 이동
		$("a.QnABoard").click(function () {
			var boardId = $(this).attr("boardId");
			ViewBoard('Qna', 'View', boardId);
		});

		//하단 게시판 이동
		$("a.HelpBoard").click(function () {
			var boardId = $(this).attr("boardId");
			ViewBoard('Help', 'View', boardId);
		});
	});

	function ViewBoard(bk, bp, bi) {

		if (bk == "Qna") {
			document.location.href = "/community/tobe_qna_view.asp?idx=" + bi;
		}
		else if (bk == "Help") {
			document.location.href = "/community/tobe_help_pass.asp?idx=" + bi;
		}
		else if (bk == "After") {
			document.location.href = "/community/tobe_review_view.asp?idx=" + bi;
		}
	}




	/*프리미엄 CHOICE, WOORI EVENT 시작*/
	function premium_eventInit() {
		$("li.premiumchoice, li.premiumchoice a").bind({
			mouseover: function (e) {
				var evenetEle = $(this);
				var index = evenetEle.attr("index");
				premiumchoiceRolling(index);

				if (premiumIntervalRef) {
					clearInterval(premiumIntervalRef);

				}
				premiumIntervalRef = null;
			},
			mouseout: function () {
				if (premiumIntervalRef) {
					clearInterval(premiumIntervalRef);

				}
				premiumIntervalRef = null;
				premiumInterval();
			}
		});


		$("li.wooriEvent, li.wooriEvent a").bind({
			mouseover: function (e) {
				var index = $(this).attr("index");
				wooriEventRolling(index);

				if (wooriEventRef) {
					clearInterval(wooriEventRef);

				}
				wooriEventRef = null;
			},
			mouseout: function () {
				if (wooriEventRef) {
					clearInterval(wooriEventRef);

				}
				wooriEventRef = null;
				wooriEventInterval();
			}
		});


		//프리미엄, 이벤트 선택 클릭
		$("#wooriEventOnOff, #premiumchoiceOnOff").css("cursor", "pointer").click(function () {
			var id = $(this).attr("id");
			premium_eventOnOff(id);
		});


		//
		var index = $("li.premiumchoice").first().attr("index");
		premiumchoiceRolling(index);

		var index = $("li.wooriEvent").first().attr("index");
		wooriEventRolling(index);
	}

	var premiumchoiceSize;
	var premiumchoiceIndex = 0;
	var premiumIntervalRef;


	var wooriEventSize;
	var wooriEventIndex = 0;
	var wooriEventRef;

	/*프리미엄초이스, 우리이벤트 자동 롤링 셋팅*/
	$(function () {
		premiumchoiceSize = $("li.premiumchoice").size();
		wooriEventSize = $("li.wooriEvent").size();
		premiumInterval();
		wooriEventInterval();
		$('li.premiumchoice').css('width',100/premiumchoiceSize+'%');
	});


	function premiumInterval() {

		premiumIntervalRef = setInterval(function () {
			premiumIntervalExec();
		}, 5000);
	}

	function wooriEventInterval() {

		wooriEventRef = setInterval(function () {
			wooriEventIntervalExec();
		}, 5000);

	}

	function premiumIntervalExec() {
		premiumchoiceIndex++;
		if (premiumchoiceSize <= premiumchoiceIndex) {
			premiumchoiceIndex = 0;
		}
		premiumchoiceRolling(premiumchoiceIndex);
	}

	function wooriEventIntervalExec() {
		wooriEventIndex++;
		if (wooriEventSize <= wooriEventIndex) {
			wooriEventIndex = 0;
		}
		wooriEventRolling(wooriEventIndex);
	}

	function premium_eventOnOff(id) {
		if (id == "wooriEventOnOff") {
			$(".wooriEventWrap").show();
			$(".premiumchoiceWrap").hide();
		}
		else if (id == "premiumchoiceOnOff") {
			$(".premiumchoiceWrap").show();
			$(".wooriEventWrap").hide();
		}
	}

	function premiumchoiceRolling(index) {
		premiumchoiceIndex = index;
		$("li.premiumchoice").removeClass("on");
		$("li.premiumchoice[index=" + index + "]").addClass("on");
		$("a.premiumchoice").hide();
		$("a.premiumchoice[index=" + index + "]").show();
		$("div.premiumchoice").hide();
		$("div.premiumchoice[index=" + index + "]").show();
	}

	function wooriEventRolling(index) {
		wooriEventIndex = index;
		$("li.wooriEvent").removeClass("on");
		$("li.wooriEvent[index=" + index + "]").addClass("on");
		$("a.wooriEvent").hide();
		$("a.wooriEvent[index=" + index + "]").show();
		$("div.wooriEvent").hide();
		$("div.wooriEvent[index=" + index + "]").show();
	}
	/*프리미엄 CHOICE, WOORI EVENT 끝*/


	/* 검색영역 form 초기화 */
	$(function () {
		var obj = {
			method: "GET",
			action: "/search/reserve_search.asp"
		};
		searchFormInit(obj);

		$("li.wooriEvent a").click(function () {

			var href = $(this).attr("href");
			//var href = $("a.wooriEvent", $(this)).attr("href");
			//var href = $(this).attr("href");
			document.location.href = href;

		});
	});


</script>
<script type="text/javascript">
    $(function () {
        $("li.hot_place_item").bind({
            mouseover: function () {
                var index = $(this).attr("index");
                hotPlaceRolling(index);
                if (hotPlaceRef) {
                    clearInterval(hotPlaceRef);

                }
                hotPlaceRef = null;
            },
            mouseout: function () {
                if (hotPlaceRef) {
                    clearInterval(hotPlaceRef);
                }
                hotPlaceRef = null;
                hotPlaceInterval();
            }
        });

        var index = $("li.hot_place_item").first().attr("index");
        hotPlaceSize = $("li.hot_place_item").size();
        hotPlaceRolling(index);
        hotPlaceInterval();
    });

    var hotPlaceSize;
    var hotPlaceIndex = 0;
    var hotPlaceRef;



    function hotPlaceInterval() {
        hotPlaceRef = setInterval(function () {
            hotPlaceExec();
        }, 5000);
    }


    function hotPlaceExec() {
        hotPlaceIndex++;
        if (hotPlaceSize <= hotPlaceIndex) {
            hotPlaceIndex = 0;
        }
        hotPlaceRolling(hotPlaceIndex);
    }

    function hotPlaceRolling(index) {
        hotPlaceIndex = index;
        $("a.hot_place_item").hide();
        $("a.hot_place_item[index=" + index + "]").show();
        $("li.hot_place_item").removeClass("on");
        $("li.hot_place_item[index=" + index + "]").addClass("on");
    }
</script>


	
    <!--검색영역 시작-->

    <script type="text/javascript">

        /* 검색영역 form 초기화 */
        /*$(function () {
            var obj = {
                method: "GET",
                action: "/search/reserve_search.asp"
            };
            searchFormInit(obj);
        });*/
        function searchFormInit(obj) {
            var objForm = obj || {};
            var form = $("#form_search");
            for (var key in objForm) {
                form.attr(key, objForm[key]);
            }


            var action = form.attr("action");

        }
    </script>

    <form id="form_search" action="search/reserve_search.jsp" method="get">
    <input type="hidden" />
    <div class="gnb_search_area">
        <div class="gnb_search">
            <p class="gnb_search_txt">원하는 펜션을 찾아보세요</p>
            <dl>
                <dt>날짜</dt>
                <dd class="like_input">
                    <input type="text" value="2018-07-09" readonly="readonly" id="rersrm_date" name="rersrm_date" />
                    <input type="image" src="/resources/images/common/ico_calendar.gif" alt="날짜선택" id="rersrm_date_img" onclick="return false" />
                </dd>
				<dt class="second_col">지역</dt>
                <dd>
					<select name="sido" id="sido" class="selected"></select>
						
					 <select name="gugun" id="gugun" class="selected"></select>
				</dd>

            </dl>
            <p class="fr">
                <span class="btn_detail"><a href="javascript:;">상세조건<span class="plus">+</span><span class="minus">-</span></a></span>
                <a href="javascript:;" id="btn_search" class="btn_search">예약가능 펜션 검색<!--<img src="/common/btn_search_realtime.gif" alt="실시간 빈방 검색" title="실시간 빈방 검색" />--></a>
            </p>
        </div>
        <div class="search_detail">
            <dl class="dropsearch">
                <dt>기간</dt>
                <dd>
                    <select name="rersrm_term" id="rersrm_term" class="dropdown" style="display:none" >
                        <option value="1">1박2일</option>
                        <option value="2">2박3일</option>
                        <option value="3">3박4일</option>
                        <option value="4">4박5일</option>
                        <option value="5">5박6일</option>
                        <option value="6">6박7일</option>
                    </select>
                </dd>

                <dt class="second_col">인원</dt>
                <dd>
                    <!-- 2015-09-15 SYYun : 원래 상태로 원복 -->
                    <select name="room_user" id="room_user" class="dropdown">
                        
                        <option value="1">1명</option>
                        
                        <option value="2">2명</option>
                        
                        <option value="3">3명</option>
                        
                        <option value="4">4명</option>
                        
                        <option value="5">5명</option>
                        
                        <option value="6">6명</option>
                        
                        <option value="7">7명</option>
                        
                        <option value="8">8명</option>
                        
                        <option value="9">9명</option>
                        
                        <option value="10">10명</option>
                        
                        <option value="11">11명</option>
                        
                        <option value="12">12명</option>
                        
                        <option value="13">13명</option>
                        
                        <option value="14">14명</option>
                        
                        <option value="15">15명</option>
                        
                        <option value="16">16명</option>
                        
                        <option value="17">17명</option>
                        
                        <option value="18">18명</option>
                        
                        <option value="19">19명</option>
                        
                        <option value="20">20명</option>
                        
                        <option value="21">21명</option>
                        
                        <option value="22">22명</option>
                        
                        <option value="23">23명</option>
                        
                        <option value="24">24명</option>
                        
                        <option value="25">25명</option>
                        
                        <option value="26">26명</option>
                        
                        <option value="27">27명</option>
                        
                        <option value="28">28명</option>
                        
                        <option value="29">29명</option>
                        
                        <option value="30">30명</option>
                        
                        <option value="31">31명</option>
                        
                        <option value="32">32명</option>
                        
                        <option value="33">33명</option>
                        
                        <option value="34">34명</option>
                        
                        <option value="35">35명</option>
                        
                        <option value="36">36명</option>
                        
                        <option value="37">37명</option>
                        
                        <option value="38">38명</option>
                        
                        <option value="39">39명</option>
                        
                        <option value="40">40명</option>
                        
                        <option value="41">41명</option>
                        
                        <option value="42">42명</option>
                        
                        <option value="43">43명</option>
                        
                        <option value="44">44명</option>
                        
                        <option value="45">45명</option>
                        
                        <option value="46">46명</option>
                        
                        <option value="47">47명</option>
                        
                        <option value="48">48명</option>
                        
                        <option value="49">49명</option>
                        
                        <option value="50">50명</option>
                        
                    </select>

                </dd>
                <!--<dt>가격선택</dt>-->
                <dd>
                    <!-- 2014-10-20 YTEom : 요청으로 인해 가격 체계 변경
                    <select class="dropdown" name="repay_type" id="repay_type" >
                        <option value="0">가격전체</option>
                        <option value="5">5만원이하</option>
                        <option value="7">7만원이하</option>
                        <option value="10">10만원이하</option>
                        <option value="12">12만원이하</option>
                        <option value="15">15만원이하</option>
                        <option value="20">20만원이하</option>
                        <option value="25">25만원이하</option>
                        <option value="30">30만원이하</option>
                        <option value="35">35만원이하</option>
                        <option value="40">40만원이하</option>
                        <option value="99">40만원이상</option>
                    </select>
                    -->
                    <select class="dropdown" name="repay_type" id="repay_type" >
                        <option value="0">가격전체</option>
                        <option value="10">~ 10만원</option>
                        <option value="15">~ 15만원</option>
                        <option value="20">~ 20만원</option>
                        <option value="30">~ 30만원</option>
                        <option value="99">30만원이상</option>
                    </select>

                </dd>

            </dl>
            <dl class="other">
                <dt><img src="/resources/images/common/tit_search01.png" alt="편의시설" /></dt>
                <dd>
                    <ul>
            
                <li><input type="checkbox" title='노래방' id='budae_code_checkbox32' name="budae_code"
                value='32'  /><label for='budae_code_checkbox32'
                title='노래방'>노래방</label>
                </li>
            
                <li><input type="checkbox" title='무료조식' id='budae_code_checkbox27' name="budae_code"
                value='27'  /><label for='budae_code_checkbox27'
                title='무료조식'>무료조식</label>
                </li>
            
                <li><input type="checkbox" title='바베큐(4계절)' id='budae_code_checkbox40' name="budae_code"
                value='40'  /><label for='budae_code_checkbox40'
                title='바베큐(4계절)'>바베큐(4계절)</label>
                </li>
            
                <li><input type="checkbox" title='빔프로젝트' id='budae_code_checkbox30' name="budae_code"
                value='30'  /><label for='budae_code_checkbox30'
                title='빔프로젝트'>빔프로젝트</label>
                </li>
            
                <li><input type="checkbox" title='세미나실' id='budae_code_checkbox29' name="budae_code"
                value='29'  /><label for='budae_code_checkbox29'
                title='세미나실'>세미나실</label>
                </li>
            
                <li><input type="checkbox" title='수영장' id='budae_code_checkbox22' name="budae_code"
                value='22'  /><label for='budae_code_checkbox22'
                title='수영장'>수영장</label>
                </li>
            
                <li><input type="checkbox" title='수영장 15m 이상' id='budae_code_checkbox21' name="budae_code"
                value='21'  /><label for='budae_code_checkbox21'
                title='수영장 15m 이상'>수영장 15m..</label>
                </li>
            
                <li><input type="checkbox" title='수영장 유아용' id='budae_code_checkbox23' name="budae_code"
                value='23'  /><label for='budae_code_checkbox23'
                title='수영장 유아용'>수영장 유아용</label>
                </li>
            
                <li><input type="checkbox" title='스파' id='budae_code_checkbox24' name="budae_code"
                value='24'  /><label for='budae_code_checkbox24'
                title='스파'>스파</label>
                </li>
            
                <li><input type="checkbox" title='식사가능' id='budae_code_checkbox28' name="budae_code"
                value='28'  /><label for='budae_code_checkbox28'
                title='식사가능'>식사가능</label>
                </li>
            
                <li><input type="checkbox" title='오션뷰(객실)' id='budae_code_checkbox44' name="budae_code"
                value='44'  /><label for='budae_code_checkbox44'
                title='오션뷰(객실)'>오션뷰(객실)</label>
                </li>
            
                <li><input type="checkbox" title='워터슬라이드' id='budae_code_checkbox43' name="budae_code"
                value='43'  /><label for='budae_code_checkbox43'
                title='워터슬라이드'>워터슬라이드</label>
                </li>
            
                <li><input type="checkbox" title='인터넷' id='budae_code_checkbox31' name="budae_code"
                value='31'  /><label for='budae_code_checkbox31'
                title='인터넷'>인터넷</label>
                </li>
            
                <li><input type="checkbox" title='족구장' id='budae_code_checkbox34' name="budae_code"
                value='34'  /><label for='budae_code_checkbox34'
                title='족구장'>족구장</label>
                </li>
            
                <li><input type="checkbox" title='캠프파이어/모닥불' id='budae_code_checkbox36' name="budae_code"
                value='36'  /><label for='budae_code_checkbox36'
                title='캠프파이어/모닥불'>캠프파이어/모..</label>
                </li>
            
                <li><input type="checkbox" title='픽업(마트픽업)' id='budae_code_checkbox45' name="budae_code"
                value='45'  /><label for='budae_code_checkbox45'
                title='픽업(마트픽업)'>픽업(마트픽업)</label>
                </li>
            
                <li><input type="checkbox" title='픽업(자체픽업)' id='budae_code_checkbox39' name="budae_code"
                value='39'  /><label for='budae_code_checkbox39'
                title='픽업(자체픽업)'>픽업(자체픽업)</label>
                </li>
            
                    </ul>
                </dd>
            </dl>
            <dl class="other">
                <dt><img src="/resources/images/common/tit_search02.png" alt="테마검색" /></dt>
                <dd>
                    <ul>
            
                        <li><input type="checkbox" id='thema_code_checkbox01'
                            title='15인이상 단체' name="thema_code" value='01'
                             /><label for='thema_code_checkbox01'
                             title='15인이상 단체'>15인이상 단체</label>
                        </li>
            
                        <li><input type="checkbox" id='thema_code_checkbox02'
                            title='30인이상 단체' name="thema_code" value='02'
                             /><label for='thema_code_checkbox02'
                             title='30인이상 단체'>30인이상 단체</label>
                        </li>
            
                        <li><input type="checkbox" id='thema_code_checkbox13'
                            title='갯벌체험' name="thema_code" value='13'
                             /><label for='thema_code_checkbox13'
                             title='갯벌체험'>갯벌체험</label>
                        </li>
            
                        <li><input type="checkbox" id='thema_code_checkbox22'
                            title='게스트하우스' name="thema_code" value='22'
                             /><label for='thema_code_checkbox22'
                             title='게스트하우스'>게스트하우스</label>
                        </li>
            
                        <li><input type="checkbox" id='thema_code_checkbox07'
                            title='계곡(도보5분)' name="thema_code" value='07'
                             /><label for='thema_code_checkbox07'
                             title='계곡(도보5분)'>계곡(도보5분)</label>
                        </li>
            
                        <li><input type="checkbox" id='thema_code_checkbox23'
                            title='글램핑&카라반' name="thema_code" value='23'
                             /><label for='thema_code_checkbox23'
                             title='글램핑&카라반'>글램핑&카라반</label>
                        </li>
            
                        <li><input type="checkbox" id='thema_code_checkbox14'
                            title='낚시' name="thema_code" value='14'
                             /><label for='thema_code_checkbox14'
                             title='낚시'>낚시</label>
                        </li>
            
                        <li><input type="checkbox" id='thema_code_checkbox03'
                            title='독채형' name="thema_code" value='03'
                             /><label for='thema_code_checkbox03'
                             title='독채형'>독채형</label>
                        </li>
            
                        <li><input type="checkbox" id='thema_code_checkbox17'
                            title='래프팅' name="thema_code" value='17'
                             /><label for='thema_code_checkbox17'
                             title='래프팅'>래프팅</label>
                        </li>
            
                        <li><input type="checkbox" id='thema_code_checkbox10'
                            title='바다(도보5분)' name="thema_code" value='10'
                             /><label for='thema_code_checkbox10'
                             title='바다(도보5분)'>바다(도보5분)</label>
                        </li>
            
                        <li><input type="checkbox" id='thema_code_checkbox09'
                            title='바다(펜션앞)' name="thema_code" value='09'
                             /><label for='thema_code_checkbox09'
                             title='바다(펜션앞)'>바다(펜션앞)</label>
                        </li>
            
                        <li><input type="checkbox" id='thema_code_checkbox19'
                            title='반려동물' name="thema_code" value='19'
                             /><label for='thema_code_checkbox19'
                             title='반려동물'>반려동물</label>
                        </li>
            
                        <li><input type="checkbox" id='thema_code_checkbox18'
                            title='수목원(휴양림)' name="thema_code" value='18'
                             /><label for='thema_code_checkbox18'
                             title='수목원(휴양림)'>수목원(휴양림)</label>
                        </li>
            
                        <li><input type="checkbox" id='thema_code_checkbox20'
                            title='수상레포츠' name="thema_code" value='20'
                             /><label for='thema_code_checkbox20'
                             title='수상레포츠'>수상레포츠</label>
                        </li>
            
                        <li><input type="checkbox" id='thema_code_checkbox16'
                            title='워터파크' name="thema_code" value='16'
                             /><label for='thema_code_checkbox16'
                             title='워터파크'>워터파크</label>
                        </li>
            
                        <li><input type="checkbox" id='thema_code_checkbox25'
                            title='최저가보장제' name="thema_code" value='25'
                             /><label for='thema_code_checkbox25'
                             title='최저가보장제'>최저가보장제</label>
                        </li>
            
                        <li><input type="checkbox" id='thema_code_checkbox24'
                            title='풀빌라 펜션' name="thema_code" value='24'
                             /><label for='thema_code_checkbox24'
                             title='풀빌라 펜션'>풀빌라 펜션</label>
                        </li>
            
                        <li><input type="checkbox" id='thema_code_checkbox12'
                            title='해수욕장' name="thema_code" value='12'
                             /><label for='thema_code_checkbox12'
                             title='해수욕장'>해수욕장</label>
                        </li>
            
                    </ul>
                </dd>
            </dl>
            <dl class="other">
                <dt><img src="/resources/images/common/tit_search03.png" alt="객실상세검색" /></dt>
                <dd>
                    <ul>
                        <li><input type="checkbox" name="rermst_kind" id="rermst_kind_O"
                        value="O"  /><label for="rermst_kind_O">원룸</label></li>
                        <li><input type="checkbox" name="rermst_kind" id="rermst_kind_S"
                        value="S"  /><label for="rermst_kind_S">분리형 객실</label></li>
                        <li><input type="checkbox" name="rermst_kind" id="rermst_kind_D"
                        value="D" /><label for="rermst_kind_D">복층형</label></li>
                        <li><input type="checkbox" name="rermst_kind" id="rermst_kind_B"
                        value="B" /><label for="rermst_kind_B">침대</label></li>
                        <li><input type="checkbox" name="rermst_kind" id="rermst_kind_F"
                        value="F" /><label for="rermst_kind_F">온돌</label></li>
                        <li><input type="checkbox" id="rermst_terr_checkbox" name="rermst_terr" value="YY" ><label for='rermst_terr_checkbox'>테라스바베큐</label></li>
                    </ul>
                    <p>
                        <select name="rermst_room" class="dropdown" >
                        <option value="">방 갯수</option>
                        
                        <option value="1" >방1개이상</option>
                        
                        <option value="2" >방2개이상</option>
                        
                        <option value="3" >방3개이상</option>
                        
                        <option value="4" >방4개이상</option>
                        
                        <option value="5" >방5개이상</option>
                        
                        <option value="6" >방6개이상</option>
                        
                        <option value="7" >방7개이상</option>
                        
                        <option value="8" >방8개이상</option>
                        
                        <option value="9" >방9개이상</option>
                        
                        <option value="10" >방10개이상</option>
                        
                        </select>
                        <select name="rermst_toil" class="dropdown" ><option value="">화장실 갯수</option>
                            
                            <option value="1" >화장실1개이상</option>
                            
                            <option value="2" >화장실2개이상</option>
                            
                            <option value="3" >화장실3개이상</option>
                            
                            <option value="4" >화장실4개이상</option>
                            
                            <option value="5" >화장실5개이상</option>
                            
                            <option value="6" >화장실6개이상</option>
                            
                            <option value="7" >화장실7개이상</option>
                            
                            <option value="8" >화장실8개이상</option>
                            
                            <option value="9" >화장실9개이상</option>
                            
                            <option value="10" >화장실10개이상</option>
                            
                        </select>
                     
                    </p>
                </dd>
            </dl>
            <p class="close_search">상세검색 닫기</p>
        </div>
        <div id="loading_zone" style="position:absolute;"></div>
    </div>

    <script type="text/javascript">


        jQuery(function ($) {

            $("#resido_code").change(function () {
                residoCodeChange();
            });

            //실시간 빈방검색 클릭
            $("#btn_search").click(function () {
				// 2014-10-28 YJH 옐로트래블 이성창 팀장님 요청으로 추가
				$.each($("input[name='budae_code']:checked, input[name='thema_code']:checked, input[name='rermst_kind']:checked"), function() {
				ga('send', 'event', 'search', 'click', 'chk_'+$("label[for='"+$(this).attr('id')+"']").attr('title'), 1);
				});

                showLoadingBox("loading_zone");

                $("#form_search").submit();
            });
            residoCodeChange("01");


            /*auto submit 막기~!*/
            $("html").keydown(function (e) {
                if (e.keyCode == 13) {
                    //return false;
                }
            });

            $("#rersrm_term").val("1");
            $("#room_user").val("2");
            $("#repay_type").val("0");

            EasyDropDownInit();

        });

        //시도구분 변경시 이벤트
        function residoCodeChange(gugun_code) {
            var sido_code = $("#resido_code").val();
            var opts = {
                type: "post"
        , url: "/inc/tobe_changegugun.asp?sido_code=" + sido_code + "&gugun_code=" + (gugun_code || "") + "&totalYn=Y"
        , beforeSend: function () {
        }
        , success: function (data) {

            $("#QuickGugun").html("");
            $("#QuickGugun").html(data);
            easydropdownForSelector("regugun_code");
        }
        , error: function (data, status, err) {
        }
        , complete: function () {
        }
            };
        $.ajax(opts);
}

</script>
</form>
<!--검색영역 끝-->
<!--매인배너 하단 중단 배너-->
	<div class="middle_banner" style="margin:0 auto;text-align:center;">
	   	
    </div>
	<!--매인배너 하단 중단 배너 끝-->