angular.module("System").service('bancoService', function ($http) {
     this.findBanco = function (filter) {
        return $http.get("banco/find", {params: {'filter': filter}}, null)
                .then(function (response) {
                    return response.data;
                },
                        function (errResponse) {
                            return errResponse;
                        });
    };
    this.saveBanco = function (cliente) {
        return $http.post("banco/create", cliente)
                .then(function (response) {
                    return response;
                },
                        function (errResponse) {
                            return JSON.parse("{\"code\":500,\"msg\":\"Erro ao cadastrar banco, " + errResponse.data.exception + "\"}");
                        });
    };
    this.show = function (page) {
        return $http.get("banco/list", {params: {'filter': page.query, 'page': page.page, 'limit': page.limt}}, null)
                .then(function (response) {
                    return response.data;
                },
                function (errResponse) {
                    return errResponse;
                });
    };
    this.findById = function (id) {
        return $http.get("banco/find-by-id", {params: {'id': id}}, null)
                .then(function (response) {
                    return response.data;
                },
                        function (errResponse) {
                            return errResponse;
                        });
    };
    this.delete = function (banco) {
        return $http({url: 'banco/delete', method: 'DELETE', data: banco, headers: {'Content-Type': 'application/json'}})
                .then(function (response) {
                    return JSON.parse("{\"code\":" + response.status + ",\"msg\":\"" + 'Banco excluído' + " com sucesso!\"}");
                },
                        function (errResponse) {
                            return JSON.parse("{\"code\":500,\"msg\":\"Erro ao excluir banco, " + errResponse.data.exception + "\"}");
                        });
    }
});