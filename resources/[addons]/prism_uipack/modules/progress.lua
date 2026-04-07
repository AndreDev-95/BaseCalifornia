local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1
L0_1 = nil
L1_1 = DisableControlAction
L2_1 = DisablePlayerFiring
L3_1 = LocalPlayer
L3_1 = L3_1.state
L4_1 = {}
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L2_2 = Utils
  L2_2 = L2_2.requestModel
  L3_2 = A1_2.model
  L2_2(L3_2)
  L2_2 = GetEntityCoords
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = CreateObject
  L4_2 = A1_2.model
  L5_2 = L2_2.x
  L6_2 = L2_2.y
  L7_2 = L2_2.z
  L7_2 = L7_2 + 0.95
  L8_2 = false
  L9_2 = false
  L10_2 = false
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
  L4_2 = AttachEntityToEntity
  L5_2 = L3_2
  L6_2 = A0_2
  L7_2 = GetPedBoneIndex
  L8_2 = A0_2
  L9_2 = A1_2.bone
  if not L9_2 then
    L9_2 = 60309
  end
  L7_2 = L7_2(L8_2, L9_2)
  L8_2 = A1_2.pos
  L8_2 = L8_2.x
  L9_2 = A1_2.pos
  L9_2 = L9_2.y
  L10_2 = A1_2.pos
  L10_2 = L10_2.z
  L11_2 = A1_2.rot
  L11_2 = L11_2.x
  L12_2 = A1_2.rot
  L12_2 = L12_2.y
  L13_2 = A1_2.rot
  L13_2 = L13_2.z
  L14_2 = true
  L15_2 = true
  L16_2 = false
  L17_2 = true
  L18_2 = A1_2.rotOrder
  if not L18_2 then
    L18_2 = 0
  end
  L19_2 = true
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
  L4_2 = SetModelAsNoLongerNeeded
  L5_2 = A1_2.model
  L4_2(L5_2)
  return L3_2
end
function L6_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = PlayerPedId
  L1_2 = L1_2()
  L2_2 = A0_2.useWhileDead
  if not L2_2 then
    L2_2 = IsEntityDead
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      L2_2 = true
      return L2_2
    end
  end
  L2_2 = A0_2.allowRagdoll
  if not L2_2 then
    L2_2 = IsPedRagdoll
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      L2_2 = true
      return L2_2
    end
  end
  L2_2 = A0_2.allowCuffed
  if not L2_2 then
    L2_2 = IsPedCuffed
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      L2_2 = true
      return L2_2
    end
  end
  L2_2 = A0_2.allowFalling
  if not L2_2 then
    L2_2 = IsPedFalling
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      L2_2 = true
      return L2_2
    end
  end
  L2_2 = A0_2.allowSwimming
  if not L2_2 then
    L2_2 = IsPedSwimming
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 then
      L2_2 = true
      return L2_2
    end
  end
