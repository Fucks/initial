 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="animationload">
    <div class="loader"></div>
</div>

<div class="account-pages"></div>
<div class="clearfix"></div>

<div class="wrapper-page">
    <div class="card-box">
        <div class="panel-heading">
            <h3 class="text-center"> Sign In to <span style="color:#212121"><b>GOD</b></span>Cheque</h3>
        </div>

        <div class="panel-body">
            <c:url value="/login" var="loginUrl" />
            <form class="form-horizontal m-t-20" action="${loginUrl}" id="login-form" method="POST">

                <div class="form-group ">
                    <div class="col-xs-12">
                        <input class="form-control" type="text" name="username" required="" placeholder="Usuário">
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-xs-12">
                        <input class="form-control" type="password" name="password" required="" placeholder="Senha">
                    </div>
                </div>

                <div class="form-group ">
                    <div class="col-xs-12">
                        <div class="checkbox checkbox-primary">
                            <input id="remember-me" name="remember-me" type="checkbox">
                            <label for="remember-me">
                                Lembrar
                            </label>
                        </div>

                    </div>
                </div>

                <div class="form-group text-center m-t-40">
                    <div class="col-xs-12">
                        <button class="btn btn-inverse btn-block text-uppercase waves-effect waves-light" type="submit">
                            Log In
                        </button>
                    </div>
                </div>

            </form>

        </div>
    </div>
    <div class="row">
        <div class="col-sm-12 text-center">
            <p>
                <!--Don't have an account? <a href="page-register.html" class="text-primary m-l-5"><b>Sign Up</b></a>-->
            </p>
        </div>
    </div>

</div>

<script>
    var resizefunc = [];
</script>
