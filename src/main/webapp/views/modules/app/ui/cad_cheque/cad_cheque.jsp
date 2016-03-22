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
<style type="text/css">
    .custom-width .ngdialog-content{
        width: 50% !important;
    }
</style>
<div class="wrapper">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="card-box">
                    <h4 class="m-t-0 header-title"><b>Novo cheque</b></h4>
                    <p class="text-muted m-b-30 font-13">
                        Preencha os campos abaixo para registrar o cadastro de um novo cheque
                    </p>
                    <form role="form">
                        <div class="row">
                            <div class="col-sm-4 ">
                                <div class="form-group">
                                    <label>Cliente</label>
                                    <input type="text" id="client_id" 
                                           ng-model="controller.currentEntity.cliente.cpf" class="form-control" placeholder="RG ou CPF">
                                </div>
                            </div>
                            <div class="col-sm-8">
                                <div class="form-group">
                                    <label >Nome</label>
                                    <input type="text" class="form-control" readonly="true"
                                           ng-model="controller.currentEntity.cliente.fullName"
                                           placeholder="Informe o CPF ou RG do cliente para buscar">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-2">
                                <div class="form-group">
                                    <label>Nº do cheque</label>
                                    <input type="text" 
                                           ng-model="controller.currentEntity.numeroCheque"
                                           class="form-control" >
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <div class="form-group">
                                    <label>Nº do banco</label>
                                    <input id="bank_number" 
                                           ng-model="controller.currentEntity.banco.numero"
                                           type="text" class="form-control" >
                                </div>
                            </div>
                            <div class="col-sm-8">
                                <div class="form-group">
                                    <label>Banco</label>
                                    <input type="text" class="form-control" 
                                           ng-model="controller.currentEntity.banco.nome"
                                           readonly="true" placeholder="Informe o número do Banco para buscar" >
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-2">
                                <div class="form-group">
                                    <label>Nº da conta</label>
                                    <input type="text" 
                                           ng-model="controller.currentEntity.numeroConta"
                                           class="form-control" >
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label>Praça COMP???</label>
                                    <input type="text" 
                                           ng-model="controller.currentEntity.praca"
                                           class="form-control" value="LOCAL OU FORA????">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label>Valor</label>
                                    <div class="input-group">
                                        <span class="input-group-addon">R$</span>
                                        <input type="text" 
                                               money
                                               ng-model="controller.currentEntity.valor"
                                               class="form-control" style="text-align: right">
                                    </div>


                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label>Vencimento</label>
                                    <input type="date" 
                                           ng-model="controller.currentEntity.vencimento"
                                           class="form-control" placeholder="dd/MM/yyyy">
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label>Taxa ao dia</label>
                                    <input type="text" 
                                           ng-model="controller.currentEntity.taxaAoDia"
                                           class="form-control" style="text-align: right">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label>Resgate</label>
                                    <input type="text" 
                                           ng-model="controller.currentEntity.resgate"
                                           class="form-control" style="text-align: right" data-a-sign="%" data-p-sign="s" >
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label>Tarifa ADM</label>
                                    <input type="text" 
                                           ng-model="controller.currentEntity.tarifaAdministrativa"
                                           class="form-control" style="text-align: right" >
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label>IOF</label>
                                    <input type="text" 
                                           ng-model="controller.currentEntity.iof"
                                           class="form-control" style="text-align: right" >
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label>CPMF</label>
                                    <input type="text" 
                                           ng-model="controller.currentEntity.cpmf"
                                           class="form-control" style="text-align: right" >
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-2">
                                <div class="form-group">
                                    <label>Total de dias</label>
                                    <input type="text" 
                                           ng-model="controller.currentEntity.totalDias"
                                           class="form-control" style="text-align: right" >
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <div class="form-group">
                                    <label>(%) Total</label>
                                    <input type="text" 
                                           ng-model="controller.currentEntity.percentTotal"
                                           class="form-control" style="text-align: right" >
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-8">
                                <div class="form-group">
                                    <label>Remetente</label>
                                    <input type="text"
                                           ng-model="controller.currentEntity.remetente"
                                           class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6">
                                <button type="submit"
                                        ng-click="controller.saveCheque()"
                                        class="btn btn-success waves-effect waves-light">
                                    <span class="btn-label"><i class="material-icons">check</i>
                                    </span>Cadastrar
                                </button>
                                <button type="button" 
                                        ng-click="controller.cancel()"
                                        class="btn btn-danger waves-effect waves-light">
                                    <span class="btn-label"><i class="material-icons">close</i>
                                    </span>Cancelar
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
