window.ne_tgm_util = window.ne_tgm_util || {};

window.ne_tgm_util.eventHandler = window.ne_tgm_util.eventHandler || {};
window.ne_tgm_util.eventHandler.timer = window.ne_tgm_util.eventHandler.timer || null;
window.ne_tgm_util.eventHandler.timerExecCnt = 0;

var ne_g_handler;
window.ne_tgm_util.eventHandler.addEvent = function(element, type, handler) {
	ne_g_handler = ne_g_handler || handler;
	if (element.addEventListener) { // W3C DOM
		if(type=="ready") type = "DOMContentLoaded";
		element.addEventListener(type,handler,false);
	} else if (element.attachEvent) { // IE DOM
		if(type=="ready") type = "readystatechange";
		element.attachEvent("on"+type, handler);
	}
};

var ne_g_done = ne_g_done || false;
var ne_g_ready = ne_g_ready || [];
window.ne_tgm_util.eventHandler.domReady = function(f) {
	if(ne_g_done) return f();

	if(window.ne_tgm_util.eventHandler.timer) {
		ne_g_ready.push(f);
	} else {
		ne_g_ready = [f];
		window.ne_tgm_util.eventHandler.addEvent(window, "load", window.ne_tgm_util.eventHandler.isDomReady);
		window.ne_tgm_util.eventHandler.timer = window.ne_tgm_util.eventHandler.timer || setInterval(window.ne_tgm_util.eventHandler.isDomReady, 13);
	}
};
window.ne_tgm_util.eventHandler.isDomReady = function() {
	window.ne_tgm_util.eventHandler.timerExecCnt++;

	if(window.ne_tgm_util.eventHandler.timerExecCnt > 5) {
		clearInterval(window.ne_tgm_util.eventHandler.timer);
		window.ne_tgm_util.eventHandler.timer = null;
		return null;
	}

	if(ne_g_done) return false;
	if(document && document.getElementsByTagName && document.getElementById && document.body) {
		clearInterval(window.ne_tgm_util.eventHandler.timer);
		window.ne_tgm_util.eventHandler.timer = null;

		if(ne_g_ready) {
			for(var  i = 0 ; i < ne_g_ready.length ; i++) {
				if(ne_g_ready[i]) ne_g_ready[i]();
			}
		}

		ne_g_done = null;
		ne_g_done = true;
	}
};

/* return javascript source what our Array -> target Array */
window.ne_tgm_util.arrayToArray = function(neArr, mappingMap, objName) {
	var rtnStr = "[";
	for(var i = 0 ; i < neArr.length ; i++) {
		if(i > 0) { rtnStr += ","; }

		if(objName) {
			rtnStr += "{\"" + objName + "\":";
		};

		rtnStr += "{";
		var j = 0 ;
		for(var p in neArr[i]) {
			if(mappingMap[p]) {
				if(j > 0) rtnStr += ",";
				if([mappingMap[p].type] == "D") { /* for string type */
					rtnStr += "\"" + [mappingMap[p].targetName] + "\" : \"" + neArr[i][p] + "\"";
				} else if([mappingMap[p].type] == "S") { /* for string type */
					rtnStr += "\'" + [mappingMap[p].targetName] + "\" : \"" + neArr[i][p] + "\'";
				} else {
					rtnStr += "\"" + [mappingMap[p].targetName] + "\" : " + neArr[i][p];
				}

				j++;
			};
		};
		rtnStr += "}";

		if(objName) {
			rtnStr += "}";
		};
	};
	rtnStr += "]";
	return rtnStr;
};

window.ne_tgm_util.arrayToString = function(neArr, ourAttrName, seperator) {
	var rtnStr = "";
	var j = 0 ;
	for(var i = 0 ; i < neArr.length ; i++) {
		for(var p in neArr[i]) {
			if(p == ourAttrName) {
				if(j > 0) rtnStr += seperator;
				rtnStr += neArr[i][p]
				j++;
			}
		}
	}

	return rtnStr;
};

