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

<div class="wrapper">
    <div class="container">

        <div class="row">
            <div class="col-lg-4">
                <div class="card-box">
                    <div class="bar-widget">
                        <div class="table-box">
                            <div class="table-detail">
                                <div class="iconbox bg-info">
                                    <i class="material-icons">layers</i>
                                </div>
                            </div>

                            <div class="table-detail">
                                <h4 class="m-t-0 m-b-5"><b>{{controller.TOTAL_A_RECEBER | currency:"R$ "}}</b></h4>
                                <p class="text-muted m-b-0 m-t-0">Total a receber</p>
                            </div>
                            <div class="table-detail text-right">
                                <span data-plugin="peity-bar" data-colors="#34d3eb,#ebeff2" data-width="120" data-height="45" style="display: none;">5,3,9,6,5,9,7,3,5,2,9,7,2,1</span><svg class="peity" height="45" width="120"><rect fill="#34d3eb" x="0.8571428571428571" y="20" width="6.857142857142858" height="25"></rect><rect fill="#ebeff2" x="9.428571428571429" y="30" width="6.857142857142856" height="15"></rect><rect fill="#34d3eb" x="18" y="0" width="6.857142857142858" height="45"></rect><rect fill="#ebeff2" x="26.571428571428573" y="15" width="6.857142857142858" height="30"></rect><rect fill="#34d3eb" x="35.14285714285714" y="20" width="6.857142857142861" height="25"></rect><rect fill="#ebeff2" x="43.714285714285715" y="0" width="6.857142857142854" height="45"></rect><rect fill="#34d3eb" x="52.285714285714285" y="10" width="6.857142857142861" height="35"></rect><rect fill="#ebeff2" x="60.857142857142854" y="30" width="6.857142857142854" height="15"></rect><rect fill="#34d3eb" x="69.42857142857143" y="20" width="6.857142857142861" height="25"></rect><rect fill="#ebeff2" x="78" y="35" width="6.857142857142861" height="10"></rect><rect fill="#34d3eb" x="86.57142857142857" y="0" width="6.857142857142861" height="45"></rect><rect fill="#ebeff2" x="95.14285714285714" y="10" width="6.857142857142861" height="35"></rect><rect fill="#34d3eb" x="103.71428571428571" y="35" width="6.857142857142861" height="10"></rect><rect fill="#ebeff2" x="112.28571428571429" y="40" width="6.857142857142847" height="5"></rect></svg>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="card-box">
                    <div class="bar-widget">
                        <div class="table-box">
                            <div class="table-detail">
                                <div class="iconbox bg-custom">
                                    <i class="material-icons">layers</i>
                                </div>
                            </div>

                            <div class="table-detail">
                                <h4 class="m-t-0 m-b-5"><b>{{controller.CHEQUES_A_VENCER}}</b></h4>
                                <p class="text-muted m-b-0 m-t-0">Cheques á vencer no mês</p>
                            </div>
                            <div class="table-detail text-right">
                                <span data-plugin="peity-pie" data-colors="#5fbeaa,#ebeff2" data-width="50" data-height="45" style="display: none;">1/5</span><svg class="peity" height="45" width="50"><path d="M 25 0 A 22.5 22.5 0 0 1 46.39877161664096 15.547117626563683 L 25 22.5" fill="#5fbeaa"></path><path d="M 46.39877161664096 15.547117626563683 A 22.5 22.5 0 1 1 24.999999999999996 0 L 25 22.5" fill="#ebeff2"></path></svg>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="card-box">
                    <div class="bar-widget">
                        <div class="table-box">
                            <div class="table-detail">
                                <div class="iconbox bg-danger">
                                    <i class="material-icons">layers</i>
                                </div>
                            </div>

                            <div class="table-detail">
                                <h4 class="m-t-0 m-b-5"><b>{{controller.CHEQUES_ATRASADOS}}</b></h4>
                                <p class="text-muted m-b-0 m-t-0">Cheques atrasados</p>
                            </div>
                            <div class="table-detail text-right">
                                <span data-plugin="peity-donut" data-colors="#f05050,#ebeff2" data-width="50" data-height="45" style="display: none;">1/5</span><svg class="peity" height="45" width="50"><path d="M 25 0 A 22.5 22.5 0 0 1 46.39877161664096 15.547117626563683 L 35.69938580832048 19.02355881328184 A 11.25 11.25 0 0 0 25 11.25" fill="#f05050"></path><path d="M 46.39877161664096 15.547117626563683 A 22.5 22.5 0 1 1 24.999999999999996 0 L 24.999999999999996 11.25 A 11.25 11.25 0 1 0 35.69938580832048 19.02355881328184" fill="#ebeff2"></path></svg>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>



        <div class="row">

            <div class="col-lg-4">
                <div class="card-box">
                    <h4 class="text-dark header-title m-t-0 m-b-30">Receitas diárias</h4>

                    <div class="widget-chart text-center">
                        
                    </div>
                </div>

            </div>

            <div class="col-lg-4">
                <div class="card-box">
                    <h4 class="text-dark  header-title m-t-0 m-b-30">Receitas semanais</h4>

                    <div class="widget-chart text-center">
                        
                    </div>
                </div>

            </div>

            <div class="col-lg-4">
                <div class="card-box">
                    <h4 class="text-dark  header-title m-t-0 m-b-30">Receitas mensais</h4>

                    <div class="widget-chart text-center">
                        
                    </div>
                </div>

            </div>

        </div>

        <!-- end row -->

