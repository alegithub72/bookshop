# Bookshop demo
Example of MVC EE (J2EE) application of a bookshop using Java back-end and React.js as front-end.

##### Prequisities

1. Install jdk 17  or above
2. Install Tomcat 8 
2. Install Maven 3.8.1 or above
3. Install Derby 10.15.2.0 

##### Bookshop application


1. Create bookshop database  
2. Run Database
3. Build web-application
4. Deploy and run web-application



##### Create bookshop database

Run ij Derby tool in the folder where you want to create the database , copy here *.sql files from project root and   launch this command :


```

CONNECT 'jdbc:derby:bookshop;create=true';
run 'bookshop.sql';
run 'insert_bookshop.sql';
commit;
exit

```

##### Run Database


In the folder where is created the database launch this command:

```
.\bin\startNetworkServer.bat

```

##### Build web-application

Run the following command :


```
mvn  clean compile war:war

```


##### Deploy and run web-application


Deploying the artifact bookshop.war in Tomcat 8 server and run it, test the application with this link.


[http://localhost:8080/bookshop/index.html](http://localhost:8080/bookshop/index.html) 




You could see the following pages:

<div style=" display: flex;flex-direction:row;">
<img src="https://user-images.githubusercontent.com/26597373/120810171-175b2380-c54b-11eb-9270-e2c016841749.PNG" width="250" height="200" style="margin: 0px 20px 0px 20px;" />





<img src="https://user-images.githubusercontent.com/26597373/120810408-4ec9d000-c54b-11eb-812f-fd615ffbbdf3.PNG" width="250" height="250" style="margin: 0px 20px 0px 20px;" />



</div>

# React application

##### Prerequisities 

1. Install npm

##### Build application

Use react-js folder to  play with react , after launch the build:

```
cd react-js
npm run build

```

When updated deploy the project web-application again on the server.



