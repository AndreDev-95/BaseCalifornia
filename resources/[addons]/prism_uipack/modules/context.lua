
local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = {}
L1_1 = nil
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2
  if A1_2 then
    L3_2 = A1_2
    L4_2 = 1
    L3_2(L4_2)
  end
  L3_2 = Utils
  L3_2 = L3_2.resetNuiFocus
  L3_2()
  L3_2 = L1_1
  if not L3_2 then
    return
  end
  if A1_2 or A2_2 then
    L4_2 = L1_1
    L3_2 = L0_1
    L3_2 = L3_2[L4_2]
    L3_2 = L3_2.onExit
    if L3_2 then
      L4_2 = L1_1
      L3_2 = L0_1
      L3_2 = L3_2[L4_2]
      L3_2 = L3_2.onExit
      L3_2()
    end
  end
  if not A1_2 then
    L3_2 = SendNUIMessage
    L4_2 = {}
    L4_2.action = "hideContext"
    L3_2(L4_2)
  end
  L3_2 = nil
  L1_1 = L3_2
end
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = L0_1
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    L1_2 = error
    L2_2 = "No context menu of such id found."
    L1_2(L2_2)
  end
  L1_2 = L0_1
  L1_2 = L1_2[A0_2]
  L1_1 = A0_2
  L2_2 = Utils
  L2_2 = L2_2.setNuiFocus
  L3_2 = false
  L2_2(L3_2)
  L2_2 = SendNuiMessage
  L3_2 = json
  L3_2 = L3_2.encode
  L4_2 = {}
  L4_2.action = "showContext"
  L5_2 = {}
  L6_2 = L1_2.title
  L5_2.title = L6_2
  L6_2 = L1_2.subtitle
  L5_2.subtitle = L6_2
  L6_2 = L1_2.titleIcon
  L5_2.titleIcon = L6_2
  L6_2 = L1_2.sectionTitle
  L5_2.sectionTitle = L6_2
  L6_2 = L1_2.sectionIcon
  L5_2.sectionIcon = L6_2
  L6_2 = L1_2.footerLabel
  L5_2.footerLabel = L6_2
  L6_2 = L1_2.canClose
  L5_2.canClose = L6_2
  L6_2 = L1_2.menu
  L5_2.menu = L6_2
  L6_2 = Utils
  L6_2 = L6_2.sanitizeItems
  L7_2 = L1_2.options
  L6_2 = L6_2(L7_2)
  L5_2.options = L6_2
  L4_2.data = L5_2
  L5_2 = {}
  L5_2.sort_keys = true
  L3_2, L4_2, L5_2, L6_2, L7_2 = L3_2(L4_2, L5_2)
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
end
ShowContext = L3_1
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = pairs
  L2_2 = A0_2
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L5_2, L6_2 in L1_2, L2_2, L3_2, L4_2 do
    L7_2 = type
    L8_2 = L5_2
    L7_2 = L7_2(L8_2)
    if "number" == L7_2 then
      L8_2 = L6_2.id
      L7_2 = L0_1
      L7_2[L8_2] = L6_2
    else
      L8_2 = A0_2.id
      L7_2 = L0_1
      L7_2[L8_2] = A0_2
      break
    end
  end
end
RegisterContext = L3_1
function L3_1()
  local L0_2, L1_2
  L0_2 = L1_1
  return L0_2
end
GetOpenContextMenu = L3_1
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L2_1
  L2_2 = nil
  L3_2 = nil
  L4_2 = A0_2
  L1_2(L2_2, L3_2, L4_2)
end
HideContext = L3_1
L3_1 = RegisterNUICallback
L4_1 = "openContext"
function L5_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = A0_2.back
  if L2_2 then
    L3_2 = L1_1
    L2_2 = L0_1
    L2_2 = L2_2[L3_2]
    L2_2 = L2_2.onBack
    if L2_2 then
      L3_2 = L1_1
      L2_2 = L0_1
      L2_2 = L2_2[L3_2]
      L2_2 = L2_2.onBack
      L2_2()
    end
  end
  L2_2 = A1_2
  L3_2 = 1
  L2_2(L3_2)
  L2_2 = ShowContext
  L3_2 = A0_2.id
  L2_2(L3_2)
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNUICallback
L4_1 = "clickContext"
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = A1_2
  L3_2 = 1
  L2_2(L3_2)
  L2_2 = math
  L2_2 = L2_2.type
  L3_2 = tonumber
  L4_2 = A0_2
  L3_2, L4_2, L5_2 = L3_2(L4_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  if "float" == L2_2 then
    L2_2 = math
    L2_2 = L2_2.tointeger
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    A0_2 = L2_2
  else
    L2_2 = tonumber
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      A0_2 = A0_2 + 1
    end
  end
  L3_2 = L1_1
  L2_2 = L0_1
  L2_2 = L2_2[L3_2]
  L2_2 = L2_2.options
  L2_2 = L2_2[A0_2]
  L3_2 = L2_2.event
  if not L3_2 then
    L3_2 = L2_2.serverEvent
    if not L3_2 then
      L3_2 = L2_2.onSelect
      if not L3_2 then
        return
      end
    end
  end
  L3_2 = nil
  L1_1 = L3_2
  L3_2 = SendNUIMessage
  L4_2 = {}
  L4_2.action = "hideContext"
  L3_2(L4_2)
  L3_2 = Utils
  L3_2 = L3_2.resetNuiFocus
  L3_2()
  L3_2 = L2_2.onSelect
  if L3_2 then
    L3_2 = L2_2.onSelect
    L4_2 = L2_2.args
    L3_2(L4_2)
  end
  L3_2 = L2_2.event
  if L3_2 then
    L3_2 = TriggerEvent
    L4_2 = L2_2.event
    L5_2 = L2_2.args
    L3_2(L4_2, L5_2)
  end
  L3_2 = L2_2.serverEvent
  if L3_2 then
    L3_2 = TriggerServerEvent
    L4_2 = L2_2.serverEvent
    L5_2 = L2_2.args
    L3_2(L4_2, L5_2)
  end
end
L3_1(L4_1, L5_1)
L3_1 = RegisterNUICallback
L4_1 = "closeContext"
L5_1 = L2_1
L3_1(L4_1, L5_1)

