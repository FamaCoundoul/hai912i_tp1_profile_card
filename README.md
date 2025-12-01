# Exercice 1 : Application de Carte de Profil (Profile Card)

## Objectif de l'Exercice

Le but de cet exercice est de concevoir et d'implémenter un widget ProfileHomepage en utilisant le framework Flutter. Ce widget sert à afficher les informations essentielles du profil d'une personne dans un format visuellement attrayant et structuré.

L'objectif principal est de maîtriser l'utilisation des widgets de mise en page fondamentaux pour créer des interfaces utilisateur composées et responsives.

## Structure et Composants Clés

L'application est structurée autour d'un widget principal qui regroupe deux parties distinctes et superposées.

- Le Widget Principal (ProfileHomepage)

Ce widget est un StatelessWidget qui définit la structure globale de la page (Scaffold avec AppBar et body).

Le corps (body) utilise un Stack pour permettre la superposition de l'avatar sur la carte de profil.

- La Carte d'Information (_buildProfileCard)

Rôle : Contenir les informations textuelles du profil (nom, email, réseau social).

Widget utilisé : Card pour une élévation visuelle.

Mise en page interne : Un Column est utilisé pour disposer les éléments verticalement.

Responsivité : La largeur de la carte est limitée à une taille maximale (400) ou à 90% de la largeur de l'écran pour s'adapter aux différents appareils.

- L'Avatar du Profil (_buildAvatar)

Rôle : Afficher la photo de profil avec une bordure et un effet visuel.

Widgets utilisés : CircleAvatar est l'outil idiomatique de Flutter pour afficher des images circulaires. Il est enveloppé dans un Container pour gérer les ombres (boxShadow) et les dimensions.

Positionnement : Le widget est positionné en haut de la Stack pour chevaucher légèrement la carte d'information, créant l'effet visuel désiré.

## Détails Techniques et Bonnes Pratiques

- Thématisation : L'application utilise des constantes pour les couleurs (primaryColor en rose vif, couleur en blanc) afin de faciliter la modification du thème.

- Clarté du Code : La logique de construction de la carte et de l'avatar est séparée dans des méthodes privées (_buildProfileCard, _buildAvatar), améliorant la lisibilité du code.

- Icônes et Texte : La méthode _buildDetailRow illustre l'alignement d'une icône (Icons.email, FontAwesomeIcons.twitter) et du texte correspondant pour une présentation claire des coordonnées. Avec la dépendance font_awesome_flutter: '>= 4.7.0' ajouter dans pubspec.yaml

- Données : Les informations de profil sont définies comme des constantes statiques en haut de la classe pour un accès et une modification faciles.

## Exécution

Pour exécuter cette application, vous devez la placer dans un environnement Flutter, l'importer dans le fichier main.dart et l'utiliser comme widget principal (ou l'intégrer dans une route de navigation).

## Rendu de l'application
!(./rendu.png)
