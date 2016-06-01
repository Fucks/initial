<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- Material Design fonts -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700" type="text/css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <!-- Theme -->
        <link rel="stylesheet" href="<c:url value="resource/theme/assets/demo.css" />">
        <link rel="stylesheet" href="<c:url value="resource/theme/login/login.css"/>">
        <link rel="stylesheet" href="<c:url value="resource/theme/css/bootstrap.min.css" />" >
        <link rel="stylesheet" href="<c:url value="resource/theme/assets/header-basic-light.css" />" >
        <link rel="stylesheet" href="<c:url value="resource/library/alertfy/alertify.core.css" />" >
        <link rel="stylesheet" href="<c:url value="resource/library/alertfy/alertify.default.css" />" >
        <link href='http://fonts.googleapis.com/css?family=Cookie' rel='stylesheet' type='text/css'>

        <title>Login</title>
    </head>
    <body>
        <header class="header-basic-light">

            <div class="header-limiter">
                <h1><a href="#"><span>Companylogo</span></a></h1>
            </div>

        </header>

        <div ui-view></div>

        <!-- JQuery -->
        <script src="<c:url value="/resource/js/jquery/jquery-1.11.3.min.js" />"></script>

        <!-- Angular Material Dependencies -->
        <script src="<c:url value="/resource/js/angular/angular.js" />"></script>
        <!--<script src="<c:url value="/resource/js/angular/angular.min.js" />"></script>-->
        <script src="<c:url value="/resource/js/angular/angular-animate.min.js" />"></script>
        <script src="<c:url value="/resource/js/angular/angular-aria.min.js" />"></script>
        <script src="<c:url value="/resource/js/angular/angular-ui-router.min.js" />"></script>
        <script src="<c:url value="/resource/js/angular/angular-cookies.min.js" />"></script>
        <script src="<c:url value="/resource/js/angular/angular-sanitize.min.js" />"></script>
        <script src="<c:url value="/resource/js/angular/angular-touch.min.js" />"></script>

        <!-- Directives -->
        <script src="<c:url value="/resource/js/directives/angular-http-loader.js" />" ></script>
        <script src="<c:url value="/resource/library/alertfy/alertify.min.js" />" ></script>


        <script src="<c:url value="/views/modules/abstract-controller.js" />" ></script>
        <!-- Controllers do modulo -->
        <script type="text/javascript" src="<c:url value="/views/modules/login/login-main.js" />" ></script>
        <script type="text/javascript"  src="<c:url value="/views/modules/login/controller/login-controller.js" />" ></script>
        <script type="text/javascript"  src="<c:url value="/views/modules/login/services/account-service.js" />" ></script>
    </body>
</html>
