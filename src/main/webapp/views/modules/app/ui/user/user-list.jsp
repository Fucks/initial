<%-- 
    Document   : home
    Created on : 06/11/2015, 10:26:47
    Author     : wellington.fucks
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<div class="wrapper" ng-controller="UserController as controller">
    <div class="container" style="margin-top: 25px;">
        <ul class="breadcrumb">
            <li><a href="#/">Home</a></li>
            <li class="active">Usuários</li>
        </ul>
        <div class="panel panel-default">
            <div class="panel-body" style="padding: 25px;">
                <div class="col-sm-6">
                    <h3 class="page-title">Usuários cadastrados no sistema</h3>
                </div>
                <div class="col-sm-6">
                    <div id="datatable_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                        <div class="col-sm-12" style="text-align: right">
                            <form class="navbar-form" role="search" style="display: inline-block;">
                                <div class="form-group">
                                    <input type="text" 
                                           placeholder="Buscar usuários"
                                           class="form-control"
                                           ng-model="controller.currentPage.query" 
                                           ng-keyup="$event.keyCode == 13 && controller.loadUsers()" >
                                </div>
                            </form>

                            <button class="btn btn-success"
                                    ng-click="controller.changeToNew()" >
                                Novo cadastro
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12">
                    <table class="table table-striped table-hover ">
                        <thead>
                            <tr role="row">
                                <th>Nome</th>
                                <th>E-mail</th>
                                <th>Usuário</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr ng-repeat="user in controller.currentPage.content">
                                <td width='50%'>{{user.fullName}}</td>
                                <td width='20%'>{{user.email}}</td>
                                <td width='20%'>{{user.username}}</td>
                                <td style="text-align: center" width='10%'>
                                    <button type="button" 
                                            ng-click="controller.changeToEdit(user.id)"
                                            class="btn btn-primary btn-sm">
                                        <i class="material-icons">mode_edit</i></i>
                                    </button>
                                </td>
                            </tr>
                            <tr ng-show="controller.currentPage.content.length == 0">
                                <td colspan="4">Nenhum resultado encontrado!</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</div>