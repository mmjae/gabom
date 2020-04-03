<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  		<!-- <link rel="icon" href="favicon.ico">
		<link href="./resources/css/style.css" rel="stylesheet"> -->
</head>
<style>
#footer {
	width: 100%;
	height: 100px;
	text-align:center;
}
#cn{
font-size:50px;
border-bottom:4px solid black;
line-height:40px;
padding-bottom:10px;
}
#tel{
font-size:30px;
}

#alarm{
	position: fixed;
    top: 100px;
    left: 20px;
    width: 400px;
    border-radius:10px;
    background-color: white;
    z-index:2;   
}
p{
color:gray;
}
</style>
<script type="text/javascript">
	
	$(document).ready(function(){
			
		
		//이게 중요함,
		console.log("소켓알람 준비")
		
		
		connectalarm();
		
		
		function connectalarm(){
			console.log("연결 성공");
			
			//자체 지원,
			var wsalarm = new WebSocket("ws://localhost:80/gabom/Echo");  // 
			socketalarm = wsalarm
			//커넥션이 연결됐을때 이부분을 탄다.
			console.log("socketalarm : ", socketalarm)
			wsalarm.onopen = function() {
				console.log('Info: connection footer opened.');
			};

			
			wsalarm.onmessage = function(event) {   // 메세지 받을때
				
				//console.log("footer-ReceiveMessage : " , event.data + '\n');
				//alert("footer-ReceiveMessage : " + event.data );
				let JsonRespon = JSON.parse(event.data);
				
				alarmEvent(JsonRespon);
				
			};

			
			wsalarm.onclose = function(event) {
				console.log('Info: connection footer closed.');
			//	setTimeout(function() {connect()}, 1000)  //1초에 한번씩 커넥션 연결, 도중에 끈킬경우
			};
			
			wsalarm.onerror = function(event) {
				console.log('Info: connection footer closed.');
			};
		}
		
		$('#btnSend').on('click', function(evt) {
			console.log("음??");
			//console.log("socket : ",socket)
			evt.preventDefault();
			if (socketalarm.readyState !== 1)
				return;
			let msg = $('#msg').val();
			console.log("msg : " +msg);
			socketalarm.send();
		});
		
	})

		
	const alarmEvent =(JsonRespon)=>{
		console.log("alarmEvent 실행");
		console.log(JsonRespon);
		//gabom/somoim/somoimroom?roomnumber=24  절대 경로로 해야함
		
		if(JsonRespon.type=='jungmo'){
			console.log("정모 만들어질때 이벤트")
			
			var alarmNum = JsonRespon.somoimNumber; 	
			console.log("페이지 : " + alarmNum)
			var toastCont = $("<a href='/gabom/somoim/somoimroom?roomnumber="+alarmNum+"'>가입하신 소모임에 새로운 정모가 등록 되었습니다</a>")
			$("#toast-body").append(toastCont);
		
			$('#alarm').show();
			  setTimeout(function() { 
			   $('#alarm').hide();
			}, 5000);
		}else if(JsonRespon.type=='tripShare'){
			$("#content").empty();
			console.log("여행 계획 공유 이벤트")
			console.log("JsonRespon",JsonRespon)
			var alarmName = JsonRespon.my_id;
			//var alarmNum = JsonRespon.somoimNumber; 	
			//console.log("페이지 : " + alarmNum)
			var toastCont = $("<a href='/gabom/myplan'>"+alarmName+"님 께서 여행계획을 공유하셨습니다.</a>")
			$("#content").append(toastCont);
		
			$('#alarm').show();
			  setTimeout(function() { 
			   $('#alarm').hide();
			  }, 5000);
		}
		
	}	
		
		

	
</script>
<body>
	<div id="footer">
		<section id="contact" class="dark-bg" style="height:350px;background-color: white;">
			<div class="container" style="margin-top:15px;">
				<div class="row">
					<div class="col-lg-12 text-center">
						<div class="section-title">
							<h2 style="color:#3abade;font-size:70px;">Contact Us</h2>
							<p>If you have some Questions or need Help! Please Contact Us!<br>We make Cool and Clean Design for your Business</p>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3">
						<div class="section-text">
							<h4 style="color:#3abade">Our Business Office</h4>
							<p>3422 Street, Barcelona 432, Spain, New Building North, 15th Floor</p>
							<p><i class="fa fa-phone"></i> +101 377 655 22125</p>
							<p><i class="fa fa-envelope"></i> mail@yourcompany.com</p>
						</div>
					</div>
					<div class="col-md-3">
						<div class="section-text">
							<h4 style="color:#3abade">Business Hours</h4>
							<p><i class="fa fa-clock-o"></i> <span class="day">Weekdays:</span><span>9am to 8pm</span></p>
							<p><i class="fa fa-clock-o"></i> <span class="day">Saturday:</span><span>9am to 2pm</span></p>
							<p><i class="fa fa-clock-o"></i> <span class="day">Sunday:</span><span>Closed</span></p>
						</div>
					</div>
					<div class="col-md-6">
						<form name="sentMessage" id="contactForm" novalidate="">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<input type="text" class="form-control" placeholder="Your Name *" id="name">
										<p class="help-block text-danger"></p>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<input type="email" class="form-control" placeholder="Your Email *" id="email">
										<p class="help-block text-danger"></p>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<textarea class="form-control" placeholder="Your Message *" id="message" ></textarea>
										<p class="help-block text-danger"></p>
									</div>
								</div>
								<div class="clearfix"></div>
							</div>
							<div class="row">
								<div class="col-lg-12 text-center">
									<div id="success"></div>
									<button type="button" class="btn" style="background-color:black;">Send Message</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
		<p id="back-top">
			<a href="#top"><i class="fa fa-angle-up"></i></a>
		</p>
		<footer style="background-color:#3abade">
			<div class="container text-center" >
				<p style="color:black;">Theme made by <a href="http://moozthemes.com"><span>MOOZ</span>Themes.com</a></p>
			</div>
		</footer>

	</div>
	
	
	<div style='display: none' id="alarm" >
    <div id="alarm-header">
      <strong class="mr-auto text-primary">알람이 왔습니다!!</strong>
      <small id="alarmtext">5초 후 꺼짐</small>
      <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
    </div>
    <div id="toast-body" >
      <div id="content">
      
      </div>
    </div>
  	</div>


</body>

</html>