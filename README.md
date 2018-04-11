# MySQLVagrant
A Vagrant box that acts like a MySQL server

## Purpose
Replicating the separation of our RDBMS concerns on AWS within development

## Requirements
You need to have VirtualBox and Vagrant installed.

You'll also need the `disksize` plugin: 

```shell
vagrant plugin install vagrant-disksize
```

Everything else is inside the VM. 

## Installation
Standard for Vagrant. We just launch a VM using: ```vagrant up```, then ssh into the box: ```vagrant ssh```.

Any issue can probably be fixed with a quick ```vagrant provision```.

## Usage

```yaml
database_host: 127.0.0.1
database_user: root
database_password: password
```
