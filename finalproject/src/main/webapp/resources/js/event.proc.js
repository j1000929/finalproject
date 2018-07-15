/*-- table row별로 다른색 표시 및 마우스 롤오버 처리 ------------------------------------*/
function gridEventInit()
{
	$('.list_box tr:nth-child(odd)').css('background','#ffffff').attr('row','odd');
	$('.list_box tr:nth-child(even)').css('background','#fafdfe').attr('row','even');
	$('.list_box tr').mouseover(function(){
		$(this).css('background','#ccffcc');
	}).mouseout(function(){
		if($(this).attr('row')=='odd') { $(this).css('background','#ffffff'); }
		else { $(this).css('background','#fafdfe'); }
	});
}

/*-- table cell별로 다른색 표시 및 마우스 롤오버 처리 -----------------------------------*/
function cellEventInit()
{
	$('.celllist td').css('background','#ffffff');
	$('.celllist td').mouseover(function(){
		$(this).css('background','#dfdfde');
	}).mouseout(function(){
		$(this).css('background','#ffffff');
	});
}

/*-- 버튼 마우스 롤오버 처리 ------------------------------------------------------------*/
function buttonEventInit()
{
	$(".button").mouseover(function(){
		$(this).css( {'background':'#4b5c88', 'color':'#fff', 'cursor':'pointer'} );
	}).mouseout(function(){
		$(this).css( {'background':'#5c6d99', 'color':'#fff'} );
	});
}


/*-- 리스트 상자 로딩 처리 --------------------------------------------------------------*/
function ajaxListLoading(id,surl,param)
{
	$('#'+id).html('');
	showLoadingBox(id);
	$.post(surl, param, function(data){
		$('#'+id).html(data).ready(function(){
			hideLoadingBox();
			gridEventInit();
		});
	});
}


/*-- 리스트에서 전체 체크 버튼을 클릭한 경우 --------------------------------------------*/
function listCheckAll(o)
{
	var b = o.checked;
	//var chk = list_area.getElementsByTagName('INPUT');
	var chk = o.parentNode.parentNode.parentNode.parentNode.getElementsByTagName('INPUT');

	for(var i=0; i<chk.length; i++){
		if(chk[i].name=='chk[]') {
			chk[i].checked = b;
		}
	}
}


/*-- 지정한 레이어를 투명하게 만든다. --------------------------------------------*/
/*	o : 투명 레이어를 표시할 object의 id (object 영역에만 투명 레이어 표시)
		생략시 화면 전체에 레이어 표시
*/
function disable_screen(o)
{
	if(o==undefined || o==null) {
		var w = $(document).width();
		var h = $(document).height();

		if(document.getElementById('_hidden_view_frame')==null) { $("<div id='_hidden_view_frame'></div>").appendTo('body'); }
	} else {
		$('#'+o).css('position', 'relative');
		var w = $('#'+o).width();
		var h = $('#'+o).height();

		//if(h<200) { $('#'+o).height(100); h=200; }

		if(document.getElementById('_hidden_view_frame')==null) { $("<div id='_hidden_view_frame'></div>").appendTo($('#'+o)); }
	}
	$("#_hidden_view_frame").css({
		'position':'absolute',
		'left':'0px', 'top':'0px',
		'width':w+'px', 'height':h+'px',
		'background':'#000',
		'zIndex':'10'
	}).css('opacity',0.2);
}

/*-- 투명 레이어를 제거한다. --------------------------------------------*/
function enable_screen() {
	$('#_hidden_view_frame').remove();
}



/*-- 투명 레이어를 표시하고 로딩 박스를 표시한다. ------------------------*/
function showLoadingBox(pid)
{
	var lw = 170;
	var lh = 70;

	if(pid!=null) {
		disable_screen(pid);
		$("<div id='_view_loading_box'></div>").appendTo($('#'+pid));	// loading box
	} else {
		disable_screen();
		$("<div id='_view_loading_box'></div>").appendTo('body');	// loading box
	}

	var w = $('#_hidden_view_frame').width();		// parent-layer width
	var h = $('#_hidden_view_frame').height();		// parent-layer height

	var left = parseInt((w-lw-4)/2);	// loading box left pos.
	var top  = parseInt((h-lh-4)/2);

	// loading box
	$("#_view_loading_box").css({
		'position':'absolute',
		'left':left+'px',
		'top':top+'px',
		'width':lw+'px',
		'height':lh+'px',
		'background':'#fefeff',
		'border':'2px solid #667',
		'text-align':'center',
		'zIndex':'12'
	}).html("<div style='padding:10px 0;'><img src='/images/loading/ajax-loader2.gif' style='margin-top:"+parseInt((lh-66)/2)+"px;' /></div>Loading...");
}
function hideLoadingBox()
{
	$('#_view_loading_box').remove();
	enable_screen();
}

