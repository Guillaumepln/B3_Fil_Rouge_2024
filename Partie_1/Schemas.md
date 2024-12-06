```mermaid
graph TD
    subgraph "Cloud Infrastructure"
        A1[Serveur Comptable]
        A2[Serveur Gestion de Trésorerie]
        A3[Serveur Web 1]
        A4[Serveur Web 2]
        A5[Serveur Web 3]
        A6[Serveur Web 4]
        A7[Serveur EDR/XDR 1]
        A8[Serveur EDR/XDR 2]
    end

    subgraph "SOC"
        B1[Serveur SOC 1]
        B2[Serveur SOC 2]
    end

    subgraph "Réseau"
        C1[Firewall DMZ]
        C2[Firewall Web/Messagerie]
        C3[Switch DMZ]
        C4[Switch Réseau Dédié]
        D1[Load Balancer]
    end

    subgraph "Applications et Sécurité"
        E1[SIEM Centralisé]
        E2[VPN Zero Trust]
        E3[MFA]
        E4[Serveur Messagerie Sécurisée]
        E5[Serveur NAS/SAN Stockage]
    end

    subgraph "Infrastructure Complémentaire"
        F1[Base de Données Oracle]
        F2[Système IDS/IPS BD]
        F3[Système IDS/IPS Web]
        F4[Kubernetes]
        F5[Monitoring Site SaaS]
        F6[Monitoring SOC]
        F7[Automatisation Cloud]
        F8[Automatisation On-Prem]
        F9[Active Directory 1]
        F10[Active Directory 2]
    end

    A3 --- D1
    A4 --- D1
    A5 --- D1
    A6 --- D1
    D1 --- C1
    C1 --- A1 & A2
    C1 --- E1
    C1 --- F1
    B1 --- C2
    B2 --- C2
    C2 --- E4
    C3 --- F2 & F3
    F4 --- A3 & A4 & A5 & A6
    E1 --- E2 & E3
    E4 --- E5
    F5 --- F6
    F9 --- F10
    E5 --- F1
