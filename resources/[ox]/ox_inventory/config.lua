Prism = {}

Prism.ProfileType = 'discord'-- ( 'discord', 'steam', 'mugshot' ) if mugshot you need to have a dependency installed https://github.com/BaziForYou/MugShotBase64
Prism.UseCitizenId = false -- ( Use citizen id instead of player server id ( Only enable for QBcore or Qbox ))
Prism.UseNativeLabeling = true -- ( Use native Inventory labeling for secondary inventory )
Prism.mouseTrailActive = {
    enabled = true,
    color = {
        r = 30,
        g = 144,
        b = 255,
    }
}

Prism.ThemeSettings = {
    PrimaryColor = '#1e90ff',
    buttonGradients = {
        gradient = 'linear-gradient(135deg, #7bbdff 0%, #1e90ff 100%)',
        shadow = 'rgba(50, 135, 205, 0.4)',
        text = '#000'
    },
    money = {
        money = '#BEEE11',
        blackMoney = '#EE1111',
    }
}

Prism.ItemNotificationConfig = {
    position = 'right-center', -- 'top-left, top-center, top-right, left-center, left-bottom, bottom-center, right-bottom, right-center'
    duration = 2500
}

Prism.Texts = {
    Header = 'INVENTORY',
    Pockets = 'POCKETS',
    PocketsDescription = 'Items on your character',
    Hotbar = 'HOTBAR',
    HotbarDescription = 'Quickly equip your items',
    Secondary = 'SECONDARY',
    SecondaryDescription = 'Store necessary assets',
    Close_header_1 = 'Close',
    Close_header_2 = 'Inventory',
    labels = {
        item = 'Item',
        weapon = 'Weapon',
    }
}