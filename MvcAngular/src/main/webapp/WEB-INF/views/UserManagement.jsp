<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>ANGULAR APPLICATION</title>

<script	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
<script src="<c:url value='/static/scripts/app.js' />"></script>
<script src="<c:url value='/static/scripts/services/user_service.js' />"></script>
<script	src="<c:url value='/static/scripts/controllers/user_controller.js' />"></script>

<style>
.username.ng-valid {
	background-color: lightgreen;
}

.username.ng-dirty.ng-invalid-required {
	background-color: red;
}

.username.ng-dirty.ng-invalid-minlength {
	background-color: yellow;
}

.email.ng-valid {
	background-color: lightgreen;
}

.email.ng-dirty.ng-invalid-required {
	background-color: red;
}

.email.ng-dirty.ng-invalid-email {
	background-color: yellow;
}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>


</head>
<body ng-app="app" class="ng-cloak">
<div class="generic-container" ng-controller="UserController as uCtrl">

    <div class="panel panel-default">

		<div class="panel-heading">
			<span class="lead">User Informations</span>
			</div>
			
			<form ng-submit="uCtrl.submit()" name="myForm" class="form-horizontal">			
			         <input type="hidden" ng-model="uCtrl.user.id" />
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="uname">Name</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="uCtrl.user.username" id="uname" class="username form-control input-sm" placeholder="Enter your name" />
                              </div>
                          </div>
                      </div>
                         			
			
			         <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="uemail">Email</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="uCtrl.user.email" id="uemail" class="username form-control input-sm" placeholder="Enter your E-mail" />
                              </div>
                          </div>
                      </div>
                      
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="uaddress">Adress</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="uCtrl.user.address" id="uaddress" class="username form-control input-sm" placeholder="Enter your Address" />
                              </div>
                          </div>
                      </div>
                      
			         <div class="row">
                          <div class="form-actions floatRight">
                              <input type="submit"  value="Save" class="btn btn-primary btn-sm" />
                              <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset</button>
                          </div>
                      </div>
			
			
			</form>
			
    </div>

	<div class="panel panel-default">

		<div class="panel-heading">
			<span class="lead">List of Users </span>
		</div>
		<div class="tablecontainer">
			<table class="table table-hover">
			
				<thead>
					<tr>
						<th>ID.</th>
						<th>Name</th>
						<th>Address</th>
						<th>Email</th>
						<th width="20%"></th>
					</tr>
				</thead>
				
				<tbody>
					<tr ng-repeat='u in uCtrl.users'>
					<td><span ng-bind="u.id"></span></td>
					<td><span ng-bind="u.username"></span></td>
					<td><span ng-bind="u.address"></span></td>
					<td><span ng-bind="u.email"></span></td>
					<td>  
					<button type="button" ng-click="uCtrl.remove(u.id)" class="btn btn-warning btn-sm">Delete</button> 
					<button type="button" ng-click="uCtrl.edit(u.id)" class="btn btn-success custom-width">Edit</button>  
                    </td>         
					</tr>
				</tbody>

			</table>
		</div>

	</div>

</body>
</html>