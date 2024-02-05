Terraform apply --auto-approve

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 759386766154.dkr.ecr.us-east-1.amazonaws.com 

docker pull 759386766154.dkr.ecr.us-east-1.amazonaws.com/assignment1:v0.1

docker pull 759386766154.dkr.ecr.us-east-1.amazonaws.com/mysql:v0.1

docker network create -d bridge assignment1

docker run -d --name mysqldb -e MYSQL_ROOT_PASSWORD=pw --network=assignment1 759386766154.dkr.ecr.us-east-1.amazonaws.com/mysql:v0.1


export DBHOST=mysqldb

export DBPORT=3306

export DBUSER=root

export DATABASE=employees

export DBPWD=pw

export APP_COLOR=blue

docker run -d --name blue -p 8081:8080 --network=assignment1  -e DBHOST=$DBHOST -e DBPORT=$DBPORT -e  DBUSER=$DBUSER -e DBPWD=$DBPWD -e APP_COLOR=$APP_COLOR 759386766154.dkr.ecr.us-east-1.amazonaws.com/assignment1:v0.1 app.py

export APP_COLOR=pink

docker run -d --name pink -p 8082:8080 --network=assignment1  -e DBHOST=$DBHOST -e DBPORT=$DBPORT -e  DBUSER=$DBUSER -e DBPWD=$DBPWD -e APP_COLOR=$APP_COLOR  759386766154.dkr.ecr.us-east-1.amazonaws.com/assignment1:v0.1 app.py

export APP_COLOR=lime

docker run -d --name lime -p 8083:8080 --network=assignment1  -e DBHOST=$DBHOST -e DBPORT=$DBPORT -e  DBUSER=$DBUSER -e DBPWD=$DBPWD -e APP_COLOR=$APP_COLOR  759386766154.dkr.ecr.us-east-1.amazonaws.com/assignment1:v0.1 app.py

docker exec -it blue /bin/bash
apt install inetutils-ping -y
ping lime
ping pink

docker exec -it pink /bin/bash
apt install inetutils-ping -y
ping lime
ping blue

docker exec -it lime /bin/bash
apt install inetutils-ping -y
ping pink
ping blue

