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
                    return {code: response.status, msg: response.data.msg};
                },
                        function (errResponse) {
                            return {code: errResponse.status, msg: errResponse.data.exception};
                        });
    };
    this.update = function (account) {
        return $http.post('user/update', account)
                .then(function (response) {
                    return {code: response.status, msg: response.data.msg};
                },
                        function (errResponse) {
                            return {code: errResponse.status, msg: errResponse.data.exception};
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
                    return {code: response.status, msg: response.data.msg};
                },
                        function (errResponse) {
                            return {code: errResponse.status, msg: errResponse.data.exception};
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
    this.getAllPermission = function () {
        return $http.get("user/all-permissions-grouped")
                .then(function (response) {
                    return response;
                })
                .then(function (errResponse) {
                    return errResponse;
                })
    }
    this.loadProfilesByParams = function (page) {
        return $http.get("user/list-profiles", {params: {'filter': page.query, 'page': page.page, 'limit': page.limt}}, null)
                .then(function (response) {
                    return response.data;
                },
                        function (errResponse) {
                            return errResponse;
                        });
    }
    this.findProfile = function (id) {
        return $http.get("user/perfil-de-acesso/find", {params: {'id': id}}, null)
                .then(function (response) {
                    return response.data;
                }, function (errResponse) {
                    return errResponse.data.msg;
                })
    }
    this.savePerfilDeAcesso = function (profile) {
        return $http.post('user/perfil-de-acesso/update', profile)
                .then(function (response) {
                    return {code: response.status, msg: response.data.msg};
                },
                        function (errResponse) {
                            return {code: errResponse.status, msg: errResponse.data.exception}
                            ;
                        });
    };
    this.removePerfilDeAcesso = function (profile) {
        return $http({url: 'user/perfil-de-acesso/remove', method: 'DELETE', data: profile, headers: {'Content-Type': 'application/json'}})
//        return $http.delete('user/perfil-de-acesso/remove', {data: profile})
                .then(function (response) {
                    return {code: response.status, msg: response.data.msg};
                },
                        function (errResponse) {
                            return {code: errResponse.status, msg: errResponse.data.exception}
                            ;
                        }
                );
    };
    this.updateProfile = function (account) {
        return $http.post('user/account/update', account)
                .then(function (response) {
                    return {code: response.status, msg: response.data.msg};
                },
                        function (errResponse) {
                            return {code: errResponse.status, msg: errResponse.data.exception};
                        });
    };
}
);