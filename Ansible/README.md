# Projet Ansible - Installation automatisée de Python, Ansible et Podman

Ce projet utilise **Ansible** pour automatiser l'installation de **Python**, **Ansible** et **Podman** sur des machines Linux (Debian/Ubuntu ou RHEL/CentOS), via des **rôles** structurés.

## 📂 Structure du projet

```
ansible-project/
├── inventory.ini         # Fichier d'inventaire des hôtes
├── site.yml              # Playbook principal
└── roles/
    ├── python/
    │   └── tasks/
    │       └── main.yml
    ├── ansible/
    │   └── tasks/
    │       └── main.yml
    └── podman/
        └── tasks/
            └── main.yml
```

## 🧩 À quoi ça sert ?

Ce projet permet de :
- Préparer rapidement des machines avec les outils essentiels pour le DevOps.
- Uniformiser les environnements (Python, Ansible, Podman).
- Apprendre à utiliser les **rôles Ansible** et à les organiser proprement.

## ⚙️ Prérequis

- Avoir Ansible installé (sous Linux, WSL ou une VM).
- Accès SSH aux machines cibles (clé privée, utilisateur, etc.).
- Que la machine distante accepte les connexions SSH avec élévation de privilèges (`sudo`).

## 🖥️ Configuration de l'inventaire (`inventory.ini`)

Exemple :

```ini
[all]
serveur1 ansible_host=10.39.20.49 ansible_user=g.poulain ansible_ssh_private_key_file=~/.ssh/id_rsa
```

> Remplace :
> - `10.39.20.49` par l’IP de ta machine distante.
> - `g.poulain` par l’utilisateur avec accès SSH.
> - `~/.ssh/id_rsa` par le chemin de ta clé privée. (en général, il est le même pour tout le monde)

## 📝 Modification selon ta configuration

Tu peux :
- Modifier `ansible_user` pour qu’il corresponde à ton utilisateur.
- Ajouter d’autres machines ou groupes dans `inventory.ini`.
- Modifier les rôles dans `roles/*/tasks/main.yml` selon ta distribution ou besoin.

## 🚀 Exécuter le playbook

Depuis le dossier `ansible-project`, lance :

```bash
ansible-playbook -i inventory.ini site.yml
```

> ⚠️ Ajouter `--ask-become-pass` si vous voulez que l'utilisateur doive entrer le mot de passe `sudo`.

## 📦 Détails des rôles

### Rôle `python`
Installe `python3` via `apt` (Debian/Ubuntu) ou `yum` (RHEL/CentOS).

### Rôle `ansible`
Installe `ansible` via `pip3`. (Vous pouvez modifier pour utiliser `apt` ou `yum` si nécessaire.)

### Rôle `podman`
Installe `podman` avec le gestionnaire de paquets approprié selon la distribution.

---

## 👨‍💻 Astuces supplémentaires

- Utilise `ansible -m ping all -i inventory.ini` pour tester la connectivité.
- Utilise `ansible-playbook -i inventory.ini site.yml -C` pour simuler (mode check).
- Vous pouvez créer un rôle avec : `ansible-galaxy init nom_du_role`.

---

**Auteur** : *Guillaume POULAIN*  
**Date** : *02/07/2025*  
