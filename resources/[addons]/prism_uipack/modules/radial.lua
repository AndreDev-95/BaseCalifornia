local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1
L0_1 = false
L1_1 = {}
L2_1 = {}
L3_1 = {}
L4_1 = nil
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = A0_2 or nil
  if A0_2 then
    L2_2 = L1_1
    L2_2 = L2_2[A0_2]
  end
  if A0_2 and not L2_2 then
    L3_2 = error
    L4_2 = "No radial menu with such id found."
    return L3_2(L4_2)
  end
  L4_1 = L2_2
  L3_2 = SendNUIMessage
  L4_2 = {}
  L4_2.action = "openRadialMenu"
  L4_2.data = false
  L3_2(L4_2)
  L3_2 = Wait
  L4_2 = 100
  L3_2(L4_2)
  L3_2 = L0_1
  if not L3_2 then
    return
  end
  if L2_2 then
    L3_2 = L2_2.items
    if L3_2 then
      goto lbl_33
    end
  end
  L3_2 = L2_1
  ::lbl_33::
  L4_2 = SendNUIMessage
  L5_2 = {}
  L5_2.action = "openRadialMenu"
  L6_2 = {}
  L7_2 = Utils
  L7_2 = L7_2.sanitizeItems
  L8_2 = L3_2
  L7_2 = L7_2(L8_2)
  L6_2.items = L7_2
  if L2_2 then
    L7_2 = true
    if L7_2 then
      goto lbl_50
    end
  end
  L7_2 = nil
  ::lbl_50::
  L6_2.sub = L7_2
  L6_2.option = A1_2
  L5_2.data = L6_2
  L4_2(L5_2)
end
function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = L0_1
  if not L1_2 then
    return
  end
  L1_2 = L4_1
  if L1_2 and A0_2 then
    L1_2 = L4_1.id
    if A0_2 == L1_2 then
      L1_2 = L5_1
      L2_2 = A0_2
      return L1_2(L2_2)
    else
      L1_2 = 1
      L2_2 = L3_1
      L2_2 = #L2_2
      L3_2 = 1
      for L4_2 = L1_2, L2_2, L3_2 do
        L5_2 = L3_1
        L5_2 = L5_2[L4_2]
        L6_2 = L5_2.id
        if L6_2 == A0_2 then
          L7_2 = L5_2.id
          L6_2 = L1_1
          L6_2 = L6_2[L7_2]
          L7_2 = 1
          L8_2 = L6_2.items
          L8_2 = #L8_2
          L9_2 = 1
          for L10_2 = L7_2, L8_2, L9_2 do
            L11_2 = L6_2.items
            L11_2 = L11_2[L10_2]
            L11_2 = L11_2.menu
            L12_2 = L4_1.id
            if L11_2 == L12_2 then
              return
            end
          end
          L4_1 = L6_2
          L7_2 = L3_1
          L7_2 = #L7_2
          L8_2 = L4_2
          L9_2 = -1
          for L10_2 = L7_2, L8_2, L9_2 do
            L11_2 = L3_1
            L11_2[L10_2] = nil
          end
          L7_2 = L5_1
          L8_2 = L4_1.id
          return L7_2(L8_2)
        end
      end
    end
    return
  end
  L1_2 = table
  L1_2 = L1_2.wipe
  L2_2 = L3_1
  L1_2(L2_2)
  L1_2 = L5_1
  L1_2()
end
function L7_1(A0_2)
  local L1_2, L2_2
  L2_2 = A0_2.id
  L1_2 = L1_1
  L1_2[L2_2] = A0_2
  L1_2 = GetInvokingResource
  L1_2 = L1_2()
  A0_2.resource = L1_2
  L1_2 = L4_1
  if L1_2 then
    L1_2 = L6_1
    L2_2 = A0_2.id
    L1_2(L2_2)
  end
end
RegisterRadial = L7_1
function L7_1()
  local L0_2, L1_2
  L0_2 = L4_1
  if L0_2 then
    L0_2 = L4_1.id
  end
  return L0_2
