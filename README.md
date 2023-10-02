# Flutter game (en cours de développement)
Application de jeux contenant un seul jeu de tri de déchets pour le moment. 

### Fonctionnalités : 
- Jeu de tri de déchets

## Quelques écrans 

<p float="center">
  <img src="https://github.com/Thessalene/flutter_game/assets/42738178/3246bf37-13ca-43fb-81d1-c20bbffa0ea1" width="240" />
  <img src="https://github.com/Thessalene/flutter_game/assets/42738178/66dfe328-f54e-47c5-8f68-42a4837f2610" width="240" /> 
  <img src="https://github.com/Thessalene/flutter_game/assets/42738178/4ff6b925-1702-4408-892d-5bc907c53d8e" width="240" />
</p>

## Démo (not updated) 


https://github.com/Thessalene/flutter_game/assets/42738178/3c801e55-886b-46bc-ae04-1b47315bcb6d


## Architecture
L'architecture choisie est une sorte d'architecture modulaire par feature. 
- **Core** : Contient les éléments communs aux différents modules
- **Features** : Contient l'ensemble des features
  Chaque "feature" comprend les couches :
    - **Presentation** : Écrans liés à la feature
    - **Models** : Modèle de données
    - **Providers** : Nos controllers (providers avec Riverpod)
    - **Widgets** : Widgets spécifique à la feature

Ce choix me permettra par la suite de pouvoir réutiliser certain "module feature dans d'autres applications et de les tester individuellement.


### Stack technique 

- Flutter https://flutter.dev/
- Riverpod [riverpod.dev](https://riverpod.dev/fr/)
- go_router https://pub.dev/packages/go_router

## Branches 

- main : branche principale
- master : branche de release
- develop : Version comprenant le jeu de tri
