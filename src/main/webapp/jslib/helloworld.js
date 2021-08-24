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
app.run(function($rootScope) {
    $rootScope.menuShowGeneri=true;
    $rootScope.showBestSeller=true;


  });
app.controller('listGeneriCtrl', function($scope,$rootScope, $http) {
    $http.get("../service/ricercalistejson?webfunction=generi")
    .then(function(response) {
      $scope.listaGeneri = response.data;
    });
    $scope.menuShowGeneriFunction= function() {
        $rootScope.showBestSeller=true;
        $rootScope.menuShowGeneri=!$rootScope.menuShowGeneri;
        
    };    
});    
    app.controller('listGeneriNoDBCtrl', function($scope,$rootScope) {
          $scope.listaGeneri = [
                                {id:1,tipologia:'Azione'},
                                {id:2,tipologia:'Thriller'},
                                {id:3,tipologia:'Rosa'},
                                ];

          $scope.menuShowGeneriFunction= function() {
              $rootScope.showBestSeller=true;
              $rootScope.menuShowGeneri=!$rootScope.menuShowGeneri;
              
          };
       });    
    app.controller('listBestSellerCtrl', function($scope,$rootScope) {

        $scope.menuShowBestSellerFunction= function() {
            $rootScope.menuShowGeneri=true;
            $rootScope.showBestSeller=!$rootScope.showBestSeller;
            
        };
     });    
    app.controller('loginCtrl', function($scope,$rootScope) {
        $rootScope.loginModalHide=true;
        
     });    

    app.controller('listRicercaLibriCtrl',function($scope,$http) {

	$scope.init = function(id){
			$scope.genereID=id;
			console.log("funciotn id==="+id);
        $http.get("../service/ricercalistejson?webfunction=ricercaPergenere&genere="+id+"&startRow=1&ricercaPage=4")
        .then(function(response) {
          $scope.listaLibri = response.data;
        });			
	};

//	console.log("genere id==="+$rootScope.genereID);
//        $http.get("../service/ricercalistejson?webfunction=ricercaPergenere&genere=5010&startRow=1&ricercaPage=4")
//        .then(function(response) {
//          $scope.listaLibri = response.data;
//        });
     });    


    app.controller('loginCtrl', function($scope,$rootScope) {
        $rootScope.loginModalHide=true;
        
     });    