end
GetCurrentRadialId = L7_1
function L7_1()
  local L0_2, L1_2
  L0_2 = L0_1
  if not L0_2 then
    return
  end
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.action = "openRadialMenu"
  L1_2.data = false
  L0_2(L1_2)
  L0_2 = Utils
  L0_2 = L0_2.resetNuiFocus
  L0_2()
  L0_2 = table
  L0_2 = L0_2.wipe
  L1_2 = L3_1
  L0_2(L1_2)
  L0_2 = false
  L0_1 = L0_2
  L0_2 = nil
  L4_1 = L0_2
end
HideRadial = L7_1
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = L2_1
  L1_2 = #L1_2
  L2_2 = GetInvokingResource
  L2_2 = L2_2()
  L3_2 = table
  L3_2 = L3_2.type
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  if "array" ~= L3_2 or not A0_2 then
    L3_2 = {}
    L4_2 = A0_2
    L3_2[1] = L4_2
    A0_2 = L3_2
  end
  L3_2 = 1
  L4_2 = #A0_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = A0_2[L6_2]
    L7_2.resource = L2_2
    if 0 == L1_2 then
      L1_2 = L1_2 + 1
      L8_2 = L2_1
      L8_2[L1_2] = L7_2
    else
      L8_2 = 1
      L9_2 = L1_2
      L10_2 = 1
      for L11_2 = L8_2, L9_2, L10_2 do
        L12_2 = L2_1
        L12_2 = L12_2[L11_2]
        L12_2 = L12_2.id
        L13_2 = L7_2.id
        if L12_2 == L13_2 then
          L12_2 = L2_1
          L12_2[L11_2] = L7_2
          break
        end
        if L11_2 == L1_2 then
          L1_2 = L1_2 + 1
          L12_2 = L2_1
          L12_2[L1_2] = L7_2
        end
      end
    end
  end
  L3_2 = L0_1
  if L3_2 then
    L3_2 = L4_1
    if not L3_2 then
      L3_2 = L6_1
      L3_2()
    end
  end
end
AddRadialItem = L7_1
function L7_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = nil
  L2_2 = 1
  L3_2 = L2_1
  L3_2 = #L3_2
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = L2_1
    L1_2 = L6_2[L5_2]
    L6_2 = L1_2.id
    if L6_2 == A0_2 then
      L6_2 = table
      L6_2 = L6_2.remove
      L7_2 = L2_1
      L8_2 = L5_2
      L6_2(L7_2, L8_2)
      break
    end
  end
  L2_2 = L0_1
  if not L2_2 then
    return
  end
  L2_2 = L6_1
  L3_2 = A0_2
  L2_2(L3_2)
end
RemoveRadialItem = L7_1
function L7_1()
  local L0_2, L1_2
  L0_2 = table
  L0_2 = L0_2.wipe
  L1_2 = L2_1
  L0_2(L1_2)
  L0_2 = L0_1
  if L0_2 then
    L0_2 = L6_1
    L0_2()
  end
