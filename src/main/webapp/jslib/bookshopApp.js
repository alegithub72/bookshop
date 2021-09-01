/**
 * Bookshop AngulaJS app 
 */

var app = angular.module('bookShop', []);
app.controller('ngHelloWorldController', function ($scope) {
  $scope.message = 'Ciao AngularJS by Alessio';
});
app.controller('myController', function ($scope) {
  $scope.message2 = 'Ciao Alessio due controller';

});
app.run(function ($rootScope) {
  $rootScope.menuShowGeneri = true;
  $rootScope.showBestSeller = true;
  $rootScope.adminMenuHide = true;
  $rootScope.errorDialogHide = true;

  $rootScope.errorMessage = "Errore generico!!";

});
app.controller('listGeneriCtrl', function ($scope, $rootScope, $http) {
  $http.get("../service/ricercalistejson?webfunction=generi")
    .then(function (response) {
      $scope.listaGeneri = response.data;
    }, function (response) {
      console.log("response status " + response.status);
      $rootScope.errorDialogHide = false;
      $rootScope.errorMessage = "Errore ineterno del server!!";

    });
  $scope.menuShowGeneriFunction = function () {
    $rootScope.showBestSeller = true;
     $rootScope.adminMenuHide=true;
    $rootScope.menuShowGeneri = !$rootScope.menuShowGeneri;

  };
});

app.controller('listBestSellerCtrl', function ($scope, $rootScope) {

  $scope.menuShowBestSellerFunction = function () {
    $rootScope.menuShowGeneri = true;
    $rootScope.adminMenuHide=true;
    $rootScope.showBestSeller = !$rootScope.showBestSeller;

  };
});
app.controller('openloginCtrl', function ($scope, $rootScope) {
  $rootScope.loginModalHide = true;
  $scope.openLoginDialog = function () {
    $rootScope.loginModalHide = false;
    console.log("open dialog!!");
  }
});
app.controller('loginCtrl', function ($scope, $rootScope,$http) {
  $scope.closeLoginDialog = function () {
    $rootScope.loginModalHide = true;
    console.log("close dialog!!");
  };
  $scope.login = function () {
    console.log("login with=(" + $scope.userid + "," + $scope.pswd + ")");
  $http({
    method : "POST",
      url : "../service/loginuser",
      params: {userid : $scope.userid, password : $scope.pswd}
  }).then(function mySuccess(response) {
    $rootScope.loginModalHide = true;
    console.log("login sucess="+response.data);
    if(response.data.profile.id>200) location.reload(true);
    if(response.data.errore===true){
       
       $rootScope.errorDialogHide = false;
       $rootScope.errorMessage = response.data.msg;
    }
  }, function myError(response) {
    $rootScope.loginModalHide = true;
     $rootScope.errorDialogHide = false;
     $rootScope.errorMessage = "User not autentihcated!!!";
  });    

  }
});
app.controller('listRicercaLibriCtrl', function ($scope, $http) {

  $scope.init = function (id) {
    $scope.genereID = id;
    console.log("funciotn id===" + id);
    $http.get("../service/ricercalistejson?webfunction=ricercaPergenere&genere=" + id + "&startRow=1&ricercaPage=4")
      .then(function (response) {
        $scope.listaLibri = response.data;
      }, function (response) {
        console.log("resposnse status" + response.status);
      });
  };

});    

//un casino per gestre il layout....
app.component('adminMenu',{
templateUrl:'../template/adminMenu.html',				
controller:function adminMenuController($rootScope){
  this.adminItems=[
    {link:'../admin/addbook',name:'Aggiugi Libro'},
    {link:'../admin/default',name:'Aggiungi Editore'},
     {link:'../admin/default',name:'Aggiungi Autore'},
     {link:'../admin/default',name:'Aggiungi Genere'},

  ];
   this.adminMenuHide=true;
  this.showAdminMenu= function showAdminMenu(){
    $rootScope.menuShowGeneri = true;
    $rootScope.showBestSeller=true;
    this.adminMenuHide=!this.adminMenuHide;
  };
}

})

 