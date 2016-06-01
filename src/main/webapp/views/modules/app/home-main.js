'use strict';

angular.module("System", ['ngAnimate', 'ngCookies', 'ngTouch',
    'ngSanitize', 'ngMaterial', 'directive.loading', 'ui.router', 'ui.tree',
    'camera', 'ui.bootstrap', 'fiestah.money', 'mdr.datepicker', 'ngDialog'])

        .config(function ($stateProvider, $urlRouterProvider) {

            // Use $urlRouterProvider to configure any redirects (when) and invalid urls (otherwise).
            $urlRouterProvider.otherwise('/');

            // Use $stateProvider to configure your states.
            $stateProvider.state('home', {
                url: "/",
                templateUrl: "views/modules/app/ui/home/home.jsp",
                title: 'Bem vindo',
                controller: 'HomeController',
                controllerAs: 'controller'
            }).state('profile', {
                url: "/profile",
                templateUrl: "views/modules/app/ui/home/perfil.jsp",
                title: 'Perfil pessoal',
                controller: 'HomeController',
                controllerAs: 'controller'
            });

            //perfil de acesso
            $stateProvider.state('profiles', {
                url: "/perfil-de-acesso",
                templateUrl: "views/modules/app/ui/profile/profile-list.jsp",
                title: 'Gerenciar Perfis de Acesso',
                controller: 'ProfileController',
                controllerAs: 'controller'
            }).state('profile-insert', {
                url: "/perfil-de-acesso/novo",
                templateUrl: 'views/modules/app/ui/profile/profile-form.jsp',
                title: 'Novo Perfil de Acesso',
                controller: 'ProfileController',
                controllerAs: 'controller'
            })
            .state('profile-edit', {
                url: "/perfil-de-acesso/editar/:id",
                templateUrl: 'views/modules/app/ui/profile/profile-form.jsp',
                title: 'Editar Perfil de Acesso',
                controller: 'ProfileController',
                controllerAs: 'controller'
            });
            
            //usuarios
            $stateProvider.state('users', {
                url: "/usuarios",
                templateUrl: "views/modules/app/ui/user/user-list.jsp",
                title: 'Gerenciar usuários',
                navigation: '/home',
                controller: 'UserController',
                controllerAs: 'controller'
            }).state('users-insert', {
                url: "/usuarios/novo",
                templateUrl: 'views/modules/app/ui/user/user-form.jsp',
                title: 'Novo Usuário',
                navigation: 'users',
                controller: 'UserController',
                controllerAs: 'controller'
            })
            .state('users-edit', {
                url: "/usuarios/editar/:id",
                templateUrl: 'views/modules/app/ui/user/user-form.jsp',
                title: 'Editar usuário',
                navigation: 'users',
                controller: 'UserController',
                controllerAs: 'controller'
            });

        })
        .run(function ($rootScope, $state, $stateParams) {

            // It's very handy to add references to $state and $stateParams to the $rootScope
            // so that you can access them from any scope within your applications.For example,
            // <li ng-class="{ active: $state.includes('contacts.list') }"> will set the <li>
            // to active whenever 'contacts.list' or one of its decendents is active.
            $rootScope.$state = $state;
            $rootScope.$stateParams = $stateParams;
        });

angular.module("System")
        .controller("HeaderController", function ($rootScope, $scope, $injector, userService, imageService) {

            $injector.invoke(AbstractController, this, {$scope: $scope});

            var vm = this;

            //vars
            vm.currentUser = {};
            vm.title = $rootScope.title;
            vm.navigation = $rootScope.navigation;
            vm.picture;

            //methods
            vm.loadUser = loadUser;
            vm.updateUser = updateUser;
            vm.alterPhoto = alterPhoto;
            vm.setPhoto = setPhoto;
            vm.getSnapshot = getSnapshot;
            vm.dataURItoBlob = dataURItoBlob;

            $scope.init = function (toState, toParams) {
                vm.loadUser();
            };

            /**
             * 
             * @returns {undefined}
             */
            function loadUser() {
                userService.getAuthenticated().then(function (response) {
                    vm.currentUser = response;
                });
            }

            /***
             * 
             * @returns {undefined}
             */
            function updateUser() {
                userService.updateProfile(vm.currentUser).then(function (response) {
                    if (vm.picture) {
                        imageService.upload(dataURItoBlob(vm.picture), vm.currentUser.id).then(function (response) {
                            if (response.code == 500)
                                $scope.showMessage(response.msg, 5000);
                        });
                    }
                    $scope.showMessage(response.msg, 5000);
                    vm.loadUser();

                })
            }
            ;

            /**
             * 
             * @returns {undefined}
             */
            function alterPhoto() {
                vm.picture = {};
                $("#preview").css("display", "none");
                $("#camera").attr("enable",true);
                $("#camera").css("display", "block");
            }
            ;

            /**
             * 
             * @returns {undefined}
             */
            function setPhoto() {
                $("#preview").css("display", "block");
                $("#camera").attr("enable",false);
                $("#camera").css("display", "none");
            }
            ;

            /**
             * 
             * @param {type} teste
             * @returns {undefined}
             */
            function getSnapshot() {
                vm.setPhoto();
            }

            /**
             * 
             * @param {type} dataURI
             * @returns {Blob}
             */
            function dataURItoBlob(dataURI) {
                // convert base64/URLEncoded data component to raw binary data held in a string
                var byteString;
                if (dataURI.split(',')[0].indexOf('base64') >= 0)
                    byteString = atob(dataURI.split(',')[1]);
                else
                    byteString = unescape(dataURI.split(',')[1]);

                // separate out the mime component
                var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];

                // write the bytes of the string to a typed array
                var ia = new Uint8Array(byteString.length);
                for (var i = 0; i < byteString.length; i++) {
                    ia[i] = byteString.charCodeAt(i);
                }

                return new Blob([ia], {type: mimeString});
            }

        });
angular.element(document).ready(function () {
    angular.bootstrap(document, ['System']);
});