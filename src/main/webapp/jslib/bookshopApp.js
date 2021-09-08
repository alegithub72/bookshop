/**
 * Bookshop AngulaJS app 
 */

var app = angular.module('bookShop', []);


app.component('helloWorld',{
  templateUrl:'../template/helloWorld.html',
  controller: function ($rootScope) {
  this.message = 'Ciao AngularJS by Alessio';
  var global=$rootScope;
  this.hideTestTest= function(){
        global.testHide =   !global.testHide ;
        console.log("hide:"+global.testHide);
    };
  }

});
app.component('helloWorld2',{
  templateUrl:'../template/helloWorld2.html',
  controller: function ($rootScope) {
  this.message = 'AngularJS by 2';
  var self=this;

  this.logTest= function(){
      console.log("hide:"+self.testHide);
 
    }
  }

});
app.filter('range', function() {
  return function(input, total) {
    total = parseInt(total);

    for (var i=0; i<total; i++) {
      input.push(i);
    }

    return input;
  };
});

app.run(['$rootScope',function ($rootScope) {
  $rootScope.bookCount=0;
  var global = $rootScope;
  $rootScope.incCountBook = function(){
    global.bookCount++;
  }
  $rootScope.errorDialogHide = true;
  $rootScope.errorMessage = "Errore generico!!";
  $rootScope.testHide = false;

}]);

app.component('generalMenu',{
  templateUrl:'../template/generalMenu.jsp',
  controller:['$rootScope',function ($rootScope){
    var global = $rootScope;
    var self = this;
    self.generiMenuHide = true;
    self.adminMenuHide=true;
    self.bestSellMenuHide = true;


  this.menuShowBestSellerFunction = function () {
    self.generiMenuHide = true;
    self.adminMenuHide=true;
    self.bestSellMenuHide = !self.bestSellMenuHide;

    };
  this.menuShowGeneriFunction = function () {
    self.adminMenuHide = true;
    self.bestSellMenuHide =true;
    self.generiMenuHide=!self.generiMenuHide;
     

    };
  this.showAdminMenu= function (){
    self.generiMenuHide = true;
    self.bestSellMenuHide=true;
    self.adminMenuHide=!self.adminMenuHide;

  };
  }]

});
app.component('generiMenu', {
templateUrl: "../template/generiMenu.html",
controller : function ( $rootScope,$http) {

    
    var self = this;
    $http.get("../service/ricercalistejson?webfunction=generi")
      .then(function (response) {
        self.listaGeneri= response.data;
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
app.controller('loginCtrl', function ($scope, $rootScope,$http) {
  var global=$rootScope;
  global.loginModalHide = true;
  $scope.openLoginDialog = function () {
    global.loginModalHide = false;
    console.log("open dialog!!");
  }
  $scope.login = function () {
    console.log("login with=(" + $scope.userid + "," + $scope.pswd + ")");
    $http({
      method : "POST",
        url : "../service/loginuser",
        params: {userid : $scope.userid, password : $scope.pswd}
    }).then(function mySuccess(response) {
      $rootScope.loginModalHide = true;
      console.log("login sucess="+response.data);

      if(response.data.errore===true){
        
        $rootScope.errorDialogHide = false;
        $rootScope.errorMessage = response.data.msg;
        
      }else
      if(response.data.profile.id>200) location.reload(true);
    }, function myError(response) {
      $rootScope.loginModalHide = true;
      $rootScope.errorDialogHide = false;
      $rootScope.errorMessage = "User not autentihcated!!!";
    });    

  }
  $scope.closeLoginDialog = function () {
    $rootScope.loginModalHide = true;
    console.log("close dialog!!");
  };
  
  $scope.logout = function () {
    console.log("login with=(" + $scope.userid + "," + $scope.pswd + ")");
    $http({
      method : "POST",
        url : "../service/logoutuser",
    }).then(function mySuccess(response) {
      $rootScope.loginModalHide = true;
      console.log("login sucess="+response.data);

      if(response.data.errore===true){
        
        $rootScope.errorDialogHide = false;
        $rootScope.errorMessage = response.data.msg;
      }
      location.reload(true);
    }, function myError(response) {
      $rootScope.loginModalHide = true;
      $rootScope.errorDialogHide = false;
      $rootScope.errorMessage = "User not autentihcated!!!";
    }); 


  }

});

app.controller('listRicercaLibriCtrl', function ($scope, $http) {
  $scope.page=0;
  $scope.pageSize=4;
  $scope.searchBook = function (id,pageParam) {
    $scope.genereID = id;
    $scope.page=$scope.page+pageParam;
    console.log("funciotn id===" + id);
    $http.get("../service/ricercalistejson?webfunction=ricercaPergenere&genere=" + id + "&startRow="+$scope.page+"&ricercaPage="+$scope.pageSize)
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

 