# Ansible (automated docker build)
Automated simple and small Ansible build on latest Alpine Linux base image.

Docker Hub: [4nxio/ansible][1]

## Usage
You should changed your directory to your Ansible files (e.g. ~/ansible) and then run:
```
docker run -it -v $(pwd):/etc/ansible --rm=true biotecs/ansible ansible --help

```
It is recommended to use ansible specific SSH keys. So create and add them ssh-agent to be able to use encrypted private keys: 
```
mkdir -p /home/foo/ansible/keys
ssh-keygen -t ed25519
Generating public/private ed25519 key pair.
Enter file in which to save the key (/home/foo/.ssh/id_ed25519): /home/foo/ansible/keys
The key fingerprint is:
SHA256:Bhh1IfDWIin4PNLiEcWHtcvrSb05EXdY1MVn4yMokcE foo@bar
The key's randomart image is:
+--[ED25519 256]--+
|  ..=+o +o+.. o. |
| ..o *.+ E . . oo|
|... =.= . + . ..o|
| +...o.+ + o . o |
|o.=  o  S o   . .|
|.o..  oo         |
| .   o ..        |
|    o ..o        |
|     o o.        |
+----[SHA256]-----+
```
To be able to use the encrypted key you need to use ssh-agent:
```
ssh-add /home/foo/ansible/keys/ansible_key
Enter passphrase for /home/foo/ansible/keys/ansible_key: 
Identity added: /home/foo/ansible/keys/ansible_key (foo@bar)
```
Use the ssh-agent auth socket file and forward it to the docker image start:
```
docker run -it -v $SSH_AUTH_SOCK:/tmp/ssh.sck -e SSH_AUTH_SOCK=/tmp/ssh.sck -v /home/foo/ansible:/etc/ansible --rm=true biotecs/ansible ansible localhost -m ping
```

## License
MIT License

Click on the [Link](LICENSE) to see the full text.

[1]: https://hub.docker.com/r/4nxio/ansible-docker/
