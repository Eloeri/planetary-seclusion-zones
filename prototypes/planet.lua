local planet_map_gen = require("prototypes.planet-map-gen")

local planets={"nauvis","vulcanus","gleba","fulgora","aquilo"}

data.raw["space-location"]["solar-system-edge"].distance=data.raw["space-location"]["solar-system-edge"].distance*8
data.raw["space-location"]["shattered-planet"].distance=data.raw["space-location"]["shattered-planet"].distance*6
data.raw["space-connection"]["solar-system-edge-shattered-planet"].length = 4000000 * 10
data.raw["space-connection"]["gleba-aquilo"].length = 30000 * 10
data.raw["space-connection"]["gleba-fulgora"].length = 15000 * 10
data.raw["space-connection"]["aquilo-solar-system-edge"].length = 100000 * 10
data.raw["space-connection"]["nauvis-vulcanus"].length = 15000 * 10
data.raw["space-connection"]["nauvis-gleba"].length = 15000 * 10
data.raw["space-connection"]["nauvis-fulgora"].length = 15000 * 10
data.raw["space-connection"]["vulcanus-gleba"].length = 15000 * 10
data.raw["space-connection"]["fulgora-aquilo"].length = 30000 * 10

Planet_Locations = {
    { id="North",         zone="north",         orientation=0.25,  distance=0,   label=0,    temp=1 },
    { id="South",         zone="south",         orientation=-0.25, distance=0,   label=0,    temp=1 },
    { id="East",          zone="east",          orientation=0,     distance=1.5, label=0.25, temp=0 },
    { id="West",          zone="west",          orientation=0,     distance=-1.5,label=0,    temp=0 },
    { id="North_Pole",    zone="north-pole",    orientation=0.5,   distance=0,   label=0,    temp=2 },
    { id="South_Pole",    zone="south-pole",    orientation=-0.5,  distance=0,   label=0,    temp=2 },
    { id="Far_East",      zone="far-east",      orientation=0,     distance=3,   label=0.25, temp=0 },
    { id="Far_West",      zone="far-west",      orientation=0,     distance=-3,  label=0,    temp=0 },
    { id="North_East",    zone="north-east",    orientation=0.25,  distance=1.5, label=0.25, temp=1 },
    { id="North_West",    zone="north-west",    orientation=0.25,  distance=-1.5,label=0,    temp=1 },
    { id="South_East",    zone="south-east",    orientation=-0.25, distance=1.5, label=0.25, temp=1 },
    { id="South_West",    zone="south-west",    orientation=-0.25, distance=-1.5,label=0,    temp=1 },
    { id="Far_North_East",zone="far-north-east",orientation=0.25,  distance=3,   label=0.25, temp=1 },
    { id="Far_South_East",zone="far-south-east",orientation=-0.25, distance=3,   label=0.25, temp=1 },
    { id="Far_North_West",zone="far-north-west",orientation=0.25,  distance=-3,  label=0,    temp=1 },
    { id="Far_South_West",zone="far-south-west",orientation=-0.25, distance=-3,  label=0,    temp=1 },
    --{ id="Satelite_1",    zone="sat1",          orientation=0.75,  distance=-1.5,label=0,    temp=0 },
    --{ id="Satelite_2",    zone="sat2",          orientation=0.75,  distance=1.5, label=0,    temp=0 },
    --{ id="Satelite_3",    zone="sat3",          orientation=-0.75, distance=-1.5,label=0,    temp=0 },
    --{ id="Satelite_4",    zone="sat4",          orientation=-0.75, distance=1.5, label=0,    temp=0 },
    --{ id="Satelite_5",    zone="sat5",          orientation=1,     distance=0,   label=0,    temp=0 },
    --{ id="Satelite_6",    zone="sat6",          orientation=-1,    distance=0,   label=0,    temp=0 },
    --{ id="Satelite_7",    zone="sat7",          orientation=0.5,   distance=-3,  label=0,    temp=0 },
    --{ id="Satelite_8",    zone="sat8",          orientation=0.5,   distance=3,   label=0,    temp=0 },
    --{ id="Satelite_9",    zone="sat9",          orientation=-0.5,  distance=-3,  label=0,    temp=0 },
    --{ id="Satelite_10",   zone="sat10",         orientation=-0.5,  distance=3,   label=0,    temp=0 },
    --{ id="Satelite_11",   zone="sat11",         orientation=.25,   distance=-4.5,label=0,    temp=0 },
    --{ id="Satelite_12",   zone="sat12",         orientation=-.25,  distance=-4.5,label=0,    temp=0 },
    --{ id="Satelite_13",   zone="sat13",         orientation=0,     distance=-6,  label=0,    temp=0 },
    --{ id="Satelite_14",   zone="sat14",         orientation=.25,   distance=4.5, label=0,    temp=0 },
    --{ id="Satelite_15",   zone="sat15",         orientation=-.25,  distance=4.5, label=0,    temp=0 },
    --{ id="Satelite_16",   zone="sat16",         orientation=0,     distance=6,   label=0,    temp=0 },
    --{ id="Satelite_17",   zone="sat17",         orientation=.75,   distance=0,   label=0,    temp=0 },
    --{ id="Satelite_18",   zone="sat18",         orientation=.5,    distance=-1.5,label=0,    temp=0 },
    --{ id="Satelite_19",   zone="sat19",         orientation=.5,    distance=1.5, label=0,    temp=0 },
    --{ id="Satelite_20",   zone="sat20",         orientation=0,     distance=-4.5,label=0,    temp=0 },
    --{ id="Satelite_21",   zone="sat21",         orientation=-0,    distance=4.5, label=0,    temp=0 },
    --{ id="Satelite_22",   zone="sat22",         orientation=-.5,   distance=-1.5,label=0,    temp=0 },
    --{ id="Satelite_23",   zone="sat23",         orientation=-.5,   distance=1.5, label=0,    temp=0 },
    --{ id="Satelite_24",   zone="sat24",         orientation=-.75,  distance=0,   label=0,    temp=0 },
}

