'use strict';

angular.module("System").controller('ProfileController', function ($injector, $scope, $state, userService) {

    $injector.invoke(AbstractController, this, {$scope: $scope});

    var vm = this;

    //States
    vm.LIST_STATE = "profiles";
    vm.INSERT_STATE = "profile-insert";
    vm.EDIT_STATE = "profile-edit";
    vm.DETAIL_STATE = "profile-detail";
    vm.DELETE_STATE = "profile-delete";

    //Vars
    vm.currentPage;
    vm.currentEntity;
    vm.permissions;
    vm.selectedPermissions = [];

    //Methods
    vm.changeToNew = changeToNew;
    vm.changeToList = changeToList;
    vm.changeToEdit = changeToEdit;
    vm.changeToDetail = changeToDetail;
    vm.loadProfiles = loadProfiles;
    vm.selected = selected;
    vm.loadPermissions = loadPermissions;
    vm.populatePermissions = populatePermissions;
    vm.findProfile = findProfile;
    vm.save = save;
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
                vm.loadProfiles();

                break;
            }
            case vm.INSERT_STATE:
            {
                vm.currentEntity = {};
                vm.loadPermissions();

                break;
            }
            case vm.DETAIL_STATE:
            {
                vm.findProfile(params.id);

                break;
            }
            case vm.EDIT_STATE:
            {
                vm.findProfile(params.id);

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
    function loadProfiles() {
        userService.loadProfilesByParams(vm.currentPage)
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
    function loadPermissions() {
        userService.getAllPermission()
                .then(function (response) {
                    vm.permissions = response.data;
                    if (vm.currentState == vm.EDIT_STATE)
                        vm.populatePermissions();
                });

    }
    ;

    /**
     * 
     * @returns {undefined}
     */
    function populatePermissions() {
        vm.permissions.forEach(function (group) {
            group.permissoes.forEach(function (permissao) {
                permissao.selected = verifyHavePermission(vm.currentEntity.permissoes, permissao);
            })
        });
    }

    /**
     * 
     * @param {type} permissions
     * @param {type} permission
     * @returns {undefined}
     */
    function verifyHavePermission(permissions, permission) {
        for (var i = 0; i < permissions.length; i++) {
            if (permissions[i].dependencias && permissions[i].dependencias.lenght > 0) {
                verifyHavePermission(permissions[i].dependencias, permission)
            }
            if (permissions[i].name == permission.name) {
                return true;
            }

        }
    }

    /**
     * 
     * @param {type} id
     * @returns {undefined}
     */
    function findProfile(id) {
        userService.findProfile(id)
                .then(function (response) {
                    vm.currentEntity = response;
                    vm.loadPermissions();
                });
    }
    ;

    /**
     * 
     * @param {type} node
     * @returns {undefined}
     */
    function selected(node) {
        if (node.selected && node.dependencias && node.dependencias.length > 0) {
            node.dependencias.forEach(function (dependency) {
                //nivel de grupo
                vm.permissions.forEach(function (groupPermission) {
                    //permissoes do grupo
                    groupPermission.permissoes.forEach(function (permission) {
                        if (dependency.name == permission.name) {
                            permission.selected = true;
                            return;
                        }
                    });
                });
            });
        }
    }

    /**
     * 
     * @returns {undefined}
     */
    function save() {
        if (!$scope.form.$valid) {
            $scope.showMessage("Preencha os campos corretamente", 5000);
            return;
        }
        var selectedPermissions = new Array();

        vm.permissions.forEach(function (group) {
            group.permissoes.forEach(function (permissao) {
                if (permissao.selected) {
                    permissao.selected = undefined;
                    selectedPermissions.push(permissao);
                }
            })
        });

        vm.currentEntity.permissoes = selectedPermissions;

        userService.savePerfilDeAcesso(vm.currentEntity)
                .then(function (response) {
                    $scope.showMessage(response.msg, 5000);
                    if (response.code == 200) {
                        $state.go(vm.LIST_STATE);
                    }
                });


    }
    ;

    /**
     * 
     * @param {type} $event
     * @returns {undefined}
     */
    function remove() {
        if (confirm("Deseja realmente excluir o perfil de acesso??")) {
            userService.removePerfilDeAcesso(vm.currentEntity)
                    .then(function (response) {
                        $scope.showMessage(response.msg, 5000);
                        if (response.code == 200)
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