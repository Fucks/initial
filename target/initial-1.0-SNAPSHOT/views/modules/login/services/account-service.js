/*
 * CRIA O SERVICE E SEUS METODOS
 */
angular.module("login").service('accountService', function ($http) {

    this.register = function (account) {
        return $http.post('user/register', account)
                .then(function (response) {
                    return "{\"code\":" + response.status + ",\"msg\":\"Usuário Cadastrado!\"}";
                },
                        function (errResponse) {
                            return "{\"code\":500,\"msg\":\"Erro ao cadastrar usuário, " + errResponse.data.localizedMessage + "\"}";
                        });
    }
});
