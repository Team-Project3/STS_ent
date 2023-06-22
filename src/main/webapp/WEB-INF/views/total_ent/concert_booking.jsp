<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<title>Insert title here</title>
</head>
<style>
	

  body {
    font-family: Arial, sans-serif;
  }

  .container {
    display: flex;
    justify-content: center;
    align-items: flex-start;
    margin-top: 50px;
  }
  
  img {
    width: 300px;
    height: 363px;
    max-width: 100%;
    max-height: 100%;
  }
  .img{
  	margin-left: 20px;
    background-color: #f5f5f5;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  }

  .info {
    margin-left: 20px;
    background-color: #f5f5f5;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  }

  h2 {
    font-size: 24px;
    margin-bottom: 10px;
  }

  table {
    width: 300px;
    height: 300px;
    border-collapse: collapse;
    margin-bottom: 20px;
  }

  td {
    padding: 10px;
    text-align: center;
  }

  .seatbutton {
    display: block;
    width: 100%;
    border-radius: 50px;
    padding: 10px 20px;
    background-color: #e74c3c;
    color: white;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }

  .seatbutton:hover {
    background-color: #c0392b;
  }

  .seat-selection {
    margin-top: 10px;
    font-size: 18px;
    padding: 10px;
    border-radius: 5px;
    background-color: #f1f1f1;
  }

  .totalprice {
    margin-top: 10px;
    font-size: 20px;
    font-weight: bold;
  }

  #nextButton {
    margin-top: 20px;
    padding: 10px 20px;
    background-color: #3498db;
    color: white;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }

  #nextButton:hover {
    background-color: #2980b9;
  }
</style>
<c:set var="rableseat" value="${r-head1}"></c:set>
<c:set var="aableseat" value="${a-head2}"></c:set>
<c:set var="bableseat" value="${b-head3}"></c:set>
<body>
  <div class="container">
  	<div class="img">
  	<h2>공연장 정보</h2>
    <img src="img/concert/좌석배치도.png" id="chair">
    </div>
    <div class="info">
      <form action="total_ent_booking_detail" method="post" id="total_ent_booking">
        <h2>좌석 선택</h2>
        <table border="1">
          <tr>
            <td class="buttontd">
              <button type="button" value="R" class="seatbutton">R석</button>
              <div><input type="hidden" min="1" max="${rableseat}" id="Rseathead" class="seathead" pattern="0*[1-9][0-9]*"></div>
            </td>
            <td>
              <c:out value="잔여석 : ${rableseat} 석"></c:out>
            </td>
          </tr>
          <tr>
            <td>
              <button type="button" value="A" class="seatbutton">A석</button>
              <div><input type="hidden" min="1" max="${aableseat}" id="Aseathead" class="seathead" pattern="0*[1-9][0-9]*"></div>
            </td>
            <td>
              잔여석 : ${aableseat} 석
            </td>
          </tr>
          <tr>
            <td>
              <button type="button" value="B" class="seatbutton">B석</button>
              <div><input type="hidden" min="1" max="${bableseat}" id="Bseathead" class="seathead" pattern="0*[1-9][0-9]*"></div>
            </td>
            <td>
              <c:out value="잔여석 : ${bableseat} 석"></c:out>
            </td>
          </tr>
          <tr>
            <td>
              <div class="seat-selection" id="seat">좌석을 선택해주세요</div>
              <div class="totalprice" id="totalprice">0</div>
            </td>
          </tr>
        </table>

        <input type="hidden" id="R" value="${rableseat}">
        <input type="hidden" id="A" value="${aableseat}">
        <input type="hidden" id="B" value="${bableseat}">
        <input type="hidden" id="dday" value="${dday}" name="dday">
        <input type="hidden" id="tseq" name="tseq" value="${concert.tseq}">
        <input type="hidden" id="Rprice" value="${concert.price}">
        <c:set var="Aprice" value="${concert.price*0.8}"></c:set>
        <c:set var="Bprice" value="${concert.price*0.6}"></c:set>
        <input type="hidden" id="Aprice" value="${Aprice}">
        <input type="hidden" id="Bprice" value="${Bprice}">
      </form>
      <button type="button" id="nextButton" onclick="return submit()">Next</button>
    </div>
  </div>
</body>
<script src="js/concert_booking.js"></script>
</html>