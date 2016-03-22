<%-- 
    Document   : header
    Created on : 10/11/2015, 09:44:07
    Author     : wellington.fucks
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<c:url value="/logout" var="logoutUrl" />
<c:url value="#home" var="homeUrl" />
<div class="nav-wrapper" ng-cloak ng-controller="HeaderController as controller">
    <!-- Navigation Bar-->
    <header id="topnav">
        <div class="topbar-main">
            <div class="container" style="height: 60px;">

                <!-- Logo container-->
                <div class="logo">
                    <a href="${homeUrl}" class="logo"><span style="color: #212121;"><b>GOD</b></span><span>Cheque</span></a>
                </div>
                <!-- End Logo container-->

                <div class="menu-extras">

                    <!--                        <ul class="nav navbar-nav navbar-right pull-right">
                                                <li>
                                                    <form role="search" class="navbar-left app-search pull-left hidden-xs">
                                                         <input type="text" placeholder="Search..." class="form-control">
                                                         <a href=""><i class="fa fa-search"></i></a>
                                                    </form>
                                                </li>
                                            </ul>-->
                </div>

                <div style="margin-top: 30px; float: right; color: #fff;">
                    <span>Bem-vindo <b>{{controller.currentUser.firstName}}.</b></span> 
                </div>

            </div>
        </div>
        <!-- End topbar -->


        <!-- Navbar Start -->
        <div class="navbar-custom">
            <div class="container">
                <div id="navigation">
                    <!-- Navigation Menu-->
                    <ul class="navigation-menu">
                        <li class="submenu">
                            <a href="${homeUrl}"><i class="material-icons">home</i>Ínicio</a>
                        </li>
                        <li class="submenu">
                            <a href="#cad-cheque"><i class="material-icons">add_circle</i>Novo cheque</a>
                        </li>
                        <li class="has-submenu">
                            <a href="#"><i class="material-icons">thumbs_up_down</i>Gerenciar</a>
                            <ul class="submenu">
                                <li><a href="#gerenciar/cheques">Cheques</a></li>
                                <li><a href="#gerenciar/clientes">Clientes</a></li>
                                <li><a href="#gerenciar/bancos">Bancos</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#"><i class="material-icons">find_in_page</i>Relatórios</a>
                        </li>
                        <li class="submenu active">
                            <a href="#user-module"><i class="material-icons">supervisor_account</i>Usuários</a>
                        </li>
                        <li class="submenu active">
                            <a href="${logoutUrl}"><i class="material-icons">exit_to_app</i>Sair</a>
                        </li>
                    </ul>
                    <!-- End navigation menu        -->
                </div>
            </div>
        </div>
    </header>
    <!-- End Navigation Bar-->

