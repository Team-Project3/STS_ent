<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>QuantityInput.js</title>
<style type="text/css">
.input-number-group {
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
}

.input-number-group input[type=number]::-webkit-inner-spin-button,
	.input-number-group input[type=number]::-webkit-outer-spin-button {
	-webkit-appearance: none;
	appearance: none;
}

.input-number-group .input-group-button {
	line-height: calc(80px/ 2 - 5px);
}

.input-number-group .input-number {
	width: 40px;
	padding: 0 12px;
	vertical-align: top;
	text-align: center;
	outline: none;
	display: block;
	margin: 0;
}

.input-number-group .input-number, .input-number-group .input-number-decrement,
	.input-number-group .input-number-increment {
	border: 1px solid #cacaca;
	height: 40px;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	border-radius: 0;
}

.input-number-group .input-number-decrement, .input-number-group .input-number-increment
	{
	display: inline-block;
	width: 40px;
	background: #e6e6e6;
	color: #0a0a0a;
	text-align: center;
	font-weight: bold;
	cursor: pointer;
	font-size: 2rem;
	font-weight: 400;
}

.input-number-group .input-number-decrement {
	margin-right: 0.3rem;
}

.input-number-group .input-number-increment {
	margin-left: 0.3rem;
}
</style>

</head>
<body>
	<button type="button" onclick="showTable('s')" id="sButton">S</button>
	<button type="button" onclick="showTable('a')" id="aButton">A</button>
	<button type="button" onclick="showTable('b')" id="bButton">B</button>
	<table border="1" id="myTable" style="display: none;">
		<tr>
			<td>인원</td>
			<td>
				<div class="input-group input-number-group">
					<div class="input-group-button">
						<span class="input-number-decrement">-</span>
					</div>
					<input class="input-number" type="number" value="0" min="0"
						max="1000">
					<div class="input-group-button">
						<span class="input-number-increment">+</span>
					</div>
				</div>
			</td>
		</tr>
	</table>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
  	
	var selectedButton = null;

	function showTable(button) {
	  var table = document.getElementById("myTable");
	  var currentButton = document.getElementById(button+"Button");

	  if (table.style.display === "none") {
	    table.style.display = "table";

	    if (selectedButton) {
	      selectedButton.style.backgroundColor = "";
	    }

	    currentButton.style.backgroundColor = "red";
	    selectedButton = currentButton;
	  } else {
	    table.style.display = "none";
	    currentButton.style.backgroundColor = "";
	    selectedButton = null;
	  }
	}
  	
  	$('.input-number-increment').click(function() {
  	  var $input = $(this).parents('.input-number-group').find('.input-number');
  	  var val = parseInt($input.val(), 10);
  	  $input.val(val + 1);
  	});

  	$('.input-number-decrement').click(function() {
  	  var $input = $(this).parents('.input-number-group').find('.input-number');
  	  var val = parseInt($input.val(), 10);
  	  $input.val(val - 1);
  	})
	</script>

</body>
</html>