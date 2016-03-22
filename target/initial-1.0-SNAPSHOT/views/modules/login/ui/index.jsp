<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- Material Design fonts -->
        <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700" type="text/css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <!-- Theme -->
        <link href="<c:url value="resource/theme/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css">
        <link href="<c:url value="resource/theme/css/core.css"/>" rel="stylesheet" type="text/css">
        <link href="<c:url value="resource/theme/css/components.css"/>" rel="stylesheet" type="text/css">
        <link href="<c:url value="resource/theme/css/icons.css"/>" rel="stylesheet" type="text/css">
        <link href="<c:url value="resource/theme/css/pages.css"/>" rel="stylesheet" type="text/css">
        <link href="<c:url value="resource/theme/css/menu.css"/>" rel="stylesheet" type="text/css">
        <link href="<c:url value="resource/theme/css/responsive.css"/>" rel="stylesheet" type="text/css">

        <link rel="stylesheet" href="<c:url value="/resource/library/angular-material/angular-material.min.css" />">

        <title>Entre!</title>
    </head>
    <body>

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

        <!-- Material -->
        <script src="<c:url value="/resource/library/angular-material/angular-material.min.js" />"></script>

        <!-- Directives -->
        <script src="<c:url value="/resource/js/directives/angular-http-loader.js" />" ></script>

        <!-- theme -->
        <script src="<c:url value="resource/theme/js/jquery.min.js"/>"></script>
        <script src="<c:url value="resource/theme/js/bootstrap.min.js"/>"></script>
        <script src="<c:url value="resource/theme/js/detect.js"/>"></script>
        <script src="<c:url value="resource/theme/js/fastclick.js"/>"></script>
        <script src="<c:url value="resource/theme/js/jquery.slimscroll.js"/>"></script>
        <script src="<c:url value="resource/theme/js/jquery.blockUI.js"/>"></script>
        <script src="<c:url value="resource/theme/js/waves.js"/>"></script>
        <script src="<c:url value="resource/theme/js/wow.min.js"/>"></script>
        <script src="<c:url value="resource/theme/js/jquery.nicescroll.js"/>"></script>
        <script src="<c:url value="resource/theme/js/jquery.scrollTo.min.js"/>"></script>
        <script src="<c:url value="resource/theme/js/jquery.peity.min.js"/>"></script>
        <script src="<c:url value="resource/theme/js/jquery.sparkline.min.js"/>"></script>
        <script src="<c:url value="resource/theme/js/jquery.dashboard_3.js"/>"></script>
        <script src="<c:url value="resource/theme/js/jquery.core.js"/>"></script>
        <script src="<c:url value="resource/theme/js/jquery.app.js"/>"></script>


        <script src="<c:url value="/views/modules/abstract-controller.js" />" ></script>
        <!-- Controllers do modulo -->
        <script type="text/javascript" src="<c:url value="/views/modules/login/login-main.js" />" ></script>
        <script type="text/javascript"  src="<c:url value="/views/modules/login/controller/login-controller.js" />" ></script>
        <script type="text/javascript"  src="<c:url value="/views/modules/login/services/account-service.js" />" ></script>
    </body>
</html>