local Loc = {}
for _, loc in ipairs(Planet_Locations) do
    Loc[loc.id] = loc
end

Planet_label_mod={0.125,0.125,0.125,-0.125,-0.25}
Planet_Locations_seed_offset={}

for i, loc in ipairs(Planet_Locations) do
    Planet_Locations_seed_offset[i]=math.random(2^32-2^4)
end

data:extend({
    {
        type = "noise-expression",
        name = "psz_aquilo_pole_elevation",
        expression = "max(aquilo_elevation, 0.05)"
    }
})

local function apply_nauvis_pole_ice_terrain(new_planet)
    local aquilo = data.raw["planet"]["aquilo"]
    if not aquilo or not aquilo.map_gen_settings then return end

    local aq_tiles = aquilo.map_gen_settings.autoplace_settings.tile.settings
    local expr = new_planet.map_gen_settings.property_expression_names

    new_planet.map_gen_settings.autoplace_settings.tile = {
        settings = {
            ["snow-flat"]   = table.deepcopy(aq_tiles["snow-flat"]),
            ["snow-crests"] = table.deepcopy(aq_tiles["snow-crests"]),
            ["snow-lumpy"]  = table.deepcopy(aq_tiles["snow-lumpy"]),
            ["snow-patchy"] = table.deepcopy(aq_tiles["snow-patchy"]),
            ["ice-rough"]   = table.deepcopy(aq_tiles["ice-rough"]),
            ["ice-smooth"]  = table.deepcopy(aq_tiles["ice-smooth"]),
        }
    }

    if aquilo.map_gen_settings.autoplace_settings.decorative then
        new_planet.map_gen_settings.autoplace_settings.decorative =
            table.deepcopy(aquilo.map_gen_settings.autoplace_settings.decorative)
    end

    expr.elevation = "psz_aquilo_pole_elevation"

    local aq_expr = aquilo.map_gen_settings.property_expression_names
    expr.temperature = aq_expr.temperature
    expr.moisture    = aq_expr.moisture
    expr.aux         = aq_expr.aux
end


