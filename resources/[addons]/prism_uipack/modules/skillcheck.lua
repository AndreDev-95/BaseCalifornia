local L0_1, L1_1, L2_1, L3_1
L0_1 = nil
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = L0_1
  if L3_2 then
    return
  end
  L3_2 = promise
  L4_2 = L3_2
  L3_2 = L3_2.new
  L3_2 = L3_2(L4_2)
  L0_1 = L3_2
  if not A2_2 then
    L3_2 = {}
    A2_2 = L3_2
  end
  L3_2 = Utils
  L3_2 = L3_2.setNuiFocus
  L4_2 = false
  L5_2 = true
  L3_2(L4_2, L5_2)
  L3_2 = SendNUIMessage
  L4_2 = {}
  L4_2.action = "startSkillCheck"
  L5_2 = {}
  L6_2 = A0_2 or L6_2
  if not A0_2 then
    L6_2 = {}
    L7_2 = "easy"
    L6_2[1] = L7_2
  end
  L5_2.difficulty = L6_2
  L6_2 = A1_2 or L6_2
  if not A1_2 then
    L6_2 = {}
    L7_2 = "e"
    L6_2[1] = L7_2
  end
  L5_2.keys = L6_2
  L6_2 = A2_2.label
  L5_2.label = L6_2
  L6_2 = A2_2.instruction
  L5_2.instruction = L6_2
  L6_2 = A2_2.type
  L5_2.type = L6_2
  L4_2.data = L5_2
  L3_2(L4_2)
  L3_2 = Citizen
  L3_2 = L3_2.Await
  L4_2 = L0_1
  return L3_2(L4_2)
end
SkillCheck = L1_1
function L1_1()
  local L0_2, L1_2
  L0_2 = L0_1
  if not L0_2 then
    L0_2 = error
    L1_2 = "No skillCheck is active"
    L0_2(L1_2)
  end
  L0_2 = SendNUIMessage
  L1_2 = {}
  L1_2.action = "skillCheckCancel"
  L0_2(L1_2)
end
CancelSkillCheck = L1_1
function L1_1()
  local L0_2, L1_2
  L0_2 = L0_1
  L0_2 = nil ~= L0_2
  return L0_2
end
SkillCheckActive = L1_1
L1_1 = RegisterNUICallback
L2_1 = "skillCheckOver"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = A1_2
  L3_2 = 1
  L2_2(L3_2)
  L2_2 = L0_1
  if L2_2 then
    L2_2 = Utils
    L2_2 = L2_2.resetNuiFocus
    L2_2()
    L2_2 = L0_1
    L3_2 = L2_2
    L2_2 = L2_2.resolve
    L4_2 = A0_2
    L2_2(L3_2, L4_2)
    L2_2 = nil
    L0_1 = L2_2
  end
end
L1_1(L2_1, L3_1)