end
L7_1 = {}
L7_1.INPUT_LOOK_LR = 1
L7_1.INPUT_LOOK_UD = 2
L7_1.INPUT_SPRINT = 21
L7_1.INPUT_AIM = 25
L7_1.INPUT_MOVE_LR = 30
L7_1.INPUT_MOVE_UD = 31
L7_1.INPUT_DUCK = 36
L7_1.INPUT_VEH_MOVE_LEFT_ONLY = 63
L7_1.INPUT_VEH_MOVE_RIGHT_ONLY = 64
L7_1.INPUT_VEH_ACCELERATE = 71
L7_1.INPUT_VEH_BRAKE = 72
L7_1.INPUT_VEH_EXIT = 75
L7_1.INPUT_VEH_MOUSE_CONTROL_OVERRIDE = 106
function L8_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L3_1.invBusy = true
  L0_1 = A0_2
  L1_2 = A0_2.anim
  if L1_2 then
    L2_2 = L1_2.dict
    if L2_2 then
      L2_2 = Utils
      L2_2 = L2_2.requestAnimDict
      L3_2 = L1_2.dict
      L2_2(L3_2)
      L2_2 = TaskPlayAnim
      L3_2 = PlayerPedId
      L3_2 = L3_2()
      L4_2 = L1_2.dict
      L5_2 = L1_2.clip
      L6_2 = L1_2.blendIn
      if not L6_2 then
        L6_2 = 3.0
      end
      L7_2 = L1_2.blendOut
      if not L7_2 then
        L7_2 = 1.0
      end
      L8_2 = L1_2.duration
      if not L8_2 then
        L8_2 = -1
      end
      L9_2 = L1_2.flag
      if not L9_2 then
        L9_2 = 49
      end
      L10_2 = L1_2.playbackRate
      if not L10_2 then
        L10_2 = 0
      end
      L11_2 = L1_2.lockX
      L12_2 = L1_2.lockY
      L13_2 = L1_2.lockZ
      L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
      L2_2 = RemoveAnimDict
      L3_2 = L1_2.dict
      L2_2(L3_2)
    else
      L2_2 = L1_2.scenario
      if L2_2 then
        L2_2 = TaskStartScenarioInPlace
        L3_2 = PlayerPedId
        L3_2 = L3_2()
        L4_2 = L1_2.scenario
        L5_2 = 0
        L6_2 = L1_2.playEnter
        L6_2 = nil == L6_2 or L6_2
        L2_2(L3_2, L4_2, L5_2, L6_2)
      end
    end
  end
  L2_2 = A0_2.prop
  if L2_2 then
    L2_2 = L3_1
    L3_2 = L2_2
    L2_2 = L2_2.set
    L4_2 = "prism:progressProps"
    L5_2 = A0_2.prop
    L6_2 = true
    L2_2(L3_2, L4_2, L5_2, L6_2)
  end
  L2_2 = A0_2.disable
  L3_2 = GetGameTimer
  L3_2 = L3_2()
  L4_2 = PlayerId
  L4_2 = L4_2()
  while true do
    L5_2 = L0_1
    if not L5_2 then
      break
    end
    if L2_2 then
      L5_2 = L2_2.mouse
      if L5_2 then
        L5_2 = L1_1
        L6_2 = 0
        L7_2 = L7_1.INPUT_LOOK_LR
        L8_2 = true
        L5_2(L6_2, L7_2, L8_2)
        L5_2 = L1_1
        L6_2 = 0
        L7_2 = L7_1.INPUT_LOOK_UD
        L8_2 = true
        L5_2(L6_2, L7_2, L8_2)
        L5_2 = L1_1
        L6_2 = 0
        L7_2 = L7_1.INPUT_VEH_MOUSE_CONTROL_OVERRIDE
        L8_2 = true
        L5_2(L6_2, L7_2, L8_2)
      end
      L5_2 = L2_2.move
      if L5_2 then
        L5_2 = L1_1
        L6_2 = 0
        L7_2 = L7_1.INPUT_SPRINT
        L8_2 = true
        L5_2(L6_2, L7_2, L8_2)
        L5_2 = L1_1
        L6_2 = 0
        L7_2 = L7_1.INPUT_MOVE_LR
        L8_2 = true
        L5_2(L6_2, L7_2, L8_2)
        L5_2 = L1_1
        L6_2 = 0
        L7_2 = L7_1.INPUT_MOVE_UD
        L8_2 = true
        L5_2(L6_2, L7_2, L8_2)
        L5_2 = L1_1
        L6_2 = 0
        L7_2 = L7_1.INPUT_DUCK
        L8_2 = true
        L5_2(L6_2, L7_2, L8_2)
      end
      L5_2 = L2_2.sprint
      if L5_2 then
        L5_2 = L2_2.move
        if not L5_2 then
          L5_2 = L1_1
          L6_2 = 0
          L7_2 = L7_1.INPUT_SPRINT
          L8_2 = true
          L5_2(L6_2, L7_2, L8_2)
        end
      end
      L5_2 = L2_2.car
      if L5_2 then
        L5_2 = L1_1
        L6_2 = 0
        L7_2 = L7_1.INPUT_VEH_MOVE_LEFT_ONLY
        L8_2 = true
        L5_2(L6_2, L7_2, L8_2)
        L5_2 = L1_1
        L6_2 = 0
        L7_2 = L7_1.INPUT_VEH_MOVE_RIGHT_ONLY
        L8_2 = true
        L5_2(L6_2, L7_2, L8_2)
        L5_2 = L1_1
        L6_2 = 0
        L7_2 = L7_1.INPUT_VEH_ACCELERATE
        L8_2 = true
        L5_2(L6_2, L7_2, L8_2)
        L5_2 = L1_1
        L6_2 = 0
        L7_2 = L7_1.INPUT_VEH_BRAKE
        L8_2 = true
        L5_2(L6_2, L7_2, L8_2)
        L5_2 = L1_1
        L6_2 = 0
        L7_2 = L7_1.INPUT_VEH_EXIT
        L8_2 = true
        L5_2(L6_2, L7_2, L8_2)
      end
      L5_2 = L2_2.combat
      if L5_2 then
        L5_2 = L1_1
        L6_2 = 0
        L7_2 = L7_1.INPUT_AIM
        L8_2 = true
        L5_2(L6_2, L7_2, L8_2)
        L5_2 = L2_1
        L6_2 = L4_2
        L7_2 = true
        L5_2(L6_2, L7_2)
      end
    end
    L5_2 = L6_1
    L6_2 = L0_1
    L5_2 = L5_2(L6_2)
    if L5_2 then
      L5_2 = false
      L0_1 = L5_2
    end
    L5_2 = Wait
    L6_2 = 0
    L5_2(L6_2)
  end
  L5_2 = A0_2.prop
  if L5_2 then
    L5_2 = L3_1
    L6_2 = L5_2
    L5_2 = L5_2.set
    L7_2 = "prism:progressProps"
    L8_2 = nil
    L9_2 = true
    L5_2(L6_2, L7_2, L8_2, L9_2)
  end
  if L1_2 then
    L5_2 = L1_2.dict
    if L5_2 then
      L5_2 = StopAnimTask
      L6_2 = PlayerPedId
      L6_2 = L6_2()
      L7_2 = L1_2.dict
      L8_2 = L1_2.clip
      L9_2 = 1.0
      L5_2(L6_2, L7_2, L8_2, L9_2)
      L5_2 = Wait
      L6_2 = 0
      L5_2(L6_2)
    else
      L5_2 = ClearPedTasks
      L6_2 = PlayerPedId
      L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L6_2()
      L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
    end
  end
  L3_1.invBusy = false
  L5_2 = L0_1
  L5_2 = GetGameTimer
  L5_2 = L5_2()
  L5_2 = L5_2 - L3_2
  L5_2 = false ~= L5_2 and L5_2
  L6_2 = L0_1
  if false ~= L6_2 then
    L6_2 = A0_2.duration
    if not (L5_2 <= L6_2) then
      goto lbl_239
    end
  end
  L6_2 = SendNUIMessage
  L7_2 = {}
  L7_2.action = "progressCancel"
  L6_2(L7_2)
  L6_2 = false
  do return L6_2 end
  ::lbl_239::
  L6_2 = true
  return L6_2
