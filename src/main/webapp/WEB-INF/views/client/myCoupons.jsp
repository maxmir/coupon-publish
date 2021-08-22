<%--
  Created by IntelliJ IDEA.
  User: kjh
  Date: 2021/08/22
  Time: 1:05 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css'/>">
    <%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">--%>
</head>
<body>
<div class="text-center mb-0" style="background-color: #491217bb; padding: 2rem 1rem; color: snow">
    <h1>발급 받은 내 쿠폰 내역</h1>
</div>

<div class="container">
    <div style="text-align:right; margin-top:1em; margin-bottom: 0.2em;" />

    <table id="coupon" class="table table-striped table-hover table-bordered" style="background-color: #b3b7bbdd">
        <thead align="center">
        <tr>
            <th>쿠폰이름</th>
            <th>쿠폰설명</th>
            <th>발행요청일</th>
            <th>발행수량</th>
            <th>유효기간 시작일</th>
            <th>유효기간 종료일</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach var="coupon" items="${myCoupons }" varStatus="status">
            <tr>
                <input type="hidden" name="seq" data-seq="${coupon.seq}" />
                <td name="name"><c:out value="${coupon.name }" /></td>
                <td name="description"><c:out value="${coupon.description }" /></td>
                <td name="quantity"><c:out value="${coupon.regist_dt }" /></td>
                <td name="quantity"><c:out value="${coupon.quantity }" /></td>
                <td name="availableStartDt"><c:out value="${coupon.available_start_dt }" /></td>
                <td name="availableEndDt"><c:out value="${coupon.available_end_dt }" /></td>
            </tr>
        </c:forEach>

            <%--
            <tr>
                <td name="name"></td>
                <td name="description"></td>
                <td name="availableStartDt"></td>
                <td name="availableEndDt"></td>
                <td name="maxCnt"><</td>
                <td name="publishCnt"></td>
                <td name="remainCnt"></td>
            </tr>
            --%>
        </tbody>
    </table>

</div>

<script src="<c:url value='/js/jquery-3.5.1.min.js'/>"></script>
<script src="<c:url value='/js/popper.min.js'/>"></script>
<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
