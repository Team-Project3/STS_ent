<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
img {
	width: 200px;
	height: 100px;
}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
var IMP = window.IMP;
IMP.init("imp53212873"); /// 예: imp00000000	

const random = (length = 8) => {
	  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
	  let str = '';

	  for (let i = 0; i < length; i++) {
	    str += chars.charAt(Math.floor(Math.random() * chars.length));
	  }
	  return str;
	
	};

    function kakaoPay() {	
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: "kakaopay",
          pay_method: "card",
          merchant_uid: random(4)+"${orderVO.oseq}",
          name: "${totalVO.tname}"+" "+"${orderVO.head}"+"명",
          amount: "${totalprice}",
          buyer_email: "${memberVO.email}",
          buyer_name: "${memberVO.name}",
          buyer_tel: "${memberVO.phone}"
      }, 
      function (rsp) { // callback
          if (rsp.success) {
        	  var form = document.getElementById("submit");
        	  var input = document.createElement("input");
              input.setAttribute("type", "hidden");
              input.setAttribute("name", "oseq"); // Set the name for the input field
              input.setAttribute("value", "${orderVO.oseq}"); // Set the value for the input field
              form.appendChild(input);
        	  form.submit();
          } 
          else {
        	  alert("실패 :코드("+rsp.error_code+") / message(" +rsp.error_msg+")"+random(2));
          }
      });
    }
    
    function nicepay() {	
        // IMP.request_pay(param, callback) 결제창 호출
        IMP.request_pay({ // param
            pg: "nice",
            pay_method: "trans",
            merchant_uid: random(4)+"${orderVO.oseq}",
            name: "${totalVO.tname}"+" "+"${orderVO.head}"+"명",
            amount:  "${totalprice}",
            buyer_email: "${memberVO.email}",
            buyer_name: "${memberVO.name}",
            buyer_tel: "${memberVO.phone}"
        }, function (rsp) { // callback
      	  console.log(rsp);
            if (rsp.success) {
            	  var form = document.getElementById("submit");
            	  var input = document.createElement("input");
                  input.setAttribute("type", "hidden");
                  input.setAttribute("name", "oseq"); // Set the name for the input field
                  input.setAttribute("value", "${orderVO.oseq}"); // Set the value for the input field
                  form.appendChild(input);
            	  form.submit();
            } else {
          	  alert("실패 :코드("+rsp.error_code+") / message(" +rsp.error_msg+")");
            }
        });
      }
    
    function kicc() {	
        // IMP.request_pay(param, callback) 결제창 호출
        IMP.request_pay({ // param
            pg: "kicc",
            pay_method: "card",
            merchant_uid: random(4)+"${orderVO.oseq}",
            name: "${totalVO.tname}"+" "+"${orderVO.head}"+"명",
            amount:  "${totalprice}",
            buyer_email: "${memberVO.email}",
            buyer_name: "${memberVO.name}",
            buyer_tel: "${memberVO.phone}"
        }, function (rsp) { // callback
      	  console.log(rsp);
            if (rsp.success) {
          		var submit = document.getElementById("submit");
          	  submit.submit();
            } else {
          	  alert("실패 :코드("+rsp.error_code+") / message(" +rsp.error_msg+")");
            }
        });
      }
    
    function tosspayments() {	
        // IMP.request_pay(param, callback) 결제창 호출
        IMP.request_pay({ // param
            pg: "uplus",
            pay_method: "card",
            merchant_uid: random(4)+"${orderVO.oseq}",
            name: "${totalVO.tname}"+" "+"${orderVO.head}"+"명",
            amount:  "${totalprice}",
            buyer_email: "${memberVO.email}",
            buyer_name: "${memberVO.name}",
            buyer_tel: "${memberVO.phone}"
        }, function (rsp) { // callback
      	  console.log(rsp);
            if (rsp.success) {
          		var submit = document.getElementById("submit");
          	  submit.submit();
            } else {
          	  alert("실패 :코드("+rsp.error_code+") / message(" +rsp.error_msg+")");
            }
        });
      }
  </script>
</head>
<body>
<form action="BookingSuccess" id="submit" method="get"><input type="hidden" name="oseq" value="${orderVO.oseq}"></form><!-- form 태그 여기다가 둔 이유 : 밑에다가 두면 무조건 rsp가 success로 인식하고 다음페이지로 보냄 -->
<button onclick="kakaoPay()"><img alt="" src="img/booking/kakaopay.png"></button>
<button onclick="nicepay()"><img alt="" src="img/booking/nicepay.png"></button>
<button onclick="kicc()"><img alt="" src="img/booking/kicc.webp"></button>
<button onclick="tosspayments()"><img alt="" src="img/booking/toss.png"></button>
</body>
</html>