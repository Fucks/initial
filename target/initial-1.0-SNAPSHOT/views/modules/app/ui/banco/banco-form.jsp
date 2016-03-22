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
                        <a href="#gerenciar/bancos">Bancos</a>
                    </li>
                    <li class="active" ng-show="controller.currentState == controller.INSERT_STATE">
                        Novo banco
                    </li>
                    <li class="active" ng-show="controller.currentState == controller.EDIT_STATE">
                        {{controller.currentEntity.nome}}
                    </li>
                </ol>
            </div>
        </div>
        <!-- Page-Title -->
        <div class="row">
            <div class="col-sm-12">
                <div class="card-box">
                    <h4 class="m-t-0 header-title"><b>Novo banco</b></h4>
                    <p class="text-muted m-b-30 font-13">
                        Preencha os campos abaixo para cadastrar um novo banco
                    </p>
                    <form role="form">
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label>Número</label>
                                    <input type="text"
                                           ng-model="controller.currentEntity.numero"
                                           class="form-control" >
                                </div>
                            </div>
                            <div class="col-sm-8 ">
                                <div class="form-group">
                                    <label>Nome completo</label>
                                    <input type="text" class="form-control" 
                                           ng-model="controller.currentEntity.nome"
                                           required="true" placeholder="Informe o nome completo do cliente">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label>Endereço</label>
                                    <input type="text" class="form-control"  
                                           ng-model="controller.currentEntity.endereco"
                                           placeholder="Informe o endereço" >
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <button type="submit" 
                                        ng-click="controller.saveCliente()"
                                        class="btn btn-success waves-effect waves-light">
                                    <span class="btn-label"><i class="material-icons">check</i>
                                    </span>{{controller.currentState == controller.INSERT_STATE ? 'Cadastrar' : 'Atualizar'}}
                                </button>
                                <button type="button" 
                                        ng-show="controller.currentState != controller.INSERT_STATE"
                                        class="btn btn-danger waves-effect waves-light"
                                        ng-click="controller.remove()">
                                    <span class="btn-label"><i class="material-icons">close</i>
                                    </span>Remover
                                </button>
                                <a ng-click="controller.changeToList()" style="width: 124px;" class="btn btn-inverse waves-effect waves-light">
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