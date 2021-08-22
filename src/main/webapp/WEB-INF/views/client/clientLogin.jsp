<%--
  Created by IntelliJ IDEA.
  User: kjh
  Date: 2021/08/20
  Time: 2:19 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!doctype html>
<html lang="en">
<head>
  <title>Login 05</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="/css/client/clientLoginStyle.css">

</head>
<body>
<section class="ftco-section">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-6 text-center mb-5">
        <h2 class="heading-section">Welcome</h2>
      </div>
    </div>
    <div class="row justify-content-center">
      <div class="col-md-7 col-lg-5">
        <div class="wrap">
          <div class="img" style="background-image: url(/images/clientLoginBg-1.jpg);"></div>
          <div class="login-wrap p-4 p-md-5">
            <div class="d-flex">
              <div class="w-100">
                <h3 class="mb-4">Sign In</h3>
              </div>
              <div class="w-100">
                <p class="social-media d-flex justify-content-end">
                  <a href="#" class="social-icon d-flex align-items-center justify-content-center"><span class="fa fa-facebook"></span></a>
                  <a href="#" class="social-icon d-flex align-items-center justify-content-center"><span class="fa fa-twitter"></span></a>
                </p>
              </div>
            </div>
            <form action="#" class="signin-form">
              <div class="form-group mt-3">
                <input type="text" id="userid" class="form-control" required>
                <label class="form-control-placeholder" for="userid">UserId</label>
              </div>
              <div class="form-group">
                <input id="password" type="password" id="password" class="form-control" required>
                <label class="form-control-placeholder" for="password">Password</label>
                <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
              </div>
              <div class="form-group">
                <button type="submit" id="login" class="form-control btn btn-primary rounded submit px-3">Sign In</button>
              </div>
              <div class="form-group d-md-flex">
                <div class="w-50 text-left">
                  <label class="checkbox-wrap checkbox-primary mb-0">Remember Me
                    <input type="checkbox" checked>
                    <span class="checkmark"></span>
                  </label>
                </div>
                <div class="w-50 text-md-right">
                  <a href="#">Forgot Password</a>
                </div>
              </div>
            </form>
            <p class="text-center">Not a member? <a data-toggle="tab" href="#signup">Sign Up</a></p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<script src="<c:url value='/js/jquery-3.5.1.min.js'/>"></script>
<script src="<c:url value='/js/popper.min.js'/>"></script>
<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/js/jquery.sticky.js'/>"></script>
<script src="<c:url value='/js/client/clientLogin.js'/>"></script>

</body>
</html>