end
function L9_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  while true do
    L1_2 = L0_1
    if nil == L1_2 then
      break
    end
    L1_2 = Wait
    L2_2 = 0
    L1_2(L2_2)
  end
  L1_2 = L6_1
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L1_2 = SendNUIMessage
    L2_2 = {}
    L2_2.action = "progress"
    L3_2 = {}
    L4_2 = A0_2.label
    L3_2.label = L4_2
    L4_2 = A0_2.duration
    L3_2.duration = L4_2
    L4_2 = A0_2.position
    L3_2.position = L4_2
    L4_2 = A0_2.variant
    L3_2.variant = L4_2
    L4_2 = A0_2.canCancel
    L3_2.canCancel = L4_2
    L2_2.data = L3_2
    L1_2(L2_2)
    L1_2 = L8_1
    L2_2 = A0_2
    return L1_2(L2_2)
  end
end
ProgressBar = L9_1
function L9_1(A0_2)
  local L1_2, L2_2
  L1_2 = ProgressBar
  L2_2 = A0_2
  L1_2(L2_2)
end
ProgressCircle = L9_1
function L9_1()
  local L0_2, L1_2
  L0_2 = L0_1
  if not L0_2 then
    L0_2 = error
    L1_2 = "No progress bar is active"
    L0_2(L1_2)
  end
  L0_2 = false
  L0_1 = L0_2
