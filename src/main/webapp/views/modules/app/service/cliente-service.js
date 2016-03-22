angular.module("System").service('clienteService', function ($http) {
    this.showClientes = function (page) {
        return $http.get("cliente/list", {params: {'filter': page.query, 'page': page.page, 'limit': page.limt}}, null)
                .then(function (response) {
                    return response.data;
                },
                        function (errResponse) {
                            return errResponse;
                        });
    };
    this.findCliente = function (filter) {
        return $http.get("cliente/find", {params: {'filter': filter}}, null)
                .then(function (response) {
                    return response.data;
                },
                        function (errResponse) {
                            return errResponse;
                        });
    };
    this.findClienteById = function (id) {
        return $http.get("cliente/find-by-id", {params: {'id': id}}, null)
                .then(function (response) {
                    return response.data;
                },
                        function (errResponse) {
                            return errResponse;
                        });
    };
    this.saveCliente = function (cliente) {
        return $http.post("cliente/create", cliente)
                .then(function (response) {
                    return response;
                },
                        function (errResponse) {
                            return JSON.parse("{\"code\":500,\"msg\":\"Erro ao cadastrar Cliente, " + errResponse.data.exception + "\"}");
                        });
    };
    this.delete = function (cliente) {
        return $http({url: 'cliente/delete', method: 'DELETE', data: cliente, headers: {'Content-Type': 'application/json'}})
                .then(function (response) {
                    return JSON.parse("{\"code\":" + response.status + ",\"msg\":\"" + 'Cliente excluído' + " com sucesso!\"}");
                },
                        function (errResponse) {
                            return JSON.parse("{\"code\":500,\"msg\":\"Erro ao excluir cliente, " + errResponse.data.exception + "\"}");
                        });
    }
});