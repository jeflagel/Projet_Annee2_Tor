#Rapport Projet Deuxième Année #

## 1) Le reseau TOR
### a) Qu'est ce que c'est ?
    TOR est l'accronyme de The Onion Router.  Le réseau a été concu par la marine américaine dans le but de protéger les communications gouvernamentales pendant les opérations secrètes. Le département de la défence a financé le projet a plus de 60% tandis que les autres financements proviennent des organisations qui protègent la vie privée tel que des associations de journalistes, des groupes d'activistes ou l'EFF.  TOR est désormais une organisation a but non lucratif qui se concentre sur la protection des données personnelles et l'anonymat des internautes sur le web. C'est un projet open source, c'est a dire que tout le monde peut voir le code et le corriger si nécessaire.
    ![L'internet profond](http://static.papergeek.fr/2016/04/dark-web-deep-web.jpg)
    Le reseau TOR permet d'accéder au *"DEEP WEB"* ou l'internet profond. Comme cela est illustré dans la figure précédente, une partie du réseau internet est enfouie, inaccesible depuis les moteurs de recherche communs tels que GOOGLE, SAFARI... Le deep web correspond a tout ce qui n'est pas indexé par ces moteurs de recherche.  C'est biensur le repère de tout commerce illégal. Par exemple, en octobre 2013, Silk Road, site de traffic de drogue trouvable uniquement sur le deep web a été "trouvé" et fermé. C'est aussi le repère des organisations gouvernamentales ou des groupes d'activistes.

### b) Comment TOR garde l'anonymat?
    L'objectif de TOR est que l'utilisateur puisse utiliser internet tout en restant totalement anonyme. Pour cela, il faut que personne ne soit capable de retrouver la source de la demande ou la destination de l'information.
    Lorsque nous nous connectons à un site web, notre ordinateur essaie de se connecter directement à son serveur par la route la plus courte. Ce qui prime est la rapidité et l'efficacité. Notre adresse IP est donc ressencée comme point de départ de la communication et il n'y a aucun anonymat. Pour éviter cela, TOR rompt celle ligne entre notre ordinateur et ce serveur distant. TOR utilise l'Onion Routing qui est une technique de communication anonyme sur un réseau. Les messages sont cryptés en continu en passant de noeuds en noeuds. Ces noeuds sont aussi appelés routeurs Onions. Le terme onion se réfère aux différentes couches de chiffrement effectuées par des relais anonymes qui protègent les messages. Le routage devient alors totalement invisible.
    Si une personne A envoie une requête au serveur B, la requête va passer par plusieurs noeuds. Cette requête va d'abbord être chiffrer avec le clé publique du noeuds de sortie puis re-chiffrer par la clé publique de l'avant dernier noeud et ainsi de suite jusqu'au premier noeud auquel elle va être envoyé. Ce principe permet que le premier noeud connaisse seulement l'expéditeur mais pas la destination, les noeuds intermédiaires ne connaissent que le noeuds précédent et le suivant et le noeud de sortie ne connait que le destinataire.
    Tor utilise ce même chemin pendant plusieurs minutes puis le change pour qu'aucun lien ne puisse être établi.


### c) Quels sont les failles de TOR?



### d) Quels sont les intermédiaires?





## 2) Familiarisation avec les technologies #

### a)Markdown
      un language simple et léger basé sur un balisage moins lourd que celui utilisé pour html. Utilisé à la base pour écrire un document html il a été adapté et permet aujourd'hui via l'intermédiaire de Pandoc (décrit ci-dessous) de créer
      à partir d'un document .md une multitude de document tel que .doc , .odt...
      Ce language permet une grande facilité de lecture et d'écriture.

### b)Pandoc
      Un outil de conversion supportant un très grand nombre de formats.Dnas notre cas très utile car il supporte le format Markdown et contient de plus des éléments

### c) Vagrant
      Permet de créer une machine virtuelle avec tous les paramètres souhaités de manière très rapide. Ainsi notre environnement de travail est très rapidement disponible.Possibilité de récupérer les boxs sur internet facilement en choisissant sa distribution (nous avons choisi debian 7.2).
      On tape la commande :  vagrant init NomMachine LienBox
      Cela entraine la création d'un fichier vagrantfile
