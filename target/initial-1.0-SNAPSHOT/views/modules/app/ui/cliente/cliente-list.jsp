<%-- 
    Document   : home
    Created on : 06/11/2015, 10:26:47
    Author     : wellington.fucks
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<div class="wrapper">
    <div class="container">

        <div class="row">
            <div class="col-sm-12">
                <div class="card-box table-responsive">
                    <h4 class="m-t-0 header-title"><b>Clientes cadastrados no sistema</b></h4>
                    <div id="datatable_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                        <div class="row">
                            <div class="col-sm-12" style="text-align: right">
                                <label>Pesquisar: 
                                    <input type="text" 
                                           ng-model="controller.currentPage.query" 
                                           ng-keyup="$event.keyCode == 13 && controller.loadClientes()"
                                           class="form-control input-sm" style="margin-right: 25px;" ></label>
                                <button class="btn btn-success waves-effect waves-light btn-sm"
                                        ng-click="controller.changeToNew()" >
                                    Novo cadastro
                                </button>
                            </div>
                        </div>
                        <div class="row" style="margin-top: 5px;">
                            <div class="col-sm-12">
                                <table id="datatable" class="table table-striped table-bordered dataTable no-footer" role="grid" aria-describedby="datatable_info">
                                    <thead>
                                        <tr role="row">
                                            <th>Nome completo</th>
                                            <th>CPF</th>
                                            <th>RG</th>
                                            <th>Endereço</th>
                                            <th>Nascimento</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr ng-repeat="entity in controller.currentPage.content">
                                            <td width='20%'>{{entity.fullName}}</td>
                                            <td width='10%'>{{entity.cpf}}</td>
                                            <td width='10%'>{{entity.rg}}</td>
                                            <td width='20%'>{{entity.endereco}}</td>
                                            <td width='10%'>{{entity.nascimento| date:'dd/MM/yyyy'}}</td>
                                            <td style="text-align: center"  width='10%'>
                                                <button type="button" 
                                                        ng-click="controller.changeToEdit(entity.id)"
                                                        class="btn btn-inverse waves-effect waves-light btn-xs">
                                                    <i class="material-icons">mode_edit</i></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr ng-show="controller.currentPage.content.length == 0">
                                            <td colspan="6">Nenhum resultado encontrado!</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-12 center-align" style="text-align: center">
                                <uib-pagination total-items="controller.currentPage.totalElements" 
                                                previous-text="Anterior"
                                                next-text="Próximo"
                                                items-per-page="controller.currentPage.numberOfElements"
                                                ng-model="controller.currentPage.pageNumber" ng-change="controller.pageChanged()"></uib-pagination>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div> <!-- end container -->
</div>