window.ne_tgm_util.findElements = function(rule) {
	var segArr = rule.split(">");

	var targetArr = [document];
	for(var i = 0 ; i < segArr.length ; i++) {
		var rullArr = segArr[i].match(/([a-zA-Z0-9_\-\.\/\*]+)/g); // A[B=C] �� 媛숈� 猷곗뿉�� A,B,C瑜� 遺꾨━�쒗궡.

		var findingTagName = rullArr[0];
		var findingAttrNameArr = [], findingAttrValueArr = [];

		if(findingTagName.indexOf(".") > -1) { // if rule contain class attribute
			var findingTagNameArr = findingTagName.split(".");
			findingTagName = findingTagNameArr[0];

			for(var classIdx = 1 ; classIdx < findingTagNameArr.length ; classIdx++) {
				findingAttrNameArr.push("class");
				findingAttrValueArr.push(findingTagNameArr[classIdx]);
			}
		}

		var searchElemNth;
		if(rullArr[1]) findingAttrNameArr.push(rullArr[1]);
		if(rullArr.length == 2) {
			if(rullArr[1] && Number(rullArr[1]) != NaN) searchElemNth = Number(rullArr[1]);
		} else {
			if(rullArr[2]) findingAttrValueArr.push(rullArr[2]);
			if(rullArr[3] && Number(rullArr[3]) != NaN) searchElemNth = Number(rullArr[3]);
		}

		var newTargetArr = [];
		for(var t = 0 ; t < targetArr.length ; t++) {
			var findedTagArr = [];
			if(targetArr[t] == document) {
				findedTagArr = targetArr[t].getElementsByTagName(findingTagName);
			} else { // document留� �꾩껜 Tag瑜� ���곸쑝濡� 寃��됲븯怨� 洹� �댄썑�� sibling�� child noe�먯꽌 寃���.
				var childNodeArr = targetArr[t].childNodes;
				for(var childNodeIdx = 0 ; childNodeIdx < childNodeArr.length ; childNodeIdx++) {
					if(childNodeArr[childNodeIdx].tagName && childNodeArr[childNodeIdx].tagName == findingTagName.toUpperCase()) {
						findedTagArr.push(childNodeArr[childNodeIdx]);
					}
				}
			}

			var findedCnt = 0;
			for(var v = 0 ; v < findedTagArr.length ; v++) {
				if((findingAttrNameArr.length == 0 && findingAttrValueArr.length == 0) || window.ne_tgm_util.isMatchAttr(findedTagArr[v], findingAttrNameArr, findingAttrValueArr)) {
					if(searchElemNth != undefined && findedCnt != searchElemNth) {findedCnt++;continue;}
					findedCnt++; // if find elem then

					// target clear
					newTargetArr.push(findedTagArr[v]);
				}
			}
		}

		searchElemNth = undefined;

		targetArr = null;
		targetArr = newTargetArr;
	}

	return targetArr;
};

window.ne_tgm_util.getAttribute = function(elem, attrName) {
	if(elem.getAttribute && elem.getAttribute(attrName)) {
		return elem.getAttribute(attrName);
	} else if(elem.attributes[attrName]) {
		return elem.attributes[attrName].nodeValue;
	}  else if(elem[attrName]) {
		return elem[attrName];
	}
	return undefined;
};

window.ne_tgm_util.indexOfArr = function(arr, val) {
	if(!Array.indexOf) {
		for (var i = 0; i < arr.length; i++) {
			if (arr[i] == val) {
				return i;
			}
		}
		return -1;
	} else {
		return arr.indexOf(val);
	}
};

window.ne_tgm_util.isMatchAttr = function(elem, findingAttrNameArr, findingAttrValueArr) {
	for(var i = 0 ; i < findingAttrNameArr.length ; i++) {
		if(findingAttrNameArr[i] == "class") {
			if(window.ne_tgm_util.getAttribute(elem, "class")) {
				var classArr = window.ne_tgm_util.getAttribute(elem, "class").split(" ");
				if(classArr && window.ne_tgm_util.indexOfArr(classArr, findingAttrValueArr[i]) > -1) {
					continue;
				}
			}
			return false;
		} else if(findingAttrValueArr[i] && findingAttrValueArr[i].indexOf("*") == findingAttrValueArr[i].length - 1) { // startWith 湲곕뒫
			var str = findingAttrValueArr[i].substring(0, findingAttrValueArr[i].length - 1);
			if(!window.ne_tgm_util.getAttribute(elem, findingAttrNameArr[i]) || window.ne_tgm_util.getAttribute(elem, findingAttrNameArr[i]).indexOf(str) != 0) return false;
		} else if(findingAttrValueArr[i] && window.ne_tgm_util.getAttribute(elem, findingAttrNameArr[i]) != findingAttrValueArr[i]) {
			return false;
		}
	}
	return true;
};

