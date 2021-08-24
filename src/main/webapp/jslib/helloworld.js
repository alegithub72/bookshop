/**
 * 
 */

var app=angular.module('ngHelloWorld', []);
app.controller('ngHelloWorldController', function($scope) {
  $scope.message = 'Ciao Angular by Alessio';
});
app.controller('myController',function($scope){
   $scope.message2='Ciao Alessio due controller'; 
    
});

app.controller('listGeneriCtrl', function($scope, $http) {
    $http.get("../service/ricercalistejson?webfunction=generi")
    .then(function(response) {
      $scope.listaGeneri = response.data;
    });
});    
    app.controller('listGeneriNoDBCtrl', function($scope) {
          $scope.listaGeneri = [
                                {id:1,tipologia:'Azione'},
                                {id:2,tipologia:'Thriller'},
                                {id:3,tipologia:'Rosa'},
                                ]
          $scope.menuShowGeneri=true;
          $scope.menuShowFunction= function(){
              $scope.menuShowGeneri=!$scope.menuShowGeneri;
              
          }
       });    


