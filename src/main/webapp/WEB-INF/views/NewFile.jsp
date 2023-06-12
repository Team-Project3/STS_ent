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
	

	var IMP = window.IMP;
	IMP.init("imp53212873"); /// 예: imp00000000	

    function kakaoPay() {	
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: "kakaopay",
          pay_method: "card",
          merchant_uid: "333333453412",
          name: "김태욱",
          amount: 32322,
          buyer_email: "gildong@gmail.com",
          buyer_name: "홍길동",
          buyer_tel: "01042424242",
          buyer_addr: "서울특별시 강남구 신사동",
          buyer_postcode: "01181"
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

    function kgpay() {	
        // IMP.request_pay(param, callback) 결제창 호출
        IMP.request_pay({ // param
            pg: "html5_inicis.INIBillTst",
            pay_method: "card",
            merchant_uid: "123434345",
            name: "김태욱",
            amount: 100,
            buyer_email: "gildong@gmail.com",
            buyer_name: "홍길동",
            buyer_tel: "01042424242",
            buyer_addr: "서울특별시 강남구 신사동",
            buyer_postcode: "01181"
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
    function tosspay() {	
        // IMP.request_pay(param, callback) 결제창 호출
        IMP.request_pay({ // param
            pg: "tosspay",
            pay_method: "card",
            merchant_uid: "2342332432",
            name: "김태욱",
            amount: 100,
            buyer_email: "gildong@gmail.com",
            buyer_name: "홍길동",
            buyer_tel: "01042424242",
            buyer_addr: "서울특별시 강남구 신사동",
            buyer_postcode: "01181"
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
    function payco() {	
        // IMP.request_pay(param, callback) 결제창 호출
        IMP.request_pay({ // param
            pg: "payco",
            pay_method: "trans",
            merchant_uid: "23423432",
            name: "김태욱",
            amount: 100,
            buyer_email: "gildong@gmail.com",
            buyer_name: "홍길동",
            buyer_tel: "01042424242",
            buyer_addr: "서울특별시 강남구 신사동",
            buyer_postcode: "01181"
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
    function nicepay() {	
        // IMP.request_pay(param, callback) 결제창 호출
        IMP.request_pay({ // param
            pg: "nice",
            pay_method: "trans",
            merchant_uid: "234234323434343232332",
            name: "김태욱",
            amount: 1000,
            buyer_email: "gildong@gmail.com",
            buyer_name: "홍길동",
            buyer_tel: "01042424242",
            buyer_addr: "서울특별시 강남구 신사동",
            buyer_postcode: "01181"
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
    function kicc() {	
        // IMP.request_pay(param, callback) 결제창 호출
        IMP.request_pay({ // param
            pg: "kicc",
            pay_method: "card",
            merchant_uid: "234234334323232332",
            name: "김태욱",
            amount: 100,
            buyer_email: "gildong@gmail.com",
            buyer_name: "홍길동",
            buyer_tel: "01042424242",
            buyer_addr: "서울특별시 강남구 신사동",
            buyer_postcode: "01181"
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
            pg: "tosspayments",
            pay_method: "card",
            merchant_uid: "234234334323232332",
            name: "김태욱",
            amount: 100,
            buyer_email: "gildong@gmail.com",
            buyer_name: "홍길동",
            buyer_tel: "01042424242",
            buyer_addr: "서울특별시 강남구 신사동",
            buyer_postcode: "01181"
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
    function tosspayments1() {	
        // IMP.request_pay(param, callback) 결제창 호출
        IMP.request_pay({ // param
            pg: "uplus",
            pay_method: "card",
            merchant_uid: "2342343323343232312332",
            name: "김태욱",
            amount: 100,
            buyer_email: "gildong@gmail.com",
            buyer_name: "홍길동",
            buyer_tel: "01042424242",
            buyer_addr: "서울특별시 강남구 신사동",
            buyer_postcode: "01181"
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
    
    function tosspayments2() {	
        // IMP.request_pay(param, callback) 결제창 호출
        IMP.request_pay({ // param
            pg: "tosspay",
            pay_method: "card",
            merchant_uid: "234234334444432fdfd32312332",
            name: "김태욱",
            amount: 100,
            buyer_email: "gildong@gmail.com",
            buyer_name: "홍길동",
            buyer_tel: "01042424242",
            buyer_addr: "서울특별시 강남구 신사동",
            buyer_postcode: "01181"
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
<form action="index" id="submit" method="get"></form>
<button onclick="kakaoPay()">카카오</button>
<button onclick="kgpay()">kg이니시스</button>
<button onclick="tosspay()">토스페이</button>
<button onclick="payco()">페이코</button>
<button onclick="nicepay()">나이스페이</button>
<button onclick="kicc()">kicc</button>
<button onclick="tosspayments()">토스페이먼츠</button>
<button onclick="tosspayments1()">구토스페이먼츠</button>
<button onclick="tosspayments2()">토스페이먼츠</button>
</body>
</html>