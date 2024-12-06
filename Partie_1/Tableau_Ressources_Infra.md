| **Élément**                                    | **Nombre** | **Description**                                               |
|-------------------------------------------------|------------|---------------------------------------------------------------|
| **Serveurs dédiés (cloud IaaS/PaaS)**           | 5          | - Applications comptables (1 serveur) <br> - Gestion de la trésorerie (1 serveur) <br> - Serveurs web (site SaaS) (4 serveurs VM Linux) <br> - Serveurs EDR/XDR (2 serveurs dans le cloud) |
| **Serveurs SOC**                                | 2          | 2 serveurs physiques avec hyperviseurs                        |
| **Firewalls virtuels gérés par le SOC**         | 2          | Un pour le réseau DMZ, un pour les serveurs web et la messagerie |
| **Load Balancer**                               | 1          | Pour la répartition de la charge sur les serveurs web (site SaaS) |
| **SIEM centralisé**                             | 1          | Ex. Splunk ou IBM QRadar (pour la gestion des logs et la corrélation des événements) |
| **VPN Zero Trust (Zscaler ou Palo Alto GlobalProtect)** | 1          | Pour sécuriser les accès distants                             |
| **MFA (Duo Security ou Azure AD)**              | 1          | Pour l'authentification multi-facteurs des utilisateurs        |
| **Switchs ou routeurs réseau (réseau dédié et DMZ)** | 2          | Un pour le réseau dédié Back End et un pour la DMZ            |
| **Serveurs de messagerie sécurisée**            | 1          | Géré via le SOC avec des outils de filtrage antispam et antivirus |
| **Serveurs de stockage sécurisé (NAS ou SAN)**  | 1          | Pour le stockage des données avec des solutions de sauvegarde (ex. NetApp ou Dell EMC Isilon) |
| **Systèmes de détection d'intrusion (IDS/IPS)**  | 2          | Un pour la base de données Oracle, un pour l'infrastructure web |
| **Bases de données (Oracle dernière version)** | 1          | Pour l'application comptable et la gestion de la trésorerie   |
| **Système de gestion des appareils mobiles (MDM)** | 1          | Ex. Microsoft Intune ou Jamf pour la gestion des appareils mobiles |
| **Kubernetes (pour orchestration des ressources)** | 1          | Pour gérer les containers et la scalabilité des serveurs web  |
| **Outils de monitoring (Prometheus)**           | 2          | Un pour la gestion des performances du site SaaS et un pour l'infrastructure du SOC |
| **Outils d'automatisation (Ansible, Terraform)** | 2          | Un pour l'infrastructure cloud et un pour l'infrastructure on-premises |
| **Contrôleurs de domaine Active Directory**     | 2          | Pour garantir la haute disponibilité et la gestion centralisée des accès |
| **Système de déduplication des fichiers (NAS)** | 1          | Pour la gestion des fichiers et la réduction de l'espace de stockage |
