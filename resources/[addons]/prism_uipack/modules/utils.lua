local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1
L0_1 = {}
Utils = L0_1
L0_1 = Utils
L1_1 = GetGameName
L1_1 = L1_1()
L0_1.game = L1_1
L0_1 = Utils
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L3_2 = A0_2
  L3_2 = L3_2()
  if nil ~= L3_2 then
    return L3_2
  end
  if A2_2 or nil == A2_2 then
    L4_2 = type
    L5_2 = A2_2
    L4_2 = L4_2(L5_2)
    if "number" ~= L4_2 then
      A2_2 = 1000
    end
  end
  L4_2 = A2_2 or L4_2
  if A2_2 then
    L4_2 = GetGameTimer
    L4_2 = L4_2()
  end
  while nil == L3_2 do
    L5_2 = Wait
    L6_2 = 0
    L5_2(L6_2)
    L5_2 = A2_2 or L5_2
    if A2_2 then
      L5_2 = GetGameTimer
      L5_2 = L5_2()
      L5_2 = L5_2 - L4_2
    end
    if L5_2 and A2_2 < L5_2 then
      L6_2 = error
      L7_2 = "%s (waited %.1fms)"
      L8_2 = L7_2
      L7_2 = L7_2.format
      L9_2 = A1_2 or L9_2
      if not A1_2 then
        L9_2 = "failed to resolve callback"
      end
      L10_2 = L5_2
      L7_2 = L7_2(L8_2, L9_2, L10_2)
      L8_2 = 2
      return L6_2(L7_2, L8_2)
    end
    L6_2 = A0_2
    L6_2 = L6_2()
    L3_2 = L6_2
  end
  return L3_2
end
L0_1.waitFor = L1_1
L0_1 = Utils
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = Utils
  L2_2 = L2_2.waitFor
  function L3_2()
    local L0_3, L1_3, L2_3
    L0_3 = RequestScriptAudioBank
    L1_3 = A0_2
    L2_3 = false
    L0_3 = L0_3(L1_3, L2_3)
    if L0_3 then
      L0_3 = A0_2
      return L0_3
    end
  end
  L4_2 = [[
failed to load audiobank '%s' - this may be caused by
- too many loaded assets
- oversized, invalid, or corrupted assets]]
  L5_2 = L4_2
  L4_2 = L4_2.format
  L6_2 = A0_2
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = A1_2 or L5_2
  if not A1_2 then
    L5_2 = 30000
  end
  return L2_2(L3_2, L4_2, L5_2)
end
L0_1.requestAudioBank = L1_1
L0_1 = Utils
function L1_1(A0_2, A1_2, A2_2, A3_2, A4_2, ...)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L5_2 = A1_2
  L6_2 = A3_2
  L5_2 = L5_2(L6_2)
  if L5_2 then
    return A3_2
  end
  L5_2 = A0_2
  L6_2 = A3_2
  L7_2, L8_2, L9_2, L10_2 = ...
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  L5_2 = Utils
  L5_2 = L5_2.waitFor
  function L6_2()
    local L0_3, L1_3
    L0_3 = A1_2
    L1_3 = A3_2
    L0_3 = L0_3(L1_3)
    if L0_3 then
      L0_3 = A3_2
      return L0_3
    end
  end
  L7_2 = [[
failed to load %s '%s' - this may be caused by
- too many loaded assets
- oversized, invalid, or corrupted assets]]
  L8_2 = L7_2
  L7_2 = L7_2.format
  L9_2 = A2_2
  L10_2 = A3_2
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  L8_2 = A4_2 or L8_2
  if not A4_2 then
    L8_2 = 30000
  end
  return L5_2(L6_2, L7_2, L8_2)
