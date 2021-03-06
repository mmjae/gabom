<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a7e29fa39462f45fc2138a8307dbe830"></script>
<title>검색결과</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 검색창 부트스트랩 -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
<style>
#showhouse{
	padding:5px;
	background-color: white;
	border: 2px solid black;
}
body{overflow:scroll;}
.form-control-borderless {
    border:none;
}

.form-control-borderless:hover, .form-control-borderless:active, .form-control-borderless:focus {
    border: none;
    outline: none;
    box-shadow: none;
}

#middle{
	display:flex; 
}
#house_list{
	overflow: auto;
    height: 900px;
	width:45%;
	
}
.house{
	margin:15px;
	width:80%;
	border-bottom:2px solid gray;
	display:flex;
}
#maparea{
	width:70%;
}
#img{
	width:200px;
	height:100px;
	margin:0 10px 5px 0;
}
.out{
width:100%;
border:1px solid lightgray;
margin:40px 0 0 0;
border-radius: 50px;
}
#searchbtn{
border-radius: 40px;
background-color:#3abade
}
#housechangesearch{
border:none;
text-align:center;
}
#searchhouse{
text-align:center;
margin:0 10px;
border:none;
}

</style>
</head>
<body>
<header>
		<jsp:include page="/WEB-INF/views/header/househeader.jsp" />
	</header>
 <!-- searchdetail page에서 재검색하는 것  -->
 
	<div class="container">
	<div class="row justify-content-center">
                        <div class="col-12 col-md-5 col-lg-12">
                                <div style="padding: 0.5rem;margin:30px 0 30px 50px;" class="out card-body row no-gutters align-items-center">
                                    <div class="col-auto"> <!-- 돋보기 -->
                                        <i class="fas fa-search h4 text-body"></i>
                                    </div>
                                    <!--end of col-->
                                    <div class="col"><!-- 검색창 -->
                                        <input id="housechangesearch" name="house_address" class="form-control form-control-lg form-control-borderless" type="search" placeholder="지역을 입력해주세요">
                                    </div>
                                    <!--end of col-->
                                    <div class="col-auto"><!-- 검색버튼 -->
                                        <button id="searchbtn" class="btn btn-lg  " type="submit">Search</button>
                                    </div>
                                    <!--end of col-->
                                </div>
                        </div>
                        <!--end of col-->
                    </div>
</div>

<div id="middle">
		<div id="house_list" class="house_list">
		</div>
		
		<div id="maparea">
			<div id="map" style="width:100%; height: 900px;"></div>
		</div>
</div>



<div>
	<jsp:include page="/WEB-INF/views/footer/footer.jsp"/>
</div> 

</body>
<script>
let test = ${searchhouse};
console.log(test);

let house_list = document.getElementById("house_list");
let positions  =new Array; 
let xavg = 0;
let yavg =0;



for(let i of test ){
	console.log("집리스트 보여줘",i)
	 let out = $('<div class="house" name ='+[i.house_number]+'></div>')
	 let img = $('<div class="img"><img id="img" alt='+[i.house_sysname]+'name ='+[i.house_number]+' src="'+[i.house_sysname]+'"></div>')
	 let info = $('<div class="info"><p  style="font-weight:bold">'+[i.house_name]+"</p>"+"1박 가격  : "+[i.house_price]+'만원'+"<br>"+"주소 : "+[i.house_address]+'</div>')

	$("#house_list").append(out);
	out.append(img);
	out.append(info);
	
	
	//이거 갈굼1
	$(".house").on('click', function() { // 이미지 클릭시 url 이동
		console.log("집 클릭") 
		console.log($(this).attr("name"));
	    location.href="housedetail?house_number="+$(this).attr("name");
	});	
	
	
	console.log("지도")
	console.log(i)
	
	let innerList = {  
		title : i.house_name,
		content: '<div id="showhouse"><img style="width:100px" src="'+i.house_sysname+'">&nbsp&nbsp'+i.house_name+'</div>',
		latlng: new kakao.maps.LatLng(i.house_ypoint, i.house_xpoint)
	};
	
	yavg += Number(i.house_ypoint);
	xavg += Number(i.house_xpoint);
	
	positions.push(innerList)
	
}



//--------------------------------------지도 마커싱


xavg=xavg/test.length;

yavg=yavg/test.length;

console.log(xavg);
console.log(yavg);


console.log("positions[좌표모음]",positions)



let mapContainer = document.getElementById('map'), // 지도를 표시할 div 

mapOption = { 
    center: new kakao.maps.LatLng(yavg, xavg), // 지도의 중심좌표
    level: 7 // 지도의 확대 레벨
   };

//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
let map = new kakao.maps.Map(mapContainer, mapOption); 

let imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
let customOverlay ;

let bounds = new kakao.maps.LatLngBounds();
for (let i = 0; i < positions.length; i ++) {
    console.log(positions[i].latlng)
    // 마커 이미지의 이미지 크기 입니다
    let imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    let marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        image : markerImage, // 마커 이미지 
        title : positions[i].content
    });
    
    
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener());
   
    bounds.extend(positions[i].latlng);
	
}
map.setBounds(bounds)


function makeOverListener(map, marker) {
    return function() {
    	console.log(marker.getPosition())
    	console.log(marker.getTitle())
    	var t = marker.getPosition()
		t["Ga"] += 0.000;
    	t["Ha"] += 0.013;
    	console.log("t",t)
    	var content = marker.getTitle();
    	console.log("content",content);
    	customOverlay = new kakao.maps.CustomOverlay({
            position: t,
            content: content   
        });
    	customOverlay.setMap(map);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener() {
    return function() {
    	customOverlay.setMap(null);
    };
}


//---------------------------------------------------------------------------------------------------------

 $("#searchbtn").on("click", function(e) {
	 	console.log("ajax 재검색")
		var house_address=$("#housechangesearch").val();
	 	
	 	console.log("검색어",house_address);
	 	
		$.ajaxSetup({         
		      beforeSend : function(xhr){
		         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");}
		      });//먼저 보냄
	  
		$.ajax({
		       type:'post',
		        url:'hrest/housechangesearch',
		        data:{"data":house_address},
		        dataType:"json",
		        
		        success:function(data){
		        	
		        	 positions  =new Array; 
		        	 xavg = 0;
		        	 yavg =0;
		        	
					console.log("성공");
					 $('#house_list').empty();
					 $('#map').empty();
			         console.log(data);
			         
			         for(let i of data ){
			        		console.log("집리스트 보여줘",i)
			        		let out = $('<div class="house" name ='+[i.house_number]+'></div>')
							let img = $('<div class="img"><img id="img" alt='+[i.house_sysname]+'name ='+[i.house_number]+' src="'+[i.house_sysname]+'"></div>')
	 						let info = $('<div class="info"><p  style="font-weight:bold">'+[i.house_name]+"</p>"+"1박 가격 : "+[i.house_price]+'만원'+"<br>"+"주소 : "+[i.house_address]+'</div>')

			        		$("#house_list").append(out);
			        		out.append(img);
			        		out.append(info);

			        		console.log("ypoint",i.house_ypoint);
			        		console.log("xpoint",i.house_xpoint);
			        		console.log(i)
		        			let innerList = {  
		        				latlng: new kakao.maps.LatLng(i.house_ypoint, i.house_xpoint)
		        			};
		        			yavg += Number(i.house_ypoint);
		        			xavg +=  Number(i.house_xpoint);
		        			
		        			positions.push(innerList)
			        		
			         };
			         
			         $("#mainimg").on('click', function() { // 이미지 클릭시 url 이동
			     		console.log("집 클릭") 
			     		console.log($(this).attr("name"));
			     	    location.href="housedetail?house_number="+$(this).attr("name");
			     	});	
			        		
			         		

			        		
			        		console.log("positions[좌표] : " + positions);
			        		xavg=xavg/data.length;

			        		yavg=yavg/data.length;
			        		console.log("positions : " + positions);
			        		let mapContainer = document.getElementById('map') // 지도를 표시할 div 
			        		console.dir(mapContainer);
			        		
			        		mapOption = { 
			        		    center: new kakao.maps.LatLng(yavg, xavg), // 지도의 중심좌표
			        		    level: 7 // 지도의 확대 레벨
			        		   };
			        		
			        		//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
			        		let map = new kakao.maps.Map(mapContainer, mapOption); 

			        		let imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 

			        		let bounds = new kakao.maps.LatLngBounds();   
			        		
			        		for (let i = 0; i < positions.length; i ++) {
			        		    console.log(positions[i].latlng)
			        		    // 마커 이미지의 이미지 크기 입니다
			        		    let imageSize = new kakao.maps.Size(24, 35); 
			        		    
			        		    // 마커 이미지를 생성합니다    
			        		    let markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			        		    
			        		    // 마커를 생성합니다
			        		    let marker = new kakao.maps.Marker({
			        		        map: map, // 마커를 표시할 지도
			        		        position: positions[i].latlng, // 마커를 표시할 위치
			        		        /* title : positions[i].title, */ // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			        		        image : markerImage // 마커 이미지 
			        		    });
			        		    
			        		    bounds.extend(positions[i].latlng);
			        		}
			        		
			        		 map.setBounds(bounds)
				},
				error:function(error){
					console.log("실패")
				}
});
})//event end





</script>
</html>