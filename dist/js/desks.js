var posname = "";

function loading() {
	$('#myLoadingModal').modal('show');
}

function loadingdismiss() {
	$('#myLoadingModal').modal('hide');
}
function pkeydown(){
	if(window.event.keyCode==13){
		$('#loginModal').modal('hide');
		login(false);
	}
}

function ukeydown(){
	if(window.event.keyCode==13){
		document.getElementById("inputpassword").focus();
	}
}


function winload(){
		//loadfunc();
	$("#myFunctionsModal").draggable({
		handle : ".modal-header"
	});
	$("#loginModal").draggable({
		handle : ".modal-header"
	});
	$("#myFunctionsModal1").draggable({
		handle : ".modal-header"
	});
	$("#myFunctionsModal2").draggable({
		handle : ".modal-header"
	});
	$("#userinfoModal").draggable({
		handle : ".modal-header"
	});
	$("#myFunctionsModal3").draggable({
		handle : ".modal-header"
	});
	$("#myLoadingModal").draggable({
		handle : ".modal-header"
	});
	$("#getRandomSentenceModal").draggable({
		handle : ".modal-header"
	});

	$("#confirmsubmitModal").draggable({
		handle : ".modal-header"
	});
	$("#NullInstantiatedModal").draggable({
		handle : ".modal-header"
	});

	login(true);
	;// willchangesentence

	$.post("/assianno/servlet/GetLockFrameServlet", {}, function(data, status) {
		if (status == "success") {
			var lockframe = eval("(" + data + ")");
			var lfstr = "";
			$.each(lockframe, function(i, item) {
				lfstr += "<li>" + item.name + "</li>";
			});
			document.getElementById("lockframe").innerHTML = lfstr;
		}
	});
	loading();
	if (wcs != null) {
		document.getElementById("Separated Sentence").innerHTML="加载中，请稍后...";
		$.post("/assianno/servlet/ChangeMarkedSentenceServlet", {
			willchangesentenceid : wcs,
		}, function(data, status) {
			if (status == "success") {
				data = eval("(" + data + ")");
				displayseparated(data);
				loadingdismiss();
				/*
				 * var json = eval("(" + data + ")"); loginpage( json.username,
				 * json.auditcount); islogin = true; isconfirmseparated = false;
				 * document .getElementById("Separated Sentence").innerHTML =
				 * json.sentence; var jsons = json.audits; $ .each( jsons,
				 * function( n, item) { document
				 * .getElementById("audittable").innerHTML += "<tr><td>" +
				 * item.date + "</td><td>" + item.audit + "</td></tr>";
				 * });
				 */
			}
		});
	} else {
		wcs = -1;
	}
	loadingdismiss();
	$('input').iCheck({
		checkboxClass : 'icheckbox_flat-pink',
		radioClass : 'iradio_flat-pink'
	});
	/*
	 * $('input').on('ifClicked',function(event){ $('input').iCheck('uncheck');
	 * });
	 */
	$('input').on('ifUnchecked', function(event) {
	});
	$('input').on('ifChecked', function(event) {
		var posobjs = document.getElementsByName("POSradio");
		for (var i = 0; i < posobjs.length; i++) {
			if (posobjs[i].checked) {
				posname = posobjs[i].value;
			}
		}
	});

}

function getBrowserInfo() {
	var agent = navigator.userAgent.toLowerCase();

	var regStr_ie = /msie [\d.]+;/gi;
	var regStr_ff = /firefox\/[\d.]+/gi;
	var regStr_chrome = /chrome\/[\d.]+/gi;
	var regStr_saf = /safari\/[\d.]+/gi;
	// IE
	if ("ActiveXObject" in window) {
		if ((window.navigator.userProfile + '') == 'null') {
			return "360";
		} else {
			return "ie";
		}
	}

	// firefox
	if (agent.indexOf("firefox") > 0) {
		return agent.match(regStr_ff);
	}

	// Chrome
	if (agent.indexOf("chrome") > 0) {
		return agent.match(regStr_chrome);
	}

	// Safari
	if (agent.indexOf("safari") > 0 && agent.indexOf("chrome") < 0) {
		return agent.match(regStr_saf);
	}

}

function confirmfunc() {
	var objs = document.getElementsByName("Func");
	for (var i = 0; i < objs.length; i++) {
		if (objs[i].checked) {
			if (i == 1) {
				displayframeelement();
			} else if (i == 2) {
				displayinife();
			} else {
				$('#myFunctionsModal1').modal('show');
			}
		}
	}
}

function SelectionToString() {
	if (!islogin) {
		alert("请先登录!!!");
		return;
	}
	if (navigator.appName != "Microsoft Internet Explorer") {
		selection = window.getSelection();
		range = window.getSelection().getRangeAt(0);
		selectionstr = range.toString();
	} else {
		selection = document.selection;
		range = document.selection.createRange();
		selectionstr = range.text;
	}
	document.getElementById("ModalStrong").innerHTML = selectionstr;
}