end
L0_1.streamingRequest = L1_1
L0_1 = Utils
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = HasAnimDictLoaded
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    return A0_2
  end
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if "string" ~= L2_2 then
    L2_2 = error
    L3_2 = "expected animDict to have type 'string' (received %s)"
    L4_2 = L3_2
    L3_2 = L3_2.format
    L5_2 = type
    L6_2 = A0_2
    L5_2, L6_2, L7_2 = L5_2(L6_2)
    L3_2, L4_2, L5_2, L6_2, L7_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  end
  L2_2 = DoesAnimDictExist
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = error
    L3_2 = "attempted to load invalid animDict '%s'"
    L4_2 = L3_2
    L3_2 = L3_2.format
    L5_2 = A0_2
    L3_2, L4_2, L5_2, L6_2, L7_2 = L3_2(L4_2, L5_2)
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  end
  L2_2 = Utils
  L2_2 = L2_2.streamingRequest
  L3_2 = RequestAnimDict
  L4_2 = HasAnimDictLoaded
  L5_2 = "animDict"
  L6_2 = A0_2
  L7_2 = A1_2
  return L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
end
L0_1.requestAnimDict = L1_1
L0_1 = Utils
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = type
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if "number" ~= L2_2 then
    L2_2 = joaat
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    A0_2 = L2_2
  end
  L2_2 = HasModelLoaded
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    return A0_2
  end
  L2_2 = IsModelValid
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = IsModelInCdimage
    L3_2 = A0_2
    L2_2 = L2_2(L3_2)
    if not L2_2 then
      L2_2 = error
      L3_2 = "attempted to load invalid model '%s'"
      L4_2 = L3_2
      L3_2 = L3_2.format
      L5_2 = A0_2
      L3_2, L4_2, L5_2, L6_2, L7_2 = L3_2(L4_2, L5_2)
      L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
    end
  end
  L2_2 = Utils
  L2_2 = L2_2.streamingRequest
  L3_2 = RequestModel
  L4_2 = HasModelLoaded
  L5_2 = "model"
  L6_2 = A0_2
  L7_2 = A1_2
  return L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
end
L0_1.requestModel = L1_1
L0_1 = IsNuiFocusKeepingInput
L0_1 = L0_1()
L1_1 = Utils
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = IsNuiFocusKeepingInput
  L2_2 = L2_2()
  L0_1 = L2_2
  L2_2 = SetNuiFocus
  L3_2 = true
  L4_2 = not A1_2
  L2_2(L3_2, L4_2)
  L2_2 = SetNuiFocusKeepInput
  L3_2 = A0_2
  L2_2(L3_2)
end
L1_1.setNuiFocus = L2_1
L1_1 = Utils
function L2_1()
  local L0_2, L1_2, L2_2
  L0_2 = SetNuiFocus
  L1_2 = false
  L2_2 = false
  L0_2(L1_2, L2_2)
  L0_2 = SetNuiFocusKeepInput
  L1_2 = L0_1
  L0_2(L1_2)
end
L1_1.resetNuiFocus = L2_1
L1_1 = {}
L2_1 = IsPauseMenuActive
L3_1 = GetControlInstructionalButton
L4_1 = {}
L4_1.disabled = false
L4_1.isPressed = false
L4_1.defaultKey = ""
L4_1.defaultMapper = "keyboard"
function L5_1(A0_2, A1_2)
  local L2_2, L3_2
  if "currentKey" == A1_2 then
    L3_2 = A0_2
    L2_2 = A0_2.getCurrentKey
    L2_2 = L2_2(L3_2)
    if L2_2 then
      goto lbl_9
    end
  end
  L2_2 = L4_1
  L2_2 = L2_2[A1_2]
  ::lbl_9::
  return L2_2
end
L4_1.__index = L5_1
function L5_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = L3_1
  L2_2 = 0
  L3_2 = A0_2.hash
  L4_2 = true
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  L2_2 = L1_2
  L1_2 = L1_2.sub
  L3_2 = 3
  return L1_2(L2_2, L3_2)
end
L4_1.getCurrentKey = L5_1
function L5_1(A0_2)
  local L1_2
  L1_2 = A0_2.isPressed
  return L1_2
end
L4_1.isControlPressed = L5_1
function L5_1(A0_2, A1_2)
  A0_2.disabled = A1_2
