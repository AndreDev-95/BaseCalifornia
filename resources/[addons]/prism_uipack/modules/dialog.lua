local L0_1, L1_1, L2_1, L3_1
L0_1 = nil
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = L0_1
  if L3_2 then
    return
  end
  L3_2 = promise
  L3_2 = L3_2.new
  L3_2 = L3_2()
  L0_1 = L3_2
  L3_2 = 1
  L4_2 = #A1_2
  L5_2 = 1
  for L6_2 = L3_2, L4_2, L5_2 do
    L7_2 = type
    L8_2 = A1_2[L6_2]
    L7_2 = L7_2(L8_2)
    if "string" == L7_2 then
      L7_2 = {}
      L7_2.type = "input"
      L8_2 = A1_2[L6_2]
      L7_2.label = L8_2
      A1_2[L6_2] = L7_2
    end
  end
  L3_2 = Utils
  L3_2 = L3_2.setNuiFocus
  L4_2 = false
  L3_2(L4_2)
  L3_2 = SendNUIMessage
  L4_2 = {}
  L4_2.action = "openDialog"
  L5_2 = {}
  L5_2.heading = A0_2
  L5_2.rows = A1_2
  L5_2.options = A2_2
  L4_2.data = L5_2
  L3_2(L4_2)
  L3_2 = Citizen
  L3_2 = L3_2.Await
  L4_2 = L0_1
  return L3_2(L4_2)
end
InputDialog = L1_1
function L1_1()
  local L0_2, L1_2, L2_2
  L0_2 = L0_1
  if not L0_2 then
    return
  end
  L0_2 = Utils
  L0_2 = L0_2.resetNuiFocus
  L0_2()
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.action = "closeInputDialog"
  L0_2(L1_2)
  L0_2 = L0_1
  L1_2 = L0_2
  L0_2 = L0_2.resolve
  L2_2 = nil
  L0_2(L1_2, L2_2)
  L0_2 = nil
  L0_1 = L0_2
end
CloseInputDialog = L1_1
L1_1 = RegisterNUICallback
L2_1 = "inputData"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = A1_2
  L3_2 = 1
  L2_2(L3_2)
  L2_2 = Utils
  L2_2 = L2_2.resetNuiFocus
  L2_2()
  L2_2 = L0_1
  L3_2 = nil
  L0_1 = L3_2
  L4_2 = L2_2
  L3_2 = L2_2.resolve
  L5_2 = A0_2
  L3_2(L4_2, L5_2)
end
L1_1(L2_1, L3_1)