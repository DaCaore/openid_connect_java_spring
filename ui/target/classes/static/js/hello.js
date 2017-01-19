angular.module('hello', ['ngRoute']).config(function ($routeProvider, $httpProvider) {
	$routeProvider.when('/', {
		templateUrl: 'home.html',
		controller: 'home',
		controllerAs: 'controller'
	}).otherwise('/');

	$httpProvider.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';
	$httpProvider.defaults.headers.common['Accept'] = 'application/json';

}).controller('navigation',

	function ($rootScope, $http, $location, $route) {

		var self = this;

		self.tab = function (route) {
			return $route.current && route === $route.current.controller;
		};

		$http({
			method: 'GET',
			url: '/user'
		}).then(function successCallback(response) {
			if (response.data) {
				console.log(response.data);
				$rootScope.authenticated = true;
			} else {

				console.log(response.data);
				$rootScope.authenticated = false;
			}
		}, function errorCallback(response) {
			$rootScope.authenticated = false;
		});


		self.credentials = {};

		self.logout = function () {
			$http.post('logout', {}).finally(function () {
				$rootScope.authenticated = false;
				$location.path("/");
			});
		};

	}).controller('home', function ($http) {
	var self = this;

	$http({
		method: 'GET',
		url: '/user'
	}).then(function successCallback(response) {
		console.log(response.data);
		self.greeting = response.data;
	});
});
