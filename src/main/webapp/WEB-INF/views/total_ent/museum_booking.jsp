<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel='stylesheet' href='css/total_ent/museum_booking.css'>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    </head>
<body>
    <div class="container">
        <div class="image-container">
            <img id="img" src="img/museum/${museum.pimg}.jpg">
        </div>
        <div class="table-container">
            <form action="total_ent_booking_detail" method="post" id="museum_booking" onsubmit="return false;">
                <table>
                    <tr>
                        <td class="title">전시회 제목</td>
                        <td>${museum.tname}</td>
                    </tr>
                    <tr>
                        <td class="title">선택 날짜</td>
                        <td>${dday}</td>
                    </tr>
                    <tr>
                        <td class="title">시간 선택</td>
                        <td>
                            <select id="seat" name="seat">
                                <option value="">시간 선택</option>
                                <option value="오전">오전</option>
                                <option value="오후">오후</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="title">인원 수</td>
                        <td>
                            <input type="number" id="headvalue" min="1" value="1" oninput="calculateTotal()" name="headvalue">매
                        </td>
                    </tr>
                    <tr>
                        <td class="title">결제금액</td>
                        <td><span id="totalPrice">${museum.price}</span>원</td>
                    </tr>
                    <tr>
                        <td class="title">오전 예약인원</td>
                        <td>${head}</td>
                    </tr>
                    <tr>
                        <td class="title">오후 예약인원</td>
                        <td>${head2}</td>
                    </tr>
                </table>
                <div class="button-container">
                    <button onclick="return submitForm()">다음</button>
                </div>
                <input type="hidden" name="tseq" value="${museum.tseq}">
                <input type="hidden" value="${dday}" name="dday">
                <input type="hidden" value="" name="totalPrice">
                <input type="hidden" value="${am}" id="am">
                <input type="hidden" value="${pm}" id="pm">
                <input type="hidden" value="${head}" id="head1">
                <input type="hidden" value="${head2}" id="head2">
                <input type="hidden" value="${museum.price}" id="price">
            </form>
        </div>
    </div>
</body>
<script src="js/total_ent/museum_booking.js"></script>
</html>