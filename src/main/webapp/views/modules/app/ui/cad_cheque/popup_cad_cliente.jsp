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
<div class="row">
    <div class="col-sm-12">
        <div class="card-box">
            <h4 class="m-t-0 header-title"><b>Novo cliente</b></h4>
            <p class="text-muted m-b-30 font-13">
                Preencha os campos abaixo para cadastrar um novo cliente
            </p>
            <form role="form">
                <div class="row">
                    <div class="col-sm-12 ">
                        <div class="form-group">
                            <label>Nome completo</label>
                            <input type="text" class="form-control" 
                                   ng-model="controller.currentEntity.fullName"
                                   required="true" placeholder="Informe o nome completo do cliente">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label>CPF</label>
                            <input type="text" id="cpf"
                                   ng-model="controller.currentEntity.cpf"
                                   class="form-control" >
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label>RG</label>
                            <input type="text" id="rg" 
                                   ng-model="controller.currentEntity.rg"
                                   class="form-control" >
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label>Data de nascimento</label>
                            <input type="date" id="nascimento" 
                                   placeholder="dd/mm/yyyy"
                                   ng-model="controller.currentEntity.nascimento"
                                   class="form-control" >
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-8">
                        <div class="form-group">
                            <label>Endereço</label>
                            <input type="text" class="form-control"  
                                   ng-model="controller.currentEntity.endereco"
                                   placeholder="Informe o endereço" >
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label>Bairro</label>
                            <input type="text" class="form-control"  
                                   ng-model="controller.currentEntity.bairro"
                                   placeholder="Informe o bairro" >
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-8">
                        <div class="form-group">
                            <label>Empresa</label>
                            <input type="text" class="form-control" 
                                   ng-model="controller.currentEntity.empresa"
                                   placeholder="Informe o nome da empresa" >
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="form-group">
                            <label>Cargo</label>
                            <input type="text" class="form-control" 
                                   ng-model="controller.currentEntity.cargo"
                                   placeholder="Informe o cargo executado">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <button type="submit" 
                                ng-click="controller.saveCliente()"
                                class="btn btn-success waves-effect waves-light">
                            <span class="btn-label"><i class="material-icons">check</i>
                            </span>Cadastrar
                        </button>
                        <button type="button" class="btn btn-danger waves-effect waves-light"
                                ng-click="closeThisDialog()">
                            <span class="btn-label"><i class="material-icons">close</i>
                            </span>Cancelar
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