end
ClearRadialItems = L7_1
L7_1 = RegisterNUICallback
L8_1 = "radialClick"
function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = A1_2
  L3_2 = 1
  L2_2(L3_2)
  L2_2 = A0_2 + 1
  L3_2 = nil
  L4_2 = nil
  L5_2 = L4_1
  if L5_2 then
    L5_2 = L4_1.items
    L3_2 = L5_2[L2_2]
    L4_2 = L4_1.id
  else
    L5_2 = L2_1
    L3_2 = L5_2[L2_2]
  end
  L5_2 = L4_1
  if L5_2 then
    L5_2 = L4_1.resource
    if L5_2 then
      goto lbl_23
    end
  end
  L5_2 = L3_2.resource
  ::lbl_23::
  L6_2 = L3_2.menu
  if L6_2 then
    L6_2 = L3_1
    L6_2 = #L6_2
    L7_2 = L6_2 + 1
    L6_2 = L3_1
    L8_2 = {}
    L9_2 = L4_1
    if L9_2 then
      L9_2 = L4_1.id
    end
    L8_2.id = L9_2
    L9_2 = L3_2.menu
    L8_2.option = L9_2
    L6_2[L7_2] = L8_2
    L6_2 = L5_1
    L7_2 = L3_2.menu
    L6_2(L7_2)
  else
    L6_2 = L3_2.keepOpen
    if not L6_2 then
      L6_2 = HideRadial
      L6_2()
    end
  end
  L6_2 = L3_2.onSelect
  if L6_2 then
    L7_2 = type
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    if "string" == L7_2 then
      L7_2 = exports
      L7_2 = L7_2[L5_2]
      L7_2 = L7_2[L6_2]
      L8_2 = 0
      L9_2 = L4_2
      L10_2 = L2_2
      return L7_2(L8_2, L9_2, L10_2)
    end
    L7_2 = L6_2
    L8_2 = L4_2
    L9_2 = L2_2
    L7_2(L8_2, L9_2)
  end
end
L7_1(L8_1, L9_1)
L7_1 = RegisterNUICallback
L8_1 = "radialBack"
function L9_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = A1_2
  L3_2 = 1
  L2_2(L3_2)
  L2_2 = L3_1
  L2_2 = #L2_2
  L3_2 = L3_1
  L3_2 = L2_2 > 0 and L3_2
  if not L3_2 then
    return
  end
  L4_2 = L3_1
  L4_2[L2_2] = nil
  L4_2 = L3_2.id
  if L4_2 then
    L4_2 = L5_1
    L5_2 = L3_2.id
    L6_2 = L3_2.option
    return L4_2(L5_2, L6_2)
  end
  L4_2 = nil
  L4_1 = L4_2
  L4_2 = SendNUIMessage
  L5_2 = {}
  L5_2.action = "openRadialMenu"
  L5_2.data = false
  L4_2(L5_2)
  L4_2 = Wait
  L5_2 = 100
  L4_2(L5_2)
  L4_2 = L0_1
  if not L4_2 then
    return
  end
  L4_2 = SendNUIMessage
  L5_2 = {}
  L5_2.action = "openRadialMenu"
  L6_2 = {}
  L7_2 = Utils
  L7_2 = L7_2.sanitizeItems
  L8_2 = L2_1
  L7_2 = L7_2(L8_2)
  L6_2.items = L7_2
  L7_2 = L3_2.option
  L6_2.option = L7_2
  L5_2.data = L6_2
  L4_2(L5_2)
end
L7_1(L8_1, L9_1)
L7_1 = RegisterNUICallback
L8_1 = "radialClose"
function L9_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = A1_2
  L3_2 = 1
  L2_2(L3_2)
  L2_2 = L0_1
  if not L2_2 then
    return
  end
  L2_2 = Utils
  L2_2 = L2_2.resetNuiFocus
  L2_2()
  L2_2 = false
  L0_1 = L2_2
  L2_2 = nil
  L4_1 = L2_2
end
L7_1(L8_1, L9_1)
L7_1 = RegisterNUICallback
L8_1 = "radialTransition"
function L9_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = Wait
  L3_2 = 100
  L2_2(L3_2)
  L2_2 = L0_1
  if not L2_2 then
    L2_2 = A1_2
    L3_2 = false
    return L2_2(L3_2)
  end
  L2_2 = A1_2
  L3_2 = true
  L2_2(L3_2)
end
L7_1(L8_1, L9_1)
L7_1 = false
function L8_1(A0_2)
  local L1_2
  L7_1 = A0_2
  L1_2 = L0_1
  if L1_2 and A0_2 then
    L1_2 = HideRadial
    return L1_2()
  end
