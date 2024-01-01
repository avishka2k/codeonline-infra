#!/bin/bash -xe

PASSWORD_RAND=$(echo $RANDOM | md5sum | head -c 20;)

# introducing sleep so network interfaces and routes can get ready before fetching software
sleep 10
# install software
sudo apt-get update -y
sudo apt-get install -y openjdk-11-jdk
sudo apt-get install -y nodejs
sudo apt-get install -y npm
sudo wget https://github.com/coder/code-server/releases/download/v4.2.0/code-server-4.2.0-linux-amd64.tar.gz
sudo tar -xvzf code-server-4.2.0-linux-amd64.tar.gz
sudo cp -r code-server-4.2.0-linux-amd64 /usr/lib/code-server
sudo ln -s /usr/lib/code-server/bin/code-server /usr/bin/code-server
sudo echo "[Unit]" > /lib/systemd/system/code-server.service
sudo echo "Description=code-server" >> /lib/systemd/system/code-server.service
sudo echo "After=nginx.service" >> /lib/systemd/system/code-server.service
sudo echo "[Service]" >> /lib/systemd/system/code-server.service
sudo echo "Type=simple" >> /lib/systemd/system/code-server.service
sudo echo "Environment=PASSWORD=$PASSWORD_RAND" >> /lib/systemd/system/code-server.service
sudo echo "ExecStart=/usr/bin/code-server --bind-addr 0.0.0.0:80 --auth password" >> /lib/systemd/system/code-server.service
sudo echo "Restart=always" >> /lib/systemd/system/code-server.service
sudo echo "[Install]" >> /lib/systemd/system/code-server.service
sudo echo "WantedBy=multi-user.target" >> /lib/systemd/system/code-server.service
sudo systemctl daemon-reload
sudo systemctl start code-server
sudo systemctl enable code-server
sudo systemctl status code-server
# install plugins
sudo code-server --install-extension esbenp.prettier-vscode
sudo code-server --install-extension redhat.vscode-yaml
sudo code-server --install-extension ms-python.python
sudo code-server --install-extension redhat.java
sudo code-server --install-extension Betajob.modulestf
sudo code-server --install-extension redhat.vscode-xml
sudo code-server --install-extension hediet.vscode-drawio-insiders-build
sudo code-server --install-extension richardwillis.vscode-gradle
sudo code-server --install-extension vscjava.vscode-java-pack
sudo code-server --install-extension vscjava.vscode-maven
sudo code-server --install-extension pivotal.vscode-spring-boot
sudo code-server --install-extension pivotal.vscode-boot-dev-pack
sudo code-server --install-extension vscjava.vscode-spring-initializr
sudo code-server --install-extension vscjava.vscode-spring-boot-dashboard