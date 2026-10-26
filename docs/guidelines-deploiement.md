# Guidelines de déploiement

Ce fichier ne décrit pas comment déployer l'application : il dit **où** se trouvent les consignes.

## La source qui fait foi

Le déploiement suit les guidelines du fichier **`/CLAUDE.md` à la racine du serveur** (la VM qui expose l'application sur `URL_PUBLIQUE`), et **non** le `CLAUDE.md` de ce projet.

- Le `CLAUDE.md` de ce dépôt cadre le hackathon (itérations, DoR, DoD). Il ne dit pas comment déployer.
- Le `/CLAUDE.md` du serveur décrit comment l'application y est construite, démarrée et exposée. En cas de contradiction avec ce dépôt, c'est lui qui s'applique pour le déploiement.

## Ce que fait l'agent

1. Lire `/CLAUDE.md` à la racine du serveur avant chaque déploiement : il peut changer en cours de hackathon.
2. Déployer en suivant ces guidelines, sans ajouter d'étape qu'elles ne décrivent pas.
3. Confirmer ensuite que l'application est en ligne avec `./scripts/verifier-en-ligne.sh`.

## Si le fichier est absent ou incomplet

Si `/CLAUDE.md` n'existe pas à la racine du serveur, ou s'il ne dit pas comment déployer, l'agent s'arrête et le signale (❗️). Il n'invente pas de mécanisme de déploiement.

## Ce qui ne change pas

- Le contrat [contrat-deployabilite.md](./contrat-deployabilite.md) s'applique toujours au dépôt (Dockerfile, `.env.example`, routes de santé, `DEPLOIEMENT.md`), pour la Forge.
- Aucun secret ni la clé `CLE` ne s'écrit dans un fichier, même si une étape de déploiement le suggère.
