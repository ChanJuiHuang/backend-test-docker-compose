以ubuntu為例，執行專案

```
# 切換root權限
sudo su
cd ~
git clone https://github.com/ChanJuiHuang/backend-test.git
git clone https://github.com/ChanJuiHuang/backend-test-docker-compose.git


# 確認80, 3306, 6379 port沒被佔用後，執行以下指令
cd ~/backend-test-docker-compose
./docker-compose-install.sh
source docker-compose-env.sh
docker-compose up -d


docker exec -it $(docker ps | grep fpm | cut -d ' ' -f 1) cp .env.example .env
docker exec -it $(docker ps | grep fpm | cut -d ' ' -f 1) composer install
docker exec -it $(docker ps | grep fpm | cut -d ' ' -f 1) php artisan key:generate
docker exec -it $(docker ps | grep fpm | cut -d ' ' -f 1) php artisan migrate --seed
docker exec -it $(docker ps | grep fpm | cut -d ' ' -f 1) openssl genrsa -out /var/www/application-service/jwt_private.pem 2048
docker exec -it $(docker ps | grep fpm | cut -d ' ' -f 1) openssl rsa -in /var/www/application-service/jwt_private.pem -outform PEM -pubout -out /var/www/application-service/jwt_public.pem
chown 1000:1000 -R ~/backend-test


# 專案測試完畢後，執行以下指令
cd ~/backend-test-docker-compose
docker-compose down
./docker-compose-clean.sh
```

