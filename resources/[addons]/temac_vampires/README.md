# temac_vampires

Versão: **Beta 1.0.0**

## Inclui
- transformar jogador em vampiro
- forma vampírica alternável
- sugar sangue de players e NPCs
- sede de sangue com drenagem automática
- níveis de vampiro por XP
- dano automático ao sol
- buffs à noite
- item blood pouch
- item antidote
- item daylight ring
- animações de transformação e alimentação
- comandos de administração

## Comandos
- `/vampire` ativa o sistema no próprio jogador e depois mostra estado
- `/vstatus` mostra o estado vampírico
- `/bloodpouch` usa bolsa de sangue
- `/antidote` usa antídoto
- `/daylightring` ativa proteção solar temporária
- `/setvampire [id]` admin
- `/removevampire [id]` admin

## Keybinds
- `G` sugar sangue do alvo mais próximo
- `J` alternar forma vampírica

## Persistência
O estado fica em `PlayerData.metadata.temac_vampires`.

## Notas
- O script foi preparado para Qbox + ox_lib.
- Para itens reais no inventário, usa o ficheiro `install/ox_inventory_items.lua`.
