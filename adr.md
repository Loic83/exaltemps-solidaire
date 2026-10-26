# Architecture Decision Record (ADR)

Journal des décisions d'architecture prises pendant le hackathon (dépendance nouvelle, stockage, pattern structurant).

Une entrée par décision, ajoutée à la fin, au format :

```
### AAAA-MM-JJ — <titre court>

- **Décision** : ce qui a été choisi
- **Contexte** : le problème à résoudre
- **Alternatives envisagées** : les autres options, et pourquoi elles sont écartées
- **Conséquences** : les compromis acceptés
```

Le fichier est un journal : on ajoute, on ne réécrit pas. Pour revenir sur une décision, une nouvelle entrée le dit explicitement.

---

## Décisions

### 2026-10-26 — Deux services, api/ et frontend/, selon le gabarit du serveur

- **Décision** : le dépôt suit le gabarit du `/CLAUDE.md` du serveur. `api/` est un service Node sans dépendance (TypeScript exécuté directement par Node, port 8081). `frontend/` est une application Next.js en export statique, servie par nginx (port 80 dans le conteneur, 8080 sur la VM). Chaque service a son `Dockerfile` et son fichier de verrouillage. La racine ne garde que l'outillage du harnais (tests et lint de l'API, démo Playwright).
- **Contexte** : la recette de déploiement du serveur construit `api/` et `frontend/` séparément avec podman, et sert le front et l'API sur une seule origine (`/` et `/api/`). Une seule application Next.js avec routes intégrées n'y entre pas.
- **Alternatives envisagées** : garder Next.js d'un seul tenant (incompatible avec la recette) ; npm workspaces (un seul fichier de verrouillage, à la racine, hors du contexte de construction de chaque service) ; un framework HTTP pour l'API (dépendance nouvelle, inutile pour l'instant).
- **Conséquences** : le front n'a ni route d'API, ni Server Action, ni réécriture ; toute donnée passe par `fetch("/api/v1/...")`. `npm install` à la racine installe aussi `frontend/`. Les `Dockerfile` sont à confronter à `CCOE-RULES.md` §3.2 sur la VM. Les scripts du harnais (`verifier-deployabilite.sh`, `verifier-en-ligne.sh`) ne sont pas adaptés : choix « a » du développeur, on reste dans le cadre PM Lab.
