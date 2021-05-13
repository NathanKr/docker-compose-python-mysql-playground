<h2>Motivation</h2>
Experiment with two docker containers application using docker compose : one container is python app and the other is MySQL


<h2>Functionality</h2>
<ul>
<li>The database is db1 and it has an employees table with two rows - this is created with sql script install_db.sql upon image creating</li>
<li>the python app wait for the connection to the database and then list rows of table employees</li>
</ul>


<h2>Setup</h2>
<ul>
<li><a href='https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker'>The vscode Docker extension </a> is used to bootstrap\scafolded docker project using F1 Docker:Add Docker Files to workspace , choose app.py , application platform as python general and click yes to enable debugging</li>
<li>use on project root docker-compose up -d to create the images and run the containers</li>
<li>to test a code change use on project root :  docker-compose down followed by docker-compose build</li>
</ul>


<h2>Tools</h2>
<ul>
<li>vscode</li>
<li><a href='https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker'>The vscode Docker extension </a> is used to bootstrap\scafolded docker project but can be used also to handle containers and images</li>
<li>to view that the db\tables\rows are created i have used <a href='https://marketplace.visualstudio.com/items?itemName=cweijan.vscode-mysql-client2'>cool database client vscode extension</a> which can access according to its docs few types of databases </li>
<li>to view images\containers i have used <a href='https://hub.docker.com/editions/community/docker-ce-desktop-windows'>Docker Desktop for Windows</a> this is part of docker</li>
</ul>

<h2>Points of interest</h2>
<ul>
    <li>i was not able to set the name of the container using container_name. i saw that the container name in this case is a concatenation of the project root directory name : docker-compose-python-mysql-playground , the service name and running index. thus the container of service dc_app_image has name docker-compose-python-mysql-playground_dc_app_service_1 and the container of dc_db_service has name docker-compose-python-mysql-playground_dc_db_service_1</li>
    <li>in general you use localhost in the DB client when you have a local DB and even if you have local db container which is accessed localy by a pc host. however in this case we have a python container which access MySQL container and in a container to container case you use the DB container name : docker-compose-python-mysql-playground_dc_db_service_1 as host name(check app.py)</li>  
    <li>the script ./database/install_db.sql is copy to the container's /docker-entrypoint-initdb.d and is invoked once when the image is created . this is done using volumes: in docker-compose.yml. actually , ANY sql script in ./database will be executed which is very elegant way to create the database !!!</li>
    <li>Dockerfile was created on bootstrap\scafolded docker project and it handles the creation of the python image and container. This was very helpful</li>
    <li>docker-compose.yml was created on bootstrap\scafolded docker project but i have made few changes there , all related to the DB service</li>
    <li>the python app access MySQL DB thus order is important. MySQL DB should be invoked before the app and this is done using depends_on: but it is not enough. the app needs to wait for the DB to be ready. the <a href='https://github.com/eficode/wait-for'>following repo</a> can help on this <a href='https://www.youtube.com/watch?v=xXXM7av2W_g'>check here 21:14</a>but according to docker documentation it is better to implement this in code so i have a loop in app.py waiting for the DB to be ready</li>
</ul>

<h2>Open issues</h2>
<ul>
    <li>following the bootstrap\scafolded docker project a docker-compose.yml and docker-compose.debug.yml is created. later i have changed docker-compose.yml and did not know what to do with it so i have remarked it ---> question is what to do with docker-compose.debug.yml when docker-compose.yml is changed</li>
</ul>

<h2>production todo</h2>
<ul>
    <li>use regular user instead of root when accessing the DB in app.py</li>
    <li>move user , password , db name (check e.g. in app.py) .... to config file </li>
</ul>