<!--        <div class="row">

            <div class="col-lg-12">

                <div class="portlet"> /primary heading 
                    <div class="portlet-heading">
                        <h3 class="portlet-title text-dark text-uppercase">
                            Ultimas atividades
                        </h3>
                        <div class="clearfix"></div>
                    </div>
                    <div id="portlet2" class="panel-collapse collapse in">
                        <div class="portlet-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Project Name</th>
                                            <th>Start Date</th>
                                            <th>Due Date</th>
                                            <th>Status</th>
                                            <th>Assign</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Ubold Admin v1</td>
                                            <td>01/01/2015</td>
                                            <td>26/04/2015</td>
                                            <td><span class="label label-info">Released</span></td>
                                            <td>Coderthemes</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>Ubold Frontend v1</td>
                                            <td>01/01/2015</td>
                                            <td>26/04/2015</td>
                                            <td><span class="label label-success">Released</span></td>
                                            <td>Coderthemes</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>Ubold Admin v1.1</td>
                                            <td>01/05/2015</td>
                                            <td>10/05/2015</td>
                                            <td><span class="label label-pink">Pending</span></td>
                                            <td>Coderthemes</td>
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td>Ubold Frontend v1.1</td>
                                            <td>01/01/2015</td>
                                            <td>31/05/2015</td>
                                            <td><span class="label label-purple">Work in Progress</span></td>
                                            <td>Coderthemes</td>
                                        </tr>
                                        <tr>
                                            <td>5</td>
                                            <td>Ubold Admin v1.3</td>
                                            <td>01/01/2015</td>
                                            <td>31/05/2015</td>
                                            <td><span class="label label-warning">Coming soon</span></td>
                                            <td>Coderthemes</td>
                                        </tr>

                                        <tr>
                                            <td>6</td>
                                            <td>Ubold Admin v1.3</td>
                                            <td>01/01/2015</td>
                                            <td>31/05/2015</td>
                                            <td><span class="label label-primary">Coming soon</span></td>
                                            <td>Coderthemes</td>
                                        </tr>

                                        <tr>
                                            <td>7</td>
                                            <td>Ubold Admin v1.3</td>
                                            <td>01/01/2015</td>
                                            <td>31/05/2015</td>
                                            <td><span class="label label-info">Cool</span></td>
                                            <td>Coderthemes</td>
                                        </tr>

                                        <tr>
                                            <td>8</td>
                                            <td>Ubold Admin v1.3</td>
                                            <td>01/01/2015</td>
                                            <td>31/05/2015</td>
                                            <td><span class="label label-warning">Coming soon</span></td>
                                            <td>Coderthemes</td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>  end col 

        </div>-->
        <!-- end row -->
    </div>
</div>
