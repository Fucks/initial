'use strict';
angular.module("System").controller('ChequeController', function ($injector, $scope, $state,
        clienteService, chequeService, bancoService, ngDialog) {

    $injector.invoke(AbstractController, this, {$scope: $scope});
    var vm = this;
    //States
    vm.LIST_STATE = "cheques";

    //Vars
    vm.currentEntity = {};
    vm.currentPage = {};

    //Methods
    vm.load = load;

    /**
     * 
     * @param {type} toState
     * @param {type} toParams
     * @returns {undefined}
     */
    $scope.init = function (toState, toParams) {
        $scope.currentState = toState.name;

        var state = toState.name;
        var params = toParams;

        switch (state) {
            case vm.LIST_STATE:
            {
                vm.currentPage = {page: 0, limit: '8', query: "", content: []};
                vm.load();

                break;
            }
            case vm.INSERT_STATE:
            {
//                vm.changeToNew();

                break;
            }
            case vm.EDIT_STATE:
            {
//                vm.findCliente(params.id);

                break;
            }

            default :
            {
                $state.go(vm.LIST_STATE);

                break;
            }
        }
        vm.currentState = state;

    };

    function load() {
        chequeService.listByParam(vm.currentPage)
                .then(function (response) {
                    vm.currentPage = response;
                    vm.currentPage.query = "";
                    vm.currentPage.pageNumber = response.number + 1;
                });
    }

});