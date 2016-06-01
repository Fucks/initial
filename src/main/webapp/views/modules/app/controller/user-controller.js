'use strict';

angular.module("System").controller('UserController', function ($injector, $scope, $state, userService) {

    $injector.invoke(AbstractController, this, {$scope: $scope});

    var vm = this;

    //States
    vm.LIST_STATE = "users";
    vm.INSERT_STATE = "users-insert";
    vm.EDIT_STATE = "users-edit";
    vm.DETAIL_STATE = "users-detail";
    vm.DELETE_STATE = "users-delete";

    //Vars
    vm.error;
    vm.confirmPassword;
    vm.users = [{}];
    vm.currentPage;
    vm.selected = [];
    vm.profiles = {};
    vm.profile = {};

    //Methods
    vm.changeToNew = changeToNew;
    vm.changeToList = changeToList;
    vm.changeToEdit = changeToEdit;
    vm.changeToDetail = changeToDetail;
    vm.loadUsers = loadUsers;
    vm.loadProfiles = loadProfiles;
    vm.findUser = findUser;
    vm.insert = insert;
    vm.update = update;
    vm.remove = remove;

    /**
     * 
     * @param {type} toState
     * @param {type} toParams
     * @returns {undefined}
     */
    $scope.init = function (toState, toParams) {
        var state = toState.name;
        var params = toParams;

        switch (state) {
            case vm.LIST_STATE:
            {
                vm.currentPage = {page: 0, limit: '8', query: "", content: []};
                vm.selected = new Array();
                vm.loadUsers();

                break;
            }
            case vm.INSERT_STATE:
            {
                vm.loadProfiles();
                vm.currentEntity = {};

                break;
            }
            case vm.DETAIL_STATE:
            {
                vm.loadProfiles();
                vm.findUser(params.id);

                break;
            }
            case vm.EDIT_STATE:
            {
                vm.loadProfiles();
                vm.findUser(params.id);

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
     * 
     */
    function changeToNew() {
        $state.go(vm.INSERT_STATE);
    }
    ;

    /**
     * 
     * @returns {undefined}
     */
    function changeToList() {
        $state.go(vm.LIST_STATE);
    }
    ;

    /**
     * 
     * @param {type} id
     * @returns {undefined}
     */
    function changeToEdit(id) {
        $state.go(vm.EDIT_STATE, {id: id});
    }
    ;

    /**
     * 
     * @param {type} id
     * @returns {undefined}
     */
    function changeToDetail(id) {
        $state.go(vm.DETAIL_STATE);
    }
    ;

    /**
     * 
     * @returns {undefined}
     */
    function loadUsers() {
        userService.showUsersByParams(vm.currentPage)
            .then(function (response) {
                vm.currentPage = response;
                vm.currentPage.query = "";
                vm.currentPage.pageNumber = response.number + 1;
            });

    }
    ;

    /**
     * 
     * @returns {undefined}
     */
    function loadProfiles() {
        userService.loadProfiles()
                .then(function (response) {
                    vm.profiles = response;
                });
    }
    ;

    /**
     * 
     * @param {type} id
     * @returns {undefined}
     */
    function findUser(id) {
        userService.findUser(id)
            .then(function (response) {
                vm.currentEntity = response;
            });
    }
    ;

    /**
     * 
     * @returns {undefined}
     */
    function insert() {
        if (!$scope.form.$valid) {
            $scope.showMessage('Preencha todos os campo!', 5000);
            return;
        }
        if (vm.currentEntity.password == vm.confirmPassword && vm.confirmPassword != null) {

            userService.register(vm.currentEntity)
                    .then(function (response) {
                        $scope.showMessage(response.msg, 5000);
                        if (response.code == 200) {
                            $state.go(vm.LIST_STATE);
                        }
                    });

        } else {
            $scope.showMessage("Senha e confirmar senha devem ser iguais", 5000);
        }

    }
    ;

    /**
     * 
     * @returns {undefined}
     */
    function update() {
        if (!$scope.form.$valid) {
            $scope.showMessage("Preencha os campos corretamente", 5000);
            return;
        }
        if (vm.currentEntity.password == vm.confirmPassword && vm.confirmPassword != null) {

            userService.update(vm.currentEntity)
                    .then(function (response) {
                        $scope.showMessage(response.msg, 5000);
                        if (response.code == 200) {
                            $state.go(vm.LIST_STATE);
                        }
                    });

        } else {
            $scope.showMessage("Senha e confirmar senha devem ser iguais", 5000);
        }

    }
    ;

    /**
     * 
     * @param {type} $event
     * @returns {undefined}
     */
    function remove() {
        if (confirm("Deseja realmente excluir o usuário?")) {
            userService.deleteUser(vm.currentEntity)
                    .then(function (response) {
                        $scope.showMessage(response.msg, 5000);
                        $state.go(vm.LIST_STATE);
                    });
        }
    }
    /**
     * GRID EVENTS
     */

    /**
     * 
     * @param {type} page
     * @param {type} limit
     * @returns {unresolved}
     */
    $scope.onPaginationChange = function (page, limit) {
        vm.currentPage.page = page - 1;
        vm.loadUsers();
    };
});