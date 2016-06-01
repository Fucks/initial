<%-- 
    Document   : user-form
    Created on : Nov 10, 2015, 9:13:21 PM
    Author     : Fucks
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<link href="<c:url value="resource/library/treeview/angular-ui-tree.min.css"/>" rel="stylesheet" type="text/css">

<div class="wrapper" ng-controller="ProfileController as controller">
    <div class="container" style="margin-top: 25px;">
        <ul class="breadcrumb">
            <li><a href="#/">Home</a></li>
            <li><a href="#/perfil-de-acesso">Perfil de acesso</a></li>
            <li class="active">{{controller.currentState == controller.INSERT_STATE ? 
                'Novo perfil de acesso' : controller.currentState == controller.EDIT_STATE ? 
                controller.currentEntity.name : ''}}</li>
        </ul>
        <div class="panel panel-default">
            <div class="panel-body" style="padding: 25px;">
                <h4 class="m-t-0 header-title"><b>Novo perfil de acesso do sistema</b></h4>
                <p class="text-muted m-b-30 font-13">
                    Preencha os campos para cadastrar um novo perfil de acesso do sistema.
                </p>
                <form name="form" class="form" role="form">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label">Nome*</label>
                                <input type="text" required class="form-control" 
                                       placeholder="Informe o nome do perfil de acesso" ng-model="controller.currentEntity.name">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label">Permissões</label>
                                <script type="text/ng-template" id="nodes_renderer.html">
                                    <div class="tree-node tree-node-content">
                                        <a ng-if="node.permissoes && node.permissoes.length > 0" data-nodrag ng-click="toggle(this)">
                                            <i class="material-icons">{{collapsed ? 'chevron_right' : 'expand_more' }}</i>                        
                                        </a>
                                         <input type="checkbox" ng-model="node.selected" ng-change="controller.selected(node)">  {{node.name}}
                                    </div>
                                    <ol ui-tree-nodes="" ng-model="node.permissoes" ng-class="{hidden: collapsed}">
                                        <li ng-repeat="node in node.permissoes" ui-tree-node ng-include="'nodes_renderer.html'">
                                        </li>
                                    </ol>
                                </script>
                                <div ui-tree>
                                    <ol ui-tree-nodes="" ng-model="controller.list" id="tree-root">
                                        <li ng-repeat="node in controller.permissions" ui-tree-node>
                                            <div class="tree-node tree-node-content">
                                                <a ng-if="node.permissoes && node.permissoes.length > 0" data-nodrag ng-click="toggle(this)">
                                                    <i class="material-icons">{{collapsed ? 'chevron_right' : 'expand_more' }}</i>                        
                                                </a>
                                                <b>{{node.name}}</b>
                                            </div>
                                            <ol ui-tree-nodes="" ng-model="node.permissoes" ng-class="{hidden: collapsed}">
                                                <li ng-repeat="node in node.permissoes" ui-tree-node ng-include="'nodes_renderer.html'">
                                                </li>
                                            </ol>
                                        </li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <button type="button" ng-show="controller.currentState == controller.INSERT_STATE"
                                    ng-click="controller.save()"
                                    class="btn btn-success waves-effect waves-light">
                                <span class="btn-label"><i class="material-icons">check</i>
                                </span>Cadastrar
                            </button>
                            <button type="button" ng-show="controller.currentState == controller.EDIT_STATE"
                                    ng-click="controller.save()"
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
                            <a href='#perfil-de-acesso' style="width: 124px;" class="btn btn-primary">
                                </span>Cancelar
                            </a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>