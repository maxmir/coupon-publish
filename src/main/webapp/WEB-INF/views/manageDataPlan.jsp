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
    <form id="boardForm" name="boardForm" method="post">
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <th>서비스코드</th>
                    <th>서비스이름</th>
                    <th>적용여부</th>
                    <th>최종수정일</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="result" items="${manageDataPlanList }" varStatus="status">
                    <tr>
                        <td><c:out value="${result.DEGCS_SVCCD }"/></td>
                        <td><c:out value="${result.DEGCS_SVCNM }"/></td>
                        <td><c:out value="${result.DEGCS_EnableYN }"/></td>
                        <td><c:out value="${result.DEGCS_OAUTH_LASTUPDATE }"/></td>
                        <td><a href='#' onClick='fn_write()' class="btn btn-warning">수정</a></td>
                        <td><a href='#' onClick='fn_write()' class="btn btn-danger">삭제</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div style="text-align:right">
            <a href='#' onClick='fn_write()' class="btn btn-success">입력</a>
        </div>

    </form>
</div>

<script src="<c:url value='/js/jquery-3.5.1.min.js'/>"></script>
<script src="<c:url value='/js/popper.min.js'/>"></script>
<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
<script>
//글쓰기
function fn_write(){

    var form = document.getElementById("boardForm");

    form.action = "<c:url value='/board/writeForm.do'/>";
    form.submit();

}

//글조회
function fn_view(code){

    var form = document.getElementById("boardForm");
    var url = "<c:url value='/board/viewContent.do'/>";
    url = url + "?code=" + code;

    form.action = url;
    form.submit();
}
</script>
</body>
</html>