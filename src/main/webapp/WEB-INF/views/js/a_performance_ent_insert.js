/**
 * 
 */
		$(document).ready(function() {
			$('#time').timepicker({
				timeFormat : 'HH:mm',
				interval : 30,
				startTime : '00:00',
				dynamic : false,
				dropdown : true,
				scrollbar : true
			});
		});
		
		$(function() {
		    $("#sdatePicker").datepicker({
		      dateFormat: 'yy-mm-dd',
		      minDate: 'today'
		      ,showOn: "focus"
		      ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
              ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
              ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
              ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
		      ,onSelect: function(selectedDate) {
		        $("#edatePicker").datepicker("option", "minDate", selectedDate);
		      }
		    });
		  
		    $("#edatePicker").datepicker({
		      dateFormat: 'yy-mm-dd'
		      ,minDate: 'today'
		      ,showOn: "focus"
		      ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
              ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
              ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
              ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
		    });
		  });
		
		
		function changeselect(){
			var seat = "";
			var selected = document.getElementById("category");
			
			var selectValue = selected.options[selected.selectedIndex].value;
			
			if(selectValue == 1){
				document.getElementById("theaterseat").style.display = "none";
				document.getElementById("museumseat").style.display = "none";
				document.getElementById("concertseat").style.display = "block";
			}
			else if(selectValue == 2){
				document.getElementById("concertseat").style.display = "none";
				document.getElementById("museumseat").style.display = "none";
				document.getElementById("theaterseat").style.display = "block";
			}
			else if(selectValue == 3){
				document.getElementById("theaterseat").style.display = "none";
				document.getElementById("concertseat").style.display = "none";
				document.getElementById("museumseat").style.display = "block";
			}
			else if(selectValue == 0){
				document.getElementById("concertseat").style.display = "none";
				document.getElementById("theaterseat").style.display = "none";
				document.getElementById("museumseat").style.display = "none";
			}
		}
		
		function setpimg(event) {
			
			var obj=document.getElementById("pimg");
			
			pathpoint = obj.value.lastIndexOf('.');

			filepoint = obj.value.substring(pathpoint+1,obj.length);

			filetype = filepoint.toLowerCase();

			if(filetype=='jpg') {

				// 정상적인 이미지 확장자 파일인 경우
		        var reader = new FileReader();

		        reader.onload = function(event) {
		          var img = document.createElement("img");
		          img.setAttribute("src", event.target.result);
		          document.querySelector("div#pimgcontainer").appendChild(img);
		        };

		        reader.readAsDataURL(event.target.files[0]);

			} else {

				alert('.jpg 파일 확장자만 고를 수 있습니다.');

				$("#pimg").val("");

				return false;

			}
	      }

		function setcimg(event) {
			
			var obj=document.getElementById("cimg");
			
			pathpoint = obj.value.lastIndexOf('.');

			filepoint = obj.value.substring(pathpoint+1,obj.length);

			filetype = filepoint.toLowerCase();

			if(filetype=='jpg') {

				// 정상적인 이미지 확장자 파일인 경우
				var reader = new FileReader();

		        reader.onload = function(event) {
		          var img = document.createElement("img");
		          img.setAttribute("src", event.target.result);
		          document.querySelector("div#cimgcontainer").appendChild(img);
		        };

		        reader.readAsDataURL(event.target.files[0]);

			} else {

				alert('.jpg 파일 확장자만 고를 수 있습니다.');

				$("#cimg").val("");

				return false;
			}
	      }
		
		function a_insertperformance() {
			
			var form = document.getElementById("formm");
			
			var selected = document.getElementById("category");
			
			var selectValue = selected.options[selected.selectedIndex].value;
			
			if(selectValue == 1){
				var r =document.getElementById("rseat").value;
				var a =document.getElementById("aseat").value;
				var b =document.getElementById("bseat").value;
				
				if(r>0 && a>0 && b>0){
					
					seat = "r"+r+"a"+a+"b"+b;
				}
				else{
					alert("인원수를 설정해주세요.");
					return false;
				}
			}
			else if(selectValue == 2){
				var width =document.getElementById("width").value;
				var length =document.getElementById("length").value;
				
				if(width>0 && length>0){
					
					seat = "가로"+width+"세로"+length;
				}
				else{
					alert("인원수를 설정해주세요.");
					return false;
				}
				
			}
			else if(selectValue == 3){
				var am =document.getElementById("am").value;
				var pm =document.getElementById("pm").value;
								
				if(am>0 && pm>0){
					
					seat = "오전"+am+"오후"+pm;
				}
				else{
					alert("인원수를 설정해주세요.");
					return false;
				}
			}
			else{
				alert("공연을 선택 해주세요");
				
				return false;
			}
			
			if(document.getElementById("tname").value ==""){
				alert("공연명을 입력 해주세요");
				return false;
			}
			if(document.getElementById("place").value ==""){
				alert("공연장소를 입력 해주세요");
				return false;
			}
			
			if(document.getElementById("time").value ==""){
				alert("공연시간을 입력 해주세요");
				return false;
			}
			if(document.getElementById("price").value < 1000 || document.getElementById("price").value%1000 !== 0){
				alert("공연가격을 1000단위로 해주세요");
				return false;
			}
			if(document.getElementById("pimg").value == ""){
				alert("공연 포스터 이미지를 첨부해 주세요");
				return false;
			}
			if(document.getElementById("cimg").value == ""){
				alert("공연 정보 이미지를 첨부해 주세요");
				return false;
			}
			
			var seatinput = document.createElement('input');
			seatinput.setAttribute("type", "hidden");
			seatinput.setAttribute("name", "seat");
			seatinput.setAttribute("value", seat);
			form.appendChild(seatinput);
			
			var sdate = document.getElementById("sdatePicker").value;
			var sdateinput = document.createElement('input');
			sdateinput.setAttribute("type", "hidden");
			sdateinput.setAttribute("name", "sdate");
			sdateinput.setAttribute("value", sdate);
			form.appendChild(sdateinput);
			
			var edate = document.getElementById("edatePicker").value;
			var edateinput = document.createElement('input');
			edateinput.setAttribute("type", "hidden");
			edateinput.setAttribute("name", "edate");
			edateinput.setAttribute("value", edate);
			form.appendChild(edateinput);
			
			
			
			document.getElementById("formm").submit();
		}