'use strict';
angular.module("System").controller('CadastroClienteController', function ($injector, $scope, $filter, clienteService, ngDialog) {

    $injector.invoke(AbstractController, this, {$scope: $scope});
    var vm = this;
    //States

    //Vars
    vm.currentEntity = {};
    vm.nascimento;

    //Methods
    vm.init = init;
    vm.iniciaMasks = iniciaMasks;

    vm.saveCliente = saveCliente;

    vm.init();

    /**
     * 
     * @param {type} toState
     * @param {type} toParams
     * @returns {undefined}
     */
    function init() {
        console.log("iniciou controller da popup");

        vm.iniciaMasks();

    }
    ;

    /**
     * 
     * @returns {undefined}
     */
    function iniciaMasks() {
        $("#rg").mask("9.999.999-9");
        $("#cpf").mask("999.999.999-99");
    }

    /**
     * 
     * @returns {undefined}
     */
    function saveCliente() {
        //salva o cliente

        clienteService.saveCliente(vm.currentEntity)
                .then(function (response) {
                    console.log(response);
                    if (response.status == 200) {
                        vm.currentEntity = response.data;
                        $scope.closeThisDialog(vm.currentEntity);
                    } else {
                        console.log("deu erro ao cadastrar cliente. verifique")
                    }
                });
    }

});