function deletemark() {
	if (!islogin) {
		alert("请先登录!!!");
		return;
	}
	var str = new String();
	str = "";
	if (navigator.appName != "Microsoft Internet Explorer") {
		range = window.getSelection().getRangeAt(0);
		selectionstr = range.toString();
		str = selectionstr;
	} else {
		range = document.selection.createRange();
		selectionstr = range.text;
		str = range.text;
	}
	if (str.match(/<\S+-\w+-\S+\s.+\s>/)) {
		var r = confirm("将要删除标注:\n" + str);
		if (r) {
			str = str.replace(/<\S+-\S+-\S+ /, "");
			str = str.replace(/ >/, "");
			if (navigator.appName == "Netscape") {// chrome
				range.deleteContents();
				range.insertNode(document.createTextNode(str));
			} else {
				range.text = str;
			}
			document.getElementById("Separated Sentence").innerHTML = document
					.getElementById("Separated Sentence").innerHTML.replace(
					/\s+/g, " ");
			separatedsenstringarray[chooseframeindex] = document
					.getElementById("Separated Sentence").innerHTML;
		}

	} else if (str.match(/<\w+\sini>/)) {
		var r = confirm("将要删除标注：\n" + str);
		if (r) {
			str = str.replace(/<\w+\sini>/, "");
			if (navigator.appName == "Netscape") {// chrome
				range.deleteContents();
				range.insertNode(document.createTextNode(str));
			} else {
				range.text = str;
			}
			document.getElementById("Separated Sentence").innerHTML = document
					.getElementById("Separated Sentence").innerHTML.replace(
					/\s+/g, " ");
			separatedsenstringarray[chooseframeindex] = document
					.getElementById("Separated Sentence").innerHTML;
		}
	} else if (str.match(/<supp_\d+\s\S+\s>/)) {
		var r = confirm("将要删除标注：\n" + str);
		if (r) {
			str = str.replace(/<supp_\d+ /, "");
			str = str.replace(/ >/, "");
			if (navigator.appName == "Netscape") {// chrome
				range.deleteContents();
				range.insertNode(document.createTextNode(str));
			} else {
				range.text = str;
			}
			document.getElementById("Separated Sentence").innerHTML = document
					.getElementById("Separated Sentence").innerHTML.replace(
					/\s+/g, " ");
			separatedsenstringarray[chooseframeindex] = document
					.getElementById("Separated Sentence").innerHTML;
		}
	} else if (str.match(/{\S+-\w+-dni\s.+\s}/)) {
		var r = confirm("将要删除标注:\n" + str);
		if (r) {
			str = str.replace(/{\S+-\w+-dni /, "");
			str = str.replace(/ }/, "");
			if (navigator.appName == "Netscape") {// chrome
				range.deleteContents();
				range.insertNode(document.createTextNode(str));
			} else {
				range.text = str;
			}
			document.getElementById("Separated Sentence").innerHTML = document
					.getElementById("Separated Sentence").innerHTML.replace(
					/\s+/g, " ");
			separatedsenstringarray[chooseframeindex] = document
					.getElementById("Separated Sentence").innerHTML;
		}
	} else {
		var r = confirm("将要删除:\n" + str);
		if (r) {
			if (navigator.appName == "Netscape") {// chrome
				range.deleteContents();
				range.insertNode(document.createTextNode(""));
			} else {
				range.text = "";
			}
		}

		if (separatedsenstringarray != null
				&& separatedsenstringarray[chooseframeindex] != null) {
			separatedsenstringarray[chooseframeindex] = document
					.getElementById("Separated Sentence").innerHTML;
		}
	}
	document.getElementById("Separated Sentence").innerHTML = document
			.getElementById("Separated Sentence").innerHTML
			.replace(/\s+/g, " ");
}

function SeparationSentence() {
	if (!islogin) {
		alert("请先登录!!!");
		return;
	}
	initial();
	wcs = -1;
	var str = document.getElementById("SampleSentence").value;
	if (str == "" || str == null) {
		alert("输入错误！！！");
		return;
	}
	loading();
	$
			.post(
					"/assianno/servlet/SeparationSentenceServlet",
					{
						string : str
					},
					function(data, status) {
						loadingdismiss();
						if (status == "success") {
							var serverstatus = data.charAt(0);
							if (serverstatus == "1") {
								isconfirmseparated = false;
								data = data.substr(1);
								var jsons = $.parseJSON(data);
								var resultstr = "";
								$.each(eval(jsons),
										function(i, n) {
											resultstr += (n.lemma + "/"
													+ n.posmark + " ");
										});
								document.getElementById("Separated Sentence").innerHTML = resultstr;

							}
						}
					});

}

function addFrame() {
	frameelementjsonarray = new Array();
	document.getElementById("frameinfo").innerHTML = "<h1><strong>框架信息：</strong></h1>";
	for (var i = 0; i < FRAMECOUNT; i++) {
		allsupparray.push(new Array());
		// var str=$("#frameinfo").html()+"<div class='accordion-group'><div
		// class='panel-heading'><h4 class='panel-title'
		// style='background-color:#F2F2F2'><a class='accordion-toggle h2'
		// onclick='displayseparatedsenwithtgt("+i+")'
		// href='/assianno/servlet/GetFrameInformationWithID?frameid="+framejsonarray[i].frameid+"'
		// target='FrameInfo.jsp'>"+framejsonarray[i].framename+"</a><input
		// type='checkbox' name='framechoosecheck' value="+i+"
		// >操作此框架</h4></div><div id='frameinfo-"+i+"' class='accordion-body
		// collapse' style=border-style:outset>"+"There will be the NO."+i+"
		// textarea to describe the specific frame.</div></div>";
		var str = $("#frameinfo").html()
				+ "<div class='accordion-group'><div class='panel-heading'><h4 class='panel-title' style='background-color:#F2F2F2'><a class='accordion-toggle h2' data-toggle='collapse' onclick='displayseparatedsenwithtgt("
				+ i
				+ ")'  href='#frameinfo-"
				+ i
				+ "'>"
				+ framejsonarray[i].framename
				+ "</a><a class='h4'>已标注例句</a>"
				+ "<span class='badge'>"
				+ framejsonarray[i].nummarkedsentence
				+ "</span>"
				+ "<input type='checkbox' name='framechoosecheck' value="
				+ i
				+ " >提交此框架</h4></div><div id='frameinfo-"
				+ i
				+ "' class='accordion-body collapse' style=border-style:outset>"
				+ "There will be the NO." + i
				+ " textarea to describe the specific frame.</div></div>";
		var frameelementstr = "<div class='h3' id='framedes'>"
				+ framejsonarray[i].framedescription
				+ "<a class='btn' href='/assianno/servlet/GetFrameInformationWithID?frameid="
				+ framejsonarray[i].frameid
				+ "' target='FrameInfo.jsp'>查看更多...</a></div><table class='table table-hover table-condensed table-bordered' contenteditable='true'><thead><tr><th>编号</th><th>框架元素</th><th>框架元素英文名</th><th>是否核心</th></tr></thead><tbody id='frameelementtr"
				+ i + "'></tbody></table>";
		document.getElementById("frameinfo").innerHTML = str;
		document.getElementById("frameinfo-" + i).innerHTML = frameelementstr;
		document.getElementById("frameelement").innerHTML = "";
		$
				.each(
						eval("("
								+ framejsonarray[i].frameelementsjsonarrayString
								+ ")"),
						function(n, item) {
							frameelementjsonarray.push(item);
							var elementstr = $("#frameelementtr" + i).html()
									+ "<tr><td>" + n + "</td><td>"
									+ item.frameelementname + "</td><td>"
									+ item.frameelementname_en + "</td><td>"
									+ item.iscore + "</td></tr>";
							document.getElementById("frameelementtr" + i).innerHTML = elementstr;

						});
	}
	;
}