end
disableRadial = L8_1
function L8_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = 100
  L1_2 = 0
  while true do
    L2_2 = Utils
    if not (not L2_2 and L0_2 > L1_2) then
      break
    end
    L2_2 = Wait
    L3_2 = 100
    L2_2(L3_2)
    L1_2 = L1_2 + 1
  end
  L2_2 = Utils
  if not L2_2 then
    L2_2 = error
    L3_2 = "Failed to load Utils dependency after \"%s\" ms."
    L4_2 = L3_2
    L3_2 = L3_2.format
    L5_2 = L0_2 * 100
    L3_2, L4_2, L5_2 = L3_2(L4_2, L5_2)
    L2_2(L3_2, L4_2, L5_2)
  end
end
L9_1 = L8_1
L9_1()
L9_1 = Utils
L9_1 = L9_1.addKeybind
L10_1 = {}
L10_1.name = "prism-radial"
L10_1.description = "Open radial menu"
L11_1 = GetConvar
L12_1 = "prism:radialOpenKey"
L13_1 = "z"
L11_1 = L11_1(L12_1, L13_1)
L10_1.defaultKey = L11_1
function L11_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = L7_1
  if L0_2 then
    return
  end
  L0_2 = L0_1
  if L0_2 then
    L0_2 = HideRadial
    return L0_2()
  end
  L0_2 = L2_1
  L0_2 = #L0_2
  if 0 ~= L0_2 then
    L0_2 = IsNuiFocused
    L0_2 = L0_2()
    if not L0_2 then
      L0_2 = IsPauseMenuActive
      L0_2 = L0_2()
      if not L0_2 then
        goto lbl_24
      end
    end
  end
  do return end
  ::lbl_24::
  L0_2 = true
  L0_1 = L0_2
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.action = "openRadialMenu"
  L2_2 = {}
  L3_2 = Utils
  L3_2 = L3_2.sanitizeItems
  L4_2 = L2_1
  L3_2 = L3_2(L4_2)
  L2_2.items = L3_2
  L1_2.data = L2_2
  L0_2(L1_2)
  L0_2 = Utils
  L0_2 = L0_2.setNuiFocus
  L1_2 = true
  L0_2(L1_2)
  L0_2 = SetCursorLocation
  L1_2 = 0.5
  L2_2 = 0.5
  L0_2(L1_2, L2_2)
  L0_2 = PlayerId
  L0_2 = L0_2()
  while true do
    L1_2 = L0_1
    if not L1_2 then
      break
    end
    L1_2 = DisablePlayerFiring
    L2_2 = L0_2
    L3_2 = true
    L1_2(L2_2, L3_2)
    L1_2 = DisableControlAction
    L2_2 = 0
    L3_2 = 1
    L4_2 = true
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = DisableControlAction
    L2_2 = 0
    L3_2 = 2
    L4_2 = true
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = DisableControlAction
    L2_2 = 0
    L3_2 = 142
    L4_2 = true
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = DisableControlAction
    L2_2 = 2
    L3_2 = 199
    L4_2 = true
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = DisableControlAction
    L2_2 = 2
    L3_2 = 200
    L4_2 = true
    L1_2(L2_2, L3_2, L4_2)
    L1_2 = Wait
    L2_2 = 0
    L1_2(L2_2)
  end
end
L10_1.onPressed = L11_1
L11_1 = GetConvar
L12_1 = "prism:radialOpenMode"
L13_1 = "press"
L11_1 = L11_1(L12_1, L13_1)
if "hold" == L11_1 then
  L11_1 = HideRadial
  if L11_1 then
    goto lbl_69
  end
end
L11_1 = nil
::lbl_69::
L10_1.onReleased = L11_1
L9_1(L10_1)
L9_1 = AddEventHandler
L10_1 = "onClientResourceStop"
function L11_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = L2_1
  L1_2 = #L1_2
  L2_2 = 1
  L3_2 = -1
  for L4_2 = L1_2, L2_2, L3_2 do
    L5_2 = L2_1
    L5_2 = L5_2[L4_2]
    L6_2 = L5_2.resource
    if L6_2 == A0_2 then
      L6_2 = table
      L6_2 = L6_2.remove
      L7_2 = L2_1
      L8_2 = L4_2
      L6_2(L7_2, L8_2)
    end
  end
