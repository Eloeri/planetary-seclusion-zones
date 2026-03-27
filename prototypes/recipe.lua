local seconds = 60
local minutes = 60*seconds

data:extend(
{
    {
        type = "recipe",
        name = "ice-ore-melting",
        icon = "__planetary-seclusion-zones__/graphics/icons/fluid/ice-ore-melting.png",
        category = "chemistry",
        subgroup = "fluid-recipes",
        order = "d[other-chemistry]-c[ice-ore-melting]",
        auto_recycle = false,
        enabled = false,
        ingredients = {{type = "item", name = "ice-ore", amount = 1}},
        energy_required = 1,
        results = {{type = "fluid", name = "water", amount = 10}},
        allow_productivity = true,
        allow_decomposition = false,
        crafting_machine_tint =
        {
        primary = {r = 0.433, g = 0.773, b = 1.000, a = 1.000}, -- #6ec5ffff
        secondary = {r = 0.591, g = 0.856, b = 1.000, a = 1.000}, -- #96daffff
        tertiary = {r = 0.381, g = 0.428, b = 0.436, a = 0.502}, -- #616d6f80
        quaternary = {r = 0.499, g = 0.797, b = 0.793, a = 0.733}, -- #7fcbcabb
        },
        show_amount_in_title = false
    },
})