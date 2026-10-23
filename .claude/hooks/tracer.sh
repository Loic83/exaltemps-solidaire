#!/usr/bin/env bash
# Traçage : une ligne par action de l'agent dans .iterations/trace.jsonl (non commité).
# Sert au bilan de chaque itération et à /retro-harnais.
mkdir -p .iterations
jq -c '{t: (now | todate), outil: .tool_name,
        cible: (.tool_input.command // .tool_input.file_path // .tool_input.pattern // "")}' \
  >> .iterations/trace.jsonl
