
local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = {}
L1_1 = nil
function L2_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = A0_2.id
  if not L2_2 then
    L2_2 = error
    L3_2 = "No menu id was provided."
    L2_2(L3_2)
  end
  L2_2 = A0_2.title
  if not L2_2 then
    L2_2 = error
    L3_2 = "No menu title was provided."
    L2_2(L3_2)
  end
  L2_2 = A0_2.options
  if not L2_2 then
    L2_2 = error
    L3_2 = "No menu options were provided."
    L2_2(L3_2)
  end
  A0_2.cb = A1_2
  L3_2 = A0_2.id
  L2_2 = L0_1
  L2_2[L3_2] = A0_2
end
RegisterMenu = L2_1
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = L0_1
  L2_2 = L2_2[A0_2]
  if not L2_2 then
    L3_2 = error
    L4_2 = "No menu with id %s was found"
    L5_2 = L4_2
    L4_2 = L4_2.format
    L6_2 = A0_2
    L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2)
    L3_2(L4_2, L5_2, L6_2)
  end
  L3_2 = table
  L3_2 = L3_2.type
  L4_2 = L2_2.options
  L3_2 = L3_2(L4_2)
  if "empty" == L3_2 then
    L3_2 = error
    L4_2 = "Can't open empty menu with id %s"
    L5_2 = L4_2
    L4_2 = L4_2.format
    L6_2 = A0_2
    L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2)
    L3_2(L4_2, L5_2, L6_2)
  end
  L3_2 = L1_1
  if not L3_2 then
    L3_2 = Utils
    L3_2 = L3_2.game
    if "fivem" == L3_2 then
      L3_2 = 140
      if L3_2 then
        goto lbl_34
      end
    end
    L3_2 = 3809269511
    ::lbl_34::
    L4_2 = CreateThread
    function L5_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3
      L0_3 = PlayerId
      L0_3 = L0_3()
      while true do
        L1_3 = L1_1
        if not L1_3 then
          break
        end
        L1_3 = L1_1.disableInput
        if nil ~= L1_3 then
          L1_3 = L1_1.disableInput
          if not L1_3 then
            goto lbl_27
          end
        end
        L1_3 = DisablePlayerFiring
        L2_3 = L0_3
        L3_3 = true
        L1_3(L2_3, L3_3)
        L1_3 = Utils
        L1_3 = L1_3.game
        if "fivem" == L1_3 then
          L1_3 = HudWeaponWheelIgnoreSelection
          L1_3()
        end
        L1_3 = DisableControlAction
        L2_3 = 0
        L3_3 = L3_2
        L4_3 = true
        L1_3(L2_3, L3_3, L4_3)
        ::lbl_27::
        L1_3 = Wait
        L2_3 = 0
        L1_3(L2_3)
      end
    end
    L4_2(L5_2)
  end
  L1_1 = L2_2
  L3_2 = Utils
  L3_2 = L3_2.setNuiFocus
  L4_2 = L2_2.disableInput
  L4_2 = not L4_2
  L5_2 = true
  L3_2(L4_2, L5_2)
  L3_2 = SendNUIMessage
  L4_2 = {}
  L4_2.action = "setMenu"
  L5_2 = {}
  L6_2 = L2_2.position
  L5_2.position = L6_2
  L6_2 = L2_2.canClose
  L5_2.canClose = L6_2
  L6_2 = L2_2.title
  L5_2.title = L6_2
  L6_2 = L2_2.subtitle
  L5_2.subtitle = L6_2
  L6_2 = L2_2.options
  L5_2.items = L6_2
  if A1_2 then
    L6_2 = A1_2 - 1
    if L6_2 then
      goto lbl_68
    end
  end
  L6_2 = 0
  ::lbl_68::
  L5_2.startItemIndex = L6_2
  L4_2.data = L5_2
  L3_2(L4_2)
end
ShowMenu = L2_1
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = L1_1
  L2_2 = nil
  L1_1 = L2_2
  if not L1_2 then
    return
  end
  L2_2 = Utils
  L2_2 = L2_2.resetNuiFocus
  L2_2()
  if A0_2 then
    L2_2 = L1_2.onClose
    if L2_2 then
      L2_2 = L1_2.onClose
      L2_2()
    end
  end
  L2_2 = SendNUIMessage
  L3_2 = {}
  L3_2.action = "closeMenu"
  L2_2(L3_2)
end
HideMenu = L2_1
function L2_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2
  if A2_2 then
    L3_2 = L0_1
    L3_2 = L3_2[A0_2]
    L3_2 = L3_2.options
    L3_2[A2_2] = A1_2
  else
    L3_2 = A1_2[1]
    if not L3_2 then
      L3_2 = error
      L4_2 = "Invalid override format used, expected table of options."
      L3_2(L4_2)
    end
    L3_2 = L0_1
    L3_2 = L3_2[A0_2]
    L3_2.options = A1_2
  end
end
SetMenuOptions = L2_1
function L2_1()
  local L0_2, L1_2
  L0_2 = L1_1
  if L0_2 then
    L0_2 = L1_1.id
  end
  return L0_2
