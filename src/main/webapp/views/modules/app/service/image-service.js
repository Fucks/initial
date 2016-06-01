angular.module("System").service('imageService', function ($http) {
    this.upload = function (photo, id) {
        var fd = new FormData();
        fd.append('file', photo);
        fd.append('name', id);
        
        return $http.post('imagem/', fd, {
            transformRequest: angular.identity,
            headers: {'Content-Type': undefined}
        })
                .then(function (response) {
                    return "{\"code\":" + response.status + ",\"msg\":\"Imagem Cadastrada!\"}";
                },
                        function (errResponse) {
                            return "{\"code\":500,\"msg\":\"Erro ao cadastrar imagem, " + errResponse.data.exception + "\"}";
                        });
    };
});