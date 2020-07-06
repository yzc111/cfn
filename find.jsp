<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<!-- ��� Bootstrap ������ CSS ������ -->


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

</head>



<body >
	<div class="container">
		<div class="row">
						<div class="col-xs-12">
							<input type="text" placeholder="Input"
								class="col-xs-10" id="Words">
						</div>
					</div>
					
						<div class="col-xs-6">
							<button style="width:178px;margin:5px;height:41px;"
								class="button button-glow button-rounded button-highlight"
								id="btnSepSet1" onclick="submitfind()">findSen</button>
						</div>
						<div class="col-xs-6">
							<button style="width:178px;margin:5px;height:41px;"
								class="button button-glow button-rounded button-highlight"
								id="btnSepSet2" onclick="submitfind2()">findUni</button>
						</div>
						
	<!-- 	<table>
			<tbody>
				<tr>
				<th width="2%" scope="row" style="padding-left: 30px;">1</th>
				<td width="6%">
              出处模块
              <a href="/show/118868956_1_3_-1_-1/0/" data-toggle="modal" data-target="#bigscreen_0">全文</a>
                    <div class="modal fade" id="bigscreen_0" tabindex="-1" role="dialog" aria-labelledby="bigscreenlabel_0" aria-hidden="true">
              </div> 
            </td>
            <td class="col-md-5" style="text-align:right">⑥需要一个尤物的原故而生的。”①阿普列乌斯（apulée，约
            <strong class="text-danger" style="padding-left:6px">123 </strong></td>
            
		    <td class="col-md-5" style="text-align:left;padding-left:0px">-约180），罗马作家，哲学家，《变形记》和《金驴》的作者。②</td>
		    </tr>
		</tbody>
		
		
		</table> -->
		<div class="row">
							<div class="col-xs-12">
								<table class="table table-condensed table-hover table-striped">
									<thead>
										<tr>
											<th style="width: 60px;">编号</th>
											<th>例句</th>
										<!-- 	<th style="width: 60px;">状态</th>
											<th style="width: 80px;">操作</th> -->
										</tr>
									</thead>
									<tbody id="showsentence">
									</tbody>
								</table>
							</div>
						</div>
						
	</div>
			
</body>
</html>