function displayframeelement() {
	$('#myFunctionsModal2').modal('show');
	document.getElementById("frameelement").innerHTML = "";

	document.getElementById("frameelement").innerHTML += "<li><input type='radio' name='frameelementradio' value='FE'>框架元素<div id='select_fes' style='height:200px;overflow:auto;'>"
			+ "</select></li>";
	document.getElementById("frameelement").innerHTML += "<li><input type='radio' name='frameelementradio' value='CFE'><select id='select_fe'><option value='!CFE'>通用非核心框架元素</option>"
			+ "</div></li>";
	document.getElementById("frameelement").innerHTML += "<li><input type='radio' name='frameelementradio' value='SUP'><select id='select_supp'><option value='supp'>支撑词</option><option value='null'>透明成分</option></select>";

	$
			.post(
					"/assianno/servlet/GetCommonFEServlet",
					function(data, status) {
						if (status == "success") {
							$
									.each(
											eval(data),
											function(n, item) {
												document
														.getElementById("select_fe").innerHTML += "<option value='"
														+ item.frameelement_en_short
														+ "'>"
														+ item.frameelementname
														+ "</option>";
											});
							$
									.each(
											eval("("
													+ framejsonarray[chooseframeindex].frameelementsjsonarrayString
													+ ")"),
											function(n, item) {
												var corestr = "";
												if (item.iscore == true) {
													corestr = "(核心)";
												} else {
													corestr = "(非核心)";
												}
												document
														.getElementById("select_fes").innerHTML += "<input type='checkbox' name='select_fes' value='"
														+ item.frameelement_en_short
														+ "' />"
														+ item.frameelementname
														+ corestr + "<br/>";
												/*
												 * var elementlistr = $(
												 * "#frameelement") .html() + "<li><input
												 * type='radio'
												 * name='frameelementradio'
												 * value='"+item.frameelement_en_short+"' >" +
												 * item.frameelementname + "</li>";
												 * document
												 * .getElementById("frameelement").innerHTML =
												 * elementlistr;
												 */
											});
						}
					});

	var supp_element_str = "<select id='suppindex'><option value='null'>请选择所属支撑词（如果存在）</option>";
	for (var i = 0; i < supparray.length; i++) {
		supp_element_str += "<option value='s" + (i + 1) + "'>" + supparray[i]
				+ "</option>";
	}
	document.getElementById("frameelement").innerHTML += supp_element_str
			+ "</select>";
}

// 留着待用
function filtersepasen(str) {
	var filterstr = "";
	if (str.charAt(0) == " ") {
		filterstr = " ";
	}
	for (var i = 0; i < str.length; i++) {
		var code = str.charCodeAt(i);
		if ((code > 0x4e00 && code < 0x9fff) || (code > 48 && code < 57)) {
			filterstr += str.charAt(i);
		}
		;
	}
	return filterstr;
}

function getlemmafromsentence(str) {
	/*
	 * var k = str.indexOf("/"); while (k != -1) { if (k + 2 < str.length) { str =
	 * str.substring(0, k) + str.substr(str.indexOf(" ", k + 1)); } else { str =
	 * str.substring(0, k); } k = str.indexOf("/"); } return str;
	 */
	str = str.replace(/\/\S+\s/g, "");
	str = str.replace(/\/\S+/g, "");
	return str;
}

function getsegmentfromsenetnce(str) {
	str = str.trim();
	var resustr = "";
	while (1) {
		resustr = str.substring(str.lastIndexOf(" ") + 1, str.lastIndexOf(">"))
				+ resustr;
		if (str.indexOf("<") != str.lastIndexOf("<")) {
			str = str.substring(0, str.lastIndexOf("<")).trim();
		} else {
			break;
		}
	}
	return resustr;
}

function getRandomSentenceFrameList() {
	if (!islogin) {
		alert("请先登录!!!");
		return;
	}
	if (framelist == null) {
		loading();
		$
				.post(
						"/assianno/servlet/GetFrameListServlet",
						{},
						function(data, status) {
							loadingdismiss();
							if (status == "success") {
								framelist = eval("(" + data + ")");
								var str = "<option value='-1'>--------</option>";
								$.each(framelist, function(i, item) {
									str += "<option value='" + item.id + "'>"
											+ item.frame_name + "</option>";
								});
								document
										.getElementById("randomsentenceframelist").innerHTML = str;
							}
						});
	}
	$('#getRandomSentenceModal').modal('show');

}

function changerangetext(posname) {
	loading();
	$.post("/assianno/servlet/GetPOSMarkServlet", {
		posname : posname
	}, function(data, status) {
		loadingdismiss();
		if (status == "success") {
			if (selectionstr.charAt(selectionstr.length - 1) == " ") {
				data += " ";
			}
			selectionstr = filtersepasen(selectionstr) + "/" + data;
			alert(selectionstr);
			if (navigator.appName == "Netscape") {// chrome
				range.deleteContents();
				range.insertNode(document.createTextNode(selectionstr));
			} else {
				range.text = selectionstr;
			}

		}
	});

}

