<%--
  Created by IntelliJ IDEA.
  User: kjh
  Date: 2021/08/19
  Time: 3:15 오전
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
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Quicksand:400,600,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/fonts/icomoon/style.css">
    <link rel="stylesheet" href="/css/client/owl.carousel.min.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <!-- Style -->
    <link rel="stylesheet" href="/css/client/clientMenuStyle.css">

    <title>Coupon Publish</title>
</head>
<body class="hero" style="background-image: url('/images/hero_1.jpg'); background-repeat: no-repeat; background-position: center center;">
<%--<div class="hero" style="background-image: url('/images/hero_1.jpg');"></div>--%>

<div class="site-mobile-menu site-navbar-target">
    <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
            <span class="icon-close2 js-menu-toggle"></span>
        </div>
    </div>
    <div class="site-mobile-menu-body"></div>
</div> <!-- .site-mobile-menu -->


<!-- NAVBAR -->
<header class="site-navbar mt-3">
    <div class="container-fluid">
        <div class="row align-items-center">
            <div class="site-logo col-6"><a href="index.html">Golden Time</a></div>

            <nav class="mx-auto site-navigation">
                <ul class="site-menu js-clone-nav d-none d-xl-block ml-0 pl-0">
                    <li><a href="" class="nav-link active">Home</a></li>
                    <li><a href="/client/myCoupons">My-Coupons</a></li>
                    <li><a href="/client/couponList">Coupon-List</a></li>
                    <li><a href="">Member</a></li>
                    <li class="has-children">
                        <a href="">Introduce</a>
                        <ul class="dropdown">
                            <li><a href="">Blog</a></li>
                            <li><a href="">Contact</a></li>
                        </ul>
                    </li>
                    <li class="d-lg-none"><a href=""><span class="mr-2">+</span> Post a Email</a></li>
                    <li class="d-lg-none"><a href="">Log In</a></li>
                </ul>
            </nav>

            <div class="right-cta-menu text-right d-flex aligin-items-center col-6">
                <div class="ml-auto">
                    <a href="" class="btn btn-outline-white border-width-2 d-none d-lg-inline-block"><span class="mr-2 icon-add"></span>Post a Job</a>
                    <a href="/client/login" class="btn btn-primary border-width-2 d-none d-lg-inline-block"><span class="mr-2 icon-lock_outline"></span>Log In</a>
                </div>
                <a href="#" class="site-menu-toggle js-menu-toggle d-inline-block d-xl-none mt-lg-2 ml-3"><span class="icon-menu h3 m-0 p-0 mt-2"></span></a>
            </div>

        </div>
    </div>
</header>

<%--<div class="hero" style="background-image: url('/images/hero_1.jpg');"></div>--%>

<div style="padding-top: 5em;">
    <c:if test="${coupons.size() > 0}">
        <jsp:include page="couponList.jsp"/>
    </c:if>
    <c:if test="${myCoupons.size() > 0}">
        <jsp:include page="myCoupons.jsp"/>
    </c:if>
</div>

<script src="<c:url value='/js/jquery-3.5.1.min.js'/>"></script>
<script src="<c:url value='/js/popper.min.js'/>"></script>
<script src="<c:url value='/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/js/jquery.sticky.js'/>"></script>
<script src="<c:url value='/js/client/clientMenu.js'/>"></script>
</body>
</html>