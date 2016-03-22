'use strict';

angular.module("System", ['ngAnimate', 'ngCookies', 'ngTouch',
    'ngSanitize', 'ngMaterial', 'directive.loading', 'ui.router', 
    'ui.bootstrap','fiestah.money', 'mdr.datepicker', 'ngDialog'])

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
            });

            //usuarios
            $stateProvider.state('users', {
                url: "/user-module",
                templateUrl: "views/modules/app/ui/user/user-list.jsp",
                title: 'Gerenciar usuários',
                navigation: '/home',
                controller: 'UserController',
                controllerAs: 'controller'
            }).state('users-insert', {
                url: "/novo",
                templateUrl: 'views/modules/app/ui/user/user-form.jsp',
                title: 'Novo Usuário',
                navigation: 'users',
                controller: 'UserController',
                controllerAs: 'controller'
            })
            .state('users-edit', {
                url: "/editar/:id",
                templateUrl: 'views/modules/app/ui/user/user-form.jsp',
                title: 'Editar usuário',
                navigation: 'users',
                controller: 'UserController',
                controllerAs: 'controller'
            });

            //cheques
            $stateProvider.state('cad-cheque', {
                url: "/cad-cheque",
                templateUrl: "views/modules/app/ui/cad_cheque/cad_cheque.jsp",
                title: 'Novo Cheque',
                controller: 'CadChequeController',
                controllerAs: 'controller'
            });
            
            //gerenciar-clientes
            $stateProvider.state('clientes', {
                url: "/gerenciar/clientes",
                templateUrl: "views/modules/app/ui/cliente/cliente-list.jsp",
                title: 'Clientes',
                controller: 'ClienteController',
                controllerAs: 'controller'
            })
            .state('cliente-insert', {
                url: "/gerenciar/clientes/novo",
                templateUrl: 'views/modules/app/ui/cliente/cliente-form.jsp',
                title: 'Novo Cliente',
                navigation: 'users',
                controller: 'ClienteController',
                controllerAs: 'controller'
            })
            .state('cliente-edit', {
                url: "/gerenciar/clientes/editar/:id",
                templateUrl: 'views/modules/app/ui/cliente/cliente-form.jsp',
                title: 'Editar cliente',
                navigation: 'users',
                controller: 'ClienteController',
                controllerAs: 'controller'
            });
            
            //gerenciar-bancos
            $stateProvider.state('bancos', {
                url: "/gerenciar/bancos",
                templateUrl: "views/modules/app/ui/banco/banco-list.jsp",
                title: 'Bancos',
                controller: 'BancoController',
                controllerAs: 'controller'
            })
            .state('banco-insert', {
                url: "/gerenciar/bancos/novo",
                templateUrl: 'views/modules/app/ui/banco/banco-form.jsp',
                title: 'Novo banco',
                navigation: 'users',
                controller: 'BancoController',
                controllerAs: 'controller'
            })
            .state('banco-edit', {
                url: "/gerenciar/bancos/editar/:id",
                templateUrl: 'views/modules/app/ui/banco/banco-form.jsp',
                title: 'Editar banco',
                navigation: 'users',
                controller: 'BancoController',
                controllerAs: 'controller'
            });
            
            //gerenciar-cheques
            $stateProvider.state('cheques', {
                url: "/gerenciar/cheques",
                templateUrl: "views/modules/app/ui/cheque/cheque-list.jsp",
                title: 'Cheques',
                controller: 'ChequeController',
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
        .controller("HeaderController", function ($rootScope, $interval, dateFilter, userService) {

            var vm = this;

            //vars
            vm.currentUser = {};
            vm.title = $rootScope.title;
            vm.navigation = $rootScope.navigation;
            vm.currentTime = new Date();
            vm.dateFilter = dateFilter;

            //methods
            vm.loadUser = loadUser();

            var updateTime = $interval(function () {
                vm.currentTime = new Date();
            }, 1000);
            /**
             * 
             * @returns {undefined}
             */
            function loadUser() {
                userService.getAuthenticated().then(function (response) {
                    vm.currentUser = response;
                });
            }

        });
angular.element(document).ready(function () {
    angular.bootstrap(document, ['System']);
});