end
L9_1(L10_1, L11_1)

-- === Submenu Roupas ===
exports.prism_uipack:RegisterRadial({
    id = "menu_roupas",
    items = {
        { id = "chapeu",      title = "Chapéu",      icon = "fas fa-hat-cowboy",       onSelect = function() print("Removendo chapéu") end },
        { id = "mascara",     title = "Máscara",     icon = "fas fa-mask",             onSelect = function() print("Removendo máscara") end },
        { id = "oculos",      title = "Óculos",      icon = "fas fa-glasses",          onSelect = function() print("Removendo óculos") end },
        { id = "camisa",      title = "Camisa",      icon = "fas fa-tshirt",           onSelect = function() print("Removendo camisa") end },
        { id = "jaqueta",     title = "Jaqueta",     icon = "fas fa-jacket",           onSelect = function() print("Removendo jaqueta") end },
        { id = "maos",        title = "Mãos",        icon = "fas fa-hand-sparkles",    onSelect = function() print("Removendo luvas") end },
        { id = "colete",      title = "Colete",      icon = "fas fa-shield-alt",       onSelect = function() print("Removendo colete") end },
        { id = "calca",       title = "Calça",       icon = "fas fa-jeans",            onSelect = function() print("Removendo calça") end },
        { id = "sapatos",     title = "Sapatos",     icon = "fas fa-shoe-prints",      onSelect = function() print("Removendo sapatos") end },
        { id = "acessorios",  title = "Acessórios",  icon = "fas fa-gem",              onSelect = function() print("Removendo acessórios") end }
    }
})

-- === Submenu Armário ===
exports.prism_uipack:RegisterRadial({
    id = "menu_armario",
    items = {
        { id = "vestir",  title = "Vestir",  icon = "fas fa-tshirt", onSelect = function() TriggerServerEvent("player:Outfit","aplicar","wardrobe") end },
        { id = "guardar", title = "Guardar", icon = "fas fa-box",    onSelect = function() TriggerServerEvent("player:Outfit","salvar","wardrobe") end },
        { id = "remover", title = "Remover", icon = "fas fa-trash",  onSelect = function() TriggerServerEvent("player:Outfit","remover","wardrobe") end }
    }
})

-- === Submenu Outros ===
exports.prism_uipack:RegisterRadial({
    id = "menu_outros",
    items = {
        { id = "propriedades",    title = "Propriedades",       icon = "fas fa-home",          onSelect = function() print("Abrindo propriedades") end },
        { id = "armazem",         title = "Armazém",            icon = "fas fa-boxes",         onSelect = function() print("Abrindo armazém") end },
        { id = "ferimentos",      title = "Ferimentos",         icon = "fas fa-user-injured",  onSelect = function() print("Verificando ferimentos") end },
        { id = "desbugar",        title = "Desbugar",           icon = "fas fa-magic",         onSelect = function() print("Desbugando personagem") end },
        { id = "status_cidade",   title = "Status da Cidade",   icon = "fas fa-city",          onSelect = function() print("Mostrando status da cidade") end },
        { id = "identidade",      title = "Identidade",         icon = "fas fa-id-card",       onSelect = function() TriggerServerEvent("dynamic:identity") end }
    }
})

-- === Menu Principal ===
exports.prism_uipack:AddRadialItem({
    id = "armario",
    title = "Armário",
    icon = "fas fa-wardrobe",
    menu = "menu_armario"
})

exports.prism_uipack:AddRadialItem({
    id = "roupas",
    title = "Roupas",
    icon = "fas fa-tshirt",
    menu = "menu_roupas"
})

exports.prism_uipack:AddRadialItem({
    id = "outros",
    title = "Outros",
    icon = "fas fa-ellipsis-h",
    menu = "menu_outros"
})
