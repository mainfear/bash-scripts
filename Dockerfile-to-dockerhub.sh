#!/bin/bash

echo "Приветствую, введите название образав формате user/name:"
read IMAGE_NAME

echo "введите тэг:"
read TAG

echo "Идет сборка образа..."
docker build -t $IMAGE_NAME:$TAG .

if [ $? -ne 0 ]; then
        echo "Ошибка, Сборка образа завершилась с ошибкой"
        exit 1
fi

#echo "Аутентификация Docker Hub"
#echo "Введите логин:"
#read DOCKER_LOGIN
#echo "Введите пароль:"
#read -s DOCKER_PASSWORD
#docker login -u $DOCKER_LOGIN -p $DOCKER_PASSWORD

if [ $? -ne 0 ]; then
        echo "Ошибка, аутентификация не прошла"
        exit 1
fi

echo "Загрузка образа в Docker Hub"
docker push $IMAGE_NAME:$TAG

if [ $? -ne 0 ]; then
        echo "Загрузка образа завершилась с ошибкой"
        exit 1
else
        echo "Загрузка образа завершилась УДАЧНО!!!"
fi
