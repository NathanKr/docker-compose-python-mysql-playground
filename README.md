<h2>Motivation</h2>
Experiment with two docker containers application using docker compose : one container is python app and the other is mysql


<h2>Setup</h2>
<ul>
<li>The vscode Docker extension <a href='https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker'>here</a> is used to create the python image via F1 Docker:Add Docker Files to workspace , choose application platform as python general</li>
<li>the image is created using : docker build -t my_python:1.0 .</li>
<li>run the image as container : docker container run -it image_id
</ul>


<h2>Points of interest</h2>
<ul>
    <li>can it be done without docker compose ???</li>
    <li>i have used <a href='https://www.youtube.com/watch?v=hP77Rua1E0c'>this</a> as reference to docker compose</li>
</ul>


