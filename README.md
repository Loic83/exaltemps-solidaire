## Démarrage rapide : hackathon, partie 2

Si vous êtes sur cette page, c'est que vous êtes dans la 2ème partie du hackathon sinon commencez par l'atelier : https://github.com/Loic83/exaltemps-solidaire-practice

Vous livrez le programme de votre équipe en **itérations courtes**, autant que le temps restant le permet, avec **10 minutes de codage au plus** chacune. Chaque itération se termine par une version en ligne, que l'équipe teste dans PM Lab. L'agent vous demandera régulièrement combien de minutes il reste avant la fin du build.

### Prérequis

- Node.js 24 et npm, `jq`, `curl`, `unzip` et `git`, accessibles dans le terminal où vous lancez Claude Code. Sans `jq`, le harnais refuse toutes les commandes du terminal.
- Docker avec `docker compose` : préconisé.

1. **Préparez le dépôt** : `npm ci`, puis `git config core.hooksPath .githooks` (le commit refuse la passation et les secrets).
2. **Vérifiez vos variables** : `export CLE=...` (la clé de contexte, transmise à part) et `export URL_PUBLIQUE=...` (l'adresse où votre application sera visible).
3. **Lancez Claude Code** dans ce dossier (`claude`), puis tapez les commandes dans l'ordre :

   | Commande | Ce qu'elle fait |
   |---|---|
   | `/recuperer-passation <CODE>` | Télécharge le dossier de votre équipe et le résume |
   | `/planifier-iterations` | Découpe le programme en itérations selon le temps restant et écrit `ITERATIONS.md`. **Validez ce plan avec les cadreurs avant de coder** |
   | `/iteration 1`, puis `2`, `3`… | Code l'itération, la vérifie, la publie, la signale à PM Lab et replanifie la suite |
   | `/expliquer-iteration` (optionnel) | Explique ce que l'itération a produit, pour comprendre l'architecture du code |
   | `/retro-harnais` | En fin de hackathon : ce que le harnais a apporté, ce qui lui a manqué, ce que vous emportez |

4. **Pour montrer l'application** : `npm run demo` rejoue le cas passant dans un navigateur. Ce n'est pas une suite de tests, c'est la démo du pitch.

**Comprendre le harnais que vous utilisez** : [HARNAIS.md](./HARNAIS.md), en six questions. C'est fait pour être lu pendant le hackathon et réutilisé après.

Ce que contient le dossier de passation : [docs/passation.md](./docs/passation.md). Les règles de déploiement : [docs/contrat-deployabilite.md](./docs/contrat-deployabilite.md).

