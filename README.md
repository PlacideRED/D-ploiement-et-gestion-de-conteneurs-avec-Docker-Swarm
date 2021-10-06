# Projet-TATA


++++++ +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+	Procédure d'automatisation du déploiement et gestion                         +
+	de conteneurs avec Docker Swarm au sein d’une infrastructure informatique    +
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


+++++Pré-réquis : 

-- connaissance moyenne en réseau IP

-- connaissance moyenne en administration système

-- Bonne connaissance en technologies DevSecOps

-- Bonne connaissance en Bash 

-- Bonne connaissance en ruby

-- connaissance moyenne en developpement d'applicaton


+++++Installation+++++++++++++++++++++

-- Avoir une machine avec linux avec au moins 8 GO de RAM

-- Installation de virtualBox ou VMware 
https://www.informatiweb.net/tutoriels/informatique/virtualisation/virtualbox-installation-sous-linux.html

-- Installation de vagrant
https://linuxize.com/post/how-to-install-vagrant-on-ubuntu-18-04/

-- Installation de ansible

$ sudo apt-get install -y python-pip sshpass

$ sudo -H pip install --upgrade pip

$ sudo -H pip install ansible

-- cloner le depot pour continuer 

++ Vagrant 
 -- VagrantFile 
Fichier dans lequel est renseigné toutes les configurations des machines et outils à installer 
pour bien mettre en place et faire fonctionner notre environnement virtuel

-- ansible.sh 
Fichier utile pour la mise à jour système de vagrant et ansible 


++ les playbooks de Ansible 
cluster.yml code pour initialiser le cluster de façon automatique 

++ master.yml fichier contenant le code pour le choix de la machine maitre de façon automatique

++ join.yml code pour intégré le cluster 

++ hosts.yml nos quatres machines virtuelles 

++ vars.yml les différents logiciels utilitaires à utiliser dans nos machines virtuellles 

++++++ReadMe
Fichier conteant les différents informations sur les fichiers
 

++++++++++++EXECUTION DES COMMANDES++++++++++++++

Après le clonage du git on exécute les commandes suivantes :

Première étape:

 Ajouter le box des machines virtuelles de vagrant 
 
 
$ vagrant box add bento/ubuntu-20.04 --provider virtualbox



Deuxième étape: 
Lancer Vagrant pour automatiser votre deploiement, il faut noter que Cette 
commande exécute le Vagrantfile , qui à son tour  installe Ansible et exécute les playbooks.

Tout cela prendra quelques minutes. Finalement, notre Docker Swarm Cluster sera configuré et prêt à être utilisé. 


$ cd swarm-vagrant-ansible

$ cd Vagrant

$ vagrant up

Troisième étape:
Connexion au premier noeud maitre du cluster


$ vagrant ssh swarm-maitre-1



+++++++++++++++++++++ Test Simulation du bon fonctionnement du Cluster++++++++++++


+++Affichage des noeuds du cluster une fois dans la machine swarm-maitre-1

$ docker node ls

++++Création des services 

$ docker service create --replicas 1 --name  <NOM SERVICE>  --publish 80:80 


++++Afficher les différents services crés sur les machines 

$ docker service ls 

+++Afficher les informations concernant un service

$ docker service ps  <NOM SERVICE>
 
++++Démarrage des différents services 

$ docker service run
 
+++Créer une panne en faisant tomber un noeud du cluster (a exécuter sur la machine à faire tomber )
 
 $ docker swarm leave
 
 +++Affichage des noeuds du cluster 
 
$ docker node ls

 +++Inspecter un nœud
 
docker node inspect <NOM NOEUD> 
 
 ++++Supprimer un noeud 
 
 $ docker node rm 