function modifypos() {
	var str = "";
	var posobjs = document.getElementsByName("POSradio");
	for (var i = 0; i < posobjs.length; i++) {
		if (posobjs[i].checked) {
			str = posobjs[i].value;
			if (str == "n_s") {
				str = document.getElementById("n_s").value;
			}
			alert(str);
			/*
			 * var select = document.getElementById(str); str = select.value;
			 */
			break;
		}
	}
	if (str == "") {
		alert("没有选择词性！！！");
		return;
	}
	var lemma;
	if (navigator.appName == "Netscape") {// chrome
		lemma = getlemmafromsentence(range.toString());
		lemma = lemma.replace(/\s+/g, "");
		range.deleteContents();
		range
				.insertNode(document.createTextNode(" " + lemma + "/" + str
						+ " "));
		document.getElementById("Separated Sentence").innerHTML = document
				.getElementById("Separated Sentence").innerHTML.replace(/\s+/g,
				" ");
	} else {
		lemma = getlemmafromsentence(range.text);
		lemma = lemma.replace(/\s+/g, "");
		range.text = lemma + "/" + str + " ";
		document.getElementById("Separated Sentence").innerHTML = document
				.getElementById("Separated Sentence").innerHTML.replace(/\s+/g,
				" ");
	}
	newlibarray.push(lemma);
	if (chooseframeindex != -1) {
		separatedsenstringarray[chooseframeindex] = document
				.getElementById("Separated Sentence").innerHTML;
	}
}

function formatconfirmseparated() {
	var str = document.getElementById("Separated Sentence").innerHTML;
	return str;
	str = str.replace(/<strong>/g, "");
	str = str.replace("</strong>", "");
	var k = str.indexOf("&lt;");
	while (k != -1) {
		str = str.substring(0, k) + str.substr(str.indexOf(" ", k + 1) + 1);
		k = str.indexOf("lt;");
	}
	str = str.replace(/ &gt;/g, "");
	/*
	 * if(!isconfirmseparated){ str=str.replace(/ /g,""); } str=str.replace("<strong>","");
	 * str=str.replace("</strong>",""); var strs=str.split("&gt; &lt; "); var
	 * resultstr=""; for(var i=0;i<strs.length;i++){ strs[i]=strs[i].trim();
	 * var begin=strs[i].lastIndexOf(" "),end=strs[i].lastIndexOf("&gt;");
	 * if(begin<end){ strs[i]=strs[i].substring(begin+1,end); } else{
	 * strs[i]=strs[i].substr(begin+1); } resultstr+=strs[i]; }
	 * if(strs.indexOf("&lt;")==0){ strs=str.substr(1); }
	 */
	return str;
}

function confirmseparated() {
	if (!islogin) {
		alert("请先登录!!!");
		return;
	}
	var str = formatconfirmseparated();
	loading();
	$.post("/assianno/servlet/GetTargetServlet", {
		unformatstr : str
	}, function(data, status) {
		if (status == "success") {
			data = eval("(" + data + ")");
			displayseparated(data);
			/*
			 * data = eval("(" + data + ")"); var tgt = data.tgt; var pt =
			 * data.pt; var gf = data.gf; var ptstr = ""; var gfstr = ""; $
			 * .each( eval(pt), function(i, item) { var name = item.name; var
			 * ptmark = item.mark; ptstr += ("<li><input type='radio'
			 * name='typeofphrase' value='"+ptmark+"'>" + name + "</li>"); });
			 * document.getElementById("phrasetype").innerHTML = ptstr; $ .each(
			 * eval(gf), function(i, item) { var name = item.name; var gfmark =
			 * item.mark; gfstr += ("<li><input type='radio'
			 * name='grammarfunction' value='"+gfmark+"'>" + name + "</li>");
			 * }); document.getElementById("grammarfunction").innerHTML = gfstr;
			 */

			/*
			 * if (tgt == "null") { alert("没有目标词！！！"); return; }
			 * $.each(eval(tgt), function(i, item) {
			 * framejsonarray.push(item.frame); separatedsenjsonarray
			 * .push(item.separatedsenjson); lexicualunitsidarray
			 * .push(item.lexicalunitid); }); //FRAMECOUNT =
			 * framejsonarray.length;
			 */

			/*
			 * for (var i = 0; i < separatedsenjsonarray.length; i++) { var str =
			 * ""; var segmentjson = eval("(" +
			 * separatedsenjsonarray[i].segmentsjsonarrayString + ")"); $ .each(
			 * segmentjson, function(k, item) { if (item.istarget) { str += "<strong>
			 * &lt;tgt=" + framejsonarray[i].framename + " " +
			 * item.tostringwithmark + " &gt; </strong>"; } else { str +=
			 * item.tostringwithmark + " "; } });
			 * separatedsenstringarray.push(str); //separatedsenstring=str; }
			 */

		}
	});
};

function displayseparated(data) {
	isconfirmseparated = true;
	loadingdismiss();
	framejsonarray = new Array();
	separatedsenstringarray = new Array();
	lexicualunitsidarray = new Array();
	$.each(eval(data.mss), function(i, item) {
		framejsonarray.push(item.frame);
		separatedsenstringarray.push(item.marksentence);
		lexicualunitsidarray.push(item.lexicalunitid);
	});
	FRAMECOUNT = framejsonarray.length;
	addFrame();
	document.getElementById("Separated Sentence").innerHTML = data.separated;
}

function displayseparatedsenwithtgt(index) {
	supparray = allsupparray[index];
	chooseframeindex = index;
	if (chooseframeindex == -1) {
		alert("ERROR!!!");
		return;
	}
	document.getElementById("Separated Sentence").innerHTML = separatedsenstringarray[chooseframeindex];
};

