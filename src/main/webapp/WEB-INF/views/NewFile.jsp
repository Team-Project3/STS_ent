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
	
	var submit = document.getElementById("submit");
	var IMP = window.IMP;
	IMP.init("imp53212873"); /// 예: imp00000000	

    function kakaoPay() {	
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: "kakaopay",
          pay_method: "card",
          merchant_uid: "32332",
          name: "김태욱",
          amount: 32322,
          buyer_email: "gildong@gmail.com",
          buyer_name: "홍길동",
          buyer_tel: "01042424242",
          buyer_addr: "서울특별시 강남구 신사동",
          buyer_postcode: "01181"
      }, function (rsp) { // callback
          if (rsp.success) {
        	  submit.submit();
          } else {
        	  alert("실패 :코드("+rsp.error_code+") / message(" +rsp.error_msg+")");
        	  location.href='bookingfail?oseq='+${oseq};
          }
      });
    }
  </script>
</head>
<body>
<form action="index" id="submit" method="get"></form>
<button onclick="kakaoPay()"><img alt="" src="img/booking/kakaopay.png"></button>

</body>
</html>