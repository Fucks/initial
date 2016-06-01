<%-- 
    Document   : home
    Created on : 06/11/2015, 10:26:47
    Author     : wellington.fucks
--%>

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="user-module" var="userModule" />
<c:url value="projeto" var="projetoModule" />
<!-- =======================
             ===== START PAGE ======
             ======================= -->

<div class="wrapper" ng-controller="HeaderController as controller">
    <div class="container" style="margin-top: 25px;">
        <div class="panel panel-default">
            <div class="panel-body" style="padding: 25px;">
                <form>
                    <h3 class="page-title">Perfil pessoal</h3>
                    <div class="row">
                        <div class="col-md-4 col-sm-6">
                            <div id="preview" style="    height: 330px;">
                                <img id="preview" class="panel" style="height: 315px;margin-top: 5px;width: 100%;" ng-src="{{!controller.picture?'imagem/files/' + controller.currentUser.id : controller.picture}}" />
                                <button class="btn btn-primary alter-photo-btn" ng-click="controller.alterPhoto()">Alterar</button>
                            </div>
                            <div id="camera" style="display: none; height: 330px;">
                                <ng-camera
                                    type="photo"
                                    enable="false"
                                    output-height="315"
                                    output-width="332"
                                    viewer-height="330"
                                    viewer-width="100%"
                                    image-format="png"
                                    action-message="Capturar"
                                    snapshot="controller.picture"
                                    snapshot-callback="controller.getSnapshot()"
                                    ></ng-camera>
                                <input type="file" style="display: none" ng-model="controller.picture" />
                            </div>
                        </div>
                        <div class="col-md-8 col-sm-6">
                            <div class="form-group">
                                <label class="control-label" for="inputDefault">Nome</label>
                                <input type="text" class="form-control" id="inputDefault" ng-model="controller.currentUser.fullName">
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="inputDefault">E-mail</label>
                                <input type="text" class="form-control" id="inputDefault" ng-model="controller.currentUser.email">
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="inputDefault">Usuário</label>
                                <input type="text" class="form-control" id="inputDefault" ng-model="controller.currentUser.username">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="control-label" for="inputDefault">Sobre</label>
                                <textarea class="form-control" rows="3" id="textArea"></textarea>
                            </div>
                        </div>
                        <div class="col-md-12 buttons-row">
                            <a href="#/" class="btn btn-default">Cancelar</a>
                            <button type="submit" ng-click="controller.updateUser()" class="btn btn-success">Atualizar</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
