
var EasyDropDownInitInstances = {};
(function ($) {
    $(document).ready(function () {

        var EasyDropDownInit = null;
        var userBrowser = navigator.userAgent.toLowerCase();
        var dropdownLink = '<script type="text/javascript" src="jquery.easydropdown.custom.js"></script>';
        var dropdownLinkIe7 = '<script type="text/javascript" src="jquery.easydropdown.custom.ie7.js"></script>';
        var tempIeType = ""
        //브라우져가 크롬이면
        if (userBrowser.indexOf("chrome") != -1) {
            //alert(dropdownLink);
            // $("title").append(dropdownLink);
        }
        //브라우져가 IE이면
        else if (userBrowser.indexOf("msie 7") > -1) {
            //alert("IE browser");
            tempIeType = "IE7";
            //$("title").append(dropdownLinkIe7);
        }
        //기타 브라우져
        else {
            //alert("etc");
            // $("title").append(dropdownLink);
        }
        EasyDropDownInit = EasyDropDownInitSet(tempIeType);
        EasyDropDownInit();

        $('.pension_list li:nth-child(6)').css('border-right', 'none');
        $('.pension_list li:nth-child(12)').css('border-right', 'none');
        $('.pension_list li:nth-child(18)').css('border-right', 'none');
        $('.pension_list li:nth-child(24)').css('border-right', 'none');

        $('.top_banner_area .banner_close').click(function () {
            $('.top_banner_area').css('display', 'none');
        });

        $('.gnb_search_area .btn_detail').click(function () {
            $('.search_detail').toggle();
            $('.gnb_search_area .btn_detail').find('a').toggleClass('view');
        });

        $('.close_search').click(function () {
            $('.search_detail').hide();
            $('.gnb_search_area .btn_detail').find('a').removeClass('view');
        });

        $('.main_tab > li').click(function () {
            $(this).siblings().removeClass('on');
            $(this).siblings().find('img').attr('src', $(this).siblings().find('img').attr('src').replace(/_on/g, '_off'));
            $(this).addClass('on');
            $(this).find('img').attr('src', $(this).find('img').attr('src').replace(/_off/g, '_on'));
        });

        $('.best_rolling > ul > li > a').click(function () {
            $(this).parent().siblings().find('a').removeClass('on');
            $(this).addClass('on');
            return false;
        });

        function addon() {
            $(this).siblings().removeClass('on');
            $(this).addClass('on');
            return false;
        }

        $('.list_array .btn a').click(addon);
        $('.select_theme a').click(addon);
        $('.local_choice > li').click(addon);
        //$('.hot_place > ul > li').click(addon);
        //$('.pension_list > ul > li').click(addon);
        $('.img_tab > li').click(addon);
        $('.inner_tab > li').click(addon);
        $('.urgency_tab > ul > li').click(addon);
        $('.pop_tab li').click(addon);
        $('.urgency_paging a').click(addon);

        if ($('.best_rolling li').length == 7) {
            $('.best_rolling li:nth-child(7) a').css('border-right', 'none');
        }

        /* 2014-10-14 YTEom : 요청으로 인해 기능 삭제
        $('.list_thumb li').bind('mouseover', function () {
            $(this).children('.dim_area').show();
        });
        $('.list_thumb li').bind('mouseleave', function () {
            $(this).children('.dim_area').hide();
        });*/
        $('.list_thumb li').bind('mouseover', function () {
            if ($(this).find(".outline").size() < 1) {
                $(this).prepend("<div class='outline'></div>");
            }
        });
        $('.list_thumb li').bind('mouseleave', function () {
            $(this).find('.outline').remove();
        });


        $('.pen_list li').bind('mouseover', function () {
            $(this).children('.dim_area').show();
        });
        $('.pen_list li').bind('mouseleave', function () {
            $(this).children('.dim_area').hide();
        });

        $('.img_view').bind('mouseover', function () {
            $('.img_expansion').show();
        });
        $('.img_view').bind('mouseleave', function () {
            $('.img_expansion').hide();
        });

        $('.img_expansion').click(function () {
            var winH = $('body').height();
            $('.view_img_layer').css('visibility', 'visible');
            $('.dim_area').show();
            $('.dim_area').css('height', winH);
        });

        $('.view_img_layer .view_layer_close').click(function () {
            $('.view_img_layer').css('visibility', 'hidden');
            $('.dim_area').hide();
        });

        $('#map1').click(function () {
            $('.map_area').show();
            $('.map_area2').hide();
            return false;
        });
        $('#map2').click(function () {
            $('.map_area2').show();
            $('.map_area').hide();
            return false;
        });

        $('.list_list .btn_toggle').click(function () {
            var obj = $(this).siblings().find('table');
            if (obj.is(':hidden')) {
                obj.parent().show();
                $(this).find('img').attr('src', $(this).find('img').attr('src').replace(/_open/g, '_close'));
            } else {
                obj.parent().hide();
                $(this).find('img').attr('src', $(this).find('img').attr('src').replace(/_close/g, '_open'));
            }
            return false;
        });

        $('.pension_info td input[type=image]').bind('mouseover', function () {
            //alert('1');
            $(this).parent().find('.tip').show();
        });
        $('.pension_info td input[type=image]').bind('mouseleave', function () {
            $('.tip').hide();
        });


        // 통합검색
        $('.total_search .more').click(function () {
            $('.popular_all').hide();
            $(this).siblings('.popular_all').show();
        });
        $('.popular_all .close').click(function () {
            $(this).parent().hide();
        });

        $('.pick_date_area .col input').click(function () {
            $(this).parent().parent().toggleClass('choice');
        });

        /*
        // 실시간 예약확인 팝업
        function getCurrentStyle(element) {
        if (element.currentStyle) {
        return element.currentStyle;
        } else if (window.getComputedStyle) {
        return window.getComputedStyle(element);
        } else {
        return element.style;
        }
        }
        $('.room .off').bind('mouseover', function(){
        var target = event.target || event.srcElement; // event.target = Safari,Chrome,Opera,Firefox <> srcElement = IE
        var divTop = target.offsetTop + parseInt(getCurrentStyle(target).height); // 클릭된 element의 y좌+표element의 실제 높이
        var divLeft = target.offsetLeft + parseInt(getCurrentStyle(target).width)/2 - 51; // 60에서 51로 수정
        $('.off_pop').css({
        top: divTop
        , left: divLeft
        }).show();
        $('body').css('overflow-x','hidden');
        });
        $('.room .off').bind('mouseleave', function(){
        $('.off_pop').hide();
        });
        */

        // image slider
        fnc_ShowSlideList = function (id, v_direction, v_scroll, v_circular, v_infinite, v_auto) {
            //if($('.'+id).length > 0){
            $('.' + id).carouFredSel({
                items: {
                    //height: v_height
                },
                prev: {
                    button: function () {
                        return $(this).parent().siblings(".prev");
                    }
                },
                next: {
                    button: function () {
                        return $(this).parent().siblings(".next");
                    }
                },
                //height: v_height, // 리스트 높이 (화면이 잘릴경우에만 입력한다.)
                direction: v_direction, // 슬라이드 방향
                scroll: v_scroll, // 한번에 이동시킬 아이템 수
                circular: v_circular, // 좌우 버튼 클릭시 무한루프 옵션
                infinite: v_infinite, // 좌우 이동시 마지막일 경우 다시 시작/끝으로 되돌릴지 선택옵션
                auto: v_auto
            });
            //}
        };

        $(window).resize(function () {
            var winW = $(window).width();

            if (winW > 1100) {
                //alert(winW);
                $('.img_pension').css({ 'width': winW });
            } else {
                //alert(winW);
                $('.img_pension').css({ width: winW, 'min-width': '1100px' });
                return false;
            }
        });

    });
})(jQuery);

