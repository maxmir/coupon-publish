<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
<div class="container">
    <form id="dataPlanListForm" name="dataPlanListForm" method="post">
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
                        <td><c:out value="${result.DEGCS_OAUTH_LASTUPDATE }" /></td>
                        <td align="center">
<%--                         	<button type="button" class="btn btn-warning" name="modifyDataPlan" onclick="modifyDataPlanClick('<c:out value="${result.DEGCS_SVCCD }" />');" data-toggle="modal" data-target="#myModal">수정</button> --%>
                        	<button type="button" class="btn btn-warning" name="modifyDataPlan" onclick="modifyDataPlanClick(this);" data-toggle="modal" data-target="#myModal">수정</button>
                        	<button type="button" class="btn btn-danger"  name="deleteDataPlan" onclick="deleteDataPlanClick('<c:out value="${result.DEGCS_SVCCD }" />');" data-toggle="modal" data-target="#myModal">삭제</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Button trigger modal -->
        <div style="text-align:right">
		<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#insertModal">입력</button>
		</div>
		</form>
		
		<!-- Insert Modal -->
        <div class="modal fade" id="insertModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">Insert Data Plan</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="insertDataPlanForm" name="insertDataPlanForm" method="post">
                        <table class="table table-striped table-hover table-bordered">
                            <tr>
                                <td>서비스코드</td>
                                <td><input type="text" class="form-control" name="svcCd" /></td>
                            </tr>
                            <tr>
                                <td>서비스이름</td>
                                <td><input type="text" class="form-control" name="svcNm" /></td>
                            </tr>
                            <tr>
                                <td>적용여부</td>
                                <td>
                                    <select class="form-control" name="enableYn">
                                        <option>Y</option>
                                        <option>N</option>
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
</div>

<script src="<c:url value='/js/jquery-3.5.1.min.js'/>"></script>
<script src="<c:url value='/js/popper.min.js'/>"></script>
<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
<script>
window.onbeforeunload = function () {
    window.scrollTo(0, 0);
}


// 수정버튼 클릭
function modifyDataPlanClick(e) {
    var parentNode = e.parentNode.parentNode;
    var svcCd = parentNode.querySelector('[name=svcCd]').innerText;
    var svcNm = parentNode.querySelector('[name=svcNm]').innerText;
    var enableYn = parentNode.querySelector('[name=enableYn]').innerText;
    console.log(svcCd, svcNm, enableYn);
    
//     $.ajax({ 
//         type: 'PUT', 
//         url: '/insertDataPlan', 
//         cache: false,
//         datatype: 'json',
//         data: {"svcCd": svcCd},
//         success: function(data) { 
//             console.log('result', data);
//             alert(data.resMsg);
//             location.reload();
//         },
//         error: function(e) {
//             console.log(e.status, e.error);
//             alert(e);
//         },
//         complete : function() {
//             $('#insertDataPlanForm').each(function() {
//                 this.reset();
//             });
//         }
//     });
}

// 삭제버튼 클릭
function deleteDataPlanClick(svcCd) {
    $.ajax({ 
        type: 'DELETE', 
        url: '/deleteDataPlan', 
        cache: false,
        datatype: 'json',
        data: {"svcCd": svcCd},
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
            $('#insertDataPlanForm').each(function() {
                this.reset();
            });
        }
    });
}


// 입력버튼 클릭
$(document).on('click', '#saveDataPlan', function(e) {
    $.ajax({ 
	    type: 'POST', 
	    url: '/insertDataPlan', 
	    cache: false,
	    datatype: 'json',
	    data: $('#insertDataPlanForm').serialize(),
	    success: function(data) { 
            console.log('result', data);
            alert(data.resMsg);
            $('#insertModal').modal('hide');
            location.reload();
        },
        error: function(e) {
            console.log(e.status, e.error);
            alert(e);
        },
        complete : function() {
            $('#insertDataPlanForm').each(function() {
                this.reset();
            });
        }
    });
})
</script>
</body>
</html>