function confirmmark() {
	var str = " <";
	var kstr = " > ";
	var feobjs = document.getElementsByName("frameelementradio");
	var f1 = true, f2 = true, f3 = true;
	for (var i = 0; i < feobjs.length; i++) {
		if (feobjs[i].checked) {
			if (feobjs[i].value == "SUP") {
				f1 = false;
				f2 = false;
				f3 = false;
				var select_suppstr = document.getElementById("select_supp").value;
				if (select_suppstr == "supp") {
					supparray.push(selectionstr);
					select_suppstr += ("_" + supparray.length);
					str += select_suppstr + " ";
				} else {
					str += select_suppstr + " ";
				}
			} else if (feobjs[i].value == "CFE") {
				if (document.getElementById("select_fe").value != "!CFE") {
					str += document.getElementById("select_fe").value;
					f1 = false;
				}
			} else {
				var feobjs = document.getElementsByName("select_fes");
				var hasselectfe = false;
				for (var i = 0; i < feobjs.length; i++) {
					if (feobjs[i].checked) {
						if (hasselectfe == true) {
							str += "+";
						}
						str += feobjs[i].value;
						hasselectfe = true;
						f1 = false;
					}
				}
				/*
				 * if (document.getElementById("select_fes").value != "!FE") {
				 * str += document.getElementById("select_fes").value; f1 =
				 * false; }
				 */
			}
			break;
		}
	}
	var tpobjs = document.getElementsByName("typeofphrase");
	if (f2) {
		for (var i = 0; i < tpobjs.length && f2 == true; i++) {
			if (tpobjs[i].checked) {
				str += "-" + tpobjs[i].value;
				f2 = false;
				break;
			}
		}
	}

	var gfobjs = document.getElementsByName("grammarfunction");
	if (f3) {
		for (var i = 0; i < gfobjs.length; i++) {
			if (gfobjs[i].checked) {
				if (gfobjs[i].value == "dni") {
					str += "-dni ";
					str = str.replace(" <", " {");
					kstr = " } ";
					f3 = false;
					break;
				}
				var supp_str_temp = document.getElementById("suppindex").value;
				if (supp_str_temp != "null") {
					supp_str_temp = "_" + supp_str_temp;
				} else {
					supp_str_temp = "";
				}
				str += "-" + gfobjs[i].value + supp_str_temp + " ";
				f3 = false;
				break;
			}
		}
	}
	if (f1) {
		alert("没有选择框架元素！！！");
		return;
	} else if (f2) {
		alert("没有选择短语类型！！！");
		return;
	} else if (f3) {
		alert("没有选择句法功能！！！");
		return;
	} else {
		/*
		 * var begin=false,end=false; if(selectionstr.indexOf(" ")==0){
		 * begin=true; } else if(selectionstr.indexOf("
		 * ")==selectionstr.length-1){ end=true; } if(selectionstr.lastIndexOf("
		 * ")==0){ begin=true; } else if(selectionstr.lastIndexOf("
		 * ")==selectionstr.length-1){ end=true; }
		 */
		if (navigator.appName == "Netscape") {// chrome
			range.deleteContents();
			range
					.insertNode(document.createTextNode(str + selectionstr
							+ kstr));
		} else {
			// range.text=str+getsegmentfromsenetnce(selectionstr)+" &gt;";
			selectionstr = selectionstr.trim();
			range.text = str + selectionstr + kstr;
			range = selection.createRange();
			/*
			 * var tempstr=document.getElementById("Separated
			 * Sentence").innerHTML; str=str.replace(/</g, "&lt;").trim(); var
			 * index=tempstr.indexOf(str+" "+selectionstr);
			 * 
			 * if(tempstr.indexOf("&lt;supp",index+8)!=-1){
			 * str=str.replace(/&lt;/g, "<"); range.text=str.trim()+"_s"+"
			 * "+selectionstr+" > "; }
			 */
		}
		document.getElementById("Separated Sentence").innerHTML = document
				.getElementById("Separated Sentence").innerHTML.replace(/\s+/g,
				" ");
		separatedsenstringarray[chooseframeindex] = document
				.getElementById("Separated Sentence").innerHTML;
		$('#myFunctionsModal2').modal('hide');
	}
}

function initial() {
	FRAMECOUNT = 0;
	selectionstr = "";
	range = null;
	framejsonarray = null;
	separatedsenjsonarray = null;
	lexicualunitsidarray = null;
	separatedsenstring = null;
	frameelementjsonarray = null;
	chooseframeindex = -1;
	newlibarray = new Array();
	separatedsenstringarray = null;
	isconfirmseparated = false;
	allsupparray = new Array();
	document.getElementById("frameinfo").innerHTML = "<h1><strong>框架信息：</strong></h1>";
	document.getElementById("frameelement").innerHTML = "";
	document.getElementById("Separated Sentence").innerHTML = "请输入句子进行分词";
}

function finish() {
	if (!islogin) {
		alert("请先登录!!!");
		return;
	}
	var checkobjs = document.getElementsByName("framechoosecheck");
	var sentencestrings = new Array();
	var framejsons = new Array();
	var lexicalunitarray = new Array();
	for (var i = 0; i < checkobjs.length; i++) {
		if (checkobjs[i].checked) {
			sentencestrings.push(separatedsenstringarray[i]);
			framejsons.push(framejsonarray[i]);
			lexicalunitarray.push(lexicualunitsidarray[i]);
		}
	}
	loading();
	$.post("/assianno/servlet/SubmitResultServlet", {
		sentencejsonarray : $.toJSON(sentencestrings),
		framejsonarray : $.toJSON(framejsons),
		lexicualunitsarray : $.toJSON(lexicalunitarray),
		wcs : wcs
	}, function(data, status) {
		if (status == "success") {
			alert("success!");
			initial();
			loadingdismiss();
		}
	});
}

