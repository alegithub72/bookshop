# Bookshop demo
Example of MVC EE application of a bookshop using Java,  React.js!

#####Prequisities

1. Install jdk 17  or above
2. Install Tomcat 8 
2. Install Maven apache-maven-3.8.1 or above
3. Install Derby 10.15.2.0 
4. Create bookshop database  


##### Run Database


................


##### Run application

Run the following command :


```
mvn  clean compile war:war

```



Deploying the artifact bookshop.war in Tomcat 8 server, test the application with this link.


[http://localhost:8080/bookshop/index.html](http://localhost:8080/bookshop/index.html) 


Some screenshot:

<div style=" display: flex;flex-direction:row;">
<img src="https://user-images.githubusercontent.com/26597373/120810171-175b2380-c54b-11eb-9270-e2c016841749.PNG" width="250" height="200" style="margin: 0px 20px 0px 20px;" />





<img src="https://user-images.githubusercontent.com/26597373/120810408-4ec9d000-c54b-11eb-812f-fd615ffbbdf3.PNG" width="250" height="250" style="margin: 0px 20px 0px 20px;" />



</div>

#React application

#####Prerequisities 
1. Install npm

#####Build application

Use react-js folder to  modify react and run this command:

```
cd react-js
npm run build

```

When updated the project deploy again webapp artifact.