local presets = {
Nauvis_Default_Settings= {
    ["iron-ore"] = {frequency = 1,size = 1,richness = 1},
    ["copper-ore"] = {frequency = 1,size = 1,richness = 1},
    ["stone"] = {frequency = 1,size = 1,richness = 1},
    ["coal"] = {frequency = 1,size = 1,richness = 1},
    ["crude-oil"] = {frequency = 1,size = 1,richness = 1},
    ["uranium-ore"] = {frequency = 1,size = 1,richness = 1},
    ["water"] = {frequency = 1,size = 1},},
Nauvis_Railworld = {
    ["iron-ore"] = {frequency = 1/6,size = 6,richness = 6},
    ["copper-ore"] = {frequency = 1/6,size = 6,richness = 6},
    ["stone"] = {frequency = 1/6,size = 6,richness = 6},
    ["coal"] = {frequency = 1/6,size = 6,richness = 6},
    ["crude-oil"] = {frequency = 1/6,size = 6,richness = 6},
    ["uranium-ore"] = {frequency = 1/6,size = 6,richness = 6},
    ["water"] = {frequency = 0.5,size = 1.5},},
Nauvis_Default_Pole_Settings= {
    ["iron-ore"] = {frequency = 1,size = 1,richness = 1},
    ["copper-ore"] = {frequency = 1,size = 1,richness = 1},
    ["stone"] = {frequency = 1,size = 1,richness = 1},
    ["coal"] = {frequency = 1,size = 1,richness = 1},
    ["crude-oil"] = {frequency = 1,size = 1,richness = 1},
    ["uranium-ore"] = {frequency = 1,size = 1,richness = 1},
    ["water"] = {frequency = 1,size = 1},
    ["ice-ore"] = {frequency = 2,size = 2,richness = 2},},
Nauvis_Min_Cliffs = {
    ["nauvis_cliff"] = {frequency = 6,size = 1/6},},
Nauvis_Half_Cliffs = {
    ["nauvis_cliff"] = {frequency = 2,size = .5},},
Nauvis_Regular_Cliffs = {
    ["nauvis_cliff"] = {frequency = 1,size = 1},},
Nauvis_Double_Cliffs = {
    ["nauvis_cliff"] = {frequency = 1/2,size = 2},},
Nauvis_Triple_Cliffs = {
    ["nauvis_cliff"] = {frequency = 1/3,size = 3},},
Nauvis_Max_Cliffs = {
    ["nauvis_cliff"] = {frequency = 1/6,size = 6},},
Default_Biters = {
    ["enemy-base"] = {frequency = 1,size = 1},},
Min_Biters = {
    ["enemy-base"] = {frequency = .001,size = .001},},
Half_Biters = {
    ["enemy-base"] = {frequency = .5,size = .5},},
Three_Fourth_Biters = {
    ["enemy-base"] = {frequency = 3/4,size = 3/4},},
Triple_Biters = {
    ["enemy-base"] = {frequency = 3,size = 3},},
Max_Biters = {
    ["enemy-base"] = {frequency = 6,size = 6},},
Ultimate_Biters = {
    ["enemy-base"] = {frequency = 36,size = 36},},
Vulcanus_Default_Settings= {
    ["vulcanus_coal"] = {frequency = 1,size = 1,richness = 1,},
    ["calcite"] = {frequency = 1,size = 1,richness = 1,},
    ["sulfuric_acid_geyser"] = {frequency = 1,size = 1,richness = 1,},
    ["tungsten_ore"] = {frequency = 1,size = 1,richness = 1,}},
Vulcanus_Railworld = {
    ["vulcanus_coal"] = {frequency = 1/6,size = 6,richness = 6,},
    ["calcite"] = {frequency = 1/6,size = 6,richness = 6,},
    ["sulfuric_acid_geyser"] = {frequency = 1/6,size = 6,richness = 6,},
    ["tungsten_ore"] = {frequency = 1/6,size = 6,richness = 6,}},
Vulcanus_Rich_Ores = {
    ["vulcanus_coal"] = {frequency = 6,size = 6,richness = 6,},
    ["calcite"] = {frequency = 6,size = 6,richness = 6,},
    ["sulfuric_acid_geyser"] = {frequency = 6,size = 6,richness = 6,},
    ["tungsten_ore"] = {frequency = 6,size = 6,richness = 6,}},
Vulcanus_Some_Rich_Ores = {
    ["vulcanus_coal"] = {frequency = 1,size = 6,richness = 6,},
    ["calcite"] = {frequency = .5,size = 6,richness = 6,},
    ["sulfuric_acid_geyser"] = {frequency = 1,size = 6,richness = 6,},
    ["tungsten_ore"] = {frequency = 8,size = 6,richness = 6,}},
Nil_Volcanism = {
    ["vulcanus_volcanism"] = {frequency = 0,size = 0,}},
Default_Volcanism = {
    ["vulcanus_volcanism"] = {frequency = 1,size = 1,}},
Half_Volcanism = {
    ["vulcanus_volcanism"] = {frequency = 2,size = 1/2,}},
Double_Volcanism = {
    ["vulcanus_volcanism"] = {frequency = 1/2,size = 2,}},
Max_Volcanism = {
    ["vulcanus_volcanism"] = {frequency = 1/6,size = 6,}},
Ultimate_Volcanism = {
    ["vulcanus_volcanism"] = {frequency = 1/36,size = 36,}},
Gleba_Default_Settings = {
    ["gleba_plants"] = {frequency = 1,size = 1,}},
Gleba_Railworld = {
    ["gleba_plants"] = {frequency = 1/6,size = 6,}},
Gleba_Min_Cliffs = {
    ["gleba_cliff"] = {frequency = 6,size = 1/6},},
Gleba_Half_Cliffs = {
    ["gleba_cliff"] = {frequency = 2,size = .5},},
Gleba_Regular_Cliffs = {
    ["gleba_cliff"] = {frequency = 1,size = 1},},
Gleba_Double_Cliffs = {
    ["gleba_cliff"] = {frequency = 1/2,size = 2},},
Gleba_Triple_Cliffs = {
    ["gleba_cliff"] = {frequency = 1/3,size = 3},},
Gleba_Max_Cliffs = {
    ["gleba_cliff"] = {frequency = 1/6,size = 6},},
Default_Pentapods = {
    ["gleba_enemy_base"] = {frequency = 1,size = 1},},
Min_Pentapods = {
    ["gleba_enemy_base"] = {frequency = .001,size = .001},},
Half_Pentapods = {
    ["gleba_enemy_base"] = {frequency = .5,size = .5},},
Triple_Pentapods = {
    ["gleba_enemy_base"] = {frequency = 3,size = 3},},
Max_Pentapods = {
    ["gleba_enemy_base"] = {frequency = 6,size = 6},},
Ultimate_Pentapods = {
    ["gleba_enemy_base"] = {frequency = 36,size = 36},},
Fulgora_Default_Settings = {
    ["scrap"] = {frequency = 1,size = 1,richness = 1,},
    ["fulgora_islands"] = {frequency = 1,size = 1,},},
Fulgora_Railworld = {
    ["scrap"] = {frequency = 1/6,size = 6,richness = 6,},
    ["fulgora_islands"] = {frequency = 1/6,size = 6,},},
Fulgora_Default_Cliffs = {
    ["fulgora_cliff"] = {frequency = 1,size = 1},},
Fulgora_Half_Cliffs = {
    ["fulgora_cliff"] = {frequency = 2,size = .5},},
Fulgora_Double_Cliffs = {
    ["fulgora_cliff"] = {frequency = 1/2,size = 2},},
Fulgora_Triple_Cliffs = {
    ["fulgora_cliff"] = {frequency = 1/3,size = 3},},
Fulgora_Max_Cliffs = {
    ["fulgora_cliff"] = {frequency = 1/6,size = 6},},
Aquilo_Default_Settings = {
    ["aquilo_crude_oil"] = {frequency = 1,size = 1,richness = 1,},
    ["fluorine_vent"] = {frequency = 1,size = 1,richness = 1,},
    ["lithium_brine"] = {frequency = 1,size = 1,richness = 1,}},
Aquilo_Railworld = {
    ["aquilo_crude_oil"] = {frequency = 1/6,size = 6,richness = 6,},
    ["fluorine_vent"] = {frequency = 1/6,size = 6,richness = 6,},
    ["lithium_brine"] = {frequency = 1/6,size = 6,richness = 6,}},
}

