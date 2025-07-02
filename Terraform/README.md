# Projet Terraform - Déploiement d'une infrastructure Azure

Ce projet permet de déployer automatiquement une infrastructure sur Microsoft Azure à l'aide de Terraform. Il s'agit d'un exemple simple pour illustrer l'utilisation de Terraform avec le provider Azure.

## 🛠️ Objectif du projet

- Utiliser Terraform pour automatiser le déploiement de ressources sur Azure.
- Faciliter la reproduction d'un environnement via l'infrastructure as code (IaC).
- Fournir un point d'entrée simple pour les utilisateurs souhaitant apprendre ou automatiser leur déploiement Azure.

## 📄 Fichiers principaux

- `provider.tf` : Contient la configuration du provider Azure (région, authentification, etc.).
- `main.tf` : Définit les ressources Azure à créer (groupe de ressources, machine virtuelle, réseau, etc.).

## 🚀 Lancer le projet

Voici les étapes à suivre pour utiliser ce projet :

### 1. Cloner ou copier le projet

```bash
git clone <url-du-projet>
cd <nom-du-dossier>
```

### 2. Se connecter à Azure

Avant de lancer Terraform, connectez-vous à votre compte Azure avec l’Azure CLI :

```bash
az login
```

### 3. Initialiser Terraform

Initialise le dossier de travail Terraform (télécharge les providers nécessaires) :

```bash
terraform init
```

### 4. Vérifier le plan d’exécution

Affiche les ressources qui seront créées ou modifiées :

```bash
terraform plan
```

### 5. Appliquer le déploiement

Déploie l’infrastructure sur Azure :

```bash
terraform apply
```

Confirmez avec `yes` lorsque Terraform vous le demande.

### 6. (Optionnel) Détruire l’infrastructure

Pour supprimer toutes les ressources créées :

```bash
terraform destroy
```

## 📝 Remarques

- Assurez-vous d'avoir les droits suffisants sur votre abonnement Azure.
- Ne stockez jamais vos identifiants ou secrets directement dans les fichiers `.tf`. (sauf si besoin pour les tests dans un milieu sécurisé)

---

**Auteur** : *Guillaume POULAIN*  
**Date** : *02/07/2025*
