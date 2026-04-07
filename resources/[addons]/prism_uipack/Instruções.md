# Instalação no Qbox

1. Coloque a pasta do recurso no seu servidor.
2. Garanta que `ox_lib` inicia antes deste recurso no `server.cfg`.
3. Adicione `ensure prism_uipack` depois do `ensure ox_lib`.
4. Se algum script do seu Qbox usar `lib.notify`, `lib.progressBar`, `lib.registerContext`, `lib.inputDialog`, `lib.alertDialog`, `lib.skillCheck`, `lib.showTextUI` e similares, este pacote já fica pronto para funcionar como interface compatível.

## Observações

- O arquivo `init.lua` agora é carregado como script cliente, então o bridge de compatibilidade com `ox_lib` realmente inicializa.
- O recurso continua dependente de `ox_lib`, que é o padrão no ecossistema Qbox.
