angular.module("System").service('userService', function ($http) {
    this.showUsers = function (page) {
        return $http.get("user/list")
                .then(function (response) {
                    return response.data;
                },
                        function (errResponse) {
                            return errResponse;
                        });
    };
    this.register = function (account) {
        return $http.post('user/create', account)
                .then(function (response) {
                    return "{\"code\":" + response.status + ",\"msg\":\"Usuário Cadastrado!\"}";
                },
                        function (errResponse) {
                            return "{\"code\":500,\"msg\":\"Erro ao cadastrar usuário, " + errResponse.data.exception + "\"}";
                        });
    };
    this.update = function (account) {
        return $http.post('user/update', account)
                .then(function (response) {
                    return "{\"code\":" + response.status + ",\"msg\":\"Usuário Atualizado!\"}";
                },
                        function (errResponse) {
                            return "{\"code\":500,\"msg\":\"Erro ao atualizar usuário, " + errResponse.data.exception + "\"}";
                        });
    };
    this.showUsersByParams = function (page) {
        return $http.get("user/list", {params: {'filter': page.query, 'page': page.page, 'limit': page.limt}}, null)
                .then(function (response) {
                    return response.data;
                },
                        function (errResponse) {
                            return errResponse;
                        });
    };
    this.findUser = function (id) {
        return $http.get("user/find", {params: {'id': id}}, null)
                .then(function (response) {
                    return response.data;
                },
                        function (errResponse) {
                            return errResponse;
                        });
    };
    this.getAuthenticated = function () {
        return $http.get("user/authenticated")
                .then(function (response) {
                    return response.data;
                },
                        function (errResponse) {
                            return errResponse;
                        });
    };
    this.deleteUser = function (user) {
        return $http({url: 'user/delete', method: 'DELETE', data: user, headers: {'Content-Type': 'application/json'}})
                .then(function (response) {
                    return "{\"code\":" + response.status + ",\"msg\":\"" + 'Usuário excluído' + " com sucesso!\"}";
                },
                        function (errResponse) {
                            return "{\"code\":500,\"msg\":\"Erro ao excluir usuário, " + errResponse.data.exception + "\"}";
                        });
    }
    this.loadProfiles = function () {
        return $http.get('user/profiles')
                .then(function (response) {
                    return response.data;
                },
                        function (errResponse) {
                            return errResponse.data.exception;
                        });
    }
});