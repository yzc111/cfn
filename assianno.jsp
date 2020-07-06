<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<head>
<title>欢迎来到人机协同标注系统</title>
<link rel="icon" href="./img/logo.ico" />
<link rel="shortcut icon" href="./img/logo.ico" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="pragma" content="no-cach">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="this is my page">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<!-- Bootstrap -->
<!-- 新 Bootstrap 核心 CSS 文件 -->


<!-- <link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">-->
<link href="./dist/css/bootstrap.min.css" rel="stylesheet">
<link href="./dist/flat/pink.css" rel="stylesheet">
<link href="./dist/css/futurico.css" rel="stylesheet">
<link
	href="http://cdn.bootcss.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="./dist/css/buttons.css" rel="stylesheet">

<!-- <script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>-->
<script src="./dist/js/jquery-2.0.0.min.js"></script>
<script src="./dist/js/icheck.min.js"></script>
<!--   <script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>-->
<script src="./dist/js/bootstrap.min.js"></script>
<script src="./dist/js/jquery.json.js"></script>
<script src="./dist/js/jquery-ui.min.js"></script>
<script src="./dist/js/jquery-2.12.js"></script>


<script type="text/javascript">
	var FRAMECOUNT = 0;
	var selectionstr = "";
	var selection;
	//var choosefunction=0;
	var range;
	var framejsonarray;
	var phrasetypearray = new Array();
	var grammarfunctionarray = new Array();
	/*	var separatedsenjsonarray;
	 var separatedsenstring;*/
	var frameelementjsonarray;
	var chooseframeindex = -1;
	var separatedsenstringarray = new Array();
	var rebacksen = new Array();
	var userid = -1;
	var lexicualunitsidarray;
	var islogin = false, isconfirmseparated = false;
	var supparray = new Array();
	var allsupparray = new Array();
	var wcs = -1;
	var framelist = null;
	var wcs =
	<%=request.getSession().getAttribute("willchangesentenceid")%>
	;
	var separatedsen = null;
	
	
	
</script>




<!--        <link rel="stylesheet" type="text/css" href="./dist/css/bootstrap.min.css">
<script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
   <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
 -->





</head>

