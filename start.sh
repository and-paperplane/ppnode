#!/bin/bash

ESLINT_RULES_EMPTY='\"rules\": {}'
ESLINT_RULES='\"rules\": {\"indent\": [\"error\", 4],\"space-before-function-paren\": [\"error\", \"never\"],\"padded-blocks\": [\"error\", { \"blocks\": \"never\" }],\"padding-line-between-statements\": [\"error\",{ \"blankLine\": \"always\", \"prev\": \"*\",\"next\": \"return\" },{\"blankLine\": \"always\",\"prev\": [\"const\",\"let\", \"var\"],\"next\": \"*\"},{\"blankLine\": \"any\",\"prev\": [\"const\", \"let\", \"var\"],\"next\": [\"const\", \"let\", \"var\"]}]}'

# instala as dependências
npm install
# cria o hook pre-commit
npx husky set .husky/pre-commit "npx pretty-quick --staged" && \
# configura o eslint
npm init @eslint/config && \
# formata os arquivos de configuração
npx prettier --write . && \
# adiciona o objeto rules ao arquivo .eslintrc.json
sed -i "s/${ESLINT_RULES_EMPTY}/${ESLINT_RULES}/" .eslintrc.json && \
# formata o arquivo .eslintrc.json
npx prettier --write .eslintrc.json

# {
#     "indent": ["error", 4],
#     "space-before-function-paren": ["error", "never"],
#     "padded-blocks": ["error", { "blocks": "never" }],
#     "padding-line-between-statements": [
#         "error",
#         { "blankLine": "always", "prev": "*", "next": "return" },
#         {
#             "blankLine": "always",
#             "prev": ["const", "let", "var"],
#             "next": "*"
#         },
#         {
#             "blankLine": "any",
#             "prev": ["const", "let", "var"],
#             "next": ["const", "let", "var"]
#         }
#     ]
# }
