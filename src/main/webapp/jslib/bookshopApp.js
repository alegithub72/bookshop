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
  $rootScope.errorDialogHide = true;
  $rootScope.errorMessage = "Errore generico!!";

});

app.component('generalMenu',{
  templateUrl:'../template/generalMenu.jsp',
  controller:function (){

  this.generiMenuHide=true;
  this.bestSellMenuHide=true;
  this.adminMenuHide=true;

  this.menuShowBestSellerFunction = function () {
    this.generiMenuHide = true;
    this.adminMenuHide=true;
    this.bestSellMenuHide = !this.bestSellMenuHide;

    };
    this.menuShowGeneriFunction = function () {
      this.adminMenuHide = true;
      this.bestSellMenuHide =true;
     this.generiMenuHide=!this.generiMenuHide;
     

    };
  this.showAdminMenu= function (){
    this.generiMenuHide = true;
    this.bestSellMenuHide=true;
    this.adminMenuHide=!this.adminMenuHide;

  };
  }

});
app.component('generiMenu', {
templateUrl: "../template/generiMenu.html",
transclude:true,
  require: {
    generalCtrl: '^generalMenu'
  },
controller : function ($rootScope, $http) {



    $http.get("../service/ricercalistejson?webfunction=generi")
      .then(function (response) {
        this.listaGeneri = response.data;
        console.log(response.data);
      }, function (response) {
        console.log("response status " + response.status);
        $rootScope.errorDialogHide = false;
        $rootScope.errorMessage = "Errore ineterno del server!!";

      });      




  }
});

app.component('bestMenu',{
  templateUrl:"../template/bestMenu.html",
  controller:function () {
  this.bestItems=[
    {link:'#',name:'Piu Venduti'},
    {link:'#',name:'Tascabili'},
     {link:'#',name:'Economici'},
     {link:'#',name:'Classici'},

  ];

  }
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
controller:function adminMenuController(){
  this.adminItems=[
    {link:'../admin/addbook',name:'Aggiugi Libro'},
    {link:'../admin/default',name:'Aggiungi Editore'},
     {link:'../admin/default',name:'Aggiungi Autore'},
     {link:'../admin/default',name:'Aggiungi Genere'},

  ];




}

})

 