local sounds = require("__base__.prototypes.entity.sounds")

local particle_animations = require("prototypes.particle-animations")

local make_particle = function(params)

    if not params then error("No params given to make_particle function") end
    local name = params.name or error("No name given")

    local ended_in_water_trigger_effect = params.ended_in_water_trigger_effect
    if params.ended_in_water_trigger_effect == false then
        ended_in_water_trigger_effect = nil
    end

    local particle =
    {

    type = "optimized-particle",
    name = name,

    life_time = params.life_time or (60 * 15),
    fade_away_duration = params.fade_away_duration,

    render_layer = params.render_layer or "projectile",
    render_layer_when_on_ground = params.render_layer_when_on_ground or "corpse",

    regular_trigger_effect_frequency = params.regular_trigger_effect_frequency or 2,
    regular_trigger_effect = params.regular_trigger_effect,
    ended_in_water_trigger_effect = ended_in_water_trigger_effect,

    pictures = params.pictures,
    shadows = params.shadows,
    draw_shadow_when_on_ground = params.draw_shadow_when_on_ground,

    movement_modifier_when_on_ground = params.movement_modifier_when_on_ground,
    movement_modifier = params.movement_modifier,
    vertical_acceleration = params.vertical_acceleration,

    mining_particle_frame_speed = params.mining_particle_frame_speed,

    }

    return particle

    end

    function shadowtint()
    return {r = 0, g = 0, b = 0}
    end

    function bloodparticlescale()
    return 0.5
    end

    function watertint()
    return {r = 0.1, g = 0.6, b = 0.85}
    end

    function waterparticlescale()
    return 1
    end


data:extend({
    make_particle{
        name = "ice-ore-particle",
        life_time = 180,
        pictures = particle_animations.get_ice_particle_pictures(),
        shadows = particle_animations.get_ice_particle_shadow_pictures()
    }
})