local function apply_preset(new_planet, preset)
    for resource, settings in pairs(preset) do
        new_planet.map_gen_settings.autoplace_controls[resource] = settings
    end
end

for i,planet in ipairs(planets) do
    local old_planet=data.raw["planet"][planet]
    local subplanet_base = table.deepcopy(old_planet)
    if planets[i] == "nauvis" then
        --apply_preset(old_planet, presets.Ultimate_Biters)
        apply_preset(old_planet, presets.Nauvis_Railworld)
        apply_preset(old_planet, presets.Min_Biters)
    elseif planets[i] == "vulcanus" then
        apply_preset(old_planet, presets.Vulcanus_Railworld)
    elseif planets[i] == "gleba" then
        apply_preset(old_planet, presets.Gleba_Railworld)
        apply_preset(old_planet, presets.Min_Pentapods)
    elseif planets[i] == "fulgora" then
        apply_preset(old_planet, presets.Fulgora_Railworld)
    elseif planets[i] == "aquilo" then
        apply_preset(old_planet, presets.Aquilo_Railworld)
    end
    old_planet.distance=old_planet.distance*8
    old_planet.magnitude=old_planet.magnitude*6
    for j,loc in ipairs(Planet_Locations) do
        local new_planet = table.deepcopy(subplanet_base)
        new_planet.localised_name={"",{"subplanet-name."..loc.zone}}
        new_planet.localised_description={"",{"space-location-name."..planet},", ",{"subplanet-description."..loc.zone}}
        new_planet.draw_orbit = false
		new_planet.auto_save_on_first_trip = false
        new_planet.name=old_planet.name .. "-"..loc.zone
        new_planet.magnitude=old_planet.magnitude/2
		--new_planet.hidden_in_factoriopedia = true
        local is_nauvis_pole =
            old_planet.name == "nauvis" and
            (loc.zone == "north-pole" or loc.zone == "south-pole")

        if is_nauvis_pole then
            apply_nauvis_pole_ice_terrain(new_planet)
        end

        -- local is_nauvis_lava =
        --     old_planet.name == "nauvis" and
        --     (loc.zone == "sat1")

        -- if is_nauvis_lava then
        --     local vulcanus = data.raw["planet"]["vulcanus"]
        --     if vulcanus and vulcanus.map_gen_settings then
        --         new_planet.map_gen_settings = table.deepcopy(vulcanus.map_gen_settings)
        --     end
        -- end

        if planets[i] == "nauvis" then
            if loc.zone == "east" or loc.zone == "west" then
                apply_preset(new_planet, presets.Nauvis_Railworld)
                apply_preset(new_planet, presets.Triple_Biters)
            elseif loc.zone == "far-east" or loc.zone == "far-west" then
                apply_preset(new_planet, presets.Nauvis_Railworld)
                apply_preset(new_planet, presets.Max_Biters)
            elseif loc.zone == "north-east" or loc.zone == "north-west"
                or loc.zone == "south-east" or loc.zone == "south-west" then
                apply_preset(new_planet, presets.Nauvis_Railworld)
                new_planet.map_gen_settings.autoplace_controls["enemy-base"] = nil
            elseif loc.zone == "far-north-east" then
                apply_preset(new_planet, presets.Ultimate_Biters)
            elseif  loc.zone == "far-north-west" then
                apply_preset(new_planet, presets.Nauvis_Railworld)
                apply_preset(new_planet, presets.Ultimate_Biters)
            elseif loc.temp == 1 then
                apply_preset(new_planet, presets.Half_Biters)
            elseif loc.temp == 2 then
                new_planet.map_gen_settings.autoplace_controls["trees"] = nil
                new_planet.map_gen_settings.autoplace_controls["enemy-base"] = nil
                new_planet.map_gen_settings.autoplace_controls["nauvis_cliff"] = nil
                new_planet.map_gen_settings.autoplace_settings["entity"].settings["ice-ore"] = {}
                apply_preset(new_planet, presets.Nauvis_Default_Pole_Settings)

            else
                apply_preset(new_planet, presets.Nauvis_Default_Settings)
            end
        end

        if planets[i] == "vulcanus" then 
            if loc.zone == "east" or loc.zone == "west" then
                apply_preset(new_planet, presets.Vulcanus_Railworld)
                apply_preset(new_planet, presets.Double_Volcanism)
            elseif loc.zone == "far-east" or loc.zone == "far-west" then
                apply_preset(new_planet, presets.Vulcanus_Railworld)
                apply_preset(new_planet, presets.Max_Volcanism)
            elseif loc.zone == "north-east" or loc.zone == "north-west"
                or loc.zone == "south-east" or loc.zone == "south-west" then
                apply_preset(new_planet, presets.Vulcanus_Railworld)
                apply_preset(new_planet, presets.Half_Volcanism)
            elseif loc.temp == 2 then
                apply_preset(new_planet, presets.Vulcanus_Some_Rich_Ores)
                apply_preset(new_planet, presets.Ultimate_Volcanism)
            else
                apply_preset(new_planet, presets.Vulcanus_Default_Settings)
            end
        end

        if planets[i] == "gleba" then
            local loc = Planet_Locations[j]
            if loc.zone == "east" or loc.zone == "west" then
                apply_preset(new_planet, presets.Gleba_Railworld)
                apply_preset(new_planet, presets.Triple_Pentapods)
            elseif loc.zone == "far-east" or loc.zone == "far-west" then
                apply_preset(new_planet, presets.Gleba_Railworld)
                apply_preset(new_planet, presets.Max_Pentapods)
            elseif loc.zone == "north-east" or loc.zone == "north-west" 
                or loc.zone == "south-west" or loc.zone == "south-east" then
                apply_preset(new_planet, presets.Gleba_Railworld)
                new_planet.map_gen_settings.autoplace_controls["gleba_enemy_base"] = nil
            elseif loc.zone == "far-north-east" or loc.zone == "far-north-west" then
                apply_preset(new_planet, presets.Ultimate_Pentapods)
            elseif loc.temp == 1 then
                apply_preset(new_planet, presets.Half_Pentapods)
            elseif loc.temp == 2 then
                new_planet.map_gen_settings.autoplace_controls["gleba_enemy_base"] = nil
            else
                apply_preset(new_planet, presets.Gleba_Default_Settings)
            end
        end

        if planets[i] == "fulgora" then
            if loc.zone == "east" or loc.zone == "west"
            or loc.zone == "far-east" or loc.zone == "far-west"
            or loc.zone == "north-east" or loc.zone == "north-west"
            or loc.zone == "south-east" or loc.zone == "south-west" then
                apply_preset(new_planet, presets.Fulgora_Railworld)
            else
                apply_preset(new_planet, presets.Fulgora_Default_Settings)
            end
        end

        if planets[i] == "aquilo" then
            if loc.zone == "east" or loc.zone == "west"
            or loc.zone == "far-east" or loc.zone == "far-west"
            or loc.zone == "north-east" or loc.zone == "north-west"
            or loc.zone == "south-east" or loc.zone == "south-west" then
                apply_preset(new_planet, presets.Aquilo_Railworld)
            else
                apply_preset(new_planet, presets.Aquilo_Default_Settings)
            end
        end

        local solar_modifier
        if loc.temp == 1 then
            solar_modifier=0.75
			if planets[i] == "fulgora" then
				new_planet.lightning_properties = {
				    lightnings_per_chunk_per_tick = 1 / (30 * 10), --cca once per chunk every 5 seconds (300 ticks)
                    search_radius = 10.0,
                    lightning_types = {"lightning"}
				}
			end
        elseif loc.temp == 2 then
            solar_modifier=0.5
            if planets[i] == "nauvis" then
                new_planet.entities_require_heating = true
            end
            if planets[i] == "fulgora" then
				new_planet.lightning_properties = {
                    lightnings_per_chunk_per_tick = 1 / (15 * 10), --cca once per chunk every 2.5 seconds (150 ticks)
                    search_radius = 10.0,
                    lightning_types = {"lightning"}
				}
			end
        else
            solar_modifier=1
        end

        if old_planet.surface_properties["solar-power"] then
            new_planet.surface_properties["solar-power"]=old_planet.surface_properties["solar-power"]*solar_modifier
        else
            new_planet.surface_properties["solar-power"]=100*solar_modifier
        end

        local visual_spacing = .75
        if planets[i] ~= "vulcanus" then
            visual_spacing = 1
            new_planet.distance = old_planet.distance + old_planet.magnitude *  loc.distance * visual_spacing
        end
        if planets[i] ~= "gleba" then
            visual_spacing = .85
            new_planet.distance = old_planet.distance + old_planet.magnitude *  loc.distance * visual_spacing
        end
        new_planet.map_seed_offset = Planet_Locations_seed_offset[j]
        new_planet.distance = old_planet.distance + old_planet.magnitude *  loc.distance * visual_spacing
        local orientation_offset = old_planet.magnitude *  loc.orientation * visual_spacing / old_planet.distance
        new_planet.orientation = (old_planet.orientation - orientation_offset) % 1

        if old_planet.label_orientation then --check if label orientation is defined. Important for modded planets.
            new_planet.label_orientation = old_planet.label_orientation+loc.label
        else
            new_planet.label_orientation = loc.labl
        end

        --if old_planet.name=="fulgora" and (loc.zone=="west" or loc.zone=="east") then --I don't know why fulgora's west/east labels are opposite the rest. This fixes that discrepancy.
        --    new_planet.label_orientation = -new_planet.label_orientation
        --end

        local connections
        local root2 = math.sqrt(2)
        local mult = 1.0
        local mult_c45 = 1 / root2
        local mult_e2c = 5 / 8
        local mult_e1_c2 = math.acos((root2 / 2) * math.cos(math.rad(72))) / math.rad(72)

        if loc.zone == "north-pole" then
            connections  = {
                {from = planet .. "-" .. Loc.North.zone, mult = mult_e2c },
            }
        elseif loc.zone == "south-pole" then
            connections = {
                {from = planet .. "-" .. Loc.South.zone, mult = mult_e2c },
            }
        elseif loc.zone == "north" then
            connections = {
                {from = planet, mult = mult_e2c },
            }
        elseif loc.zone == "south" then
            connections = {
                {from = planet, mult = mult_e2c },
            }
        elseif loc.zone == "far-east" then
            connections = {
                {from = planet .. "-" .. Loc.Far_West.zone, mult = 1.0 },
                {from = planet .. "-" .. Loc.East.zone, mult = 1.0 }
            }
        elseif loc.zone == "far-west" then
            connections = {
                {from = planet .. "-" .. Loc.West.zone, mult = 1.0 }
            }
        elseif loc.zone == "east" then
            connections = {
                {from = planet .. "-" .. Loc.South.zone, mult = mult_e1_c2 },
                {from = planet .. "-" .. Loc.North.zone, mult = mult_e1_c2 },
                {from = planet, mult = 1.0 }
            }
        elseif loc.zone == "west" then
            connections = {
                {from = planet .. "-" .. Loc.South.zone, mult = mult_e1_c2 },
                {from = planet .. "-" .. Loc.North.zone, mult = mult_e1_c2 },
                {from = planet, mult = 1.0 }
            }
        elseif loc.zone == "north-west" then
            connections = {
                {from = planet .. "-" .. Loc.North_Pole.zone, mult = mult_e2c },
                {from = planet .. "-" .. Loc.Far_West.zone, mult = mult_e1_c2 },
                {from = planet .. "-" .. Loc.North.zone, mult = mult_c45 },
                {from = planet .. "-" .. Loc.West.zone, mult = mult_e2c },
                {from = planet, mult = mult_e1_c2 }
            }
        elseif loc.zone == "north-east" then
            connections = {
                {from = planet .. "-" .. Loc.North_Pole.zone, mult = mult_e2c },
                {from = planet .. "-" .. Loc.Far_East.zone, mult = mult_e1_c2 },
                {from = planet .. "-" .. Loc.North.zone, mult = mult_c45 },
                {from = planet .. "-" .. Loc.East.zone, mult = mult_e2c },
                {from = planet, mult = mult_e1_c2 }
            }
        elseif loc.zone == "south-west" then
            connections = {
                {from = planet .. "-" .. Loc.South_Pole.zone, mult = mult_e2c },
                {from = planet .. "-" .. Loc.Far_West.zone, mult = mult_e1_c2 },
                {from = planet .. "-" .. Loc.South.zone, mult = mult_c45 },
                {from = planet .. "-" .. Loc.West.zone, mult = mult_e2c },
                {from = planet, mult = mult_e1_c2 }
            }
        elseif loc.zone == "south-east" then
            connections = {
                {from = planet .. "-" .. Loc.South_Pole.zone, mult = mult_e2c },
                {from = planet .. "-" .. Loc.Far_East.zone, mult = mult_e1_c2 },
                {from = planet .. "-" .. Loc.South.zone, mult = mult_c45 },
                {from = planet .. "-" .. Loc.East.zone, mult = mult_e2c },
                {from = planet, mult = mult_e1_c2 }
            }
        elseif loc.zone == "far-north-west" then
            connections = {
                {from = planet .. "-" .. Loc.North_Pole.zone, mult = mult_e2c },
                {from = planet .. "-" .. Loc.North_West.zone, mult = mult_c45 },
                {from = planet .. "-" .. Loc.Far_West.zone, mult = mult_e2c },
                {from = planet .. "-" .. Loc.West.zone, mult = mult_e1_c2 },
                {from = planet .. "-" .. Loc.Far_North_East.zone, mult = mult_c45 },
                {from = planet .. "-" .. Loc.Far_East.zone, mult = mult_e1_c2 }
            }
        elseif loc.zone == "far-north-east" then
            connections = {
                {from = planet .. "-" .. Loc.North_Pole.zone, mult = mult_e2c },
                {from = planet .. "-" .. Loc.North_East.zone, mult = mult_c45 },
                {from = planet .. "-" .. Loc.Far_East.zone, mult = mult_e2c },
                {from = planet .. "-" .. Loc.East.zone, mult = mult_e1_c2 },
                {from = planet .. "-" .. Loc.Far_West.zone, mult = mult_e1_c2 },
            }
        elseif loc.zone == "far-south-west" then
            connections = {
                {from = planet .. "-" .. Loc.South_Pole.zone, mult = mult_e2c },
                {from = planet .. "-" .. Loc.South_West.zone, mult = mult_c45 },
                {from = planet .. "-" .. Loc.Far_West.zone, mult = mult_e2c },
                {from = planet .. "-" .. Loc.West.zone, mult = mult_e1_c2 },
                {from = planet .. "-" .. Loc.Far_South_East.zone, mult = mult_c45 },
                {from = planet .. "-" .. Loc.Far_East.zone, mult = mult_e1_c2 },
            }
        elseif loc.zone == "far-south-east" then
            connections = {
                {from = planet .. "-" .. Loc.South_Pole.zone, mult = mult_e2c },
                {from = planet .. "-" .. Loc.South_East.zone, mult = mult_c45 },
                {from = planet .. "-" .. Loc.Far_East.zone, mult = mult_e2c },
                {from = planet .. "-" .. Loc.East.zone, mult = mult_e1_c2 },
                {from = planet .. "-" .. Loc.Far_West.zone, mult = mult_e1_c2 },
            }
        --elseif loc.zone == "sat1" then
        --    connections = {
        --        {from = planet .. "-" .. Loc.North_Pole.zone, mult = .5 },
        --    }
        --elseif loc.zone == "sat2" then
        --    connections = {
        --        {from = planet .. "-" .. Loc.North_Pole.zone, mult = .5 },
        --    }
        --elseif loc.zone == "sat3" then
        --    connections = {
        --        {from = planet .. "-" .. Loc.South_Pole.zone, mult = .5 },
        --    }
        --elseif loc.zone == "sat4" then
        --    connections = {
        --        {from = planet .. "-" .. Loc.South_Pole.zone, mult = .5 },
        --    }
        --elseif loc.zone == "sat5" then
        --    connections = {
        --        {from = planet .. "-" .. Loc.Satelite_1.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.Satelite_2.zone, mult = .5 },
        --    }
        --elseif loc.zone == "sat6" then
        --    connections = {
        --        {from = planet .. "-" .. Loc.Satelite_3.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.Satelite_4.zone, mult = .5 },
        --    }
        --elseif loc.zone == "sat7" then
        --    connections = {
        --        {from = planet .. "-" .. Loc.Satelite_1.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.Far_North_West.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.North_West.zone, mult = .5 },
        --    }
        --elseif loc.zone == "sat8" then
        --    connections = {
        --        {from = planet .. "-" .. Loc.Satelite_2.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.Far_North_East.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.North_East.zone, mult = .5 },
        --    }
        --elseif loc.zone == "sat9" then
        --    connections = {
        --        {from = planet .. "-" .. Loc.Satelite_3.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.Far_South_West.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.South_West.zone, mult = .5 },
        --    }
        --elseif loc.zone == "sat10" then
        --    connections = {
        --        {from = planet .. "-" .. Loc.Satelite_4.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.Far_South_East.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.South_East.zone, mult = .5 },
        --    }
        --elseif loc.zone == "sat11" then
        --    connections = {
        --        {from = planet .. "-" .. Loc.Far_North_West.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.Far_West.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.Satelite_7.zone, mult = .5 },
        --    }
        --elseif loc.zone == "sat12" then
        --    connections = {
        --        {from = planet .. "-" .. Loc.Far_West.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.Far_South_West.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.Satelite_9.zone, mult = .5 },
        --    }
        --elseif loc.zone == "sat13" then
        --    connections = {
        --        {from = planet .. "-" .. Loc.Satelite_11.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.Satelite_12.zone, mult = .5 },
        --    }
        --elseif loc.zone == "sat14" then
        --    connections = {
        --        {from = planet .. "-" .. Loc.Far_North_East.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.Far_East.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.Satelite_8.zone, mult = .5 },
        --    }
        --elseif loc.zone == "sat15" then
        --    connections = {
        --        {from = planet .. "-" .. Loc.Far_East.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.Far_South_East.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.Satelite_10.zone, mult = .5 },
        --    }
        --elseif loc.zone == "sat16" then
        --    connections = {
        --        {from = planet .. "-" .. Loc.Satelite_14.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.Satelite_15.zone, mult = .5 },
        --    }
        --elseif loc.zone == "sat17" then
        --    connections = {
        --        {from = planet .. "-" .. Loc.Satelite_5.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.Satelite_1.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.Satelite_2.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.North_Pole.zone, mult = .5 },
        --    }
        --elseif loc.zone == "sat18" then
        --    connections = {
        --        {from = planet .. "-" .. Loc.Satelite_1.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.Satelite_7.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.North_Pole.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.North_West.zone, mult = .5 },
        --    }
        --elseif loc.zone == "sat19" then
        --    connections = {
        --        {from = planet .. "-" .. Loc.Satelite_2.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.Satelite_8.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.North_Pole.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.North_East.zone, mult = .5 },
        --    }
        --elseif loc.zone == "sat20" then
        --    connections = {
        --        {from = planet .. "-" .. Loc.Satelite_11.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.Satelite_12.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.Satelite_13.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.Far_West.zone, mult = .5 },
        --    }
        --elseif loc.zone == "sat21" then
        --    connections = {
        --        {from = planet .. "-" .. Loc.Satelite_14.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.Satelite_15.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.Satelite_16.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.Far_East.zone, mult = .5 },
        --    }
        --elseif loc.zone == "sat22" then
        --    connections = {
        --        {from = planet .. "-" .. Loc.Satelite_9.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.Satelite_3.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.South_Pole.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.South_West.zone, mult = .5 },
        --    }
        --elseif loc.zone == "sat23" then
        --    connections = {
        --        {from = planet .. "-" .. Loc.Satelite_10.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.Satelite_4.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.South_Pole.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.South_East.zone, mult = .5 },
        --    }
        --elseif loc.zone == "sat24" then
        --    connections = {
        --        {from = planet .. "-" .. Loc.Satelite_3.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.Satelite_4.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.Satelite_6.zone, mult = .5 },
        --        {from = planet .. "-" .. Loc.South_Pole.zone, mult = .5 },
        --    }
        end
        
        for _, conn in ipairs(connections) do
            local new_connection = {
                type = "space-connection",
                name = new_planet.name .. "-" .. conn.from,
                subgroup = "planet-connections",
                to = new_planet.name,
                from = conn.from,
                order = "aa",
                length = 100 * old_planet.magnitude * conn.mult,
                hidden_in_factoriopedia = true
            }
        
            data:extend({ new_connection })
        end

        if planet ~= "nauvis" then
            table.insert(data.raw["technology"]["planet-discovery-"..planet].effects,{
                type = "unlock-space-location",
                space_location = new_planet.name,
                use_icon_overlay_constant = true
            })
        end
        if planet == "nauvis" then
            local tech = data.raw["technology"]["space-platform-thruster"]

            local has_ice_ore_melting = false
            for _, effect in ipairs(tech.effects) do
                if effect.type == "unlock-recipe" and effect.recipe == "ice-ore-melting" then
                    has_ice_ore_melting = true
                    break
                end
            end

            if not has_ice_ore_melting then
                table.insert(tech.effects,
                {
                    type = "unlock-recipe",
                    recipe = "ice-ore-melting"
                })
            end

            table.insert(tech.effects,
            {
                type = "unlock-space-location",
                space_location = new_planet.name,
                use_icon_overlay_constant = true
            })
        end
        data:extend({new_planet})
        
    end
    if old_planet.label_orientation then
        old_planet.label_orientation=old_planet.label_orientation+Planet_label_mod[i]
    else 
        old_planet.label_orientation=Planet_label_mod[i]
    end
    
end