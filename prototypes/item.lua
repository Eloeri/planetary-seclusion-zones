local sounds = require("__base__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local simulations = require("__base__.prototypes.factoriopedia-simulations")

data:extend(
{
    {
        type = "item",
        name = "ice-ore",
        icon = "__planetary-seclusion-zones__/graphics/icons/ice-ore-1.png",
        pictures =
        {
        {size = 64, filename = "__planetary-seclusion-zones__/graphics/icons/ice-ore.png", scale = 0.5, mipmap_count = 4},
        {size = 64, filename = "__planetary-seclusion-zones__/graphics/icons/ice-ore-1.png", scale = 0.5, mipmap_count = 4},
        {size = 64, filename = "__planetary-seclusion-zones__/graphics/icons/ice-ore-2.png", scale = 0.5, mipmap_count = 4},
        {size = 64, filename = "__planetary-seclusion-zones__/graphics/icons/ice-ore-3.png", scale = 0.5, mipmap_count = 4}
        },
        subgroup = "raw-resource",
        color_hint = { text = "I" },
        order = "z[ice-ore]",
        inventory_move_sound = item_sounds.resource_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.resource_inventory_move,
        stack_size = 50,
        weight = 2 * kg
    },
})