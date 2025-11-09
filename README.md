# Azure environement deployment
## Description

Ce dépôt a pour objectif d'automatiser le déploiement d'environnements Azure à l'aide de Bicep. Il contient les modules, templates et fichiers de paramètres nécessaires pour provisionner des ressources (réseaux, groupes de ressources, services PaaS, etc.) de façon reproductible et paramétrable.

## Prérequis

- Compte Azure et permissions suffisantes pour créer les ressources (subscription / resource group).
- Azure CLI installé (az) — version recommandée récente.
- Bicep CLI (ou Azure CLI avec l'extension Bicep intégrée).
- Git pour gérer le dépôt.

## Structure recommandée du dépôt

- main.bicep — template d'entrée principal.
- modules/ — modules Bicep réutilisables (réseau, stockage, compute…).
- envs/
    - dev.parameters.json
    - prod.parameters.json
- scripts/ — scripts d'aide (validation, build, déploiement local).
- README.md — documentation (ce fichier).

## Déploiement (exemples)

1. Se connecter et sélectionner la subscription :
     - az login
     - az account set --subscription "<SUBSCRIPTION_ID>"

2. Valider / builder (optionnel) :
     - az bicep build --file ./main.bicep

3. Déployer dans un groupe de ressources :
     - az deployment group create \
         --resource-group <RESOURCE_GROUP> \
         --template-file ./main.bicep \
         --parameters @envs/dev.parameters.json

     Ou déployer au niveau subscription (pour RBAC, Policy, etc.) :
     - az deployment sub create \
         --location <LOCATION> \
         --template-file ./main.bicep \
         --parameters @envs/dev.parameters.json

## Bonnes pratiques

- Paramétrer tout ce qui change entre environnements (noms, tailles, emplacements) via des fichiers de paramètres.
- Isoler la logique réutilisable dans des modules Bicep.
- Ne pas stocker de secrets en clair : utiliser Azure Key Vault.
- Appliquer des tags standards à toutes les ressources (env, owner, cost-center).
- Valider et tester les templates localement avant déploiement.
- Automatiser via CI/CD (GitHub Actions / Azure Pipelines) pour les déploiements contrôlés et audités.

## CI/CD (conseil rapide)

- Utiliser une pipeline qui :
    - valide les fichiers Bicep (az bicep build / az deployment validate),
    - exécute des déploiements sur des environnements isolés (staging/dev),
    - utilise des identités gérées / service principals avec scopes minimaux.

## Support

Pour suggestions ou problèmes, créer une issue dans ce dépôt en précisant :
- description de l'erreur,
- commande lancée,
- fichier Bicep / paramètres utilisés.