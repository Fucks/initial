<%-- 
    Document   : index
    Created on : 06/11/2015, 10:26:14
    Author     : wellington.fucks
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>{{title}}</title>
        <jsp:include page="../styles.jsp" />
        <link rel="stylesheet" href="<c:url value="/resource/css/custom/custom.css" />">
        <c:url value="/logout" var="logoutUrl" />
    </head>
    <body>
        <div class="row">
            <div class="header">
                <!-- HEADER -->
                <jsp:include page="../header.jsp" />
            </div>

            <!-- Conteudo -->
            <div class="row">
                <div ui-view class="container" ></div>
            </div>

        </div>

        <jsp:include page="../scripts.jsp" />

        <script src="<c:url value="/views/modules/app/home-main.js" />" ></script>

        <!-- Controllers -->
        <script src="<c:url value="/views/modules/app/controller/home-controller.js" />" ></script>
        <script src="<c:url value="/views/modules/app/controller/user-controller.js" />" ></script>
        <script src="<c:url value="/views/modules/app/controller/cad-cheque-controller.js" />" ></script>
        <script src="<c:url value="/views/modules/app/controller/cheque-controller.js" />" ></script>
        <script src="<c:url value="/views/modules/app/controller/cliente-controller.js" />" ></script>
        <script src="<c:url value="/views/modules/app/controller/banco-controller.js" />" ></script>
        <script src="<c:url value="/views/modules/app/controller/popup/cadastro-cliente-controller.js" />" ></script>
        <script src="<c:url value="/views/modules/app/controller/popup/cadastro-banco-controller.js" />" ></script>

        <!-- Services -->
        <script type="text/javascript"  src="<c:url value="/views/modules/app/service/users-service.js" />" ></script>
        <script type="text/javascript"  src="<c:url value="/views/modules/app/service/cliente-service.js" />" ></script>
        <script type="text/javascript"  src="<c:url value="/views/modules/app/service/banco-service.js" />" ></script>
        <script type="text/javascript"  src="<c:url value="/views/modules/app/service/cheque-service.js" />" ></script>

    </body>
</html>