window.ne_tgm_util.setItemsByNameTagName = function(argumentsArr, param) {
	param = param || {}, param.rule = param.rule || "";

	var targetArr = window.ne_tgm_util.findElements(param.rule);

	if(!targetArr || !(targetArr instanceof Array) || targetArr.length <= 0 || targetArr[0] == document) return {text:function(){},attr:function() {}}; // not found

	return {
		text : function() {
			var argumentArrIdx = 0;
			for(var v = 0 ; v < targetArr.length ; v++) {
				var textVal;
				if(targetArr[v].textContent) {
					textVal = targetArr[v].textContent;
				} else if(targetArr[v].innerText) {
					textVal = targetArr[v].innerText;
				}

				if(textVal) {
					var contentTxt = textVal.replace(/<script\b[^<]*(?:(?!<\/script>)<[^<]*)*<\/script>/gi,'');
					contentTxt = contentTxt.replace(/\n/gi,'');

					window.ne_tgm_util.setArgunmentVarForFindTagName(argumentsArr, param, contentTxt, argumentArrIdx);
				}
				argumentArrIdx++;
			}
		}, attr : function(getAttrName) {
			var argumentArrIdx = 0;
			for(var v = 0 ; v < targetArr.length ; v++) {
				if(window.ne_tgm_util.getAttribute(targetArr[v], getAttrName)) {
					var attrVal = window.ne_tgm_util.getAttribute(targetArr[v], getAttrName).replace(/[<\[][^>]*[>\]]/gi,'');

					window.ne_tgm_util.setArgunmentVarForFindTagName(argumentsArr, param, attrVal, argumentArrIdx);
				}
				argumentArrIdx++;
			}
		}
	}
};

window.ne_tgm_util.setArgunmentVarForFindTagName = function(argumentsArr, param, contentTxt, argumentArrIdx) {
	if(param.filterFunc && typeof param.filterFunc == 'function') {
		contentTxt = param.filterFunc(contentTxt);
	}
	if(contentTxt) {
		if(argumentsArr instanceof Array === true) {
			argumentsArr[argumentArrIdx]=argumentsArr[argumentArrIdx]||{};
			argumentsArr[argumentArrIdx][param.ourAttrName] = argumentsArr[argumentArrIdx][param.ourAttrName] || contentTxt;
		} else {
			argumentsArr=argumentsArr||{};
			argumentsArr[param.ourAttrName] = argumentsArr[param.ourAttrName] || contentTxt;
		}
	}
};

window.ne_tgm_util.setItemsByJsVar = function(argumentsArr, param) {
	param.jsVar = param.jsVar || "", param.propertyName = param.propertyName||"";
	if(param.jsVar instanceof Array === false) {
		if(argumentsArr instanceof Array === true) {
			argumentsArr[0] = argumentsArr[0] || {};
			argumentsArr[0][param.ourAttrName] = argumentsArr[0][param.ourAttrName] || param.jsVar;
		} else {
			argumentsArr = argumentsArr || {};
			argumentsArr[param.ourAttrName] = argumentsArr[param.ourAttrName] || param.jsVar;
		}
	}
};

window.ne_tgm_util.setItemsByUrlParamVar = function(argumentsArr, param) {
	param.jsVar = param.urlParam || "", param.propertyName = param.propertyName||"";
	if(param.urlParam instanceof Array === false) {
		if(argumentsArr instanceof Array === true) {
			argumentsArr[0] = argumentsArr[0] || {};
			argumentsArr[0][param.ourAttrName] = argumentsArr[0][param.ourAttrName] || window.ne_tgm_util.getParameterValueInUrl(param.urlParam);
		} else {
			argumentsArr = argumentsArr || {};
			argumentsArr[param.ourAttrName] = argumentsArr[param.ourAttrName] || window.ne_tgm_util.getParameterValueInUrl(param.urlParam);
		}
	}
};

