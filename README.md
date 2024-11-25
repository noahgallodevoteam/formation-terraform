# Formation Terraform - Démo CI/CD

Bienvenue dans le dépôt de démonstration pour la **formation Terraform** ! 🚀

Ce dépôt est utilisé pour illustrer les concepts fondamentaux de Terraform, notamment :
- **Gestion des états à distance** avec un backend Azure.
- **Pipeline CI/CD** utilisant **GitHub Actions** pour l'intégration et le déploiement continu.

## Structure du Dépôt

- **`main.tf`** : Contient une infrastructure simple pour démonstration.
- **`variables.tf`** : Définit les variables nécessaires pour le déploiement.
- **`backend.tf`** : Configure le backend distant pour stocker le fichier `terraform.tfstate` dans Azure Storage.
- **`.github/workflows/terraform-pipeline.yml`** : Pipeline GitHub Actions pour exécuter les étapes Terraform (init, plan, et apply) avec une validation manuelle.

## Fonctionnalités Principales

1. **Backend distant** :
   - L'état Terraform est stocké dans Azure Storage pour permettre un travail collaboratif.

2. **Pipeline GitHub Actions** :
   - Déclenché sur les commits dans la branche `DEV`.
   - Étapes incluses :
     - **Terraform Init** : Initialisation du projet Terraform.
     - **Terraform Plan** : Génération d’un plan des changements.
     - **Validation manuelle** : Pause avant l’application des modifications pour approbation.
     - **Terraform Apply** : Application des changements après approbation.

3. **Authentification Sécurisée** :
   - Les identifiants du service principal Azure sont stockés dans les **secrets GitHub**.

## Configuration Préalable

1. **Configurer Azure** :
   - Créez un compte de stockage Azure et un conteneur pour le backend distant :
     ```bash
     az group create --name rg-formation-terraform --location westeurope
     az storage account create --name saformationterraform2024 --resource-group rg-formation-terraform --location westeurope --sku Standard_LRS
     az storage container create --account-name saformationterraform2024 --name formation-tfstate
     ```

2. **Configurer les Secrets GitHub** :
   - Ajoutez les secrets nécessaires dans votre dépôt GitHub :
     - `AZURE_CREDENTIALS` : Informations d'identification JSON pour le service principal Azure.
     - `ARM_CLIENT_ID`, `ARM_CLIENT_SECRET`, `ARM_SUBSCRIPTION_ID`, `ARM_TENANT_ID` : Identifiants pour Terraform.

## Utilisation

1. **Travailler avec Terraform localement** :
   - Initialisez Terraform avec le backend distant :
     ```bash
     terraform init
     ```
   - Appliquez l’infrastructure :
     ```bash
     terraform apply
     ```

2. **Utiliser le Pipeline GitHub Actions** :
   - Poussez vos changements dans la branche `DEV` :
     ```bash
     git push origin DEV
     ```
   - Accédez à l’onglet **Actions** dans GitHub pour surveiller le pipeline.
   - Approuvez manuellement les modifications avant leur application.

---

Amusez-vous bien et découvrez les bonnes pratiques avec Terraform et GitHub Actions ! 🎉
