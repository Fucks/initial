'use strict';
angular.module("System").controller('ClienteController', function ($injector, $scope, $rootScope, $state,
        $stateParams, $http, clienteService, ngDialog) {

    $injector.invoke(AbstractController, this, {$scope: $scope});
    var vm = this;
    //States
    vm.LIST_STATE = "clientes";
    vm.INSERT_STATE = "cliente-insert";
    vm.EDIT_STATE = "cliente-edit";
    //Vars
    vm.currentEntity = {};
    vm.currentPage;
    //Methods
    vm.changeToNew = changeToNew;
    vm.changeToEdit = changeToEdit;
    vm.changeToList = changeToList;
    vm.loadClientes = loadClientes;
    vm.pageChanged = pageChanged;
    vm.findCliente = findCliente;
    vm.saveCliente = saveCliente;
    vm.remove = remove;
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
                vm.loadClientes();
                break;
            }
            case vm.INSERT_STATE:
            {
                vm.changeToNew();
                break;
            }
            case vm.EDIT_STATE:
            {
                vm.findCliente(params.id);
                break;
            }

            default :
            {
                $state.go(vm.LIST_STATE);
                break;
            }
        }
        vm.currentState = state;
        $("#rg").mask("9.999.999-9");
        $("#cpf").mask("999.999.999-99");
    };
    /**
     * 
     * @returns {undefined}
     */
    function loadClientes() {
        clienteService.showClientes(vm.currentPage)
                .then(function (response) {
                    vm.currentPage = response;
                    vm.currentPage.query = "";
                    vm.currentPage.pageNumber = response.number + 1;
                });
    }

    /**
     * 
     * @param {type} id
     * @returns {undefined}
     */
    function findCliente(id) {
        clienteService.findClienteById(id)
                .then(function (response) {
                    vm.currentEntity = response;
                    if (vm.currentEntity.nascimento)
                        vm.currentEntity.nascimento = new Date(vm.currentEntity.nascimento);
                });
    }
    ;
    function saveCliente() {
        //salva o cliente

        clienteService.saveCliente(vm.currentEntity)
                .then(function (response) {
                    console.log(response);
                    if (response.status == 200) {
                        vm.currentEntity = response.data;
                        $state.go(vm.LIST_STATE);
                    } else {
                        console.log("deu erro ao cadastrar cliente. verifique")
                    }
                });
    }

    function remove() {
        if(confirm("Deseja realmente excluir o cliente?")){
            clienteService.delete(vm.currentEntity)
                    .then(function (response) {
                        alertify.log(response.msg);
                        if (response.code == 200)
                            $state.go(vm.LIST_STATE)
                    })
        }
    }

    /**
     * 
     * @returns {undefined}
     */
    function changeToNew() {
        vm.currentEntity = {};
        $state.go(vm.INSERT_STATE);
    }

    /**
     * 
     * @returns {undefined}
     */
    function changeToList() {
        $state.go(vm.LIST_STATE);
    }

    /**
     * 
     * @param {type} id
     * @returns {undefined}
     */
    function changeToEdit(id) {
        $state.go(vm.EDIT_STATE, {id: id});
    }

    /**
     * 
     * @returns {undefined}
     */
    function pageChanged() {
        vm.currentPage.page = vm.currentPage.pageNumber - 1;
        vm.loadClientes();
    }

});