function login(iscookie) {
	var username = document.getElementById("inputusername").value;
	var password = document.getElementById("inputpassword").value;
	var checked = "false";
	if ((iscookie == false) && (username == "" || password == "")) {
		alert("Input Wrong!");
		return;
	}
	if (iscookie == false) {
		loading();
		if (document.getElementById("isremember").checked) {
			checked = "true";
		}
	}
	$.post("/assianno/servlet/UserLoginServlet", {
		inputusername : username,
		inputpassword : password,
		iscookie : iscookie,
		ischecked : checked
	}, function(data, status) {
		if (iscookie == false) {
			loadingdismiss();
		}
		if (status == "success") {
			var returnobj = eval("(" + data + ")");
			if (returnobj.role == 5) {
				alert("该账号暂未通过审核。。。");
				return;
			}
			if (returnobj.result == true) {
				if(!iscookie){
					alert("Login Success");
				}
				loginpage(returnobj.username, returnobj.auditcount);
				islogin = true;
			} else {
				var errorstr = returnobj.error;
				if (errorstr != "nocookie") {
					alert(returnobj.error);
				}
			}

			var gfs = returnobj.GF;
			var gfstr = "";
			$.each(gfs, function(n, item) {
				gfstr += "<li><input type='radio' name='grammarfunction'value="
						+ item.mark + ">" + item.name + "(" + item.mark + ")"
						+ "</li>";
			});
			document.getElementById("grammarfunction").innerHTML = gfstr;

			var pts = returnobj.PT;
			var ptstr = "";
			$.each(pts, function(n, item) {
				ptstr += "<li><input type='radio' name='typeofphrase' value="
						+ item.mark + ">" + item.name + "(" + item.mark + ")"
						+ "</li>";
			});
			document.getElementById("phrasetype").innerHTML = ptstr;

		}
	});
}

/*
 * function cookielogin(){ var userid=document.cookie; loading();
 * $.post("/assianno/servlet/UserLoginServlet", { userid:userid },
 * function(data, status) { loadingdismiss(); if (status == "success") { var
 * returnobj = eval("(" + data + ")"); if (returnobj.result == true) {
 * alert("Login Success"); loginpage(returnobj.username, returnobj.auditcount);
 * islogin = true; document.cookie=returnobj.userid; } else {
 * alert(returnobj.error); } } }); }
 */
function loginpage(username, count) {/*
										 * var str = "<a class='btn'
										 * href='/assianno/servlet/GetUserInfoSerlvet'
										 * target='UserInfo.jsp'>" + username;
										 */
	var str = "<a class='btn' href='UserInformation.jsp'>" + username;
	if (count > 0) {
		str += "</a><a class='btn' href='UserAudit.jsp'>审核意见(" + count
				+ ")</a>";
	}
	str += "<a class='btn' onclick='logout()'>退出</a>";
	document.getElementById("userstatus").innerHTML = str;
}

function logout() {
	loading();
	$
			.post(
					"/assianno/servlet/LogoutServlet",
					function(data, status) {
						loadingdismiss();
						if (status == "success") {
							alert("Logout Success!!!");
							document.getElementById("userstatus").innerHTML = "<a class='btn' data-toggle='modal'  data-target='#loginModal'>登录</a></br><a class='btn' target='_blank' href='Registered.jsp'>注册</a>";
							islogin = false;
						}
					});
}

function dispkayuserinfo() {
	loading();
	$
			.post(
					"/assianno/servlet/GetUserInfoSerlvet",
					function(data, status) {
						loadingdismiss();
						if (status == "success") {
							var userinfo = eval("(" + data + ")");
							var createsenjsonarray = eval("("
									+ userinfo.createsenjsons + ")");
							var revisesenjsonarray = eval("("
									+ userinfo.revisesenjsons + ")");
							var createlexjsonarray = eval("("
									+ userinfo.createlexjsons + ")");
							var reviselexjsonarray = eval("("
									+ userinfo.reviselexjsons + ")");
							document.getElementById("createsen").innerHTML = "共创建"
									+ createsenjsonarray.length + "个例句";
							document.getElementById("revisesen").innerHTML = "共修改"
									+ revisesenjsonarray.length + "个例句";
							document.getElementById("createlex").innerHTML = "共创建"
									+ createlexjsonarray.length + "个词元";
							document.getElementById("reviselex").innerHTML = "共修改"
									+ reviselexjsonarray.length + "个词元";
							document.getElementById("displaycreatesen").innerHTML = "";
							document.getElementById("displayrevisesen").innerHTML = "";
							document.getElementById("displaycreatelex").innerHTML = "";
							document.getElementById("displayreviselex").innerHTML = "";
							$
									.each(
											createsenjsonarray,
											function(n, item) {
												var str = "<li><input type='radio' name='userinfosentenceradio' value="
														+ item.presenid
														+ "></li>"
														+ item.sentence;
												document
														.getElementById("displaycreatesen").innerHTML += str;
											});
							$
									.each(
											revisesenjsonarray,
											function(n, item) {
												var str = "<li><input type='radio' name='userinfosentenceradio' value="
														+ item.presenid
														+ "></li>"
														+ item.sentence;
												document
														.getElementById("displayrevisesen").innerHTML += str;
											});
							$
									.each(
											createlexjsonarray,
											function(n, item) {
												if (n % 4 == 0) {
													var newtr = "<tr id=displaycreatelex"
															+ ((n - n % 4) / 4)
															+ "><td>"
															+ item.lexicalUnit
															+ "/"
															+ item.POS_mark
															+ "</td></tr>";
													document
															.getElementById("displaycreatelex").innerHTML += newtr;
												} else {
													var newtd = "<td>"
															+ item.lexicalUnit
															+ "/"
															+ item.POS_mark
															+ "</td>";
													document
															.getElementById("displaycreatelex"
																	+ ((n - n % 4) / 4)).innerHTML += newtd;
												}
											});
							$
									.each(
											reviselexjsonarray,
											function(n, item) {
												if (n % 4 == 0) {
													var newtr = "<tr id=displayreviselex"
															+ ((n - n % 4) / 4)
															+ "><td>"
															+ item.lexicalUnit
															+ "/"
															+ item.POS_mark
															+ "</td></tr>";
													document
															.getElementById("displayreviselex").innerHTML += newtr;
												} else {
													var newtd = "<td>"
															+ item.lexicalUnit
															+ "/"
															+ item.POS_mark
															+ "</td>";
													document
															.getElementById("displayreviselex"
																	+ ((n - n % 4) / 4)).innerHTML += newtd;
												}
											});
						}
					});
}

