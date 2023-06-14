<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body {
  font: 16px sans-serif;
  padding: 3em;
}

[data-quantity] {
  position: relative;
  width: 100%;
  max-width: 11rem;
  padding: 0;
  margin: 0;
  border: 0;
}

[data-quantity] legend {
  display: none;
}

[data-quantity] input {
  font-size: 18px;
  height: 4rem;
  padding: 0 4rem;
  border-radius: 2rem;
  border: 0;
  background: #fff;
  color: #222;
  box-shadow: 0 10px 65px -10px rgba(0, 0, 0, 0.25);
  text-align: center;
  width: 100%;
  box-sizing: border-box;
  font-weight: lighter;
}

[data-quantity] input:focus {
  outline: none;
  box-shadow: 0 5px 55px -10px rgba(0, 0, 0, 0.2), 0 0 4px #3fb0ff; /* Allows border radius on focus */
}

[data-quantity] input[type=number]::-webkit-inner-spin-button,
[data-quantity] input[type=number]::-webkit-outer-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

[data-quantity] input[type=number] {
  -moz-appearance: textfield;
}

[data-quantity] button {
  position: absolute;
  width: 2.8rem;
  height: 2.8rem;
  top: 0.6rem;
  display: block;
  padding: 0;
  margin: 0;
  border: 0;
  background: #fff
    url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="100" height="50"><path d="M17 25h16M67 25h16M75 17v16" fill="none" stroke="rgb(59,69,66)" stroke-width="1.5px" stroke-linecap="round" stroke-linejoin="round" /></svg>')
    no-repeat 0 0;
  background-size: 5.6rem 2.8rem;
  overflow: hidden;
  white-space: nowrap;
  text-indent: 100%;
  border-radius: 1.4rem;
  cursor: pointer;
  transition: opacity 0.15s;
  opacity: 0.5;
}

[data-quantity] button:active {
  background-position-y: 1px;
  box-shadow: inset 0 2px 12px -4px #c5d1d9;
}

[data-quantity] button:focus {
  outline: none;
}

[data-quantity] button:hover {
  opacity: 1;
}

[data-quantity] button.sub {
  left: 0.6rem;
}

[data-quantity] button.add {
  right: 0.6rem;
  background-position-x: -2.8rem;
}

</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
<style type="text/css">
 .button {
   background-color: red;
   color: white;
   padding: 10px;
   cursor: pointer;
   margin-right: 10px;
 }
 
 .input-container {
   margin-top: 20px;
 }
 
 #total-amount {
   margin-top: 20px;
   font-size: 18px;
 }
</style>

<div>
  <button class="button" id="s">S</button>
  <button class="button" id="a">A</button>
  <button class="button" id="b">B</button>
</div>

<div class="input-container"></div>

<div id="total-amount">
  Total Amount: $0
</div>
<script type="text/javascript">

</script>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>



$(document).ready(function() {
	  var pricePerPerson = {
	    s: 10,
	    a: 20,
	    b: 30
	  };

	  var activeOption = null;
	  var totalAmount = 0;
	  
	  $('.button').click(function() {
	    var option = $(this).attr('id');
	    var inputContainer = $('.input-container');
	    var inputField = inputContainer.find('input');
	    
	    if (inputField.length > 0 && inputField.data('option') === option) {
	      inputContainer.empty();
	      activeOption = null;
	      totalAmount = 0;
	      updateTotalAmount();
	      return;
	    }
	    
	    inputContainer.empty();
	    inputField = $('<input type="number" id="numPeople" min="0" value="0">');
	    inputField.data('option', option);
	    inputContainer.append(inputField);

	    inputField.on('input', function() {
	      var numPeople = parseInt($(this).val());
	      totalAmount = pricePerPerson[option] * numPeople;
	      updateTotalAmount();
	    });

	    activeOption = option;
	  });

	  $('.button').not('#s, #a, #b').click(function() {
	    if (activeOption !== null) {
	      activeOption = null;
	      totalAmount = 0;
	      updateTotalAmount();
	    }
	  });

	  function updateTotalAmount() {
	    var totalAmountText = (totalAmount === 0) ? '$0' : '$' + totalAmount;
	    $('#total-amount').text('Total Amount: ' + totalAmountText);
	  }
	});
</script>
</body>
</html>