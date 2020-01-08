RECIPE {
    type = "recipe",
    name = "mukmoux-pasture-mk02",
    energy_required = 0.5,
    enabled = false,
    ingredients = {
        {"mukmoux-pasture-mk01", 1},
        {"lead-plate", 10},
        {"latex", 20},
        {"neuroprocessor", 30},
        {"advanced-circuit", 10} --bob electronic-logic-board
    },
    results = {
        {"mukmoux-pasture-mk02", 1}
    }
}:add_unlock("mukmoux-mk02")

ITEM {
    type = "item",
    name = "mukmoux-pasture-mk02",
    icon = "__pyalienlife__/graphics/icons/mukmoux-pasture-mk02.png",
    icon_size = 64,
    flags = {},
    subgroup = "py-alienlife-buildings-mk02",
    order = "d",
    place_result = "mukmoux-pasture-mk02",
    stack_size = 10
}

ENTITY {
    type = "assembling-machine",
    name = "mukmoux-pasture-mk02",
    icon = "__pyalienlife__/graphics/icons/mukmoux-pasture-mk02.png",
    icon_size = 64,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "mukmoux-pasture-mk02"},
    fast_replaceable_group = "mukmoux-pasture",
    max_health = 100,
    corpse = "big-remnants",
    dying_explosion = "big-explosion",
    collision_box = {{-4.9, -4.9}, {4.9, 4.9}},
    selection_box = {{-5.0, -5.0}, {5.0, 5.0}},
    draw_entity_info_icon_background = false,
    match_animation_speed_to_activity = false,
    module_specification = {
        module_slots = 7
    },
    allowed_effects = {"speed"},
    crafting_categories = {"mukmoux"},
    crafting_speed = 0.01,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = 3,
    },
    energy_usage = "390kW",
    ingredient_count = 20,
    animation = {
        layers = {
            {
            filename = "__pycoalprocessing__/graphics/entity/mukmoux-pasture/mukmoux-pasture.png",
            width = 320,
            height = 363,
            frame_count = 1,
            line_length = 1,
            shift = {0.0, -0.5}
            },
            {
                filename = "__pycoalprocessing__/graphics/entity/mukmoux-pasture/mukmoux-mask.png",
                width = 320,
                height = 363,
                frame_count = 1,
                line_length = 1,
                shift = {0.0, -0.5},
                tint = {r = 1.0, g = 0.0, b = 0.0, a = 1.0}
            },
        },
    },
    working_visualisations = {
        {
            north_position = {-2.96, 1.93},
            west_position = {-2.96, 1.93},
            south_position = {-2.96, 1.93},
            east_position = {-2.96, 1.93},
            animation = {
                filename = "__pycoalprocessing__/graphics/entity/mukmoux-pasture/mukmoux-left.png",
                scale = 1.2,
                frame_count = 158,
                line_length = 26,
                width = 76,
                height = 138,
                animation_speed = 0.5
            }
        },
        {
            north_position = {1.78, 2.06},
            west_position = {1.78, 2.06},
            south_position = {1.78, 2.06},
            east_position = {1.78, 2.06},
            animation = {
                filename = "__pycoalprocessing__/graphics/entity/mukmoux-pasture/mukmoux-right.png",
                scale = 1.2,
                frame_count = 158,
                line_length = 14,
                width = 142,
                height = 128,
                animation_speed = 0.5
            }
        },
        {
            north_position = {1.28, -2.28},
            west_position = {1.28, -2.28},
            south_position = {1.28, -2.28},
            east_position = {1.28, -2.28},
            animation = {
                filename = "__pycoalprocessing__/graphics/entity/mukmoux-pasture/mukmoux-top.png",
                scale = 1.2,
                frame_count = 158,
                line_length = 20,
                width = 100,
                height = 47,
                animation_speed = 0.5
            }
        }
    },
    vehicle_impact_sound = {filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound = {
        sound = {filename = "__pycoalprocessing__/sounds/mukmoux-pasture.ogg", volume = 0.9},
        idle_sound = {filename = "__pycoalprocessing__/sounds/mukmoux-pasture.ogg", volume = 0.65},
        apparent_volume = 0.45
    }
}
