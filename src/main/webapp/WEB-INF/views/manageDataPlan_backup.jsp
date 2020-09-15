<!doctype html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css'/>">

    <title>Hello, world!</title>
  </head>
  <body>
  	<table class="table table-bordered">
	<c:forEach var="dataPlan" items="${manageDataPlanList}">
		<tr>
			<td>${dataPlan.DEGCS_SVCCD }</td>
			<td>${dataPlan.DEGCS_SVCNM }</td>
			<td>${dataPlan.DEGCS_ENABLE_YN }</td>
			<td>${dataPlan.DEGCS_SVC_UPDATEDATE }</td>
		</tr>
	</c:forEach>
	</table>

    <script src="<c:url value='/js/jquery-3.5.1.min.js'/>"></script>
    <script src="<c:url value='/js/popper.min.js'/>"></script>
    <script src="<c:url value='/js/bootstrap.min.js'/>"></script>
  </body>
</html>