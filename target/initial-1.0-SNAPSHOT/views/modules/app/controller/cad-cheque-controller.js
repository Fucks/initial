'use strict';
angular.module("System").controller('CadChequeController', function ($injector, $scope, $rootScope, $state,
        $stateParams, $http, clienteService, chequeService, bancoService, ngDialog) {

    $injector.invoke(AbstractController, this, {$scope: $scope});
    var vm = this;
    //States

    //Vars
    vm.currentEntity = {};

    //Methods
    vm.iniciaMasks = iniciaMasks;
    vm.controlaCliente = controlaCliente;
    vm.controlaBanco = controlaBanco;
    vm.saveCheque = saveCheque;
    vm.cancel = cancel;

    /**
     * 
     * @param {type} toState
     * @param {type} toParams
     * @returns {undefined}
     */
    $scope.init = function (toState, toParams) {
        $scope.currentState = toState.name;

        vm.iniciaMasks();

        vm.controlaCliente();
        vm.controlaBanco();
    };

    function iniciaMasks() {
        $("#client_id").focus();
    }

    /**
     * Verifica se existe um cliente com esse RG OU CPF informado
     * Caso tenha, já o adiciona ao cheque, senão, pergunta se quer cadastrar um novo.
     */
    function controlaCliente() {
        //Quando perder o foco no cliente, caso tenha valor no input, busca o cliente
        //pelo valor do input, caso não encontre, pergunta se deseja cadastrar um novo
        $("#client_id").on("blur", function (event) {
            if ($(event.target).val()) {
                //busca um cliente
                console.log("busca um cliente");
                clienteService.findCliente($(event.target).val())
                        .then(function (response) {
                            if (response) {
                                vm.currentEntity.cliente = response;

                            } else {
                                //limpa o campo
                                $(event.target).val('');
                                vm.currentEntity.cliente = {};

                                //Pergunta se deseja cadastrar um novo cliente
                                if (confirm("Não existe um cliente com esses dados, deseja cadastrar?")) {
                                    //abre a popup para cadastrar cliente

                                    ngDialog.open({
                                        template: 'views/modules/app/ui/cad_cheque/popup_cad_cliente.jsp',
                                        className: 'ngdialog-theme-plain',
                                        controller: 'CadastroClienteController',
                                        controllerAs: 'controller',
                                        closeByDocument: false,
                                        preCloseCallback: function (value) {
                                            console.log("Cliente cadastrado, agora adiciona-o ao cheque");
                                            vm.currentEntity.cliente = value;
                                        }
                                    });
                                }
                            }
                        });

            }
        });
    }


    /**
     * Verifica se existe um banco com esse número informado
     * Caso tenha, já o adiciona ao cheque, senão, pergunta se quer cadastrar um novo.
     */
    function controlaBanco() {
        //Quando perder o foco no número do banco, caso tenha valor no input, busca o banco
        //pelo número do input, caso não encontre, pergunta se deseja cadastrar um novo
        $("#bank_number").on("blur", function (event) {
            if ($(event.target).val()) {
                //busca um banco
                console.log("busca um banco");
                bancoService.findBanco($(event.target).val())
                        .then(function (response) {
                            if (response) {
                                vm.currentEntity.banco = response;

                            } else {
                                //limpa o campo
                                $(event.target).val('');
                                vm.currentEntity.banco = {};

                                //Pergunta se deseja cadastrar um novo cliente
                                if (confirm("Não existe um banco com esse número, deseja cadastrar?")) {
                                    //abre a popup para cadastrar banco

                                    ngDialog.open({
                                        template: 'views/modules/app/ui/cad_cheque/popup_cad_banco.jsp',
                                        className: 'ngdialog-theme-plain custom-width',
                                        controller: 'CadastroBancoController',
                                        controllerAs: 'controller',
                                        closeByDocument: false,
                                        preCloseCallback: function (value) {
                                            console.log("banco cadastrado, agora adiciona-o ao cheque");
                                            vm.currentEntity.banco = value;
                                        }
                                    });
                                }
                            }
                        });

            }
        });
    }

    /**
     * 
     * @returns {undefined}
     */
    function saveCheque() {
        chequeService.saveCheque(vm.currentEntity)
                .then(function (response) {
                    console.log(response);
                    if (response.code == 200) {
                        alertify.log("Cheque cadastrado");
                        $state.go("home");
                    }
                });
    }

    /**
     * 
     * @returns {undefined}
     */
    function cancel() {
        $state.go("home");
    }

});