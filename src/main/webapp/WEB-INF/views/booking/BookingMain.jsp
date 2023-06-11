<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

    function kakaoPay() {	
    	var IMP = window.IMP;
    	IMP.init("imp53212873"); /// 예: imp00000000	
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: "kakaopay",
          pay_method: "card",
          merchant_uid: "${orderVO.oseq}",
          name: "${totalVO.tname}"+" "+"${orderVO.head}"+"명",
          amount: ${totalVO.price}*${orderVO.head}
      }, function (rsp) { // callback
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
  </script>
</head>
<body>
<form action="index" id="submit" method="get"></form><!-- form 태그 여기다가 둔 이유 : 밑에다가 두면 무조건 rsp가 success로 인식하고 다음페이지로 보냄 -->
<button onclick="kakaoPay()"><img alt="" src="img/booking/kakaopay.png"></button>

</body>
</html>