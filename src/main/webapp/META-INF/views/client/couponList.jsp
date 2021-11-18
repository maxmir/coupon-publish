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
    <h1>선택 가능 쿠폰</h1>
</div>

<div class="container">
    <div style="text-align:right; margin-top:1em; margin-bottom: 0.2em;" />

    <table id="coupon" class="table table-striped table-hover table-bordered" style="background-color: #b3b7bbdd">
        <thead align="center">
        <tr>
            <th>쿠폰이름</th>
            <th>쿠폰설명</th>
            <th>유효기간 시작일</th>
            <th>유효기간 종료일</th>
            <th>최대수량</th>
            <th>발행수량</th>
            <th>남은수량</th>
            <th>발행요청</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach var="coupon" items="${coupons }" varStatus="status">
            <tr>
                <input type="hidden" name="seq" data-seq="${coupon.seq}" />
                <td name="name"><c:out value="${coupon.name }" /></td>
                <td name="description"><c:out value="${coupon.description }" /></td>
                <td name="availableStartDt"><c:out value="${coupon.available_start_dt }" /></td>
                <td name="availableEndDt"><c:out value="${coupon.available_end_dt }" /></td>
                <td name="maxCnt"><c:out value="${coupon.max_cnt }" /></td>
                <td name="publishCnt"><c:out value="${coupon.publish_cnt }" /></td>
                <td name="remainCnt"><c:out value="${coupon.remain_cnt }" /></td>
                <td id="reqCouponPubish"><button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#couponPublishModal" onclick="reqCouponPublishClick(<c:out value="${coupon.seq }" />);" >발행</button></td>
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

    <!-- Insert Modify Modal Start -->
    <div class="modal fade" id="couponPublishModal" tabindex="-1" role="dialog" aria-labelledby="publishModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="couponPublishModalLabel">쿠폰 발행</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="reqCouponPublishForm" name="reqCouponPublishForm" method="post">
                        <input type="hidden" id="couponSeq" name="couponSeq" />
                        <table class="table table-striped table-hover table-bordered">
                            <tr>
                                <td>발행요청 수량</td>
                                <td><input type="text" class="form-control" id="reqPublishCnt" name="reqPublishCnt" /></td>
                            </tr>
                        </table>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
<%--                    <button type="button" class="btn btn-primary" id="saveDataPlan" name="saveDataPlan">저장</button>--%>
                    <button type="button" class="btn btn-primary" id="savePublishCnt" name="savePublishCnt">저장</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Insert Modify Modal End -->

</div>

<script src="<c:url value='/js/jquery-3.5.1.min.js'/>"></script>
<script src="<c:url value='/js/popper.min.js'/>"></script>
<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
<script>
    // 발행 클릭
    function reqCouponPublishClick(couponSeq) {
        $('#couponPublishModalLabel').html('Coupon Publish');
        $('#couponSeq').val(couponSeq);

        // 모달 위치 조정
        $("#couponPublishModalLabel").css({
            top: 500
        });
    }

    // 저장버튼 클릭 - 발행요청 모달창 내부
    $(document).on('click', '#savePublishCnt', function() {
        $.ajax({
            type: 'POST',
            url: '/client/publish-coupon',
            cache: false,
            datatype: 'json',
            data: $('#reqCouponPublishForm').serialize(),
            success: function(data) {
                console.log('result', data);
                alert(data.msg);
                $('#couponPublishModal').modal('hide');
                location.reload();
            },
            error: function(e) {
                console.log(e.status, e.error);
                alert('----- error-----\n' + e.status + '   ' + e.error);
                $('#couponPublishModal').modal('hide');
            },
            complete : function() {
                // $('#insertModifyDataPlanForm').each(function() {
                //     this.reset();
                // });
            }
        });
    })
</script>