function mainImg() {
    var winW = $(window).width();

    if (winW > 1100) {
        $('.img_pension').css('width', winW);
    } else {
        $('.img_pension').css({ width: winW, 'min-width': '1100px' });
        return false;
    }
}





/* 브라우저  버전에 따른 select box 디자인 정하는 함수 정하기 시작 - EasyDropDownInitSet*/
function EasyDropDownInitSet(type) {

    if (type == "IE7") {

        EasyDropDownInit = function () {
            var easyDropDownSelector = $.easyDropDownSelector || "";
            $(easyDropDownSelector).show();
            $(".dropdown").show();
        }

    }
    else {

        EasyDropDownInit = function () {
            EasyDropDownInitInstances = EasyDropDownInitInstances || {};
            (function ($) {

                function EasyDropDown() {
                    this.isField = true,
		this.down = false,
		this.inFocus = false,
		this.disabled = false,
		this.cutOff = false,
		this.hasLabel = false,
		this.keyboardMode = false,
		this.nativeTouch = true,
		this.wrapperClass = 'dropdown',
		this.onChange = null;
                };

                EasyDropDown.prototype = {
                    constructor: EasyDropDown,
                    instances: {},
                    init: function (domNode, settings) {
                        var self = this;

                        $.extend(self, settings);
                        self.$select = $(domNode);
                        self.id = domNode.id;
                        self.options = [];
                        self.$options = self.$select.find('option');
                        self.isTouch = 'ontouchend' in document;
                        self.$select.removeClass(self.wrapperClass + ' dropdown');
                        if (self.$select.is(':disabled')) {
                            self.disabled = true;
                        };
                        if (self.$options.length) {
                            self.$options.each(function (i) {
                                var $option = $(this);
                                if ($option.is(':selected')) {
                                    self.selected = {
                                        index: i,
                                        title: $option.text()
                                    }
                                    self.focusIndex = i;
                                };
                                if ($option.hasClass('label') && i == 0) {
                                    self.hasLabel = true;
                                    self.label = $option.text();
                                    $option.attr('value', '');
                                } else {
                                    self.options.push({
                                        domNode: $option[0],
                                        title: $option.text(),
                                        value: $option.val(),
                                        selected: $option.is(':selected')
                                    });
                                };
                            });
                            if (!self.selected) {
                                self.selected = {
                                    index: 0,
                                    title: self.$options.eq(0).text()
                                }
                                self.focusIndex = 0;
                            };
                            self.render();
                        };
                    },

                    render: function () {
                        var self = this,
				touchClass = self.isTouch && self.nativeTouch ? ' touch' : '',
				disabledClass = self.disabled ? ' disabled' : '';

                        self.$container = self.$select.wrap('<div class="' + self.wrapperClass + touchClass + disabledClass + '"><span class="old"/></div>').parent().parent();
                        self.$active = $('<span class="selected">' + self.selected.title + '</span>').appendTo(self.$container);
                        self.$carat = $('<span class="carat"/>').appendTo(self.$container);
                        self.$scrollWrapper = $('<div><ul/></div>').appendTo(self.$container);
                        self.$dropDown = self.$scrollWrapper.find('ul');
                        self.$form = self.$container.closest('form');
                        $.each(self.options, function () {
                            var option = this,
					active = option.selected ? ' class="active"' : '';
                            self.$dropDown.append('<li' + active + '>' + option.title + '</li>');
                        });
                        self.$items = self.$dropDown.find('li');

                        if (self.cutOff && self.$items.length > self.cutOff) self.$container.addClass('scrollable');

                        self.getMaxHeight();

                        if (self.isTouch && self.nativeTouch) {
                            self.bindTouchHandlers();
                        } else {
                            self.bindHandlers();
                        };
                    },

                    getMaxHeight: function () {
                        var self = this;

                        self.maxHeight = 0;

                        for (i = 0; i < self.$items.length; i++) {
                            var $item = self.$items.eq(i);
                            self.maxHeight += $item.outerHeight();
                            if (self.cutOff == i + 1) {
                                break;
                            };
                        };
                    },

                    bindTouchHandlers: function () {
                        var self = this;
                        self.$container.on('click.easyDropDown', function () {
                            self.$select.focus();
                        });
                        self.$select.on({
                            change: function () {
                                var $selected = $(this).find('option:selected'),
						title = $selected.text(),
						value = $selected.val();

                                self.$active.text(title);
                                if (typeof self.onChange === 'function') {
                                    self.onChange.call(self.$select[0], {
                                        title: title,
                                        value: value
                                    });
                                };
                            },
                            focus: function () {
                                self.$container.addClass('focus');
                            },
                            blur: function () {
                                self.$container.removeClass('focus');
                            }
                        });
                    },

                    bindHandlers: function () {
                        var self = this;
                        self.query = '';
                        self.$container.on({
                            'click.easyDropDown': function () {
                                if (!self.down && !self.disabled) {
                                    self.open();
                                } else {
                                    self.close();
                                };
                            },
                            'mousemove.easyDropDown': function () {
                                if (self.keyboardMode) {
                                    self.keyboardMode = false;
                                };
                            }
                        });

                        $('body').on('click.easyDropDown.' + self.id, function (e) {
                            var $target = $(e.target),
					classNames = self.wrapperClass.split(' ').join('.');

                            if (!$target.closest('.' + classNames).length && self.down) {
                                self.close();
                            };
                        });

                        self.$items.on({
                            'click.easyDropDown': function () {
                                var index = $(this).index();
                                self.select(index);
                                self.$select.focus();
                            },
                            'mouseover.easyDropDown': function () {
                                if (!self.keyboardMode) {
                                    var $t = $(this);
                                    $t.addClass('focus').siblings().removeClass('focus');
                                    self.focusIndex = $t.index();
                                };
                            },
                            'mouseout.easyDropDown': function () {
                                if (!self.keyboardMode) {
                                    $(this).removeClass('focus');
                                };
                            }
                        });

                        self.$select.on({
                            'focus.easyDropDown': function () {
                                self.$container.addClass('focus');
                                self.inFocus = true;
                            },
                            'blur.easyDropDown': function () {
                                self.$container.removeClass('focus');
                                self.inFocus = false;
                            },
                            'keydown.easyDropDown': function (e) {
                                if (self.inFocus) {
                                    self.keyboardMode = true;
                                    var key = e.keyCode;

                                    if (key == 38 || key == 40 || key == 32) {
                                        e.preventDefault();
                                        if (key == 38) {
                                            self.focusIndex--
                                            self.focusIndex = self.focusIndex < 0 ? self.$items.length - 1 : self.focusIndex;
                                        } else if (key == 40) {
                                            self.focusIndex++
                                            self.focusIndex = self.focusIndex > self.$items.length - 1 ? 0 : self.focusIndex;
                                        };
                                        if (!self.down) {
                                            self.open();
                                        };
                                        self.$items.removeClass('focus').eq(self.focusIndex).addClass('focus');
                                        if (self.cutOff) {
                                            self.scrollToView();
                                        };
                                        self.query = '';
                                    };
                                    if (self.down) {
                                        if (key == 9 || key == 27) {
                                            self.close();
                                        } else if (key == 13) {
                                            e.preventDefault();
                                            self.select(self.focusIndex);
                                            self.close();
                                            return false;
                                        } else if (key == 8) {
                                            e.preventDefault();
                                            self.query = self.query.slice(0, -1);
                                            self.search();
                                            clearTimeout(self.resetQuery);
                                            return false;
                                        } else if (key != 38 && key != 40) {
                                            var letter = String.fromCharCode(key);
                                            self.query += letter;
                                            self.search();
                                            clearTimeout(self.resetQuery);
                                        };
                                    };
                                };
                            },
                            'keyup.easyDropDown': function () {
                                self.resetQuery = setTimeout(function () {
                                    self.query = '';
                                }, 1200);
                            }
                        });

                        self.$dropDown.on('scroll.easyDropDown', function (e) {
                            if (self.$dropDown[0].scrollTop >= self.$dropDown[0].scrollHeight - self.maxHeight) {
                                self.$container.addClass('bottom');
                            } else {
                                self.$container.removeClass('bottom');
                            };
                        });

                        if (self.$form.length) {
                            self.$form.on('reset.easyDropDown', function () {
                                var active = self.hasLabel ? self.label : self.options[0].title;
                                self.$active.text(active);
                            });
                        };
                    },

                    unbindHandlers: function () {
                        var self = this;

                        self.$container
				.add(self.$select)
				.add(self.$items)
				.add(self.$form)
				.add(self.$dropDown)
				.off('.easyDropDown');
                        $('body').off('.' + self.id);
                    },

                    open: function () {
                        var self = this,
				scrollTop = window.scrollY || document.documentElement.scrollTop,
				scrollLeft = window.scrollX || document.documentElement.scrollLeft,
				scrollOffset = self.notInViewport(scrollTop);

                        self.closeAll();
                        self.getMaxHeight();
                        self.$select.focus();
                        //window.scrollTo(scrollLeft, scrollTop+scrollOffset);
                        self.$container.addClass('open');
                        self.$scrollWrapper.css('height', self.maxHeight + 'px');
                        self.$dropDown.css('height', self.maxHeight + 'px');
                        self.down = true;
                    },

                    close: function () {
                        var self = this;
                        self.$container.removeClass('open');
                        self.$scrollWrapper.css('height', '0px');
                        self.focusIndex = self.selected.index;
                        self.query = '';
                        self.down = false;
                    },

                    closeAll: function () {
                        var self = this,
                        //instances = Object.getPrototypeOf(self).instances;
                instances = EasyDropDownInitInstances;
                        for (var key in instances) {
                            var instance = instances[key];
                            instance.close();
                        };
                    },

                    select: function (index) {
                        var self = this;

                        if (typeof index === 'string') {
                            index = self.$select.find('option[value=' + index + ']').index() - 1;
                        };

                        var option = self.options[index],
				selectIndex = self.hasLabel ? index + 1 : index;
                        self.$items.removeClass('active').eq(index).addClass('active');
                        self.$active.text(option.title);
                        self.$select
				.find('option')
				.removeAttr('selected')
				.eq(selectIndex)
				.prop('selected', true)
				.parent()
				.trigger('change');

                        self.selected = {
                            index: index,
                            title: option.title
                        };
                        self.focusIndex = i;
                        if (typeof self.onChange === 'function') {
                            self.onChange.call(self.$select[0], {
                                title: option.title,
                                value: option.value
                            });
                        };
                    },

                    search: function () {
                        var self = this,
				lock = function (i) {
				    self.focusIndex = i;
				    self.$items.removeClass('focus').eq(self.focusIndex).addClass('focus');
				    self.scrollToView();
				},
				getTitle = function (i) {
				    return self.options[i].title.toUpperCase();
				};

                        for (i = 0; i < self.options.length; i++) {
                            var title = getTitle(i);
                            if (title.indexOf(self.query) == 0) {
                                lock(i);
                                return;
                            };
                        };

                        for (i = 0; i < self.options.length; i++) {
                            var title = getTitle(i);
                            if (title.indexOf(self.query) > -1) {
                                lock(i);
                                break;
                            };
                        };
                    },

                    scrollToView: function () {
                        var self = this;
                        if (self.focusIndex >= self.cutOff) {
                            var $focusItem = self.$items.eq(self.focusIndex),
					scroll = ($focusItem.outerHeight() * (self.focusIndex + 1)) - self.maxHeight;

                            self.$dropDown.scrollTop(scroll);
                        };
                    },

                    notInViewport: function (scrollTop) {
                        var self = this,
				range = {
				    min: scrollTop,
				    max: scrollTop + (window.innerHeight || document.documentElement.clientHeight)
				},
				menuBottom = self.$dropDown.offset().top + self.maxHeight;

                        if (menuBottom >= range.min && menuBottom <= range.max) {
                            return 0;
                        } else {
                            return (menuBottom - range.max) + 5;
                        };
                    },

                    destroy: function () {
                        var self = this;
                        self.unbindHandlers();
                        self.$select.unwrap().siblings().remove();
                        self.$select.unwrap();
                        //delete Object.getPrototypeOf(self).instances[self.$select[0].id];
                        delete EasyDropDownInitInstances[self.$select[0].id];
                    },

                    disable: function () {
                        var self = this;
                        self.disabled = true;
                        self.$container.addClass('disabled');
                        self.$select.attr('disabled', true);
                        if (!self.down) self.close();
                    },

                    enable: function () {
                        var self = this;
                        self.disabled = false;
                        self.$container.removeClass('disabled');
                        self.$select.attr('disabled', false);
                    }
                };

                var instantiate = function (domNode, settings) {
                    domNode.id = !domNode.id ? 'EasyDropDown' + rand() : domNode.id;
                    var instance = new EasyDropDown();
                    /*if (!instance.instances[domNode.id]) {
                    instance.instances[domNode.id] = instance;
                    instance.init(domNode, settings);
                    };*/
                    if (!EasyDropDownInitInstances[domNode.id]) {
                        EasyDropDownInitInstances[domNode.id] = instance;
                        instance.init(domNode, settings);
                    };
                },
		rand = function () {
		    return ('00000' + (Math.random() * 16777216 << 0).toString(16)).substr(-6).toUpperCase();
		};

                $.fn.easyDropDown = function () {
                    var args = arguments,
			dataReturn = [],
			eachReturn;

                    eachReturn = this.each(function () {
                        if (args && typeof args[0] === 'string') {
                            //var data = EasyDropDown.prototype.instances[this.id][args[0]](args[1], args[2]);
                            var data = EasyDropDownInitInstances[this.id][args[0]](args[1], args[2]);
                            if (data) dataReturn.push(data);
                        } else {
                            instantiate(this, args[0]);
                        };
                    });

                    if (dataReturn.length) {
                        return dataReturn.length > 1 ? dataReturn : dataReturn[0];
                    } else {
                        return eachReturn;
                    };
                };

                $(function () {
                    if (typeof Object.getPrototypeOf !== 'function') {
                        if (typeof 'test'.__proto__ === 'object') {
                            Object.getPrototypeOf = function (object) {
                                return object.__proto__;
                            };
                        } else {
                            Object.getPrototypeOf = function (object) {
                                return object.constructor.prototype;
                            };
                        };
                    };

                    var selector = $.easyDropDownSelector || "select.dropdown";
                    $.easyDropDownSelector = "";


                    $(selector).each(function () {
                        var json = $(this).attr('data-settings');
                        settings = json ? $.parseJSON(json) : {};
                        instantiate(this, settings);
                    });
                });
            })(jQuery);
        }





    }
    return EasyDropDownInit;


}

/* 브라우저  버전에 따른 select box 디자인 정하는 함수 정하기 끝 - EasyDropDownInitSet*/

