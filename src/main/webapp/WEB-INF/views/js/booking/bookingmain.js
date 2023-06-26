var IMP = window.IMP;
var oseq = document.getElementById("oseq").value;
var head = document.getElementById("head").value;
var tname = document.getElementById("tname").value;
var totalprice = document.getElementById("totalprice").value;
var email = document.getElementById("email").value;
var name = document.getElementById("name").value;
var phone = document.getElementById("phone").value;
var form = document.getElementById("submit");
var formSubmitted = false;
IMP.init("imp53212873"); // / 예: imp00000000

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
          merchant_uid: random(4)+oseq,
          name: tname+" "+head+"명",
          amount: totalprice,
          buyer_email: email,
          buyer_name: name,
          buyer_tel: phone
      }, 
      function (rsp) { // callback
          if (rsp.success) {
        	  formSubmitted = true;
        	  form.submit();
          } 
          else {
        	  alert("예매에 실패하였습니다 다시 결제 해주세요");
          }
      });
    }
    
    function nicepay() {	
        // IMP.request_pay(param, callback) 결제창 호출
        IMP.request_pay({ // param
            pg: "nice",
            pay_method: "trans",
            merchant_uid: random(4)+oseq,
            name: tname+" "+head+"명",
            amount: totalprice,
            buyer_email: email,
            buyer_name: name,
            buyer_tel: phone
        }, function (rsp) { // callback
      	  console.log(rsp);
            if (rsp.success) {
            	formSubmitted = true;
            	  form.submit();
            } else {
            	 alert("예매에 실패하였습니다 다시 결제 해주세요");
            }
        });
      }
    
    function kicc() {	
        // IMP.request_pay(param, callback) 결제창 호출
        IMP.request_pay({ // param
            pg: "kicc",
            pay_method: "card",
            merchant_uid: random(4)+oseq,
            name: tname+" "+head+"명",
            amount: totalprice,
            buyer_email: email,
            buyer_name: name,
            buyer_tel: phone
        }, function (rsp) { // callback
      	  console.log(rsp);
            if (rsp.success) {
            	formSubmitted = true;
          	  submit.submit();
            } else {
            	 alert("예매에 실패하였습니다 다시 결제 해주세요");
            }
        });
      }
    
    function tosspayments() {	
        // IMP.request_pay(param, callback) 결제창 호출
        IMP.request_pay({ // param
            pg: "uplus",
            pay_method: "card",
            merchant_uid: random(4)+oseq,
            name: tname+" "+head+"명",
            amount: totalprice,
            buyer_email: email,
            buyer_name: name,
            buyer_tel: phone
        }, function (rsp) { // callback
      	  console.log(rsp);
            if (rsp.success) {
            	formSubmitted = true;
          	  submit.submit();
            } else {
          	  alert("예매에 실패하였습니다 다시 결제 해주세요");
            }
        });
      }
    window.addEventListener('beforeunload', function(event) {
  	  if (!formSubmitted) {
  		window.opener.postMessage(oseq, '*');
  	  }
    });