local FUN = require '__pycoalprocessing__/prototypes/functions/functions'

local pyAE = (data and mods.pyalternativeenergy) or (script and script.active_mods.pyalternativeenergy)

if data then
    local recipe = table.deepcopy(data.raw.recipe['yotoi-seeds'])
    recipe.name = 'yotoi-seeds-cold'
    FUN.add_ingredient(recipe, {type = 'fluid', name = 'cold-air', amount = 30})
    FUN.multiply_result_amount(recipe, 'yotoi-seeds', 2)
    recipe.energy_required = recipe.energy_required * 4
    data:extend{recipe}

    for i, recipe in pairs({
        table.deepcopy(data.raw.recipe['yotoi-1']),
        table.deepcopy(data.raw.recipe['yotoi-2']),
        table.deepcopy(data.raw.recipe['yotoi-3']),
        table.deepcopy(data.raw.recipe['yotoi-4']),
    }) do
        recipe.name = recipe.name .. '-free-leaves'
        FUN.add_ingredient(recipe, {'burner-inserter', 1})
        FUN.add_result(recipe, {name = 'yotoi-leaves', amount = i * 2, type = 'item'})
        recipe.main_product = 'yotoi-leaves'
        data:extend{recipe}
    end

    data:extend{
        {
            type = 'item',
            name = 'nutrient',
            icon_size = 64,
            icon = '__pyalienlifegraphics__/graphics/icons/nutrient.png',
            stack_size = 50,
            subgroup = 'py-alienlife-items'
        },
        {
            type = 'recipe',
            enabled = false,
            energy_required = 40,
            result = 'nutrient',
            name = 'nutrient',
            category = 'electronic',
            ingredients = {
                {type = 'item', name = 'soil', amount = 100},
                {type = 'fluid', name = 'manure-bacteria', amount = 100},
                {type = 'fluid', name = 'etching', amount = 100},
                {type = 'item', name = (pyAE and 'silica-shell' or 'stone'), amount = 15},
                {type = 'item', name = (pyAE and 'polycrystalline-plate' or 'stone'), amount = 40},
                {type = 'item', name = (pyAE and 'electronics-mk03' or 'stone'), amount = 10},
                {type = 'item', name = (pyAE and 'controler-mk03' or 'stone'), amount = 1},
                {type = 'item', name = (pyAE and 'polycrystalline-cell' or 'stone'), amount = 12},
                {type = 'item', name = 'processing-unit', amount = 40},
            }
        }
    }

    for _, recipe in pairs({
        table.deepcopy(data.raw.recipe['yotoi-2']),
        table.deepcopy(data.raw.recipe['yotoi-3']),
        table.deepcopy(data.raw.recipe['yotoi-4']),
        table.deepcopy(data.raw.recipe['yotoi-fruit-2']),
        table.deepcopy(data.raw.recipe['yotoi-fruit-3']),
        table.deepcopy(data.raw.recipe['yotoi-fruit-4']),
    }) do
        recipe.name = recipe.name .. '-nutrient'
        FUN.remove_ingredient(recipe, 'fertilizer')
        FUN.add_result_amount(recipe, 'yotoi', 1)
        FUN.add_result_amount(recipe, 'yotoi-fruit', 1)
        data:extend{recipe}
    end

    for i, recipe in pairs({
        table.deepcopy(data.raw.recipe['yotoi-aloe-orchard-mk01']),
        table.deepcopy(data.raw.recipe['yotoi-aloe-orchard-mk02']),
        table.deepcopy(data.raw.recipe['yotoi-aloe-orchard-mk03']),
        table.deepcopy(data.raw.recipe['yotoi-aloe-orchard-mk04']),
    }) do
        recipe.name = recipe.name .. '-with-nutrient'
        FUN.add_ingredient(recipe, {'nutrient', 10 * i})
        data:extend{recipe}
    end
end

