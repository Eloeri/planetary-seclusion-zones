local evolution_targets = {
    ["nauvis-east"] = .5,
    ["nauvis-west"] = .5,
    ["nauvis-far-east"] = .75,
    ["nauvis-far-west"] = .75,
    ["nauvis-far-north-east"] = 1,
    ["nauvis-far-north-west"] = 1,
    ["gleba-east"] = .5,
    ["gleba-west"] = .5,
    ["gleba-far-east"] = .75,
    ["gleba-far-west"] = .75,
    ["gleba-far-north-east"] = 1,
    ["gleba-far-north-west"] = 1,

}

local function apply_surface_evolution(surface_name)
    local enemy = game.forces["enemy"]
    local surface = game.get_surface(surface_name)
    if surface and evolution_targets[surface_name] ~= nil then
        enemy.set_evolution_factor(evolution_targets[surface_name], surface)
    end
end

local function apply_all_existing_surface_evolution()
    for surface_name, _ in pairs(evolution_targets) do
        apply_surface_evolution(surface_name)
    end
end

script.on_init(apply_all_existing_surface_evolution)
script.on_configuration_changed(apply_all_existing_surface_evolution)

script.on_event(defines.events.on_surface_created, function(event)
    local surface = game.get_surface(event.surface_index)
    if surface then
        apply_surface_evolution(surface.name)
    end
end)