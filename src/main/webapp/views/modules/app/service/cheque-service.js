angular.module("System").service('chequeService', function ($http) {
    this.findCheque = function (filter) {
        return $http.get("cheque/find", {params: {'filter': filter}}, null)
                .then(function (response) {
                    return response.data;
                },
                        function (errResponse) {
                            return errResponse;
                        });
    };
    this.saveCheque = function (cliente) {
        return $http.post("cheque/create", cliente)
                .then(function (response) {
                    return JSON.parse("{\"code\":" + response.status + ",\"msg\":\"Cheque Cadastrado!\"}");
                },
                        function (errResponse) {
                            return JSON.parse("{\"code\":500,\"msg\":\"Erro ao cadastrar cheque, " + errResponse.data.exception + "\"}");
                        });
    };
    this.getTotalReceive = function () {
        return $http.get("cheque/total-receive", null, null)
                .then(function (response) {
                    return response.data;
                },
                        function (errResponse) {
                            return "Não foi possível carregar.";
                        });
    };
    this.getExpiringCheque = function () {
        return $http.get("cheque/expiring-cheque", null, null)
                .then(function (response) {
                    return response.data;
                },
                        function (errResponse) {
                            return "Não foi possível carregar.";
                        });
    };
    this.listByParam = function (page) {
        return $http.get("cheque/list", {params: {'filter': page.query, 'page': page.page, 'limit': page.limt}}, null)
                .then(function (response) {
                    return response.data;
                },
                        function (errResponse) {
                            return errResponse;
                        });
    };
});