end
CancelProgress = L9_1
function L9_1()
  local L0_2, L1_2
  L0_2 = L0_1
  if L0_2 then
    L0_2 = true
  end
  return L0_2
end
ProgressActive = L9_1
L9_1 = RegisterNUICallback
L10_1 = "progressComplete"
function L11_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = A1_2
  L3_2 = 1
  L2_2(L3_2)
  L2_2 = nil
  L0_1 = L2_2
end
L9_1(L10_1, L11_1)
L9_1 = RegisterCommand
L10_1 = "cancelprogress_prism"
function L11_1()
  local L0_2, L1_2
  L0_2 = L0_1
  if L0_2 then
    L0_2 = L0_2.canCancel
  end
  if L0_2 then
    L0_2 = false
    L0_1 = L0_2
  end
end
L12_1 = false
L9_1(L10_1, L11_1, L12_1)
L9_1 = RegisterKeyMapping
L10_1 = "cancelprogress_prism"
L11_1 = "Cancel Progressbar"
L12_1 = "keyboard"
L13_1 = GetConvar
L14_1 = "prism:progressCancelKey"
L15_1 = "X"
L13_1, L14_1, L15_1 = L13_1(L14_1, L15_1)
L9_1(L10_1, L11_1, L12_1, L13_1, L14_1, L15_1)
function L9_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = L4_1
  L1_2 = L1_2[A0_2]
  if not L1_2 then
    return
  end
  L2_2 = 1
  L3_2 = #L1_2
  L4_2 = 1
  for L5_2 = L2_2, L3_2, L4_2 do
    L6_2 = L1_2[L5_2]
    L7_2 = DoesEntityExist
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    if L7_2 then
      L7_2 = DeleteEntity
      L8_2 = L6_2
      L7_2(L8_2)
    end
  end
  L2_2 = L4_1
  L2_2[A0_2] = nil
end
L10_1 = RegisterNetEvent
L11_1 = "onPlayerDropped"
function L12_1(A0_2)
  local L1_2, L2_2
  L1_2 = L9_1
  L2_2 = A0_2
  L1_2(L2_2)
end
L10_1(L11_1, L12_1)
L10_1 = AddStateBagChangeHandler
L11_1 = "prism:progressProps"
L12_1 = nil
function L13_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  if A4_2 then
    return
  end
  L5_2 = GetPlayerFromStateBagName
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  if 0 == L5_2 then
    return
  end
  L6_2 = GetPlayerPed
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  L7_2 = GetPlayerServerId
  L8_2 = L5_2
  L7_2 = L7_2(L8_2)
  if not A2_2 then
    L8_2 = L9_1
    L9_2 = L7_2
    return L8_2(L9_2)
  end
  L8_2 = L4_1
  L9_2 = {}
  L8_2[L7_2] = L9_2
  L8_2 = L4_1
  L8_2 = L8_2[L7_2]
  L9_2 = A2_2.model
  if L9_2 then
    L9_2 = #L8_2
    L9_2 = L9_2 + 1
    L10_2 = L5_1
    L11_2 = L6_2
    L12_2 = A2_2
    L10_2 = L10_2(L11_2, L12_2)
    L8_2[L9_2] = L10_2
  else
    L9_2 = 1
    L10_2 = #A2_2
    L11_2 = 1
    for L12_2 = L9_2, L10_2, L11_2 do
      L13_2 = A2_2[L12_2]
      if L13_2 then
        L14_2 = #L8_2
        L14_2 = L14_2 + 1
        L15_2 = L5_1
        L16_2 = L6_2
        L17_2 = L13_2
        L15_2 = L15_2(L16_2, L17_2)
        L8_2[L14_2] = L15_2
      end
    end
  end
end
L10_1(L11_1, L12_1, L13_1)

