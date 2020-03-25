<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
  <!-- Bootstrap core CSS -->
  <link href="./resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template -->
  <link href="https://fonts.googleapis.com/css?family=Saira+Extra+Condensed:500,700" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Muli:400,400i,800,800i" rel="stylesheet">
  <link href="./resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="./resources/css/resume.min.css" rel="stylesheet">

<style>
section{
width:100%;
}
.filebox label { 
	display: inline-block; 
	padding: .5em .75em; 
	color: white; 
	font-size: inherit; 
	line-height: normal; 
	vertical-align: middle; 
	background-color:#064D84 ; 
	cursor: pointer; 
	border: 1px solid #064D84 ; 
	border-bottom-color: #064D84 ; 
	border-radius: .25em; 
} 
.filebox input[type="file"] { /* 파일 필드 숨기기 */ 
	position: absolute; 
	width: 1px; 
	height: 1px; 
	padding: 0; 
	margin: -1px; 
	overflow: hidden; 
	clip:rect(0,0,0,0); 
	border: 0; 
}
/* named upload */
.filebox .upload-name {
  display: inline-block;
  padding: .5em .75em;
  font-size: inherit;
  font-family: inherit;
  line-height: normal;
  vertical-align: middle;
  border: 1px solid #0080FF;
  border-bottom-color: #0080FF;
  border-radius: .25em;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
}

#profileArea{
margin-top:70%; 
}
/* content 영역 */
#mainContent{
width:100%;
}
.table{
width: 1550px;
}
.info{
display: flex;
margin:15px 20px;
}
.ttl{
margin:0 20px;
}
	
</style>


</head>

<body>

  <nav class="navbar navbar-expand-lg navbar-dark bg-primary" id="sideNav">
        <div id="profileArea">
			<div id="picArea" class="card" >
				<img id="meddelanden" class="card-img-top " src="${myinfodata.member_profile_picture}"  alt="Card image"
					style="width: 100%" >
				</div>
			</div>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav">
       <li class="nav-item filebox">
         		<div class="card-body">
					<h4 class="card-title">John Doe</h4>
				</div>
         		<input id="changeProfile" type="file" name="changeProfile">
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="myinfo">내 정보</a>
        </li>
        <li class="nav-item">
           <a class="nav-link js-scroll-trigger" id="myreser">예약리스트</a>
        </li>
        <li class="nav-item">
           <a class="nav-link js-scroll-trigger" href="myplan">여행 리스트</a>
        </li>
        <li class="nav-item">
           <a class="nav-link js-scroll-trigger" id="myreview">리뷰작성</a>
		</li>
     	<li class="nav-item">
           <a class="nav-link js-scroll-trigger" href="jjimlist">찜목록</a>
		</li>
		<li class="nav-item">
           <a class="nav-link js-scroll-trigger" href="likelist">좋아요</a>
		</li>
		<li class="nav-item">
           <a class="nav-link js-scroll-trigger" href="replylist">댓글</a>
		</li>
      </ul>
    </div>
  </nav>

  <div class="container-fluid p-0">

    <section class="resume-section p-3 p-lg-5 d-flex align-items-center" id="about">
      	<div id="mainContent">
      		<div id="title">
			<h2>내 정보</h2>
			</div>
			<div id="Content">
				<div class="info form-label-group">
                <h4 class="ttl">ID:</h4> <h4>${myinfodata.member_id}</h4>
                </div>
                
                <div class="info form-label-group">
                <h4 class="ttl">NAME:</h4> <h4>${myinfodata.member_name}</h4>
                </div>
                <div class="info form-label-group">
                <h4 class="ttl">PHONE:</h4> <h4>${myinfodata.member_phone}</h4>
                </div>
                <div class="info form-label-group">
                <h4 class="ttl">EMAIL:</h4> <h4>${myinfodata.member_email}</h4>
                </div>
                <div id="ty" class="info form-label-group">
                <h4 class="ttl">TYPE:</h4> 
                </div>
                <div class="info form-label-group">
                <h4 class="ttl">ADDRESS:</h4> <h4>${myinfodata.member_address}</h4>
                </div>
                <div class="info form-label-group">
                <h4 class="ttl">HOBBY:</h4> <h4>${myinfodata.member_hobby}</h4>
                </div>
                <div class="info form-label-group">
                <h4 class="ttl">MY PROFILE CONTENT</h4> <h4>${myinfodata.member_profile_contents}</h4>
                </div>
			</div>
		</div>
		
    </section>

	</div>

