local vampire = false

RegisterCommand("vampiro", function()
    vampire = not vampire

    lib.notify({
        title = "Vampiro",
        description = vampire and "Entraste no modo vampiro" or "Saíste do modo vampiro",
        type = "success"
    })
end)

CreateThread(function()
    while true do
        Wait(5000)

        if vampire then
            local hour = GetClockHours()

            if hour >= 6 and hour <= 18 then
                SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) - 2)
            else
                SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) + 1)
            end
        end
    end
end)