/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function AbstractController($rootScope, $scope, $state, $stateParams, $location, $mdToast) {

    $rootScope.goToBack = function (state) {
        //getting server URL
        var serverUrl = $location.absUrl().split($location.absUrl().split("/")[$location.absUrl().split("/").length - 2])[0];

        //retira a ultima barra '/'
        serverUrl = serverUrl.slice(0, serverUrl.length - 1);

        if (state[0] == '/') {
            window.location.href = serverUrl + state;
        } else {
            $state.go(state);
        }

    };

    $scope.$on('$stateChangeSuccess', function (event, toState, toParams, fromState, fromParams) {
        $rootScope.title = toState.title;
        $rootScope.navigation = toState.navigation;

        $scope.init(toState, toParams);
    });

    $scope.showToast = function (msg, delay) {
        $mdToast.show(
                $mdToast.simple()
                .content(msg)
                .position('top right')
                .hideDelay(delay)
                );
    }
    
    //ativa js's
    $(document).ready(function () {
        $('.tooltipped').tooltip({delay: 50});
    });
}
;