<!-- 프로필 변경  -->
	<div class="modal fade" id="exampleModalChangeInfo" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>


        

  <!-- Bootstrap core JavaScript -->
  <script src="./resources/vendor/jquery/jquery.min.js"></script>
  <script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="./resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="./resources/js/resume.min.js"></script>


<!-- hreview Modal -->
<div class="modal fade" id="exampleModalhreview" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">리뷰를 작성해주세요</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
       <form id="hre" enctype="multipart/form-data">
      <div class="modal-body">
    		<div class="filebox"> 
    			<label for="ex_filename">업로드</label> 
    			<input type="file" id="ex_filename" class="upload-hidden" name="house_review_orifile"multiple >
    			<div id="himg">
    				<img class="image_section" width="100px;" src="" alt="리뷰이미지" />
    			</div>
    		</div>
    		<input id="hreview_content" style="width:100%;min-height:400px;" type="text" name="house_review_content">
    		<input type="hidden" id="h_number" name="house_number">
    		<input type="hidden" id="r_number" name="reservation_number">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-lg" data-dismiss="modal">Close</button>
        <button type="button" class="hreview btn btn-lg" data-dismiss="modal">Success</button>
      </div>
     </form>
    </div>
  </div>
</div>
   
<!-- freview Modal -->
<div class="modal fade" id="exampleModalfreview" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">리뷰를 작성해주세요</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="fre" enctype="multipart/form-data">
      <div class="modal-body">
    		<div class="filebox"> 
    			<label for="ex_filename">업로드</label> 
    			<input type="file" id="ex_filename" class="upload-hidden" name="food_review_orifile"multiple >
    			<div id="fimg">
    				<img class="image_section" width="100px;" src="" alt="리뷰이미지" />
    			</div>
    		</div>
    		<input id="freview_content" style="width:100%;min-height:400px;" type="text" name="food_review_content">
    		<input type="hidden" id="f_number" name="food_number">
    		<input type="hidden" id="fr_number" name="freservation_number">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-lg" data-dismiss="modal">Close</button>
        <button type="button" class="freview btn btn-lg" data-dismiss="modal">Success</button>
      </div>
     </form>
    </div>
  </div>
</div>

<!-- 리뷰상세보기  -->
<div class="modal" id="detail" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-body">
       <div id="d_img"></div>
       <div id="d_content"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
</body>




<script>
var mty = "${myinfodata.member_type}";


if(mty == 1){
	mty = "여행자"
}else if(mty ==  2){
	mty ="서비스 업체"
}
var mt= $('<h4>'+mty+'</h4>');
$("#ty").append(mt);


var elem = '<div  class="well"><a id="changePicBasic" href="#">기본이미지변경</a></div>'+
'<div  class="well"><a id="changePicWant" href="#">사진이미지변경</a></div>'+
'<button id="close-popover" data-toggle="popover" class="btn btn-small btn-primary pull-right" onclick="$(&quot;#meddelanden&quot;).popover(&quot;hide&quot;);">Close please!</button>';

$('#meddelanden').popover({animation:true, content:elem, html:true});



	var a = "${myinfodata.member_name}";
	var b = "${myinfodata.member_id}";
	console.log(a);

$(document).on("click","#changePicWant",function(){
	console.log("원하는 사진 변경")
	//ajax실행하기	
	$("#changeProfile").trigger("click");
	$("#meddelanden").trigger("click");
	
	$("#changeProfile").change(function(e){
		$('#meddelanden').attr('src', ""); // 변할 때마다 리셋
		var files = e.target.files;
		
		console.log(files[0]); // 파일 어떤 내용들었는지 보기 1개니깐 [0]
		
		if(!files[0]["type"].match("image.*")){
			alert("확장자는 이미지 확장자만 가능함")
			return 
		}
		
		 var reader = new FileReader();
         reader.onload = function(e) {
             $('#meddelanden').attr('src', e.target.result);
         }
         reader.readAsDataURL(files[0]);
	})
	
})


