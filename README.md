# Matrix Synapse backend server setup
This repository contains the Matrix Synapse backend server. Follow the instructions to set up the server.
If you encounter any issues or came up with fixes for a specific OS, let me know.

## Prerequisites:
- Git
- Ansible
- Docker
- Docker Compose


## Mac OS installation

- Install Homebrew if you don't have it:
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- Install the dependencies:
```
brew install ansible docker docker-compose
```

- Start Docker Desktop

## Ubuntu/Debian installation
```
sudo apt update
sudo apt install -y ansible docker.io docker-compose
sudo systemctl enable docker --now
sudo usermod -aG docker $USER
newgrp docker
```

## Windows installation
1. Install [Git for Windows](https://git-scm.com/download/win)
2. Install [Docker Desktop](https://www.docker.com/products/docker-desktop)
3. Enable [WSL2](https://learn.microsoft.com/en-us/windows/wsl/install)
4. Install Ansible inside WSL2:
```
sudo apt update
sudo apt install -y ansible
```

## Clone Repository
```
git clone git@github.com:Clockwork-SignalHub/Synapse-local.git
cd synapse-local
```

## Run ansible
```
ansible-playbook -i ansible/inventory.ini ansible/matrix_synapse.yml
```

## Verify backend setup
Verify the docker container with `docker compose ps`.

You should see synapse_db, synpase_server, synapse_nginx.
Test using `curl http://localhost:8008/_matrix/client/versions`

Go to [this link](https://app.element.io/) and use `http://localhost` as the homeserver.
Register a new user and test messaging by creating a new user.

