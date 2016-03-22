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
                    <h4 class="m-t-0 header-title"><b>Cheques cadastrados no sistema</b></h4>
                    <div id="datatable_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                        <div class="row">
                            <div class="col-sm-12" style="text-align: right">
                                <label>Pesquisar: 
                                    <input type="text" 
                                           ng-model="controller.currentPage.query" 
                                           ng-keyup="$event.keyCode == 13 && controller.load()"
                                           class="form-control input-sm" ></label>
                            </div>
                        </div>
                        <div class="row" style="margin-top: 5px;">
                            <div class="col-sm-12">
                                <table id="datatable" class="table table-striped table-bordered dataTable no-footer" role="grid" aria-describedby="datatable_info">
                                    <thead>
                                        <tr role="row">
                                            <th>Nº</th>
                                            <th>Cliente</th>
                                            <th>Banco</th>
                                            <th>Valor</th>
                                            <th>Vencimento</th>
                                            <th>Status</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr ng-repeat="entity in controller.currentPage.content">
                                            <td width='10%'>{{entity.numeroCheque}}</td>
                                            <td width='20%'>{{entity.cliente.fullName}}</td>
                                            <td width='13%'>{{entity.banco.nome}}</td>
                                            <td width='15%'>{{entity.valor| currency:"R$ "}}</td>
                                            <td width='10%'>{{entity.vencimento| date:'dd/MM/yyyy'}}</td>
                                            <td><span class="label" ng-class="{'label-inverse' : entity.status == 'Pendente', 'label-danger' : entity.status == 'Atrasado'}">{{entity.status}}</span></td>
                                            <td style="text-align: center">
                                                <button type="button" 
                                                        class="btn btn-primary waves-effect waves-light btn-sm">
                                                    <i class="material-icons">file_download</i>
                                                </button>
                                                <button type="button" 
                                                        class="btn btn-danger waves-effect waves-light btn-sm">
                                                    <i class="material-icons">close</i>
                                                </button>
                                                <button type="button" 
                                                        class="btn btn-inverse waves-effect waves-light btn-sm">
                                                    <i class="material-icons">mode_edit</i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr ng-show="controller.currentPage.content.length == 0">
                                            <td colspan="7">Nenhum resultado encontrado!</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 col-md-6 col-md-offset-4">
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