</div>
<style type="text/css">
    .loader-background{
        top: 60px;
        bottom: 0;
        right: 0;
        left: 0;
        background-color: #FFF;
        opacity: .7;
        position: absolute;
        z-index: 3002;
        color: #FFF;
    }
    .sk-fading-circle {
        margin: 100px auto;
        width: 40px;
        height: 40px;
        position: relative;
        z-index: 1003;
    }

    .sk-fading-circle .sk-circle {
        width: 100%;
        height: 100%;
        position: absolute;
        left: 0;
        top: 0;
    }

    .sk-fading-circle .sk-circle:before {
        content: '';
        display: block;
        margin: 0 auto;
        width: 15%;
        height: 15%;
        background-color: #333;
        border-radius: 100%;
        -webkit-animation: sk-circleFadeDelay 1.2s infinite ease-in-out both;
        animation: sk-circleFadeDelay 1.2s infinite ease-in-out both;
    }
    .sk-fading-circle .sk-circle2 {
        -webkit-transform: rotate(30deg);
        -ms-transform: rotate(30deg);
        transform: rotate(30deg);
    }
    .sk-fading-circle .sk-circle3 {
        -webkit-transform: rotate(60deg);
        -ms-transform: rotate(60deg);
        transform: rotate(60deg);
    }
    .sk-fading-circle .sk-circle4 {
        -webkit-transform: rotate(90deg);
        -ms-transform: rotate(90deg);
        transform: rotate(90deg);
    }
    .sk-fading-circle .sk-circle5 {
        -webkit-transform: rotate(120deg);
        -ms-transform: rotate(120deg);
        transform: rotate(120deg);
    }
    .sk-fading-circle .sk-circle6 {
        -webkit-transform: rotate(150deg);
        -ms-transform: rotate(150deg);
        transform: rotate(150deg);
    }
    .sk-fading-circle .sk-circle7 {
        -webkit-transform: rotate(180deg);
        -ms-transform: rotate(180deg);
        transform: rotate(180deg);
    }
    .sk-fading-circle .sk-circle8 {
        -webkit-transform: rotate(210deg);
        -ms-transform: rotate(210deg);
        transform: rotate(210deg);
    }
    .sk-fading-circle .sk-circle9 {
        -webkit-transform: rotate(240deg);
        -ms-transform: rotate(240deg);
        transform: rotate(240deg);
    }
    .sk-fading-circle .sk-circle10 {
        -webkit-transform: rotate(270deg);
        -ms-transform: rotate(270deg);
        transform: rotate(270deg);
    }
    .sk-fading-circle .sk-circle11 {
        -webkit-transform: rotate(300deg);
        -ms-transform: rotate(300deg);
        transform: rotate(300deg); 
    }
    .sk-fading-circle .sk-circle12 {
        -webkit-transform: rotate(330deg);
        -ms-transform: rotate(330deg);
        transform: rotate(330deg); 
    }
    .sk-fading-circle .sk-circle2:before {
        -webkit-animation-delay: -1.1s;
        animation-delay: -1.1s; 
    }
    .sk-fading-circle .sk-circle3:before {
        -webkit-animation-delay: -1s;
        animation-delay: -1s; 
    }
    .sk-fading-circle .sk-circle4:before {
        -webkit-animation-delay: -0.9s;
        animation-delay: -0.9s; 
    }
    .sk-fading-circle .sk-circle5:before {
        -webkit-animation-delay: -0.8s;
        animation-delay: -0.8s; 
    }
    .sk-fading-circle .sk-circle6:before {
        -webkit-animation-delay: -0.7s;
        animation-delay: -0.7s; 
    }
    .sk-fading-circle .sk-circle7:before {
        -webkit-animation-delay: -0.6s;
        animation-delay: -0.6s; 
    }
    .sk-fading-circle .sk-circle8:before {
        -webkit-animation-delay: -0.5s;
        animation-delay: -0.5s; 
    }
    .sk-fading-circle .sk-circle9:before {
        -webkit-animation-delay: -0.4s;
        animation-delay: -0.4s;
    }
    .sk-fading-circle .sk-circle10:before {
        -webkit-animation-delay: -0.3s;
        animation-delay: -0.3s;
    }
    .sk-fading-circle .sk-circle11:before {
        -webkit-animation-delay: -0.2s;
        animation-delay: -0.2s;
    }
    .sk-fading-circle .sk-circle12:before {
        -webkit-animation-delay: -0.1s;
        animation-delay: -0.1s;
    }

    @-webkit-keyframes sk-circleFadeDelay {
        0%, 39%, 100% { opacity: 0; }
        40% { opacity: 1; }
    }

    @keyframes sk-circleFadeDelay {
        0%, 39%, 100% { opacity: 0; }
        40% { opacity: 1; } 
    }
</style>
<div class="loader-background" data-loading>
    <div class="sk-fading-circle" data-loading>
        <div class="sk-circle1 sk-circle"></div>
        <div class="sk-circle2 sk-circle"></div>
        <div class="sk-circle3 sk-circle"></div>
        <div class="sk-circle4 sk-circle"></div>
        <div class="sk-circle5 sk-circle"></div>
        <div class="sk-circle6 sk-circle"></div>
        <div class="sk-circle7 sk-circle"></div>
        <div class="sk-circle8 sk-circle"></div>
        <div class="sk-circle9 sk-circle"></div>
        <div class="sk-circle10 sk-circle"></div>
        <div class="sk-circle11 sk-circle"></div>
        <div class="sk-circle12 sk-circle"></div>
    </div>
</div>