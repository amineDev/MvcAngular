'use strict';

angular.module('app').factory('UserService',['$http','$q', function($http,$q){

	var REST_SERVICE_URI = "http://localhost:8080/MvcAngular/api/user/";

	var factory = {
			fetchAllUsers: fetchAllUsers,
			createUser: createUser,
			updateUser:updateUser,
			deleteUser:deleteUser
	};


	return factory;


	function fetchAllUsers(){

		var deferred = $q.defer();

		$http.get(REST_SERVICE_URI).then(

				function(response){
                 deferred.resolve(response.data);
				},
				function(errResponse){
                 console.error('error while fetching data');
                 deferred.reject(errResponse);

				}
		);

		return deferred.promise;
		
	}
	
	
	function createUser(user){
		
		var deferred = $q.defer();
		
		$http.post(REST_SERVICE_URI,user).then(
				
				function (response){
					deferred.resolve(response.data);
				},
		        function (errResponse){
					console.error('error while trynig to create user');
					deferred.reject(errResponse);
				}
		
		);
				
		return deferred.promise;
	}
	
	
	
	function updateUser(user,id){
		
		var deferred = $q.defer();
		
		$http.put(REST_SERVICE_URI+id, user).then(
				
		  function(response){
			  deferred.resolve(response.data);
		  }, 
		  function(errResponse){
			  console.error("error while trying to update user");
			  deferred.reject(errResponse);
			  
		  }
		
		);
					
		return deferred.promise;
		
	}
	
	
	function deleteUser(id){
		
		var deferred = $q.defer();
		
		$http.delete(REST_SERVICE_URI+id).then(
				
		  function(response){
			  deferred.resolve(response.data);
		  }, 
		  function(errResponse){
			  console.error("error while trying to delete user");
			  deferred.reject(errResponse);
			  
		  }
		
		);
					
		return deferred.promise;
		
		
	}
	

}]);
