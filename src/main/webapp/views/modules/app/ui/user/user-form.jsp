<%-- 
    Document   : user-form
    Created on : Nov 10, 2015, 9:13:21 PM
    Author     : Fucks
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="wrapper" ng-controller="UserController as controller">
    <div class="container" style="margin-top: 25px;">
        <ul class="breadcrumb">
            <li><a href="#/">Home</a></li>
            <li><a href="#/usuarios">Usuários</a></li>
            <li class="active">{{controller.currentState == controller.INSERT_STATE ? 
                'Novo usuário' : controller.currentState == controller.EDIT_STATE ? 
                controller.currentEntity.fullName : ''}}</li>
        </ul>
        <div class="panel panel-default">
            <div class="panel-body" style="padding: 25px;">
                <h4 class="m-t-0 header-title"><b>Novo usuário do sistema</b></h4>
                <p class="text-muted m-b-30 font-13">
                    Preencha os campos para cadastrar um novo usuário do sistema.
                </p>
                <form name="form" class="form" role="form">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label">Nome</label>
                                <input type="text" required class="form-control" 
                                       placeholder="Informe o nome do usuário" ng-model="controller.currentEntity.fullName">
                            </div>
                            <div class="form-group">
                                <label class="control-label">E-mail</label>
                                <input type="email" class="form-control" required 
                                       placeholder="Informe o e-mail do usuário" ng-model="controller.currentEntity.email">
                            </div>
                            <div class="form-group">
                                <label class="control-label">Usuário</label>
                                <input type="text" class="form-control" required 
                                       placeholder="Informe o usuário de acesso" ng-model="controller.currentEntity.username">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label">Perfil de Acesso</label>
                                <select class="form-control" 
                                        ng-options="profile.name for profile in controller.profiles track by profile.id" 
                                        ng-model="controller.currentEntity.profile" >
                                </select>

                            </div>
                            <div class="form-group">
                                <label class="control-label">Senha</label>
                                <input type="password" class="form-control" required 
                                       ng-model="controller.currentEntity.password" placeholder="Informe a senha de acesso">
                            </div>
                            <div class="form-group">
                                <label class="control-label">Confirmar senha</label>
                                <input type="password" class="form-control" required 
                                       ng-model="controller.confirmPassword" placeholder="Confirme a senha">
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
                            <a href='#usuarios' style="width: 124px;" class="btn btn-primary">
                                </span>Cancelar
                            </a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>