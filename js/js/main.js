/**
 * 
 */

$(document).ready(function() {

        //날짜, 요일, 시간을 출력해주는 함수 만들기 
        function startDate(){
	        var now=new Date()
	        
			var hours=23-now.getHours()
	        var minutes=60-now.getMinutes();
	        var seconds=60-now.getSeconds();
	
	        //시분초 ampm 00:00:00
	        var time=`${zero(hours)}:${zero(minutes)}:${zero(seconds)}`;
	       	document.getElementById('time').innerText=`${time}`;         
	    }
	
        //계속 실행
        setInterval(startDate, 10);
	        
        function zero(num){
	        if(num<10){
	            num='0'+num;
	        }
	        return num;
        }

		
		//menu product
		$('.menu_product ul.menu_btn li').click(function (e) { 
	        e.preventDefault();
	        $('.menu_product ul.menu_btn li').removeClass('on');
	        $(this).addClass('on')   
	    })
})