<body onload="winload()">

	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<div class="row">
					<div class="col-xs-11">
						<h2 class="text-center" style="font-style:italic;">
							<em><strong>欢迎来到人机协同标注系统</strong> </em>
						</h2>
					</div>
					<div class="col-xs-1" id="userstatus">
						<a class="btn" data-toggle="modal" data-target="#loginModal">登录</a>
						<a class="btn" target="_blank" href="Registered.jsp">注册</a>
					</div>
				</div>

				<div class="row">
					<hr>
				</div>

				<div class="row">

					<div class="row">
						<div class="col-xs-12">
							<input type="text" placeholder="请在此输入一条例句，并点击开始分词进行分词"
								class="col-xs-10" id="SampleSentence">
						</div>
					</div>

					<div class="row">
						<div class="col-xs-6">
							<a class="button button-glow button-rounded button-royal"
								data-toggle="modal" onclick="getRandomSentenceFrameList()"
								style="width:178px;margin:5px;height:41px;">使用系统例句</a>
						</div>

						<div class="col-xs-6">
							<button style="width:178px;margin:5px;height:41px;"
								class="button button-glow button-rounded button-highlight"
								id="btnSepSet" onclick="SeparationSentence()">开始分词</button>
						</div>


					</div>

				</div>

				<div class="row">
					<hr>
				</div>

				<div class="row">
					<div class="col-xs-8">
						<div style="margin:20px 0; background:#EEE;border:1px solid #CCC;">
							<h3 id="Separated Sentence">
								请对这条句子进行标注，如果对分词结果有异议，可以选中后选择修改分词。</h3>
						</div>
						<div
							style="margin:20px 5px;moz-user-select: -moz-none;-moz-user-select: none;-o-user-select:none;-khtml-user-select:none;-webkit-user-select:none;-ms-user-select:none;user-select:none;"
							onselectstart="return false;" onpaste="return false;"
							oncopy="return false;" oncut="return false;"
							oncontextmenu="return false;">
							<table style="padding:10px;">
								<tr>
									<td align="center" style="padding:8;"><a
										href="./howtouse.jsp" target="_blank"
										class="button button-raised button-primary">How to use</a></td>
									<td align="center" style="padding:8;"><button
											class="button button-raised button-royal"
											onclick="SelectionToString()" data-toggle="modal"
											data-target="#myFunctionsModal">操作所选字段</button></td>
									<td align="center" style="padding:8;"><button
											class="button button-raised button-royal"
											onclick="confirmseparated()">确认分词结果</button></td>
								</tr>
								<tr>
									<td align="center" style="padding:8;"><button
											class="button button-raised button-caution"
											onclick="deletemark()">删除</button></td>
									<td style="padding:8;" align="center"><button
											class="button button-raised button-primary"
											onclick="reback()">还原</button></td>
									<td align="center" style="padding:8;"><button
											class="button button-raised button-action"
											onclick="confirmsubmit()"
											style="font-weight:bold;border-color: rgb(150,203,47);background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(rgb(150, 203, 47)), to(rgb(112, 160, 18)));background:linear-gradient(rgb(150,203,47),rgb(112, 160, 18))">提交</button>
									</td>


								</tr>
							</table>


						</div>
					</div>
					<div class="col-xs-4 row">

						<div class="col-xs-12" style="border: 1px solid;margin: 10px;">
							<h4>封锁框架：</h4>
							<h5>以下为封锁中的框架，请不要标注</h5>
							<ul id="lockframe">
							</ul>
						</div>

						<div class="col-xs-12" style="margin-top: 10px;">
							<a href="UpdateInfo.jsp" target="_blank"
								style="font-size: x-large;">8月16日更新说明</a>
						</div>
						<div class="col-xs-12" style="margin-top: 10px;">
							<a id="faq" target="_blank" 
								style="font-size: x-large;" onclick = faq()>标注规范</a>
						</div>
						<div class="col-xs-12" style="margin-top: 10px;">
							<a id="work1" target="_blank" 
								style="font-size: x-large;" onclick = www()>培训作业</a>
						</div>
					</div>

					<div id="frameinfo" class="col-xs-12"
						style="overflow:auto;moz-user-select: -moz-none;-moz-user-select: none;-o-user-select:none;-khtml-user-select:none;-webkit-user-select:none;-ms-user-select:none;user-select:none;height:380px;">
						<h3>
							<strong>框架信息：</strong>
						</h3>

					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- 功能模态框（Modal） -->
	<div class="modal fade" id="myFunctionsModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">操作所选字段</h4>
				</div>
				<div class="modal-body">
					<span>选中的字段： </span><strong id="ModalStrong"></strong>
					<div>
						<input type="radio" name="Func">更改分词结果
					</div>
					<div>
						<input type="radio" name="Func">标注所选字段
					</div>
					<div>
						<input type="radio" name="Func">标注无定的零形式
					</div>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button id="submit" type="button" class="btn btn-primary"
						data-toggle="modal" data-dismiss="modal" onclick="confirmfunc()">确认</button>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->

	<!-- 功能1模态框（Modal） -->
	<div class="modal fade" id="myFunctionsModal1" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">更改分词结果</h4>
				</div>
				<div class="modal-body">
					<span>请选择词性</span>
					<div class="container">
						<div class="row">
							<div class="col-xs-3">
								<input type="radio" name="POSradio" value="n_s"><select
									id="n_s">
									<option value="n">名词（一类）</option>
									<option value="nh">人名(二类)</option>
									<option value="ns">地点名词(二类)</option>
									<option value="ni">机构团体名(二类)</option>
									<option value="nz">其他专名(二类)</option>
									<option value="nl">地理名词(二类)</option>
									<option value="nt">时间名词(二类)</option>
									<option value="nd">方向名词（二类）</option>
								</select>
							</div>
							<div class="col-xs-3">
								<input type="radio" name="POSradio" value="v">动词
							</div>
							<div class="col-xs-3">
								<input type="radio" name="POSradio" value="a">形容词
							</div>
						</div>

						<div class="row">
							<div class="col-xs-3">
								<input type="radio" name="POSradio" value="d">副词
							</div>
							<div class="col-xs-3">
								<input type="radio" name="POSradio" value="p">介词
							</div>
							<div class="col-xs-3">
								<input type="radio" name="POSradio" value="r">代词
							</div>
						</div>
						<div class="row">
							<div class="col-xs-3">
								<input type="radio" name="POSradio" value="c">连词
							</div>
							<div class="col-xs-3">
								<input type="radio" name="POSradio" value="e">叹词
							</div>
							<div class="col-xs-3">
								<input type="radio" name="POSradio" value="u">助词
							</div>
						</div>
						<div class="row">
							<div class="col-xs-3">
								<input type="radio" name="POSradio" value="b">其他名词修饰语
							</div>
							<div class="col-xs-3">
								<input type="radio" name="POSradio" value="g">语素
							</div>
							<div class="col-xs-3">
								<input type="radio" name="POSradio" value="i">成语
							</div>
						</div>
						<div class="row">
							<div class="col-xs-3">
								<input type="radio" name="POSradio" value="h">前缀
							</div>
							<div class="col-xs-3">
								<input type="radio" name="POSradio" value="k">后缀
							</div>
							<div class="col-xs-3">
								<input type="radio" name="POSradio" value="j">缩写词
							</div>
						</div>
						<div class="row">
							<div class="col-xs-3">
								<input type="radio" name="POSradio" value="m">数词
							</div>
							<div class="col-xs-3">
								<input type="radio" name="POSradio" value="q">量词
							</div>
							<div class="col-xs-3">
								<input type="radio" name="POSradio" value="wp">标点符号
							</div>
						</div>
						<div class="row">
							<div class="col-xs-3">
								<input type="radio" name="POSradio" value="o">拟声词
							</div>
							<div class="col-xs-3">
								<input type="radio" name="POSradio" value="ws">外来词
							</div>
							<div class="col-xs-3">
								<input type="radio" name="POSradio" value="x">非词
							</div>
						</div>
						<div class="row">
							<div class="col-xs-3">
								<input type="radio" name="POSradio" value="w_s"><select
									id="w_s">
									<option value="w">标点符号（一类）</option>
									<option value="wkz">左括号</option>
									<option value="wky">右括号</option>
									<option value="wyz">左引号</option>
									<option value="wyy">右引号</option>
									<option value="wj">句号</option>
									<option value="ww">问号</option>
									<option value="wt">叹号</option>
									<option value="wd">逗号</option>
									<option value="wf">分号</option>
									<option value="wn">顿号</option>
									<option value="wm">冒号</option>
									<option value="ws">省略号</option>
									<option value="wp">破折号</option>
									<option value="wb">百分号千分号</option>
									<option value="wh">单位符号</option>
								</select>
							</div>
						</div>
					</div>
				</div>



			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary" onclick="modifypos()"
					data-dismiss="modal">确认</button>
			</div>
		</div>
	</div>
	<!-- /.modal-content -->
	<!-- /.modal -->

	<!-- 功能2模态框（Modal） -->
	<div class="modal fade" id="myFunctionsModal2" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">标注所选字段</h4>
				</div>
				<div class="modal-body">
					<div class="container">
						<div class="row">
							<div class="col-xs-3">
								<ol id="frameelement">
								</ol>
							</div>
							<div class="col-xs-3">
								<ul id="phrasetype">
									<li><input type="radio" name="typeofphrase" value="np">名词性短语
									</li>
									<li><input type="radio" name="typeofphrase" value="vp">动词性短语
									</li>
									<li><input type="radio" name="typeofphrase" value="ap">形容词性短语
									</li>
									<li><input type="radio" name="typeofphrase" value="dp">副词性短语
									</li>
									<li><input type="radio" name="typeofphrase" value="pp">介词性短语
									</li>
									<li><input type="radio" name="typeofphrase" value="bp">区别词性短语
									</li>
									<li><input type="radio" name="typeofphrase" value="tp">时间词性短语
									</li>
									<li><input type="radio" name="typeofphrase" value="sp">处所短语
									</li>
									<li><input type="radio" name="typeofphrase" value="mbar">数词准短语
									</li>
									<li><input type="radio" name="typeofphrase" value="mp">数量短语
									</li>
									<li><input type="radio" name="typeofphrase" value="dj">单句句型
									</li>
									<li><input type="radio" name="typeofphrase" value="xj">分句句型
									</li>
									<li><input type="radio" name="typeofphrase" value="fj">复句句型
									</li>
								</ul>
							</div>
							<div class="col-xs-3">
								<ul id="grammarfunction">
									<li><input type="radio" name="grammarfunction"
										value="subj">主语</li>
									<li><input type="radio" name="grammarfunction" value="ext">外部论元
									</li>
									<li><input type="radio" name="grammarfunction" value="obj">宾语
									</li>
									<li><input type="radio" name="grammarfunction"
										value="atta">定语</li>
									<li><input type="radio" name="grammarfunction"
										value="adva">状语</li>
									<li><input type="radio" name="grammarfunction"
										value="comp">补语</li>
									<li><input type="radio" name="grammarfunction"
										value="pive">兼语</li>
									<li><input type="radio" name="grammarfunction" value="soc">兼语补语
									</li>

									<li><input type="radio" name="grammarfunction" value="par">插入语
									</li>
									<li><input type="radio" name="grammarfunction"
										value="Pared">被插入语</li>
									<li><input type="radio" name="grammarfunction"
										value="Head">中心语</li>
									<li><input type="radio" name="grammarfunction" value="GF">支撑词的从属成分</li>
									<li><input type="radio" name="grammarfunction" value="va">连谓成分
									</li>
									<li><input type="radio" name="grammarfunction"
										value="Other">其他</li>
								</ul>
								<hr />
								<div id="dnidiv">
									<input type="radio" name="grammarfunction" value="dni">有定的零形式
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button id="submit" type="button" class="btn btn-primary"
						onclick="confirmmark()">确认</button>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->

	<!-- 登录模态框（Modal） -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">用户登录</h4>
				</div>
				<div class="modal-body">

					<form class="form-horizontal">
						<div class="control-group">
							<div>用户名</div>
							<div class="controls">
								<input id="inputusername" placeholder="Username" type="text"
									onkeydown="ukeydown()" />
							</div>
						</div>

						<div class="control-group">
							<div>密码</div>

							<div class="controls">
								<input id="inputpassword" placeholder="Password" type="password"
									onkeydown="pkeydown()" />
							</div>
						</div>

						<div class="control-group">
							<div class="controls">
								<label class="checkbox"><input id="isremember"
									type="checkbox" /> Remember me(one week) </label>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button id="submit" type="button" onclick="login(false)"
						class="btn btn-primary" data-dismiss="modal">确认</button>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->

	<!-- 用户信息模态框（Modal） -->
	<div class="modal fade" id="userinfoModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">用户信息</h4>
				</div>
				<div class="modal-body">

					<div class="accordion" id="accordion-888248">

						<div class="accordion-group">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse"
									data-parent="#accordion-888248" href="#accordion-element-23892"
									id="createsen">共创建0个例句</a>
							</div>
							<div id="accordion-element-23892"
								class="accordion-body in collapse">
								<div class="accordion-inner">
									<ul id="displaycreatesen">

									</ul>
								</div>
							</div>
						</div>

						<div class="accordion-group">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse"
									data-parent="#accordion-888248"
									href="#accordion-element-188768" id="revisesen">共修改0个例句</a>
							</div>
							<div id="accordion-element-188768"
								class="accordion-body collapse">
								<div class="accordion-inner">
									<ul id="displayrevisesen">
									</ul>
								</div>
							</div>
						</div>

						<div class="accordion-group">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse"
									data-parent="#accordion-888248" href="#accordion-element-23893"
									id="createlex">共创建0个词元</a>
							</div>
							<div id="accordion-element-23893"
								class="accordion-body in collapse">
								<div class="accordion-inner">
									<table id="displaycreatelex">
									</table>
								</div>
							</div>
						</div>

						<div class="accordion-group">
							<div class="accordion-heading">
								<a class="accordion-toggle" data-toggle="collapse"
									data-parent="#accordion-888248" href="#accordion-element-23894"
									id="reviselex">共修改0个词元</a>
							</div>
							<div id="accordion-element-23894"
								class="accordion-body in collapse">
								<div class="accordion-inner" id="displayreviselex">
									<table id="displayreviselex">
									</table>
								</div>
							</div>
						</div>

					</div>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button id="submit" type="button" class="btn btn-primary"
						data-dismiss="modal">确认</button>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->

	<!-- 功能3模态框（Modal） -->
	<div class="modal fade" id="myFunctionsModal3" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">新增词元</h4>
				</div>
				<div id="newlexdiv" class="modal-body"></div>



			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary"
					onclick="addnewlexicalunit()" data-dismiss="modal">确认</button>
			</div>
		</div>
	</div>
	<!-- /.modal-content -->
	<!-- /.modal -->

	<!-- Loading模态框（Modal） -->
	<div class="modal fade" id="myLoadingModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">载入中...</h4>
				</div>
				<div class="modal-body">

					<img alt="loading..." src="./img/loading.gif">

				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->

	<!-- 生成随机例句模态框（Modal） -->
	<div class="modal fade" id="getRandomSentenceModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">请输入词元并选择词性</h4>
				</div>
				<div class="modal-body">
					<input id="inputrandomlexcicalunit"> <input type="radio"
						name="randomframe" value="id"> <select
						id="randomsentenceframelist">
						<option value="-1">-------</option>
					</select> <input type="radio" name="randomframe" value="name"><input
						id="rf_name" type="text" placeholder="请输入框架名" />

					<div class="container">
						<span>请选择词性:</span>
						<div class="row">

							<div class="col-xs-3">
								<input type="radio" name="getRandomSenPOSradio" value="n">名词
							</div>
							<div class="col-xs-3">
								<input type="radio" name="getRandomSenPOSradio" value="v">动词
							</div>
							<div class="col-xs-3">
								<input type="radio" name="getRandomSenPOSradio" value="a">形容词
							</div>

						</div>
						<div class="row">
							<div class="col-xs-3">
								<input type="radio" name="getRandomSenPOSradio" value="d">副词
							</div>
							<div class="col-xs-3">
								<input type="radio" name="getRandomSenPOSradio" value="i">成语
							</div>
						</div>
						<!--         		
         			<div class="col-xs-3">
         				<input type="radio" name="getRandomSenPOSradio" value="t">时间词
         			</div>
         			<div class="col-xs-3">
         				<input type="radio" name="getRandomSenPOSradio" value="s">处所词
         			</div>
         		
         		<div class="row">
         			<div class="col-xs-3">
         				<input type="radio" name="getRandomSenPOSradio" value="b">区别词
         			</div>
         			<div class="col-xs-3">
         				<input type="radio" name="getRandomSenPOSradio" value="z">状态词
         			</div>
         			<div class="col-xs-3">
         				<input type="radio" name="getRandomSenPOSradio" value="r">代词
         			</div>
         		</div>
         		<div class="row">
         			<div class="col-xs-3">
         				<input type="radio" name="getRandomSenPOSradio" value="f">方位词
         			</div>
         			<div class="col-xs-3">
         				<input type="radio" name="getRandomSenPOSradio" value="m">数词
         			</div>
         			<div class="col-xs-3">
         				<input type="radio" name="getRandomSenPOSradio" value="q">量词
         			</div>

         		</div>
         		<div class="row">
         			<div class="col-xs-3">
         				<input type="radio" name="getRandomSenPOSradio" value="p">介词
         			</div>
         			<div class="col-xs-3">
         				<input type="radio" name="getRandomSenPOSradio" value="c">连词
         			</div>
         			<div class="col-xs-3">
         				<input type="radio" name="getRandomSenPOSradio" value="u">助词
         			</div>
         		</div>
         	    <div class="row">
         			<div class="col-xs-3">
         				<input type="radio" name="getRandomSenPOSradio" value="e">叹词
         			</div>
         			<div class="col-xs-3">
         				<input type="radio" name="getRandomSenPOSradio" value="y">语气词
         			</div>
         			<div class="col-xs-3">
         				<input type="radio" name="getRandomSenPOSradio" value="o">拟声词
         			</div>
         		</div>
         		<div class="row">
         			<div class="col-xs-3">
         				<input type="radio" name="getRandomSenPOSradio" value="h">前缀
         			</div>
         			<div class="col-xs-3">
         				<input type="radio" name="getRandomSenPOSradio" value="k">后缀
         			</div>
         			<div class="col-xs-3">
         				<input type="radio" name="getRandomSenPOSradio" value="x">字符串
         			</div>
         		</div>
         		<div class="row">
         			<div class="col-xs-3">
         				<input type="radio" name="getRandomSenPOSradio" value="w">标点符号
         			</div>
         		</div>-->
					</div>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button id="submit" type="button" class="btn btn-primary"
						onclick="getrandomsentence()" data-dismiss="modal">确认</button>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->

	<!-- /.modal -->

	<!-- 提交确认模态框（Modal） -->
	<div class="modal fade" id="confirmsubmitModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">标注的句子：</h4>
				</div>
				<div class="modal-body">

					<table class="table">
						<thead>
							<tr>
								<th>框架</th>
								<th>标注结果</th>
							</tr>
						</thead>

						<tbody id="confirmsubtable">

						</tbody>

					</table>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button id="submit" type="button" class="btn btn-primary"
						onclick="finish()" data-dismiss="modal">确认</button>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->

	<!-- 零形式模态框（Modal） -->
	<div class="modal fade" id="NullInstantiatedModal" tabindex="-1"
		role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">操作所选字段</h4>
				</div>
				<div class="modal-body">
					<h3>请选择无定的框架元素</h3>
					<ul id="initable">

					</ul>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button id="addni" type="button" onclick="addni()"
						class="btn btn-primary" data-dismiss="modal">确认</button>
				</div>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal -->

	<div
		style="text-align:center;background-color: #CCC;font-family: Verdana, SimSun, sans-serif;font-size: 14px;height: 60px;left: 0;position: absolute;right: 0px;width:100%;">
		<span> Copyright © 2015 Team of Chinese FrameNet & Semantic
			Computing, Shanxi University. All Rights Reserved. </span> <br> <span>Address：No.
			92 Wucheng Road, Taiyuan, Shanxi, PRC</span><span>|</span><a
			href="http://sccfn.sxu.edu.cn/portal-en/contact.aspx" target="_blank">Contact
			Us</a>
	</div>

</body>




