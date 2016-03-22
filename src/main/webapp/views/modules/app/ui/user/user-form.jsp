<%-- 
    Document   : user-form
    Created on : Nov 10, 2015, 9:13:21 PM
    Author     : Fucks
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="wrapper">
    <div class="container">

        <!-- Page-Title -->
        <div class="row">
            <div class="col-sm-12">
                <ol class="breadcrumb">
                    <li>
                        <a href="#home">Dashboard</a>
                    </li>
                    <li>
                        <a href="#user-module">Usuários</a>
                    </li>
                    <li class="active" ng-show="controller.currentState == controller.INSERT_STATE">
                        Novo usuário
                    </li>
                    <li class="active" ng-show="controller.currentState == controller.EDIT_STATE">
                        {{controller.currentEntity.firstName}}
                    </li>
                </ol>
            </div>
        </div>
        <!-- Page-Title -->

        <div class="row">
            <div class="col-sm-12">
                <div class="card-box">
                    <h4 class="m-t-0 header-title"><b>Novo usuário do sistema</b></h4>
                    <p class="text-muted m-b-30 font-13">
                        Preencha os campos para cadastrar um novo usuário do sistema.
                    </p>
                    <form name="form" class="form-horizontal" role="form">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Nome</label>
                                    <div class="col-md-10">
                                        <input type="text" required class="form-control" 
                                               placeholder="Informe o nome do usuário" ng-model="controller.currentEntity.firstName">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Sobrenome</label>
                                    <div class="col-md-10">
                                        <input type="text" class="form-control" required 
                                               placeholder="Informe o sobrenome do usuário" ng-model="controller.currentEntity.lastName">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">E-mail</label>
                                    <div class="col-md-10">
                                        <input type="email" class="form-control" required 
                                               placeholder="Informe o e-mail do usuário" ng-model="controller.currentEntity.email">
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">

                                <div class="form-group">
                                    <label class="col-md-2 control-label">Usuário</label>
                                    <div class="col-md-10">
                                        <input type="text" class="form-control" required 
                                               placeholder="Informe o usuário de acesso" ng-model="controller.currentEntity.username">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Senha</label>
                                    <div class="col-md-10">
                                        <input type="password" class="form-control" required 
                                               ng-model="controller.currentEntity.password" placeholder="Informe a senha de acesso">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2 control-label">Confirmar senha</label>
                                    <div class="col-md-10">
                                        <input type="password" class="form-control" required 
                                               ng-model="controller.confirmPassword" placeholder="Confirme a senha">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <button type="button" ng-show="controller.currentState == controller.INSERT_STATE"
                                        ng-click="controller.insert()"
                                        class="btn btn-success waves-effect waves-light">
                                    <span class="btn-label"><i class="material-icons">check</i>
                                    </span>Cadastrar
                                </button>
                                <button type="button" ng-show="controller.currentState == controller.EDIT_STATE"
                                        ng-click="controller.update()"
                                        class="btn btn-success waves-effect waves-light">
                                    <span class="btn-label"><i class="material-icons">check</i>
                                    </span>Atualizar
                                </button>
                                <button type="button" ng-show="controller.currentState == controller.EDIT_STATE"
                                        ng-click="controller.remove()"
                                        class="btn btn-danger waves-effect waves-light">
                                    <span class="btn-label"><i class="material-icons">close</i>
                                    </span>Remover
                                </button>
                                <a href='#user-module' style="width: 124px;" class="btn btn-inverse waves-effect waves-light">
                                    </span>Cancelar
                                </a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div> <!-- end container -->
</div>