<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html oncontextmenu="return false">
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="img/favicon.png">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="css/total_ent/concert_booking.css">
<title>concert_booking</title>
</head>
<c:set var="rableseat" value="${r-head1}"></c:set>
<c:set var="aableseat" value="${a-head2}"></c:set>
<c:set var="bableseat" value="${b-head3}"></c:set>
<body oncontextmenu="return false">
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
              <div><input type="hidden" min="1" max="${rableseat}" id="Rseathead" class="seathead" pattern="0*[1-9][0-9]*" onKeyup="onlyNumber(this)"></div>
            </td>
            <td>
              <c:out value="잔여석 : ${rableseat} 석"></c:out>
            </td>
          </tr>
          <tr>
            <td>
              <button type="button" value="A" class="seatbutton">A석</button>
              <div><input type="hidden" min="1" max="${aableseat}" id="Aseathead" class="seathead" pattern="0*[1-9][0-9]*" onKeyup="onlyNumber(this)"></div>
            </td>
            <td>
              잔여석 : ${aableseat} 석
            </td>
          </tr>
          <tr>
            <td>
              <button type="button" value="B" class="seatbutton">B석</button>
              <div><input type="hidden" min="1" max="${bableseat}" id="Bseathead" class="seathead" pattern="0*[1-9][0-9]*" onKeyup="onlyNumber(this)"></div>
            </td>
            <td>
              <c:out value="잔여석 : ${bableseat} 석"></c:out>
            </td>
          </tr>
          <tr>
            <td colspan="2">
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
        <input type="hidden" id="id" value="${membervo.id}">
      </form>
      <button type="button" id="nextButton" onclick="return submit()">Next</button>
    </div>
  </div>
</body>
<script src="js/total_ent/concert_booking.js"></script>
</html>