$(document).on("click","#changePicBasic",function(){
	console.log("기본이미지")
	$("#meddelanden").trigger("click");
	
})
//-----------------------------------------------------------------------------------------기본 정보 
var date = getFormatDate(new Date());//오늘날짜 


$("#myreser").on('click', function(e) {
	e.preventDefault;
$.ajaxSetup({         
      beforeSend : function(xhr){
         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
      });//먼저 보냄

      $.ajax({
  		url:'myinfo/myreser',
  		type:'post',
  		
  	 	dataType:"json", //rest 컨트롤 이용	
  		success:function(data){
  			console.log(data);
  			$("#title").empty();
  			$("#Content").empty();
  			
  			var title = $('<div><h3>'+a+'님의 예약 리스트 '+'</h3></div>');
  			$("#title").append(title);
  			
  			var table =$('<table class="table"></table>');//전체 테이블 
  			var nextbtn =$('<button onclick="myfreser()" class="btn-lg btn-primary">맛집 예약보기  </button>');
  			$("#Content").append(table);
  			$("#Content").append(nextbtn);
  			
			var t_tr =$('<tr></tr>');//타이틀 tr
			table.append(t_tr);
			
			var t_th1 =$('<th>'+'예약번호'+'</th>');//
			var t_th2 =$('<th>'+'예약자명'+'</th>');//
			var t_th3 =$('<th>'+'예약장소'+'</th>');//
			var t_th4 =$('<th>'+'체크인'+'</th>');//
			var t_th5 =$('<th>'+'체크아웃'+'</th>');//
			var t_th6 =$('<th>'+'예약 인원'+'</th>');//
			var t_th7 =$('<th>'+'예약 금액'+'</th>');//
			var t_th8 =$('<th>'+'예약취소'+'</th>');//
			t_tr.append(t_th1);
			t_tr.append(t_th2);
			t_tr.append(t_th3);
			t_tr.append(t_th4);
			t_tr.append(t_th5);
			t_tr.append(t_th6);
			t_tr.append(t_th7);
			t_tr.append(t_th8);
			
			
  			for(i of data){
  				
  				var cid = getFormatDate(i.reservation_checkin);
  			 	var cod = getFormatDate(i.reservation_checkout);
  			 	
  				
  				var subtr =$('<tr></tr>');
  				table.append(subtr);
  				
  				var t_td1 =$('<td>'+i.reservation_number+'</td>');//
  				var t_td2 =$('<td>'+i.member_guestid+'님'+'</td>');//
  				var t_td3 =$('<td>'+i.house_name+'</td>');//
  				var t_td4 =$('<td>'+cid+'</td>');//
  				var t_td5 =$('<td>'+cod+'</td>');//
  				var t_td6 =$('<td>'+i.reservation_person+'명'+'</td>');//
  				var t_td7 =$('<td>'+i.reservation_totalprice+'원'+'</td>');//
  				
  				//if(){
  					var t_td8 =$('<td><button class="cbtn btn btn-warning" data-resernum="'+i.reservation_number+'">예약취소</button></td>');//
  				//}else{
  					//"지난예약"
  				//}
  				subtr.append(t_td1);
  				subtr.append(t_td2);
  				subtr.append(t_td3);
  				subtr.append(t_td4);
  				subtr.append(t_td5);
  				subtr.append(t_td6);
  				subtr.append(t_td7);
  				subtr.append(t_td8);
  				
  			}
  			
  			 
  		
  		},
  		error:function(error){
  			alert("fail")
  			console.log(error);
  		}
  		
  	})//ajax end
})// 클릭이벤트 끝

//-----------------------------------------------맛집 불러오기 
 function myfreser() {
	$.ajaxSetup({         
	      beforeSend : function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	      });//먼저 보냄

	      $.ajax({
	  		url:'myinfo/myfreser',
	  		type:'post',
	  	 	dataType:"json", //rest 컨트롤 이용	
	  		success:function(data){
	  			console.log(data);
	  			$("#Content").empty();
	  			
	  			var table =$('<table class="table"></table>');//전체 테이블 
	  			var nextbtn =$('<button onclick="" class="btn-lg btn-primary">숙박 예약보기</button>');
	  			$("#Content").append(table);
	  			$("#Content").append(nextbtn);
	  			
				var t_tr =$('<tr></tr>');//타이틀 tr
				table.append(t_tr);
				
				var t_th1 =$('<th>'+'예약번호'+'</th>');//
				var t_th2 =$('<th>'+'예약자명'+'</th>');//
				var t_th3 =$('<th>'+'예약장소'+'</th>');//
				var t_th4 =$('<th>'+'예약날짜'+'</th>');//
				var t_th5 =$('<th>'+'예약시간'+'</th>');//
				var t_th6 =$('<th>'+'예약 인원'+'</th>');//
				var t_th7 =$('<th>'+'예약 취소'+'</th>');//
				t_tr.append(t_th1);
				t_tr.append(t_th2);
				t_tr.append(t_th3);
				t_tr.append(t_th4);
				t_tr.append(t_th5);
				t_tr.append(t_th6);
				t_tr.append(t_th7);
				
				
	  			for(i of data){
	  				
	  			var rd = getFormatDate(i.foodreservation_date);
	  				
	  			var subtr =$('<tr></tr>');
	  			table.append(subtr);
	  				
	  			var t_td1 =$('<td>'+i.foodreservation_number+'</td>');//
	  			var t_td2 =$('<td>'+i.member_guestid+'님'+'</td>');//
	  			var t_td3 =$('<td>'+i.food_name+'</td>');//
	  			var t_td4 =$('<td>'+rd+'</td>');//
	  			var t_td5 =$('<td>'+i.foodreservation_time+'</td>');//
	  			var t_td6 =$('<td>'+i.foodreservation_person+'명'+'</td>');//
	  			var t_td7 =$('<td><button class="fcbtn btn btn-warning"data-fresernum="'+i.foodreservation_number+'">예약취소</button></td>');//
	  				subtr.append(t_td1);
	  				subtr.append(t_td2);
	  				subtr.append(t_td3);
	  				subtr.append(t_td4);
	  				subtr.append(t_td5);
	  				subtr.append(t_td6);
	  				subtr.append(t_td7);
	  				
	  			}
	  			 
	  			 
	  		
	  		},
	  		error:function(error){
	  			alert("fail")
	  			console.log(error);
	  		}
	  		
	  	})//ajax end
	}// 클릭이벤트 끝
 
//-------------------------------------------------------------------숙박취소버튼 
//resernum 숙박 취소버튼 
//fresernum 맛집 취소버튼 

$(document).on('click','.cbtn',function(e) {
	
	var result = confirm( '예약을 취소하시겠습니까?' );
	
    if(result){
    	var reservation_number = e.target.dataset.resernum
    	console.log(reservation_number);
    	
    	var data ={
    			"reservation_number":reservation_number
    			}
    	$.ajaxSetup({         
    	      beforeSend : function(xhr){
    	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
    	      });//먼저 보냄
     
     
     $.ajax({
        
          url: 'myinfo/deletehreser',
           type: 'post',
           data :data,
           dataType: "json", //rest 컨트롤 이용   
           success:function(data){
        	   alert("예약이 취소되었습니다.")
        	   $("#Content").empty();
             
        	   var table =$('<table class="table"></table>');//전체 테이블 
     			var nextbtn =$('<button onclick="myfreser()" class="btn-lg btn-primary">맛집 예약보기  </button>');
     			$("#Content").append(table);
     			$("#Content").append(nextbtn);
     			
    			var t_tr =$('<tr></tr>');//타이틀 tr
    			table.append(t_tr);
    			
    			var t_th1 =$('<th>'+'예약번호'+'</th>');//
    			var t_th2 =$('<th>'+'예약자명'+'</th>');//
    			var t_th3 =$('<th>'+'예약장소'+'</th>');//
    			var t_th4 =$('<th>'+'체크인'+'</th>');//
    			var t_th5 =$('<th>'+'체크아웃'+'</th>');//
    			var t_th6 =$('<th>'+'예약 인원'+'</th>');//
    			var t_th7 =$('<th>'+'예약 금액'+'</th>');//
    			var t_th8 =$('<th>'+'예약취소'+'</th>');//
    			t_tr.append(t_th1);
    			t_tr.append(t_th2);
    			t_tr.append(t_th3);
    			t_tr.append(t_th4);
    			t_tr.append(t_th5);
    			t_tr.append(t_th6);
    			t_tr.append(t_th7);
    			t_tr.append(t_th8);
    			
    			
     			for(i of data){
     				
     				var cid = getFormatDate(i.reservation_checkin);
     			 	var cod = getFormatDate(i.reservation_checkout);	  
     				
     				var subtr =$('<tr></tr>');
     				table.append(subtr);
     				
     				var t_td1 =$('<td>'+i.reservation_number+'</td>');//
     				var t_td2 =$('<td>'+i.member_guestid+'님'+'</td>');//
     				var t_td3 =$('<td>'+i.house_name+'</td>');//
     				var t_td4 =$('<td>'+cid+'</td>');//
     				var t_td5 =$('<td>'+cod+'</td>');//
     				var t_td6 =$('<td>'+i.reservation_person+'명'+'</td>');//
     				var t_td7 =$('<td>'+i.reservation_totalprice+'원'+'</td>');//
     				var t_td8 =$('<td><button class="cbtn btn btn-warning" data-resernum="'+i.reservation_number+'">예약취소</button></td>');//
     				subtr.append(t_td1);
     				subtr.append(t_td2);
     				subtr.append(t_td3);
     				subtr.append(t_td4);
     				subtr.append(t_td5);
     				subtr.append(t_td6);
     				subtr.append(t_td7);
     				subtr.append(t_td8);
     				
     			}
     			
           },
           
           error:function(error){
                 console.log(error);
              }
     });//ajax 끝
    }else{
   		//아니오면 그냥 그대로 
    }
})
//---------------------------------------------------------맛집 예약 취소 
$(document).on('click','.fcbtn',function(e) {
	
	var result = confirm( '예약을 취소하시겠습니까?' );
	
    if(result){
    	var foodreservation_number = e.target.dataset.fresernum
    	console.log(foodreservation_number);
    	
    	var data ={
    			"foodreservation_number":foodreservation_number
    			}
    	$.ajaxSetup({         
    	      beforeSend : function(xhr){
    	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
    	      });//먼저 보냄
     
     
     $.ajax({
        
          url: 'myinfo/deletefreser',
           type: 'post',
           data :data,
           dataType: "json", //rest 컨트롤 이용   
           success:function(data){
        	   alert("예약이 취소되었습니다.")
        	   $("#Content").empty();
	  			
	  			var table =$('<table class="table"></table>');//전체 테이블 
	  			var nextbtn =$('<button onclick="" class="btn-lg btn-primary">숙박 예약보기</button>');
	  			$("#Content").append(table);
	  			$("#Content").append(nextbtn);
	  			
				var t_tr =$('<tr></tr>');//타이틀 tr
				table.append(t_tr);
				
				var t_th1 =$('<th>'+'예약번호'+'</th>');//
				var t_th2 =$('<th>'+'예약자명'+'</th>');//
				var t_th3 =$('<th>'+'예약장소'+'</th>');//
				var t_th4 =$('<th>'+'예약날짜'+'</th>');//
				var t_th5 =$('<th>'+'예약시간'+'</th>');//
				var t_th6 =$('<th>'+'예약 인원'+'</th>');//
				var t_th7 =$('<th>'+'예약 취소'+'</th>');//
				t_tr.append(t_th1);
				t_tr.append(t_th2);
				t_tr.append(t_th3);
				t_tr.append(t_th4);
				t_tr.append(t_th5);
				t_tr.append(t_th6);
				t_tr.append(t_th7);
				
				
	  			for(i of data){
	  				
	  			var rd = getFormatDate(i.foodreservation_date);
	  				
	  			var subtr =$('<tr></tr>');
	  			table.append(subtr);
	  				
	  			var t_td1 =$('<td>'+i.foodreservation_number+'</td>');//
	  			var t_td2 =$('<td>'+i.member_guestid+'님'+'</td>');//
	  			var t_td3 =$('<td>'+i.food_name+'</td>');//
	  			var t_td4 =$('<td>'+rd+'</td>');//
	  			var t_td5 =$('<td>'+i.foodreservation_time+'</td>');//
	  			var t_td6 =$('<td>'+i.foodreservation_person+'명'+'</td>');//
	  			var t_td7 =$('<td><button class="fcbtn btn btn-warning"data-fresernum="'+i.foodreservation_number+'">예약취소</button></td>');//
	  				subtr.append(t_td1);
	  				subtr.append(t_td2);
	  				subtr.append(t_td3);
	  				subtr.append(t_td4);
	  				subtr.append(t_td5);
	  				subtr.append(t_td6);
	  				subtr.append(t_td7);
	  				
	  			}
     			
           },
           
           error:function(error){
                 console.log(error);
              }
     });//ajax 끝
    }else{
   		//아니오면 그냥 그대로 
    }
})

//----------------------------------------------------------------------------리뷰 작성란 
$("#myreview").on('click', function(e) {
	e.preventDefault;
	
	$.ajaxSetup({         
	      beforeSend : function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	      });//먼저 보냄

	      $.ajax({
	  		url:'myinfo/myhreview',
	  		type:'post',
	  	 	dataType:"json", //rest 컨트롤 이용	
	  		success:function(data){
	  			console.log("전체 내역",data);
	  			$("#title").empty();
	  			$("#Content").empty();
	  			
	  			var title = $('<div><h3>'+a+'님의 리뷰내역 '+'</h3></div>');
	  			$("#title").append(title);
	  			
	  			var table =$('<table class="table"></table>');//전체 테이블 
	  			$("#Content").append(table);
	  			
				var t_tr =$('<tr></tr>');//타이틀 tr
				table.append(t_tr);
				
				var t_th1 =$('<th>'+'예약번호'+'</th>');//
				var t_th2 =$('<th>'+'예약자명'+'</th>');//
				var t_th3 =$('<th>'+'예약장소'+'</th>');//
				var t_th4 =$('<th>'+'예약날짜'+'</th>');//
				var t_th5 =$('<th>'+'예약 인원'+'</th>');//
				var t_th6 =$('<th>'+'리뷰작성'+'</th>');//
				t_tr.append(t_th1);
				t_tr.append(t_th2);
				t_tr.append(t_th3);
				t_tr.append(t_th4);
				t_tr.append(t_th5);
				t_tr.append(t_th6);
				
	  			
				
	  			for(i of data.hlist){
	  				var cid = getFormatDate(i.reservation_checkin);
	  				var subtr =$('<tr></tr>');
		  			table.append(subtr);
	  				
	  				var t_td1 =$('<td>'+i.reservation_number+'</td>');//
     				var t_td2 =$('<td>'+i.member_guestid+'님'+'</td>');//
     				var t_td3 =$('<td>'+i.house_name+'</td>');//
     				var t_td4 =$('<td>'+cid+'</td>');//
     				var t_td5 =$('<td>'+i.reservation_person+'명'+'</td>');//
     				var t_td6 =$('<td><button class="hreviewbtn btn btn-success" data-toggle="modal" data-target="#exampleModalhreview" data-resernum="'+i.reservation_number+'">리뷰작성</button></td>');//
     				subtr.append(t_td1);
     				subtr.append(t_td2);
     				subtr.append(t_td3);
     				subtr.append(t_td4);
     				subtr.append(t_td5);
     				subtr.append(t_td6);
     				
     				$(".hreview").attr("data-hnum",i.house_number).attr("data-resernum",i.reservation_number);
	  				
	  			}
	  			
	  			for(i of data.flist){
	  				
	  				var rd = getFormatDate(i.foodreservation_date);
	  				
		  			var subtr =$('<tr></tr>');
		  			table.append(subtr);
		  				
		  			var t_td1 =$('<td>'+i.foodreservation_number+'</td>');//
		  			var t_td2 =$('<td>'+i.member_guestid+'님'+'</td>');//
		  			var t_td3 =$('<td>'+i.food_name+'</td>');//
		  			var t_td4 =$('<td>'+rd+'</td>');//
		  			var t_td5 =$('<td>'+i.foodreservation_person+'명'+'</td>');//
		  			var t_td6 =$('<td><button class="freviewbtn btn btn-success" data-toggle="modal" data-target="#exampleModalfreview" data-fresernum="'+i.foodreservation_number+'">리뷰작성</button></td>');//
		  				subtr.append(t_td1);
		  				subtr.append(t_td2);
		  				subtr.append(t_td3);
		  				subtr.append(t_td4);
		  				subtr.append(t_td5);
		  				subtr.append(t_td6);
		  				
		  				$(".freview").attr("data-fnum",i.food_number).attr("data-fresernum",i.foodreservation_number);
     				
	  			}
	  			
	  			
//--------------------------------------------------------------------------------------------------리뷰작성한 테이블 	  			
	  			var table2 =$('<br><table class="table" id="det"></table>');//전체 테이블 
	  			$("#Content").append(table2);
	  			
				var t_tr2 =$('<tr></tr>');//타이틀 tr
				table2.append(t_tr2);
				
				var t_th11 =$('<th>'+'작성자'+'</th>');//
				var t_th21 =$('<th>'+'작성날짜'+'</th>');//
				var t_th31 =$('<th>'+'예약장소'+'</th>');//
				var t_th41 =$('<th>'+'상세보기'+'</th>');//
				
				t_tr2.append(t_th11);
				t_tr2.append(t_th21);
				t_tr2.append(t_th31);
				t_tr2.append(t_th41);
				
				for(i of data.hrel){ //숙박작성한 리뷰 
	  				var rd = getFormatDate(i.house_review_date);
	  				var subtr =$('<tr class="hde"></tr>');
		  			table2.append(subtr);
	  				
	  				var t_td1 =$('<td>'+i.member_guestid+'님'+'</td>');//
     				var t_td2 =$('<td>'+rd+'</td>');//
     				var t_td3 =$('<td>'+i.house_name+'</td>');//
     				var t_td4 =$('<td><button name="'+i.house_review_number+'" class="detail btn btn-lg btn-primary" data-toggle="modal" data-target="#detail">자세히보기</button></td>');//
     				subtr.append(t_td1);
     				subtr.append(t_td2);
     				subtr.append(t_td3);
     				subtr.append(t_td4);
     				
				}
				
				for(i of data.hrel){ //맛집작성한 리뷰 
	  				var rd = getFormatDate(i.house_review_date);
	  				var subtr =$('<tr class="hde"></tr>');
		  			table2.append(subtr);
	  				
	  				var t_td1 =$('<td>'+i.member_guestid+'님'+'</td>');//
     				var t_td2 =$('<td>'+rd+'</td>');//
     				var t_td3 =$('<td>'+i.house_name+'</td>');//
     				var t_td4 =$('<td><button name="'+i.house_review_number+'" class="detail btn btn-lg btn-primary" data-toggle="modal" data-target="#detail">자세히보기</button></td>');//
     				subtr.append(t_td1);
     				subtr.append(t_td2);
     				subtr.append(t_td3);
     				subtr.append(t_td4);
     				
				}
	  				  			
	  		},
	           
	           error:function(error){
	                 console.log(error);
	              }
	     });//ajax 끝
})//---------------------------------------------------------------리뷰 작성 끝 

$(document).on('click',".detail", function() {
	console.log("클릭한 리뷰번호"+$(this).attr("name"));
	
	var rnum = $(this).attr("name");
	
	$.ajax({
        url: "myinfo/showhreview",
         type: 'post',
         data : {"house_review_number":rnum},
         dataType: "json", //rest 컨트롤 이용   
         success:function(data){
         console.log("자세한 리뷰내용",data);
         	$("#d_img").empty();
         	$("#d_content").empty();
         	
         	var d_content =$('<p>'+data[0].house_review_content+'</p>');
         	$("#d_content").append(d_content);
         	
         	for(i of data){
         		var d_img =$('<img style="width:200px;" src="'+i.house_review_sysfile+'">');
         		$("#d_img").append(d_img);
         	}
         },
         
         error:function(error){
               console.log(error);
            }
	 });//ajax 끝
})


//---------------------------------------------------------------------리뷰 자세히 모달 
//hreviewbtn 숙박리뷰작성
//freviewbtn 맛집리뷰작성 
//ex_filename 파일
//review_content 리플내용 


$("#fimg").hide();//이미지 보여주는거 숨김
$("#himg").hide();//이미지 보여주는거 숨김

$(".upload-hidden").change(function(e){
	$(".image_section").empty();  // 변할 때마다 리셋
	
	
	var files = e.target.files;
	
	console.log(files[0]); // 파일 어떤 내용들었는지 보기 1개니깐 [0]
	
	if(!files[0]["type"].match("image.*")){
		alert("확장자는 이미지 확장자만 가능함")
		return 
	}
	
	 var reader = new FileReader();
     reader.onload = function(e) {
         $('#image_section').attr('src', e.target.result);
     }
     reader.readAsDataURL(files[0]);
         $("#fimg").show();
         $("#himg").show();
	});//end forEach
//-----------------------------------------------------------------------이미지 

 $(document).on('click',".hreview",function(e){
	 
	 var house_number = e.target.dataset.hnum
	 var reservation_number= e.target.dataset.resernum
	 $("#h_number").val(house_number);
	 $("#r_number").val(reservation_number);
	 var formData = new FormData(document.getElementById("hre")); 
	 
	 console.log(formData.get("reservation_number"));
	 
	 $.ajaxSetup({         
	      beforeSend : function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	      });//먼저 보냄

	      $.ajax({
	  		url:'myinfo/inserthreview',
	  		type:'post',
	  		processData:false,
			contentType:false,  //제이슨 아니니깐 까보지마!!
	  		data: formData,
	  	 	dataType:"json", //rest 컨트롤 이용	
	  		success:function(data){
	  			console.log("작성리뷰 업데이트",data);
	  			$(".hde").empty();
	  			
	  			for(i of data){ //작성한 리뷰 
	  				var rd = getFormatDate(i.house_review_date);
	  				var subtr =$('<tr></tr>');
		  			$("#det").append(subtr);
	  				
	  				var t_td1 =$('<td>'+i.member_guestid+'님'+'</td>');//
     				var t_td2 =$('<td>'+rd+'</td>');//
     				var t_td3 =$('<td>'+i.house_name+'</td>');//
     				var t_td4 =$('<td><button name="'+i.house_review_number+'" class="detail btn btn-lg btn-primary" data-toggle="modal" data-target="#detail">자세히보기</button></td>');//
     				subtr.append(t_td1);
     				subtr.append(t_td2);
     				subtr.append(t_td3);
     				subtr.append(t_td4);
     				
				}
	  		
	  		},
	           
	           error:function(error){
	                 console.log(error);
	              }
	     });//ajax 끝
}) 

$(document).on('click',".freview",function(e){
	 
	 var food_number = e.target.dataset.fnum
	 var food_reservation_number= e.target.dataset.fresernum
	 $("#f_number").val(food_number);
	 $("#fr_number").val(food_reservation_number);
	 var formData = new FormData(document.getElementById("fre")); 
	 
	 console.log(formData.get("food_reservation_number"));
	 
	 $.ajaxSetup({         
	      beforeSend : function(xhr){
	         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
	      });//먼저 보냄

	      $.ajax({
	  		url:'myinfo/insertfreview',
	  		type:'post',
	  		processData:false,
			contentType:false,  //제이슨 아니니깐 까보지마!!
	  		data: formData,
	  	 	dataType:"json", //rest 컨트롤 이용	
	  		success:function(data){
	  			console.log("작성리뷰 업데이트",data);
	  			$(".hde").empty();
	  			
	  			for(i of data){ //작성한 리뷰 
	  				var rd = getFormatDate(i.house_review_date);
	  				var subtr =$('<tr></tr>');
		  			$("#det").append(subtr);
	  				
	  				var t_td1 =$('<td>'+i.member_guestid+'님'+'</td>');//
     				var t_td2 =$('<td>'+rd+'</td>');//
     				var t_td3 =$('<td>'+i.house_name+'</td>');//
     				var t_td4 =$('<td><button name="'+i.house_review_number+'" class="detail btn btn-lg btn-primary" data-toggle="modal" data-target="#detail">자세히보기</button></td>');//
     				subtr.append(t_td1);
     				subtr.append(t_td2);
     				subtr.append(t_td3);
     				subtr.append(t_td4);
     				
				}
	  		
	  		},
	           
	           error:function(error){
	                 console.log(error);
	              }
	     });//ajax 끝
}) 













//----------------------------------------------------------------------------
//날짜 포맷 변환기  str -> date ->str
function getFormatDate(strdate){
   var date = new Date(strdate);
   //console.log(date);
    var year = date.getFullYear();              //yyyy
 var month = (1 + date.getMonth());          //M
 month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
 var day = date.getDate();                   //d
 day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
 return  year + '년  ' + month + '월  ' + day+'일   ';
}
</script>
</html>