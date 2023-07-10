# recipe-app-api
Recipe API project by Udemy

server {
    listen ${LISTEN_PORT};  # port de listen toi service /app

    location /static {
        alias /vol/static;  # bat cu url nao start bang /static se duoc alias bang /vol/static (vol chua staic & media files)
    }

    location / {  #  url khong start bang /static
        uwsgi_pass              ${APP_HOST}:{APP_PORT};  #  wsgi server su dung host:port
        include                 /etc/nginx/uwsgi_params;  #  uwsgi params la cac params yeu cau cho http request de process
        client_max_body_size    10M;  #  max body request (max size cua image co the upload)
    }
}

# Amazon EC2
Tao EC2 instance, launch instance
- Gen key tu local machine sau do add vao EC2:
```bash
cd ~/.ssh/
ssh-keygen -t rsa -b 4096 # 4096 bits, ten file aws_id_rsa
cat aws_id_rsa.pub # copy, paste len key pair cua EC2

# lenh ssh vao EC2
ssh ec2-user@[ip]
```
- Tao ket noi EC2 voi Github project:
```bash
# sau khi ssh
ssh-keygen -t ed25519 -b 4096
cat ~/.ssh/id_ed25519.pub # copy, paste vao deploy key tren github (deploy: chi pull, khong push)
```
- Cai cac dependencies len EC2
```bash
# Cai git
sudo yum install git -y
# Cai docker
sudo yum install docker -y
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo usermod -aG docker ec2-user # cap quyen cho user ec2-user quyen docker root
# Cai docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```