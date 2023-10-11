# Script d'Extraction des Données PRTG

## Description

Ce script PowerShell est conçu pour extraire des données des capteurs à partir d'un serveur PRTG et les exporter dans un fichier CSV. Il récupère des informations spécifiques sur les appareils et les capteurs, les organise dans un format structuré, et les exporte dans un fichier CSV avec un encodage UTF-8 pour une utilisation et une analyse ultérieures.

## Comment l'utiliser

Pour utiliser ce script :

1. Assurez-vous d'avoir accès au serveur PRTG avec les identifiants nécessaires.
2. Ouvrez votre éditeur PowerShell ou tout autre éditeur de texte et copiez-y le script.
3. Modifiez les variables `$PRTGServer`, `$UserName` et `$Passhash` avec vos propres informations d'identification et détails du serveur.
4. Sauvegardez et exécutez le script.

Le fichier CSV généré sera sauvegardé dans le chemin spécifié dans la variable `$OutputFile`.

## Paramètres

- **$PRTGServer** : URL du serveur PRTG auquel accéder pour récupérer les données des capteurs.
- **$UserName** : Nom d'utilisateur pour s'authentifier sur le serveur PRTG.
- **$Passhash** : Hash de mot de passe pour l'authentification sur le serveur PRTG.
- **$OutputFile** : Chemin du fichier où les données extraites seront exportées.

## Exemple de Sortie

Lorsque le script est exécuté avec succès, il affiche des messages indiquant le début de l'extraction des données, la progression et le succès de l'extraction. Par exemple :

```Début de l'extraction des données de PRTG...
Extraction des données pour l'appareil 1...
Extraction des données pour l'appareil 2...
Les données ont été exportées avec succès vers le chemin spécifié.
```


En cas d'erreur, un message d'erreur détaillé sera affiché pour faciliter le dépannage.

## Notes Importantes

Ce script doit être testé dans un environnement de développement ou de test avant d'être déployé dans un environnement de production. Assurez-vous de comprendre pleinement ce que fait le script et d'avoir pris les mesures nécessaires pour éviter tout impact indésirable sur votre environnement PRTG et les données associées.
