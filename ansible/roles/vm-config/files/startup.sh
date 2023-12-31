#!/bin/sh

PASSWORD_RAND=$(echo $RANDOM | md5sum | head -c 20;)

sudo apt-get update -y
sudo apt-get install nodejs
sudo apt-get install openjdk-17-jdk
mkdir vscode
cd vscode
wget https://github.com/coder/code-server/releases/download/v4.20.0/code-server-4.20.0-linux-amd64.tar.gz
tar -xvf code-server-4.20.0-linux-amd64.tar.gz
sudo cp -r code-server-4.20.0-linux-amd64 /usr/lib/code-server
sudo ln -s /usr/lib/code-server/bin/code-server /usr/bin/code-server
sudo cat > /lib/systemd/system/code-server.service <<EOF
[Unit]
Description=code-server
After=nginx.service
[Service]
Type=simple
Environment=PASSWORD=$PASSWORD_RAND
ExecStart=/usr/bin/code-server --bind-addr 0.0.0.0:80 --auth password
Restart=always
[Install]
WantedBy=multi-user.target
EOF
sudo systemctl daemon-reload
sudo systemctl start code-server
sudo systemctl enable code-server
sudo systemctl status code-server