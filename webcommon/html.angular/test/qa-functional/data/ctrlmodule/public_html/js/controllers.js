'use strict';

/* Controllers */

angular.module('myApp.controllers', []).
        controller('MyCtrl1', ['$scope', function($scope) {
                $scope.test = 1;
                $scope.hello = function() {
                };
                $scope.ironman = new Runner();
                $scope.dog = {name: "Jerry"};
            }])
        .controller('MyCtrl2', function($scope) {
            $scope.test2 = 1;
            $scope.hello2 = function() {
            };
            $scope.ironman2 = new Runner();
            $scope.dog2 = {name: "Jerry"};
            $scope.day = new Date();
        })
        .controller('MyCtrl3', [function($scope) {
                $scope.test3 = 1;
                $scope.hello3 = function() {
                };
                $scope.ironman3 = new Runner();
                $scope.dog3 = {name: "Jerry"};
            }]);


function Runner() {
    this.iteration = 1;
    this.date = new Date();
    this.exec = function() {
    };
    this.config = {
        url: "a",
        http: "1"
    };
}