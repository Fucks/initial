<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="login-page">
    <div class="form">
        <c:url value="/login" var="loginUrl" />
        <form class="login-form" action="${loginUrl}" id="login-form" method="POST">
            <div id="message" style="display: none;">
                <a href="#" class="close" data-dismiss="alert">&times;</a>
                <span></span>
            </div>
            <input type="text"  name="username" placeholder="Usuário"/>
            <input type="password" name="password" placeholder="Senha"/>
            <button type="submit">login</button>
            <p class="message">
                <input id="remember-me" name="remember-me" type="checkbox" style="width: auto"> 
                <span >Lembrar-me</span>
            </p>
        </form>
    </div>
</div>
