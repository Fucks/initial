'use strict';

angular.module("System").controller('HomeController', function ($injector, $scope, $rootScope, chequeService, $state, $stateParams, $http) {

    /**
     * Inject methods, attributes and states inherited of the AbstractCRUDController 
     * @see AbstractCRUDController
     */

    $injector.invoke(AbstractController, this, {$scope: $scope});

    var vm = this;

    //States

    //Vars
    vm.TOTAL_A_RECEBER;
    vm.CHEQUES_A_VENCER;
    vm.CHEQUES_ATRASADOS;

    //Methods
    vm.initialDashboard = initialDashboard;

    /**
     * 
     * @param {type} toState
     * @param {type} toParams
     * @returns {undefined}
     */
    $scope.init = function (toState, toParams) {
        $scope.currentState = toState.name;

        vm.TOTAL_A_RECEBER = 0;
        vm.CHEQUES_A_VENCER = 0;
        vm.CHEQUES_ATRASADOS = 0;
        
        vm.initialDashboard();
    };

    /**
     * 
     * @returns {undefined}
     */
    function initialDashboard() {
        //obtem o valor total a receber
        chequeService.getTotalReceive()
                .then(function (response) {
                    vm.TOTAL_A_RECEBER = response;
                });
        //obtem o número de cheques que expiram
        chequeService.getExpiringCheque()
                .then(function (response) {
                    vm.CHEQUES_A_VENCER = response;
                });
    }
});