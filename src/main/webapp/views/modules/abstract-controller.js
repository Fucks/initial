/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function AbstractController($rootScope, $scope, $state, $stateParams, $location) {

    $scope.$on('$stateChangeSuccess', function (event, toState, toParams, fromState, fromParams) {
        $rootScope.title = toState.title;
        $rootScope.navigation = toState.navigation;

        $scope.init(toState, toParams);
    });

    $scope.showMessage = function (message, timeout) {

        alertify.log(message, timeout);

    }
}
;

