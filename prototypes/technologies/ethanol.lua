TECHNOLOGY {
    type = "technology",
    name = "ethanol",
    icon = "__pyalienlifegraphics2__/graphics/technology/ethanol.png",
    icon_size = 128,
    order = "c-a",
    prerequisites = {},
    effects = {},
    unit = {
        count = 300,
        ingredients = {
            {"automation-science-pack", 3},
            {"logistic-science-pack", 2},
            {"chemical-science-pack", 1},
            -- {'py-science-pack-3', 1},
        },
        time = 50
    }
}