function getcandidatesframe() {
	var lex = document.getElementById("ModalStrong").innerHTML;
	lex = lex.trim();
	lex = lex.substring(lex.lastIndexOf(" ") + 1, lex.lastIndexOf("/"));
	loading();
	$
			.post(
					"/assianno/servlet/GetCandidateFrameServlet",
					{
						lexicalunit : lex
					},
					function(data, status) {
						loadingdismiss();
						if (status == "success") {
							$('#myFunctionsModal3').modal('show');
							document.getElementById("newlexdiv").innerHTML = "<span>请选择框架</span><div class='container' id='newlexicalunit'></div><input type='radio'  name='newlexframeid' value='0'> <select id='extraframeadd'></select>";
							document.getElementById("newlexicalunit").innerHTML = "";
							var framnamejsons = eval("(" + data + ")");
							document.getElementById("extraframeadd").innerHTML = "<option value='0'>------</option>";
							$
									.each(
											framnamejsons,
											function(n, item) {
												if (n < 20) {
													var index = (n - n % 3) / 3;
													var str = "<div class='col-xs-3'><input type='radio' name='newlexframeid' value='"
															+ item.frameid
															+ "' id='"
															+ item.framename
															+ "' >"
															+ "NO."
															+ (n + 1)
															+ "  "
															+ item.framename
															+ "</div>";
													if (n % 3 == 0) {
														var parstr = "<div class='row' id=lexframepar"
																+ index
																+ "></div>";
														document
																.getElementById("newlexicalunit").innerHTML += parstr;
													}
													document
															.getElementById("lexframepar"
																	+ index).innerHTML += str;
												}
												document
														.getElementById("extraframeadd").innerHTML += "<option value='"
														+ item.frameid
														+ "' >"
														+ item.framename
														+ "</option>";

											});
						}

					});
}

function addnewlexicalunit() {
	var lexframeobjs = document.getElementsByName("newlexframeid");
	var lex = document.getElementById("ModalStrong").innerHTML.trim();
	var word = lex.substring(lex.lastIndexOf(" ") + 1, lex.lastIndexOf("/"));
	var mark = lex.substring(lex.lastIndexOf("/") + 1, lex.length);
	var frameid = 0;
	for (var i = 0; i < lexframeobjs.length; i++) {
		if (lexframeobjs[i].checked) {
			// alert(lexframeobjs[i].value+":"+lexframeobjs[i].id);
			frameid = lexframeobjs[i].value;
			break;
		}
	}
	if (frameid == 0) {
		frameid = document.getElementById("extraframeadd").value;
	}
	if (frameid == 0) {
		alert("请选择框架");
		return;
	}
	$.post("/assianno/servlet/AddNewLexicalunitServlet", {
		word : word,
		mark : mark,
		frameid : frameid,
	}, function(data, status) {
		loadingdismiss();
		if (status == "success") {
			alert("Success");
		}
	});
}

function getrandomsentence() {
	initial();
	wcs = -1;
	var lexicalunit = document.getElementById("inputrandomlexcicalunit").value;
	var pos = "";
	var posobjs = document.getElementsByName("getRandomSenPOSradio");
	for (var i = 0; i < posobjs.length; i++) {
		if (posobjs[i].checked) {
			pos = posobjs[i].value;
			break;
		}
	}
	if (pos == "") {
		alert("请选择词性");
		return;
	}
	var frameid = document.getElementById("randomsentenceframelist").value;
	var frame_name = document.getElementById("rf_name").value;
	var rfradio = document.getElementsByName("randomframe");
	var type = null;
	for (var i = 0; i < rfradio.length; i++) {
		if (rfradio[i].checked) {
			type = rfradio[i].value;
			break;
		}
	}
	if (type == null) {
		alert("请选择框架");
		return;
	}
	loading();
	$.post("/assianno/servlet/GetRandomSentenceServlet", {
		lexicalunit : lexicalunit,
		pos : pos,
		frameid : frameid,
		framename : frame_name,
		type : type
	}, function(data, status) {
		loadingdismiss();
		if (status = "success") {
			isconfirmseparated = false;
			document.getElementById("Separated Sentence").innerHTML = data;
		}
	});
}

function registered() {
	var username = document.getElementById("registeredusername").value;
	var password = document.getElementById("registeredpassword").value;
	var passwords = document.getElementById("registeredpasswords").value;
	if (username == "" || username == null || password == ""
			|| password == null || passwords == "" || passwords == null) {
		alert("输入有误！！！");
		return;
	}
	if (password != passwords) {
		alert("两次密码不一致");
		return;
	}
	$.post("/assianno/servlet/RegisteredUser", {
		username : username,
		password : password
	}, function(data, status) {
		if (status == "success") {
			if (data == 0) {
				alert("注册成功!!!");
				$('#registeredModal').modal('hide');
			} else if (data == 1) {
				alert("用户名重复！！！");
			} else {
				alert("服务器错误，请联系管理员");
				$('#registeredModal').modal('hide');
			}
		}
	});
}

function formatsuppstr(str) {
	var strarray = str.match(/&lt;supp_\d+ \S+ &gt;/g);
	if (strarray != null) {
		if (strarray.length == 1) {
			str = str.replace("&lt;supp_1", "&lt;supp");
			var tempstrs = str.match(/\S+-\w+-\w+_s1/g);
			if (tempstrs != null) {
				for (var j = 0; j < tempstrs.length; j++) {
					var tempstr = tempstrs[j];
					tempstr = tempstr.replace(/_s\d+/, "_s");
					str = str.replace(/\S+-\w+-\w+_s1/, tempstr);
				}
			}

		} else {
			for (var i = 0; i < strarray.length; i++) {
				var supp = strarray[i].match(/&lt;supp_\d+/);
				supp = supp[0].match(/_\d+/);
				str = str.replace("&lt;supp" + supp[0] + " ", "&lt;supp_"
						+ (i + 1) + " ");
				var re = new RegExp("\\w+-\\w+-\\w+_s" + supp[0].substr(1), "g");
				var tempstrarray = str.match(re);
				for (var j = 0; tempstrarray != null && j < tempstrarray.length; j++) {
					str = str.replace(tempstrarray[j], tempstrarray[j]
							.match(/\S+-\w+-\w+_s/)
							+ (i + 1));
				}
			}
		}
	}
	return str;
}