end
GetOpenMenu = L2_1
L2_1 = RegisterNUICallback
L3_1 = "confirmSelected"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = A1_2
  L3_2 = 1
  L2_2(L3_2)
  L2_2 = A0_2[1]
  L2_2 = L2_2 + 1
  A0_2[1] = L2_2
  L2_2 = A0_2[2]
  if L2_2 then
    L2_2 = A0_2[2]
    L2_2 = L2_2 + 1
    A0_2[2] = L2_2
  end
  L2_2 = L1_1
  if not L2_2 then
    return
  end
  L3_2 = L2_2.options
  L4_2 = A0_2[1]
  L3_2 = L3_2[L4_2]
  L3_2 = L3_2.close
  if false ~= L3_2 then
    L3_2 = Utils
    L3_2 = L3_2.resetNuiFocus
    L3_2()
    L3_2 = nil
    L1_1 = L3_2
  end
  L3_2 = L2_2.cb
  if L3_2 then
    L3_2 = L2_2.cb
    L4_2 = A0_2[1]
    L5_2 = A0_2[2]
    L6_2 = L2_2.options
    L7_2 = A0_2[1]
    L6_2 = L6_2[L7_2]
    L6_2 = L6_2.args
    L7_2 = A0_2[3]
    L3_2(L4_2, L5_2, L6_2, L7_2)
  end
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNUICallback
L3_1 = "changeIndex"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = A1_2
  L3_2 = 1
  L2_2(L3_2)
  L2_2 = L1_1
  if L2_2 then
    L2_2 = L1_1.onSideScroll
    if L2_2 then
      goto lbl_11
    end
  end
  do return end
  ::lbl_11::
  L2_2 = A0_2[1]
  L2_2 = L2_2 + 1
  A0_2[1] = L2_2
  L2_2 = A0_2[2]
  if L2_2 then
    L2_2 = A0_2[2]
    L2_2 = L2_2 + 1
    A0_2[2] = L2_2
  end
  L2_2 = L1_1.onSideScroll
  L3_2 = A0_2[1]
  L4_2 = A0_2[2]
  L5_2 = L1_1.options
  L6_2 = A0_2[1]
  L5_2 = L5_2[L6_2]
  L5_2 = L5_2.args
  L2_2(L3_2, L4_2, L5_2)
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNUICallback
L3_1 = "changeSelected"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = A1_2
  L3_2 = 1
  L2_2(L3_2)
  L2_2 = L1_1
  if L2_2 then
    L2_2 = L1_1.onSelected
    if L2_2 then
      goto lbl_11
    end
  end
  do return end
  ::lbl_11::
  L2_2 = A0_2[1]
  L2_2 = L2_2 + 1
  A0_2[1] = L2_2
  L2_2 = L1_1.options
  L3_2 = A0_2[1]
  L2_2 = L2_2[L3_2]
  L2_2 = L2_2.args
  if L2_2 then
    L3_2 = type
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    if "table" ~= L3_2 then
      L3_2 = error
      L4_2 = "Menu args must be passed as a table"
      return L3_2(L4_2)
    end
  end
  if not L2_2 then
    L3_2 = {}
    L2_2 = L3_2
  end
  L3_2 = A0_2[2]
  if L3_2 then
    L3_2 = A0_2[3]
    L2_2[L3_2] = true
  end
  L3_2 = A0_2[2]
  if L3_2 then
    L3_2 = L2_2.isCheck
    if not L3_2 then
      L3_2 = A0_2[2]
      L3_2 = L3_2 + 1
      A0_2[2] = L3_2
    end
  end
  L3_2 = L1_1.onSelected
  L4_2 = A0_2[1]
  L5_2 = A0_2[2]
  L6_2 = L2_2
  L3_2(L4_2, L5_2, L6_2)
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNUICallback
L3_1 = "changeChecked"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = A1_2
  L3_2 = 1
  L2_2(L3_2)
  L2_2 = L1_1
  if L2_2 then
    L2_2 = L1_1.onCheck
    if L2_2 then
      goto lbl_11
    end
  end
  do return end
  ::lbl_11::
  L2_2 = A0_2[1]
  L2_2 = L2_2 + 1
  A0_2[1] = L2_2
  L2_2 = L1_1.onCheck
  L3_2 = A0_2[1]
  L4_2 = A0_2[2]
  L5_2 = L1_1.options
  L6_2 = A0_2[1]
  L5_2 = L5_2[L6_2]
  L5_2 = L5_2.args
  L2_2(L3_2, L4_2, L5_2)
end
L2_1(L3_1, L4_1)
L2_1 = RegisterNUICallback
L3_1 = "closeMenu"
function L4_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = A1_2
  L3_2 = 1
  L2_2(L3_2)
  L2_2 = Utils
  L2_2 = L2_2.resetNuiFocus
  L2_2()
  L2_2 = L1_1
  if not L2_2 then
    return
  end
  L3_2 = nil
  L1_1 = L3_2
  L3_2 = L2_2.onClose
  if L3_2 then
    L3_2 = L2_2.onClose
    L4_2 = A0_2
    L3_2(L4_2)
  end
end
L2_1(L3_1, L4_1)