// 리스트 상자 로딩 처리


// view 상자 로딩 처리
function ajaxViewLoading(surl)
{
	showLoadingBox('view_area');

	$.post(surl, function(data){
		$('#view_area').html(data).ready(function(){
			hideLoadingBox();
		});
	});
}


/* 화면에 정보창을 표시 레이어로 */
		var popupbox_width  = 10;
		var popupbox_height = 10;

		function showPopupBox(w,h,shadow,sideclick)
		{
			if(shadow!=null && shadow=='side_shadow'){
				if(sideclick!=null && sideclick=='side_click_enable'){
					disable_screen_click('hidePopupBox');
				}else{
					disable_screen();
				}
			}
			var left = 0;
			var top  = 0;
			var bodyw  = $(window).width();
			var bodyh  = $(window).height();
			var scrtop = $(document).scrollTop();

			if(bodyw>w) { left = parseInt((bodyw-w-4)/2); }
			if(bodyh>h) { top  = scrtop + parseInt((bodyh-h-4)/2); }

			if(document.getElementById('_popup_view_box')==null) {
				$("<div id='_popup_view_box'></div>").appendTo('body');
			}
			$("#_popup_view_box").css({
				'position':'absolute',
				'left':left+'px',
				'top':top+'px',
				'width':w+'px',
				'height':h+'px',
				'background':'#fff',
				'border':'2px solid #555',
				'zIndex':'20',
				'overflow-x':'hidden',
				'display':'none',
				'overflow-y':'auto'
			}).fadeIn();

			popupbox_width  = w;
			popupbox_height = h;

			$(window).scroll(function(){
				var w = popupbox_width;
				var h = popupbox_height;
				var left = 0;
				var top  = 0;
				var bodyw = $(window).width();
				var bodyh = $(window).height();
				var scrtop = $(document).scrollTop();

				if(bodyw>w) { left = parseInt((bodyw-w-4)/2); }
				if(bodyh>h) { top  = scrtop + parseInt((bodyh-h-4)/2); }

				$("#_popup_view_box").css({
					'left':left+'px',
					'top':top+'px',
					'width':w+'px',
					'height':h+'px'
				});
			});
			$(window).resize(function(){
				var w = popupbox_width;
				var h = popupbox_height;
				var left = 0;
				var top  = 0;
				var bodyw = $(window).width();
				var bodyh = $(window).height();
				var scrtop = $(document).scrollTop();

				if(bodyw>w) { left = parseInt((bodyw-w-4)/2); }
				if(bodyh>h) { top  = scrtop + parseInt((bodyh-h-4)/2); }

				$("#_hidden_view_frame").css({
					'width':$(document).width()+'px',
					'height':$(document).height()+'px'
				});
				$("#_popup_view_box").css({
					'left':left+'px',
					'top':top+'px',
					'width':w+'px',
					'height':h+'px'
				});
			});
		}
		function hidePopupBox()
		{
			$('#_popup_view_box').remove();
			enable_screen();

			$(window).scroll();
			$(window).resize();
		}

/* 화면에 정보창을 표시 레이어로 끝 */



/* 화면을 투명하게 레이어 프레임을 표시 */

		var old_position = '';
		var old_id = null;

		/*
		   disable_screen_click(callback,o) : 투명 레이어를 표시하고, 바탕을 클릭시 callback 함수를 실행한다.

		   o : 투명 레이어를 표시할 부모 object의 id값. 생략시 화면 전체에 레이어를 그린다
		   callback : 실행할 함수
		*/
		function disable_screen_click(callback,o)
		{
			disable_screen(o);
			$("#_hidden_view_frame").click(function(){
				window[callback]();
			});
		}

/* 화면을 투명하게 레이어 프레임을 표시 끝 */