function confirmsubmit() {
	if (!islogin) {
		alert("请先登录!!!");
		return;
	}
	$('#confirmsubmitModal').modal('show');
	var str = "";
	document.getElementById("confirmsubtable").innerHTML = "";
	var checkobjs = document.getElementsByName("framechoosecheck");
	for (var i = 0; i < checkobjs.length; i++) {
		if (checkobjs[i].checked) {
			str += "<tr><td>" + framejsonarray[i].framename + "</td><td>"
					+ formatsuppstr(separatedsenstringarray[i]) + "</td></tr>";
		}
	}
	document.getElementById("confirmsubtable").innerHTML = str;
}

function addni() {
	var checkboxs = document.getElementsByName("inife");
	for (var i = 0; checkboxs != null && i < checkboxs.length; i++) {
		if (checkboxs[i].checked) {
			document.getElementById("Separated Sentence").innerHTML += "&lt;"
					+ checkboxs[i].value + " ini&gt; ";
			separatedsenstringarray[chooseframeindex] = document
					.getElementById("Separated Sentence").innerHTML;
		}
	}
}

function displayinife() {
	if (chooseframeindex == -1) {
		return;
	}
	document.getElementById("initable").innerHTML = "";
	var fes = document.getElementById("Separated Sentence").innerHTML
			.match(/&lt;\w+-/g);

	var inifes = document.getElementById("Separated Sentence").innerHTML
			.match(/&lt;\w+\sini&gt;/g);
	var dnifes = document.getElementById("Separated Sentence").innerHTML
			.match(/{\w+-/);
	$
			.each(
					eval("("
							+ framejsonarray[chooseframeindex].frameelementsjsonarrayString
							+ ")"),
					function(n, item) {
						if (item.iscore == true
								&& ((fes == null || fes.indexOf("&lt;"
										+ item.frameelement_en_short + "-") == -1)
										&& (inifes == null || inifes
												.indexOf("&lt;"
														+ item.frameelement_en_short
														+ " ini&gt;") == -1) && (dnifes == null || dnifes
										.indexOf("{"
												+ item.frameelement_en_short
												+ "-")))) {
							document.getElementById("initable").innerHTML += "<li><input type='checkbox' name='inife' value='"
									+ item.frameelement_en_short
									+ "'>"
									+ item.frameelementname + "</li>";
						}
					});
	$('#NullInstantiatedModal').modal('show');
}

/**
 * assianno
 */

function selectsentence(){
	var frameid = document.getElementById("frameselect").value;
	var framename = document.getElementById("frameinput").value;
	var selecttype = "";
	var selectradio = document
			.getElementsByName("selecttype");
	for (var i = 0; i < selectradio.length; i++) {
		if (selectradio[i].checked) {
			selecttype = selectradio[i].value;
			break;
		}
	}
	$
			.post(
					"/assianno/servlet/GetUserInfoServlet",
					{
						frameid : frameid,
						framename : framename,
						selecttype : selecttype
					},
					function(data, status) {
						if (status == "success") {
							var resjson = eval("(" + data
									+ ")");
							var framejsons = eval(resjson.framejsons);
							var sentencejsons = eval(resjson.createsenjsons);
							if (frameid == null
									|| frameid == "") {
								var framestr = "<option value='-1'>-------</option>";
								for (var i = 0; i < framejsons.length; i++) {
									var framejson = framejsons[i];
									framestr += "<option value='"+framejson.frameid+"'>"
											+ framejson.framename
											+ "</option>";
								}
								document
										.getElementById("frameselect").innerHTML = framestr;
							}

							var sentencestr = "";
							for (var i = 0; i < sentencejsons.length; i++) {
								var sentencejson = sentencejsons[i];
								var index = i;
								if (sentencejson.isremark == 1) {
									index += "★  ";
								}
								var status = "待审核";
								if (sentencejson.status == 1) {
									status = "已入库";
								}
								sentencestr += "<tr><td>"
										+ index
										+ "</td><td>"
										+ sentencejson.sentence
										+ "</td><td>"
										+ status
										+ "</td><td><a href='./servlet/WCSRedirectServlet?presentenceid="
										+ sentencejson.presenid
										+ "&willchangesentenceid="
										+ sentencejson.sentenceid
										+ "'>修改</a><br><a style='cursor:pointer;' onclick='deletesentence("
										+ sentencejson.sentenceid
										+ ")'>删除</a>";
							}
							document
									.getElementById("sentencetable").innerHTML = sentencestr;
						}
						;
					});
}

function changesentence(preid,wcsid){
	
}

function deletesentence(id){
	if(!window.confirm("确认删除该条例句吗？")){
		return;
	}
	$.post("/assianno/servlet/DeleteSentenceServlet",{
		sentenceid:id
	},function(data,status){
		if(status=="success"){
			alert("删除成功!!!");
			selectsentence();
		}
	});

	}
/**
 * userinformation
 **/
function auditload(){
	$.post("/assianno/servlet/GetUserAuditServlet",{
	},function(data,status){
		if(status=="success"){
			var jsons=eval("("+data+")");
			$.each(jsons,function(n,item){
				if(item.status==1)
					document.getElementById("audittable").innerHTML+="<tr><td>"+n+"</td><td>"+item.sentence+"<a href='assianno.jsp?presentenceid="+item.presentenceid+"&willchangesentenceid="+item.sentenceid+"'>修改</a></td><td>"+item.date+"</td><td>"+item.audit+"</td></li>";
				else
					document.getElementById("audittable").innerHTML+="<tr><td>"+n+"</td><td><font color='#FF0000'>NEW</font>"+item.sentence+"<a href='assianno.jsp?presentenceid="+item.presentenceid+"&willchangesentenceid="+item.sentenceid+"'>"+"修改"+"</a></td><td>"+item.date+"</td><td>"+item.audit+"</td></li>";
			});
		}
	});
	//var auditjsons=eval("("+jsons+")");
}