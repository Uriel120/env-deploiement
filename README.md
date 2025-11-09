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