end
L4_1.disable = L5_1
L5_1 = Utils
function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = joaat
  L2_2 = "+"
  L3_2 = A0_2.name
  L2_2 = L2_2 .. L3_2
  L1_2 = L1_2(L2_2)
  L1_2 = L1_2 | 2147483648
  A0_2.hash = L1_2
  L2_2 = A0_2.name
  L1_2 = L1_1
  L3_2 = setmetatable
  L4_2 = A0_2
  L5_2 = L4_1
  L3_2 = L3_2(L4_2, L5_2)
  L1_2[L2_2] = L3_2
  L1_2 = RegisterCommand
  L2_2 = "+"
  L3_2 = A0_2.name
  L2_2 = L2_2 .. L3_2
  function L3_2()
    local L0_3, L1_3
    L0_3 = A0_2.disabled
    if not L0_3 then
      L0_3 = L2_1
      L0_3 = L0_3()
      if not L0_3 then
        goto lbl_9
      end
    end
    do return end
    ::lbl_9::
    A0_2.isPressed = true
    L0_3 = A0_2.onPressed
    if L0_3 then
      L0_3 = A0_2
      L1_3 = L0_3
      L0_3 = L0_3.onPressed
      L0_3(L1_3)
    end
  end
  L1_2(L2_2, L3_2)
  L1_2 = RegisterCommand
  L2_2 = "-"
  L3_2 = A0_2.name
  L2_2 = L2_2 .. L3_2
  function L3_2()
    local L0_3, L1_3
    L0_3 = A0_2.disabled
    if not L0_3 then
      L0_3 = L2_1
      L0_3 = L0_3()
      if not L0_3 then
        goto lbl_9
      end
    end
    do return end
    ::lbl_9::
    A0_2.isPressed = false
    L0_3 = A0_2.onReleased
    if L0_3 then
      L0_3 = A0_2
      L1_3 = L0_3
      L0_3 = L0_3.onReleased
      L0_3(L1_3)
    end
  end
  L1_2(L2_2, L3_2)
  L1_2 = RegisterKeyMapping
  L2_2 = "+"
  L3_2 = A0_2.name
  L2_2 = L2_2 .. L3_2
  L3_2 = A0_2.description
  L4_2 = A0_2.defaultMapper
  L5_2 = A0_2.defaultKey
  L1_2(L2_2, L3_2, L4_2, L5_2)
  L1_2 = A0_2.secondaryKey
  if L1_2 then
    L1_2 = RegisterKeyMapping
    L2_2 = "~!+"
    L3_2 = A0_2.name
    L2_2 = L2_2 .. L3_2
    L3_2 = A0_2.description
    L4_2 = A0_2.secondaryMapper
    if not L4_2 then
      L4_2 = A0_2.defaultMapper
    end
    L5_2 = A0_2.secondaryKey
    L1_2(L2_2, L3_2, L4_2, L5_2)
  end
  L1_2 = SetTimeout
  L2_2 = 500
  function L3_2()
    local L0_3, L1_3, L2_3, L3_3, L4_3
    L0_3 = TriggerEvent
    L1_3 = "chat:removeSuggestion"
    L2_3 = "/+%s"
    L3_3 = L2_3
    L2_3 = L2_3.format
    L4_3 = A0_2.name
    L2_3, L3_3, L4_3 = L2_3(L3_3, L4_3)
    L0_3(L1_3, L2_3, L3_3, L4_3)
    L0_3 = TriggerEvent
    L1_3 = "chat:removeSuggestion"
    L2_3 = "/-%s"
    L3_3 = L2_3
    L2_3 = L2_3.format
    L4_3 = A0_2.name
    L2_3, L3_3, L4_3 = L2_3(L3_3, L4_3)
    L0_3(L1_3, L2_3, L3_3, L4_3)
  end
  L1_2(L2_2, L3_2)
  return A0_2
end
L5_1.addKeybind = L6_1
L5_1 = Utils
function L6_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L1_2 = {}
  L2_2 = 1
  L3_2 = #A0_2
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = A0_2[L5_2]
    L7_2 = {}
    L8_2 = pairs
    L9_2 = L6_2
    L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
    for L12_2, L13_2 in L8_2, L9_2, L10_2, L11_2 do
      L14_2 = type
      L15_2 = L13_2
      L14_2 = L14_2(L15_2)
      if "function" ~= L14_2 and "onSelect" ~= L12_2 then
        L7_2[L12_2] = L13_2
      end
    end
    L8_2 = #L1_2
    L8_2 = L8_2 + 1
    L1_2[L8_2] = L7_2
  end
  return L1_2
end
L5_1.sanitizeItems = L6_1