window.ne_tgm_util.getParameterValueInUrl = function(paramName, url) {
	var url = url || document.URL;

	var re = new RegExp(".*[?&]" + paramName + "=([^&]+)(&|$)");
	var match = url.match(re);
	return(match ? match[1] : "");
};

/* relate event in cart page */
window.ne_tgm_event = {};
window.ne_tgm_event.cart = {};

if(!window.ne_tgm_q || window.ne_tgm_q instanceof Array) {
	var oldQueue = window.ne_tgm_q || [];
	var neEventObj = window.ne_tgm_util.eventHandler;

	window.ne_tgm_q = function() {
		var init = {
			neIframeId : "ne_tgmiframe",
			queue : [],
			ifrmObj : null,
			initInfoMap : {
			"tagType":"",
			"device":"",
			"pageEncoding":"",
			"orderNo" :"",
			"items" :[],
			"referrer":"",
			"currentUrl":"",
			"searchKeyword":"",
			"totalPrice":"0",
			"loginId":""
			},
			itemInitInfoMap : {
				"id":"",
				"price":"0",
				"quantity":"0",
				"category":"",
				"imgUrl":"",
				"name":"",
				"desc":"",
				"link":""
			}
		},
		debugInfoArr = [],
		getCookieValue = function(name) {
			var allCookies = document.cookie;
			if(allCookies == "") return ;

			var pos = allCookies.indexOf(name + "=");

			if(pos != -1) {
				var start = pos + (name + "=").length;
				var end = allCookies.indexOf(";", start);
				if(end == -1) end = allCookies.length;
				var value = allCookies.substring(start, end);
				value = decodeURIComponent(value);

				return value;
			}
			return null;
		}, getDocumentObj = function(parentObj) {
			try {
				var content = (parentObj.contentWindow ? parentObj.contentWindow.document:undefined) || parentObj.contentDocument;
				return content;
			} catch(e) {
			}
			return null;
		}, makeExecScriptStr = function(argumentIdx) {
			if (!init.queue[argumentIdx]) {
				return;
			}

			var tagTp = init.queue[argumentIdx].tagType.toLowerCase();

			window.ne_tgm_util.getHeadTagScript = window.ne_tgm_util.getHeadTagScript || function () {return "";};
			window.ne_tgm_util.getBodyTagScript = window.ne_tgm_util.getBodyTagScript || function () {return "";};

			var bdTag = "";
			var hdTag = "";

			window.ne_tgm_util.getHeadTagScript = function() {
return hdTag + "<script>var debugInfoArr = debugInfoArr || [];var callStart = callStart || function(dspName, tagType) {    var debugInfo = {};    debugInfo.dspName = dspName;    debugInfo.tagType = tagType;    debugInfo.success = false;    debugInfoArr[dspName + \"_\" + tagType] = debugInfo;};var callComplete = callComplete || function(dspName, tagType) {    if(debugInfoArr[dspName + \"_\" + tagType]) {        debugInfoArr[dspName + \"_\" + tagType].success = true;    } else {        var debugInfo = {};        debugInfo.dspName = dspName;        debugInfo.tagType = tagType;        debugInfo.success = true;        debugInfoArr[dspName + \"_\" + tagType] = debugInfo;    }};\x3c/script>"; };
window.ne_tgm_util.getBodyTagScript = function() {
return bdTag + "<script>var debugInfoArr = debugInfoArr || [];var callStart = callStart || function(dspName, tagType) {    var debugInfo = {};    debugInfo.dspName = dspName;    debugInfo.tagType = tagType;    debugInfo.success = false;    debugInfoArr[dspName + \"_\" + tagType] = debugInfo;};var callComplete = callComplete || function(dspName, tagType) {    if(debugInfoArr[dspName + \"_\" + tagType]) {        debugInfoArr[dspName + \"_\" + tagType].success = true;    } else {        var debugInfo = {};        debugInfo.dspName = dspName;        debugInfo.tagType = tagType;        debugInfo.success = true;        debugInfoArr[dspName + \"_\" + tagType] = debugInfo;    }};\x3c/script>"; };
var bdTag = window.ne_tgm_util.getBodyTagScript();
 window.ne_tgm_util.getBodyTagScript = function() {
 return bdTag + "<script>callStart('toast_exchange', 'all');\x3c/script><script>var ne_adv_id=\"1729568793\";\x3c/script><script>callComplete('toast_exchange', 'all');\x3c/script>";
};

var bdTag = window.ne_tgm_util.getBodyTagScript();
 window.ne_tgm_util.getBodyTagScript = function() {
 return bdTag + "<script>callStart('ne_dmp', 'common_tail');\x3c/script><script>var ne_dmp_executed=ne_dmp_executed || false;if(ne_dmp_executed === false) {var ne_dmp_target_frame;try {  ne_dmp_target_frame= document.createElement('<iframe name=\"ne_dmp_target_frame\">');} catch (ex) {  ne_dmp_target_frame= document.createElement('iframe');}ne_dmp_target_frame.setAttribute(\"id\", \"ne_dmp_target_frame\");ne_dmp_target_frame.setAttribute(\"name\", \"ne_dmp_target_frame\");ne_dmp_target_frame.setAttribute(\"width\", \"0\");ne_dmp_target_frame.setAttribute(\"height\", \"0\");ne_dmp_target_frame.setAttribute(\"style\", \"position:absolute;width:0px;height:0px;\");ne_dmp_target_frame.setAttribute(\"scrolling\", \"no\");ne_dmp_target_frame.setAttribute(\"frameborder\", \"0\");document.body.appendChild(ne_dmp_target_frame);var ne_dmp_form = document.createElement(\"form\");ne_dmp_form.setAttribute(\"name\", \"ne_dmp_form\");ne_dmp_form.setAttribute(\"method\", \"POST\");ne_dmp_form.setAttribute(\"action\", \"//adlc-exchange.toast.com/log\");ne_dmp_form.setAttribute(\"target\", \"ne_dmp_target_frame\");var ne_dmp_form_u = document.createElement(\"input\");ne_dmp_form_u.setAttribute(\"value\", encodeURIComponent(\"" + init.queue[argumentIdx].currentUrl+ "\"));ne_dmp_form_u.setAttribute(\"type\", \"hidden\");ne_dmp_form_u.setAttribute(\"name\", \"u\");var ne_adv_id= ne_adv_id|| \"\";var ne_dmp_form_advid = document.createElement(\"input\");ne_dmp_form_advid.setAttribute(\"value\", ne_adv_id);ne_dmp_form_advid.setAttribute(\"type\", \"hidden\");ne_dmp_form_advid.setAttribute(\"name\", \"advid\");var ne_dmp_form_r = document.createElement(\"input\");ne_dmp_form_r.setAttribute(\"value\", encodeURIComponent(\"" + init.queue[argumentIdx].referrer+ "\"));ne_dmp_form_r.setAttribute(\"type\", \"hidden\");ne_dmp_form_r.setAttribute(\"name\", \"r\");var ne_dmp_form_code = document.createElement(\"input\");ne_dmp_form_code.setAttribute(\"value\", \"" + init.queue[argumentIdx].pageEncoding+ "\");ne_dmp_form_code.setAttribute(\"type\", \"hidden\");ne_dmp_form_code.setAttribute(\"name\", \"code\");var ne_dmp_form_items = document.createElement(\"input\");ne_dmp_form_items.setAttribute(\"value\", encodeURIComponent('{\"items\":" + init.queue[argumentIdx].items_20 + "}'));ne_dmp_form_items.setAttribute(\"type\", \"hidden\");ne_dmp_form_items.setAttribute(\"name\", \"target\");var ne_dmp_form_action = document.createElement(\"input\");ne_dmp_form_action.setAttribute(\"value\", encodeURIComponent(\"" + {tagType:{home:'visit', list:'visit', etc:'visit', detail:'view', cart:'cart', conversion:'buy', login:'login', join:'visit', search:'search',visit:'visit'}}.tagType[init.queue[argumentIdx].tagType]  + "\"));ne_dmp_form_action.setAttribute(\"type\", \"hidden\");ne_dmp_form_action.setAttribute(\"name\", \"action\");ne_dmp_form.appendChild(ne_dmp_form_u);ne_dmp_form.appendChild(ne_dmp_form_advid);ne_dmp_form.appendChild(ne_dmp_form_r);ne_dmp_form.appendChild(ne_dmp_form_code);ne_dmp_form.appendChild(ne_dmp_form_items);ne_dmp_form.appendChild(ne_dmp_form_action);document.body.appendChild(ne_dmp_form);ne_dmp_form.submit();ne_dmp_executed = true;}\x3c/script><script>callComplete('ne_dmp', 'common_tail');\x3c/script>";
};

init.queue[argumentIdx].items_20_mappingMap={"category":{"targetName":"cat","type":"D"},"desc":{"targetName":"idesc","type":"D"},"id":{"targetName":"id","type":"D"},"imgUrl":{"targetName":"img","type":"D"},"link":{"targetName":"link","type":"D"},"name":{"targetName":"iname","type":"D"},"price":{"targetName":"price","type":"I"},"quantity":{"targetName":"count","type":"I"}};
init.queue[argumentIdx].items_20=window.ne_tgm_util.arrayToArray(init.queue[argumentIdx].items, init.queue[argumentIdx].items_20_mappingMap, "item");


			return "<!DOCTYPE html><html><head>"+unescape(window.ne_tgm_util.getHeadTagScript())+"</head><body>" + unescape(window.ne_tgm_util.getBodyTagScript()) + "</body></html>";
		},called = false, loaded = false, tagExcutedArr = [], callTagFunc = null;

		(function(documentObj, func) {
			try {
				if(called === true) return ;
				called = true;
				callTagFunc = func;
				neEventObj.domReady(func);
			} catch(e) {
			}
		})(document, function(e) {
			try {
				loaded = true; // 1�뚮쭔 �ㅽ뻾

				for(var queueIdx = 0 ; queueIdx < init.queue.length ; queueIdx++) {
					if(!tagExcutedArr[queueIdx]) {
                        var ne_tgm_iframeObj = document.createElement("iframe");
                        var procNeIfrmaeId = init.neIframeId + "_" + queueIdx;
                        ne_tgm_iframeObj.setAttribute("id", procNeIfrmaeId);
                        ne_tgm_iframeObj.setAttribute("width", "0");
                        ne_tgm_iframeObj.setAttribute("height", "0");
                        ne_tgm_iframeObj.setAttribute("style", "position:absolute;width:0px;height:0px;display:none;");

                        init.c = makeExecScriptStr(queueIdx);

                        if (ne_tgm_iframeObj) {
                            ne_tgm_iframeObj.setAttribute("src", "about:blank");
                            document.body.appendChild(ne_tgm_iframeObj);

                            var e = getDocumentObj(ne_tgm_iframeObj);
							if(e == null) throw "content is null";
                            if (e) {
                                e.open("text/html", "replace");
                                e.write(init.c);
                                e.close();
                                init.ifrmObj = document.all[procNeIfrmaeId].contentWindow;
                                tagExcutedArr[queueIdx] = true;
                            }

                        }
                    }
                }
			} catch(e) {
				try {
                    for(var queueIdx = 0 ; queueIdx < init.queue.length ; queueIdx++) {
                        var procNeIfrmaeId = init.neIframeId + "_" + queueIdx;
                        var ne_tgm_iframeObj;
                        if(!document.all[procNeIfrmaeId] || document.all[procNeIfrmaeId].length <= 0) {
                            ne_tgm_iframeObj = document.createElement("iframe");
                        } else {
							if(document.all[procNeIfrmaeId] instanceof Array) {
                                ne_tgm_iframeObj = document.all[procNeIfrmaeId][0];
							} else {
                                ne_tgm_iframeObj = document.all[procNeIfrmaeId];
                            }
						}

                        ne_tgm_iframeObj.setAttribute("id", procNeIfrmaeId);
                        ne_tgm_iframeObj.setAttribute("width", "0");
                        ne_tgm_iframeObj.setAttribute("height", "0");
                        ne_tgm_iframeObj.setAttribute("style", "position:absolute;width:0px;height:0px;display:none;");
                        var str = "javascript:'<script>window.onload=function(){try{document.write(\\'<script>document.domain=\\\"" + document.domain + "\\\";parent.window.ne_tgm_q.writeFrame(" + queueIdx + ");<\\\\/script>\\');document.close();} catch(e){} };<\/script>'";
                        ne_tgm_iframeObj.setAttribute("src", str);
                        document.body.appendChild(ne_tgm_iframeObj);
                    }
				} catch(e1) {
				}
			}
		});

		return {
			push : function() {
				for(var argumentIdx = 0 ; argumentIdx < arguments.length ; argumentIdx++) {
                    arguments[argumentIdx]['items'] = arguments[argumentIdx]['items'] || [];

					try {
						
                    } catch(e) {
                    }

                    arguments[argumentIdx].referrer = arguments[argumentIdx].referrer || encodeURIComponent(document.referrer);
					arguments[argumentIdx].currentUrl = arguments[argumentIdx].currentUrl || encodeURIComponent(document.URL);

					/* null check */
					for(p in init.initInfoMap) {
						if(!arguments[argumentIdx][p]) {
							arguments[argumentIdx][p] = init.initInfoMap[p];
						} else {
							if(p == 'totalPrice') {
								arguments[argumentIdx][p] = "" + arguments[argumentIdx][p];
								arguments[argumentIdx][p] = arguments[argumentIdx][p].replace(/[^0-9.]/g,'');
								arguments[argumentIdx][p] = arguments[argumentIdx][p] || 0;
							}
						}
					}

                    if(arguments[argumentIdx]['items'].length > 0) {
						for(var items_idx = 0 ; items_idx < arguments[argumentIdx]['items'].length ; items_idx++) {
							for(ip in init.itemInitInfoMap) {
								if(!arguments[argumentIdx]['items'][items_idx][ip]) {
									arguments[argumentIdx]['items'][items_idx][ip] = init.itemInitInfoMap[ip];
								} else {
									if(ip == 'price' || ip == 'quantity') {
										arguments[argumentIdx]['items'][items_idx][ip] = "" + arguments[argumentIdx]['items'][items_idx][ip];
										arguments[argumentIdx]['items'][items_idx][ip] = arguments[argumentIdx]['items'][items_idx][ip].replace(/[^0-9.]/g,'');
                                        arguments[argumentIdx]['items'][items_idx][ip] = arguments[argumentIdx]['items'][items_idx][ip] || 0;
									}
								}
							}
						}
					}

					init.queue.push(arguments[argumentIdx]);

					if(loaded == true && !tagExcutedArr[init.queue.length - 1]) { // 濡쒕뵫�� �섏뿀�붾뜲 諛⑷툑 push�� �곗씠�곕줈 �쒓렇媛� �꾩쭅 �몄텧�� �섏� �딆� 寃쎌슦
                        callTagFunc.apply(this, []);
                    }

                    var ourScriptTag = window.ne_tgm_util.findElements("script[src=//static.tagmanager.toast.com/tag/view/*]");

					var asyncFlag = true;
					if(ourScriptTag) {
						for(var asyncIdx = 0 ; asyncIdx < ourScriptTag.length ; asyncIdx++) {
							if(!window.ne_tgm_util.getAttribute(ourScriptTag[asyncIdx], "async") || window.ne_tgm_util.getAttribute(ourScriptTag[asyncIdx], "async") == "false") {
								asyncFlag = false;
                            } else {
                                asyncFlag = true;
								break;
                            }
                        }
                    }

                    if(asyncFlag == false && loaded == false) { // onload�댄썑�� �몄텧�섎뒗 寃� 諛⑹�.
						var tagTp = arguments[argumentIdx]['tagType'] || "";
						window.ne_tgm_util.getBodyTagScript = window.ne_tgm_util.getBodyTagScript || function() {return "";};

						

                        document.writeln(unescape(window.ne_tgm_util.getBodyTagScript()));
						window.ne_tgm_util.getBodyTagScript = null;
                    }
				}
			}, writeFrame : function(queueIdx) {
				if(!tagExcutedArr[queueIdx]) {
					var procNeIfrmaeId = init.neIframeId + "_" + queueIdx;
					var ne_tgm_iframeObj;

                    if(document.all[procNeIfrmaeId] instanceof Array) {
                        ne_tgm_iframeObj = document.all[procNeIfrmaeId][0];
                    } else {
                        ne_tgm_iframeObj = document.all[procNeIfrmaeId];
                    }

					var e = getDocumentObj(ne_tgm_iframeObj);
					if (e) {
						e.writeln(init.c); // IE�섏쐞 踰꾩쟾�먯꽌 replace瑜� �섎땲 onload�대깽�멸� 怨꾩냽 諛쒖깮(?)�섏뿬 臾댄븳猷⑦봽 �꾨뒗 寃� 媛숈쓬.
						init.ifrmObj = document.all[procNeIfrmaeId].contentWindow;
						tagExcutedArr[queueIdx] = true;
					}
				}
			}, callStart : function(dspName, tagType) {
                // for Debug
                var debugInfo = {};
                debugInfo.dspName = dspName;
                debugInfo.tagType = tagType;
                debugInfo.success = false;
                debugInfoArr[dspName + "_" + tagType] = debugInfo;
            }, callComplete : function(dspName, tagType) {
				// for Debug
				if(debugInfoArr[dspName + "_" + tagType]) {
                    debugInfoArr[dspName + "_" + tagType].success = true;
                } else {
                    var debugInfo = {};
                    debugInfo.dspName = dspName;
                    debugInfo.tagType = tagType;
                    debugInfo.success = true;
                    debugInfoArr[dspName + "_" + tagType] = debugInfo;
                }
            }, showDebugInfo : function() {
                // for Debug
                for(var initIdx = 0 ; initIdx < init.queue.length ; initIdx++) {
                    var debugInfoArrInFrame = document.getElementById(init.neIframeId + "_" + initIdx).contentWindow.debugInfoArr;
                    for (var dii in debugInfoArrInFrame) {
                        if (debugInfoArrInFrame[dii]) {
                            debugInfoArr[dii] = debugInfoArrInFrame[dii];
                        }
                    }
                }

                var ne_tgm_debugLayerObj = document.createElement("div");
                ne_tgm_debugLayerObj.setAttribute("id", "ne_tgm_debugLayerObj");
                ne_tgm_debugLayerObj.setAttribute("style", "display:none;word-break: break-word;width:650px;color: #777;font-size:12px;position:fixed;z-index:3999;top:0px;left:0px;-webkit-box-shadow: 0 1px 2px 0 #777;box-shadow: 0 1px 2px 0 #777;background-color:#ffffff;");
                document.body.appendChild(ne_tgm_debugLayerObj);

                var debugInfoDiv = document.createElement("div");

				var debugStr = "";
                debugStr += "<ul style='list-style:square outside none;padding:0 0 30px 30px;'>";
				debugStr += "<li>** DSP Tag Status **</li>";
                for(var di in debugInfoArr) {
					if(debugInfoArr.hasOwnProperty(di)) {
                        debugStr += "<li>";
                        if (debugInfoArr[di].success) {
                            debugStr += "<font color='green'>[SUCCESS] ";
                        } else {
                            debugStr += "<font color='red'>[FAIL] ";
                        }
                        debugStr += debugInfoArr[di].dspName + " : " + debugInfoArr[di].tagType;
                        debugStr += "</font>";
                        debugStr += "</li>";
                    }
                }
				debugStr += "</ul>";

				// argument
                debugStr += "<ul style='list-style:square outside none;padding:0 0 0 30px;'>";
                debugStr += "<li><strong>** Parameter Info **</strong></li>";
				for(var ai = 0 ; ai < init.queue.length ; ai++) {
					for(var attr in init.queue[ai]) {
						if(attr == "items" && init.queue[ai][attr] instanceof Array) { // item info print
                            debugStr += "<li><strong>Items Info</strong></li>";
							for(var itemIdx = 0 ; itemIdx < init.queue[ai]["items"].length ; itemIdx++) {
                                for(var itemAttr in init.queue[ai]["items"][itemIdx]) {
                                    debugStr += "<li style=\"padding:0 0 0 50px;\"> <strong>��" + itemAttr + " : </strong>" + init.queue[ai]["items"][itemIdx][itemAttr] + "</li>";
                                }
                            }
                        } else {
                            debugStr += "<li><strong>" + attr + " : </strong>" + init.queue[ai][attr] + "</li>";
                        }
                    }
                }
                debugStr += "</ul>";

                debugInfoDiv.innerHTML = debugStr;

                ne_tgm_debugLayerObj.appendChild(debugInfoDiv);

                ne_tgm_debugLayerObj.style.display = "block";
            }
		}
	}();

	window.ne_tgm_q.push.apply(window.ne_tgm_q, oldQueue);
};
