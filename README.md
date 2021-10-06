# Projet-TATA

Procédure d'automatisation du déploiement et gestion  de conteneurs avec Docker Swarm au sein d’une infrastructure informatique



### Pré-réquis : 

 * connaissance moyenne en réseau IP
 * connaissance moyenne en administration système
 * Bonne connaissance en technologies DevSecOps
 * Bonne connaissance en Bash 
 * Bonne connaissance en ruby
 * connaissance moyenne en developpement d'applicaton


### Installation

 * Avoir une machine avec linux avec au moins 8 GO de RAM

#### Installation de virtualBox ou VMware 

##### Ubuntu 20.04


```
$ wget https://download.virtualbox.org/virtualbox/6.1.26/virtualbox-6.1_6.1.26-145957~Ubuntu~eoan_amd64.deb
$ sudo dpkg -i virtualbox-6.1_6.1.26-145957~Ubuntu~eoan_amd64.deb
```

Si vous avez des problèmes vous pouvez installer les packages suivants:

```
$ sudo apt install libgl1 libopus0 libqt5core5a libqt5gui5 libqt5gui5-gles libqt5opengl5 libqt5printsupport5 libqt5widgets5 libqt5x11extras5 libsdl1.2debian libvpx6 libxcursor1 libxt6 python3 

$ sudo apt --fix-broken install

$ sudo apt install gcc make perl
```

#### Installation de vagrant

##### Ubuntu 20.04

```
$ curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

$ sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

$ sudo apt-get update && sudo apt-get install vagrant
```

Si vous avez quelques problèmes essayez les commandes suivantes:

```
$ sudo apt install software-properties-common
```


#### Installation de ansible

```
$ sudo apt-get install -y python3 python3-pip sshpass

$ sudo -H pip3 install ansible
```

### cloner le depot pour continuer 

```
$ git clone git@github.com:PlacideRED/Projet-TATA.git
```


## EXECUTION DES COMMANDES

Après le clonage du git on exécute les commandes suivantes :

### Première étape:

 Ajouter le box des machines virtuelles de vagrant 
 
```
$ vagrant box add bento/ubuntu-20.04 --provider virtualbox
```


### Deuxième étape: 

Lancer Vagrant pour automatiser votre deploiement, il faut noter que Cette 
commande exécute le Vagrantfile , qui à son tour  installe Ansible et exécute les playbooks.

Tout cela prendra quelques minutes. Finalement, notre Docker Swarm Cluster sera configuré et prêt à être utilisé. 

```
$ cd swarm-vagrant-ansible

$ cd Vagrant

$ vagrant up

```

### Troisième étape:
Connexion au premier noeud maitre du cluster

```
$ vagrant ssh swarm-maitre-1

```

## Test Simulation du bon fonctionnement du Cluster


### Affichage des noeuds du cluster une fois dans la machine swarm-maitre-1

```

$ docker node ls

```


### Création des services 

```
$ docker service create --replicas 1 --name  <NOM SERVICE>  --publish 80:80 
```


### Afficher les différents services crés sur les machines 


```
$ docker service ls 

```

### Afficher les informations concernant un service

```
$ docker service ps  <NOM SERVICE>
```
 

### Démarrage des différents services 

```
$ docker service run
```
 
### Créer une panne en faisant tomber un noeud du cluster (a exécuter sur la machine à faire tomber )

``` 
 $ docker swarm leave
```

### Affichage des noeuds du cluster 
 
```
$ docker node ls
```

### Inspecter un nœud
 
```
docker node inspect <NOM NOEUD> 
```
 
### Supprimer un noeud 

```
 $ docker node rm 
```
