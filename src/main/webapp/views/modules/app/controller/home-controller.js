'use strict';

angular.module("System").controller('HomeController', function ($injector, $scope) {

    /**
     * Inject methods, attributes and states inherited of the AbstractCRUDController 
     * @see AbstractCRUDController
     */

    $injector.invoke(AbstractController, this, {$scope: $scope});

    var vm = this;
    
    /**
     * 
     * @param {type} toState
     * @param {type} toParams
     * @returns {undefined}
     */
    $scope.init = function (toState, toParams) {
        $scope.currentState = toState.name;
    };

});