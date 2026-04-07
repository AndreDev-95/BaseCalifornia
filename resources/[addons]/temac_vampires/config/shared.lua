return {
    locale = 'pt-br',

    commandNames = {
        toggle = 'vampire',
        status = 'vstatus',
        cure = 'curevampire',
        adminSet = 'setvampire',
        adminRemove = 'removevampire',
        useBloodPouch = 'bloodpouch',
        useAntidote = 'antidote',
        useRing = 'daylightring'
    },

    keybinds = {
        feed = 'G',
        transform = 'J'
    },

    feeding = {
        maxDistance = 2.2,
        durationMs = 6500,
        bloodFromPlayer = 28,
        bloodFromNpc = 16,
        xpFromPlayer = 18,
        xpFromNpc = 8,
        cooldownMs = 12000
    },

    blood = {
        max = 100,
        start = 65,
        drainIntervalMs = 300000, -- 5 min
        drainAmount = 3,
        criticalThreshold = 20,
        starvingThreshold = 5,
        pouchRestore = 35
    },

    sun = {
        startsAt = 7,
        endsAt = 19,
        tickMs = 7000,
        damage = 8,
        criticalBloodExtraDamage = 4,
        ringDurationMs = 10 * 60 * 1000
    },

    night = {
        startsAt = 20,
        endsAt = 5,
        regenTickMs = 12000,
        regenAmount = 4
    },

    levels = {
        [1] = { label = 'Fledgling', xpRequired = 0, speedMultiplier = 1.05, meleeModifier = 1.10, regenBonus = 0 },
        [2] = { label = 'Stalker', xpRequired = 100, speedMultiplier = 1.10, meleeModifier = 1.20, regenBonus = 2 },
        [3] = { label = 'Elder', xpRequired = 250, speedMultiplier = 1.15, meleeModifier = 1.30, regenBonus = 4 },
        [4] = { label = 'Ancient', xpRequired = 500, speedMultiplier = 1.20, meleeModifier = 1.40, regenBonus = 6 }
    },

    items = {
        bloodPouch = 'vampire_blood_pouch',
        antidote = 'vampire_antidote',
        daylightRing = 'daylight_ring'
    },

    anims = {
        transform = {
            dict = 'missheist_agency2aig_13',
            clip = 'pickup_briefcase'
        },
        feed = {
            dict = 'mp_ped_interaction',
            clip = 'kisses_guy_a'
        }
    }
}
