'use strict';
angular.module("System").controller('CadastroBancoController', function ($injector, $scope, $filter, bancoService, ngDialog) {

    $injector.invoke(AbstractController, this, {$scope: $scope});
    var vm = this;
    //States

    //Vars
    vm.currentEntity = {};
    vm.nascimento;

    //Methods
    vm.init = init;

    vm.saveBanco = saveBanco;

    vm.init();

    /**
     * 
     * @param {type} toState
     * @param {type} toParams
     * @returns {undefined}
     */
    function init() {
        console.log("iniciou controller da popup");
    };
    
    /**
     * 
     * @returns {undefined}
     */
    function saveBanco() {
        //salva o banco
        bancoService.saveBanco(vm.currentEntity)
                .then(function (response) {
                    if (response.status == 200) {
                        vm.currentEntity = response.data;
                        $scope.closeThisDialog(vm.currentEntity);
                    } else {
                        console.log("deu erro ao cadastrar banco. verifique")
                    }
                });
    }

});