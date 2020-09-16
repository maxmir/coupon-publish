<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
</head>
<body>
	<div class="jumbotron text-center mb-0">
		<h1>LGU+ Data Plan Manage</h1>
	</div>

	<div class="container">
    <form id="dataPlanListForm" name="dataPlanListForm" method="post">
        <!-- Button trigger modal -->
        <div style="text-align:right; margin-top:1em; margin-bottom: 0.2em;">
        <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#insertModifyModal" onclick="insertDataPlanClick();" >입력</button>
        </div>
        </form>

        <table class="table table-striped table-hover table-bordered">
            <thead align="center">
                <tr>
                    <th>서비스코드</th>
                    <th>서비스이름</th>
                    <th>적용여부</th>
                    <th>최종수정일</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="result" items="${manageDataPlanList }" varStatus="status">
                    <tr>
                        <td name="svcCd"><c:out value="${result.DEGCS_SVCCD }" /></td>
                        <td name="svcNm"><c:out value="${result.DEGCS_SVCNM }" /></td>
                        <td align="center" name="enableYn"><c:out value="${result.DEGCS_ENABLE_YN }" /></td>
                        <td><c:out value="${result.DEGCS_SVC_UPDATEDATE }" /></td>
                        <td align="center">
                        	<button type="button" class="btn btn-warning" name="modifyDataPlan" onclick="modifyDataPlanClick(this);" data-toggle="modal" data-target="#insertModifyModal">수정</button>
                        	<button type="button" class="btn btn-danger"  name="deleteDataPlan" onclick="deleteDataPlanClickOnList('<c:out value="${result.DEGCS_SVCCD }" />');" data-toggle="modal" data-target="#deleteConfirmModal">삭제</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

		<!-- Insert Modify Modal Start -->
        <div class="modal fade" id="insertModifyModal" tabindex="-1" role="dialog" aria-labelledby="insertModifyModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="insertModifyModalLabel">Insert Data Plan</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="insertModifyDataPlanForm" name="insertModifyDataPlanForm" method="post">
                        <table class="table table-striped table-hover table-bordered">
                            <input type="hidden" id="isInsert" name="isInsert" />
                            <tr>
                                <td>서비스코드</td>
                                <td><input readonly="readonly" type="text" class="form-control" id="svcCd" name="svcCd" /></td>
                            </tr>
                            <tr>
                                <td>서비스이름</td>
                                <td><input type="text" class="form-control" id="svcNm" name="svcNm" /></td>
                            </tr>
                            <tr>
                                <td>적용여부</td>
                                <td>
                                    <select class="form-control" id="enableYn" name="enableYn">
                                        <option value="Y">Y</option>
                                        <option value="N">N</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-primary" id="saveDataPlan" name="saveDataPlan">저장</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Insert Modify Modal End -->


        <!-- Delete Confirm Modal Start -->
        <div class="modal fade" id="deleteConfirmModal" tabindex="-1" role="dialog" aria-labelledby="deleteConfirmModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="deleteConfirmModalLabel">Delete Data Plan</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        이 데이터플랜을 삭제하시겠습니까?
                        <input type="hidden" id="deleteSvcCd" name="deleteSvcCd">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
                        <button type="button" class="btn btn-danger" onclick="deleteDataPlanClickOnModal();">삭제</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Delete Confirm Modal End -->
</div>

<script src="<c:url value='/js/jquery-3.5.1.min.js'/>"></script>
<script src="<c:url value='/js/popper.min.js'/>"></script>
<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
<script>

// 화면 표시시 맨우 스크롤
window.onbeforeunload = function () {
    window.scrollTo(0, 0);
}

// 입력버튼 클릭
function insertDataPlanClick() {
    $('#insertModifyModalLabel').html('Insert Data Plan');
    $('#svcCd').val('').removeAttr('readonly');
    $('#svcNm').val('');
    $('#enableYn').val('Y');
    $('#isInsert').val(true);

    // 모달 위치 조정
    $("#insertModifyModal").css({
        top: 200
    });
}

// 수정버튼 클릭
function modifyDataPlanClick(event) {
    var parentNode = event.parentNode.parentNode;
    var svcCd = parentNode.querySelector('[name=svcCd]').innerText;
    var svcNm = parentNode.querySelector('[name=svcNm]').innerText;
    var enableYn = parentNode.querySelector('[name=enableYn]').innerText;
    console.log(svcCd, svcNm, enableYn);

    $('#insertModifyModalLabel').html('Modify Data Plan');
    $('#svcCd').val(svcCd).attr('readonly', 'readonly');
    $('#svcNm').val(svcNm);
    $('#enableYn').val(enableYn);
    $('#isInsert').val(false);
}

// 전체목록의 삭제버튼 클릭 - svcCd 설정
function deleteDataPlanClickOnList(svcCd) {
    $('#deleteSvcCd').val(svcCd);

    // 모달 위치 조정
    $("#deleteConfirmModal").css({
        top: 300
    });
}

// 삭제 선택창의 삭제버튼 클릭
function deleteDataPlanClickOnModal() {
    var thisSvcCd = $('#deleteSvcCd').val();

    $.ajax({
        type: 'DELETE',
        url: '/deleteDataPlan',
        cache: false,
        datatype: 'json',
        data: {"svcCd": thisSvcCd},
        success: function(data) {
            console.log('result', data);
            alert(data.resMsg);
            location.reload();
        },
        error: function(e) {
            console.log(e.status, e.error);
            alert(e);
        },
        complete : function() {
            $('#insertModifyDataPlanForm').each(function() {
                this.reset();
            });
        }
    });
}

// 저장버튼 클릭 - 입력, 수정 모달창 내부
$(document).on('click', '#saveDataPlan', function() {
    var thisType = '';
    var thisUrl = '';
    var isInsert = $('#isInsert').val();

    if (isInsert === 'true') {  // 입력시
        thisType = 'POST';
        thisUrl = '/insertDataPlan';
    }
    else {  // 수정시
        thisType = 'PUT';
        thisUrl = '/modifyDataPlan';
    }

    $.ajax({
	    type: thisType,
	    url: thisUrl,
	    cache: false,
	    datatype: 'json',
	    data: $('#insertModifyDataPlanForm').serialize(),
	    success: function(data) {
            console.log('result', data);
            alert(data.resMsg);
            $('#insertModifyModal').modal('hide');
            location.reload();
        },
        error: function(e) {
            console.log(e.status, e.error);
            alert('----- error-----\n' + e.status + '   ' + e.error);
            $('#insertModifyModal').modal('hide');
        },
        complete : function() {
            $('#insertModifyDataPlanForm').each(function() {
                this.reset();
            });
        }
    });
})
</script>
</body>
</html>