return {
    affected_entities = { -- the entities that should be effected by this tech upgrade
        'yotoi-aloe-orchard-mk01',
        'yotoi-aloe-orchard-mk02',
        'yotoi-aloe-orchard-mk03',
        'yotoi-aloe-orchard-mk04',
    },
    master_tech = { -- tech that is shown in the tech tree
        name = 'yotoi-upgrade',
        icon = '__pyalienlifegraphics3__/graphics/technology/updates/u-yotoi.png',
        icon_size = 128,
        order = 'c-a',
        prerequisites = {'yotoi-mk02', 'machine-components-mk03'},
        unit = {
            count = 500,
            ingredients = {
                {'automation-science-pack', 1},
                {'py-science-pack-1', 1},
                {'logistic-science-pack', 1},
                {'military-science-pack', 1},
                {'py-science-pack-2', 1},
                {'chemical-science-pack', 1},
                {'py-science-pack-3', 1},
            },
            time = 45
        }
    },
    sub_techs = {
        {
            name = 'cryopreservation',
            icon = '__pyalienlifegraphics3__/graphics/technology/cryopreservation.png',
            icon_size = 128,
            order = 'c-a',
            effects = { -- the effects the tech will have on the building. valid types: 'module-effects', 'unlock-recipe', 'lock-recipe', 'recipe-replacement'
                {old = 'yotoi-seeds', new = 'yotoi-seeds-cold', type = 'recipe-replacement'}
            },
        },
        {
            name = 'harvest',
            icon = '__pyalienlifegraphics3__/graphics/technology/harvest.png',
            icon_size = 128,
            order = 'c-a',
            effects = { -- the effects the tech will have on the building. valid types: 'module-effects', 'unlock-recipe', 'lock-recipe', 'recipe-replacement'
                {old = 'yotoi-1', new = 'yotoi-1-free-leaves', type = 'recipe-replacement'},
                {old = 'yotoi-2', new = 'yotoi-2-free-leaves', type = 'recipe-replacement'},
                {old = 'yotoi-3', new = 'yotoi-3-free-leaves', type = 'recipe-replacement'},
                {old = 'yotoi-4', new = 'yotoi-4-free-leaves', type = 'recipe-replacement'},
            }
        },
        {
            name = 'nutrinet',
            icon = '__pyalienlifegraphics3__/graphics/technology/nutrinet.png',
            icon_size = 128,
            order = 'c-a',
            effects = { -- the effects the tech will have on the building. valid types: 'module-effects', 'unlock-recipe', 'lock-recipe', 'recipe-replacement'
                {recipe = 'nutrient', type = 'unlock-recipe'},
                {old = 'yotoi-aloe-orchard-mk01', new = 'yotoi-aloe-orchard-mk01-with-nutrient', type = 'recipe-replacement'},
                {old = 'yotoi-aloe-orchard-mk02', new = 'yotoi-aloe-orchard-mk02-with-nutrient', type = 'recipe-replacement'},
                {old = 'yotoi-aloe-orchard-mk03', new = 'yotoi-aloe-orchard-mk03-with-nutrient', type = 'recipe-replacement'},
                {old = 'yotoi-aloe-orchard-mk04', new = 'yotoi-aloe-orchard-mk04-with-nutrient', type = 'recipe-replacement'},
                {old = 'yotoi-2', new = 'yotoi-2-nutrient', type = 'recipe-replacement'},
                {old = 'yotoi-3', new = 'yotoi-3-nutrient', type = 'recipe-replacement'},
                {old = 'yotoi-4', new = 'yotoi-4-nutrient', type = 'recipe-replacement'},
                {old = 'yotoi-fruit-2', new = 'yotoi-fruit-2-nutrient', type = 'recipe-replacement'},
                {old = 'yotoi-fruit-3', new = 'yotoi-fruit-3-nutrient', type = 'recipe-replacement'},
                {old = 'yotoi-fruit-4', new = 'yotoi-fruit-4-nutrient', type = 'recipe-replacement'},
            }
        }
    },
    module_category = 'yotoi'
}