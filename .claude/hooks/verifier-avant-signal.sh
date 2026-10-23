#!/usr/bin/env bash
# Vérification (borne) : on ne signale pas une version à PM Lab si elle n'est pas finie.
# « Finie » = contrat de déployabilité sans borne franchie (aucun .env ni secret suivi),
# tests verts, et application en ligne. Un code de sortie 2 bloque la commande
# et renvoie le message à l'agent.
cmd=$(jq -r '.tool_input.command // ""')
case "$cmd" in *version-prete*|*signaler-version*) ;; *) exit 0 ;; esac

if ! sortie=$(./scripts/verifier-deployabilite.sh 2>&1); then
  echo "Signal refusé par le harnais : le contrat de déployabilité n'est pas respecté." >&2
  echo "$sortie" | grep '^BORNE' >&2
  exit 2
fi
if ! npm test --silent >/dev/null 2>&1; then
  echo "Signal refusé par le harnais : npm test échoue. Corrige les tests avant de signaler la version." >&2
  exit 2
fi
if ! ./scripts/verifier-en-ligne.sh >/dev/null 2>&1; then
  echo "Signal refusé par le harnais : l'application ne répond pas sur \$URL_PUBLIQUE/health et /sante. La version n'est pas en ligne." >&2
  exit 2
fi
exit 0
