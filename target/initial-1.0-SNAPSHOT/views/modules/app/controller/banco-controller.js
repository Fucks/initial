'use strict';
angular.module("System").controller('BancoController', function ($injector, $scope, $state, bancoService) {

    $injector.invoke(AbstractController, this, {$scope: $scope});
    var vm = this;

    //States
    vm.LIST_STATE = "bancos";
    vm.INSERT_STATE = "banco-insert";
    vm.EDIT_STATE = "banco-edit";

    //Vars
    vm.currentEntity = {};
    vm.currentPage;


    //Methods
    vm.changeToNew = changeToNew;
    vm.changeToEdit = changeToEdit;
    vm.changeToList = changeToList;

    vm.load = load;
    vm.pageChanged = pageChanged;
    vm.find = find;
    vm.save = save;
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
                vm.load();

                break;
            }
            case vm.INSERT_STATE:
            {
                vm.changeToNew();

                break;
            }
            case vm.EDIT_STATE:
            {
                vm.find(params.id);

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

    /**
     * 
     * @returns {undefined}
     */
    function load() {
        bancoService.show(vm.currentPage)
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
    function find(id) {
        bancoService.findById(id)
                .then(function (response) {
                    vm.currentEntity = response;
                });
    }
    ;

    function save() {
        //salva o cliente

        bancoService.saveBanco(vm.currentEntity)
                .then(function (response) {
                    if (response.status == 200) {
                        vm.currentEntity = response.data;
                        $state.go(vm.LIST_STATE);
                    } else {
                        console.log("deu erro ao cadastrar banco. verifique")
                    }
                });
    }

    function remove() {
        if (confirm("Deseja realmente excluir o banco?")) {
            bancoService.delete(vm.currentEntity)
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
        vm.currentPage.page = vm.currentPage.number--;
        vm.loadClientes();
    }

});