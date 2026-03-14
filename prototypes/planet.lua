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
Planet_Locations={"north","south", "east", "west","polar-north","polar-south","far-east","far-west", "north-east", "north-west", "south-east", "south-west", "far-north-east", "far-south-east", "far-north-west", "far-south-west","far-north-pole,","far-south-pole"}
Planet_Locations_temperature={1,1,0,0,2,2,0,0,1,1,1,1,1,1,1,1,1,1}
Planet_Locations_orientation_mod={0.25,-0.25,0,0,0.5,-0.5,0,0,0.25,0.25,-0.25,-0.25,0.25,-0.25,0.25,-0.25,1,-1}
Planet_Locations_distance_mod=   {0,0,1.5,-1.5,0,0,3,-3,1.5,-1.5,1.5,-1.5,3,3,-3,-3,0,0}
Planet_Locations_label_orientation_mod={0,0,0.25,0,0,0,0.25,0,0.25,0,0.25,0,0.25,0.25,0,0,0,0}

Planet_label_mod={0.125,0.125,0.125,-0.125,-0.25}
Planet_Locations_seed_offset={}

local function hash_string(str)
    local h = 0
    for i = 1, #str do
        h = (h * 31 + string.byte(str, i)) % 2^26
    end
    return h
end

for i, planet_location in ipairs(Planet_Locations) do
    Planet_Locations_seed_offset[i] = hash_string(planet_location)
end

local presets = {
Nauvis_Default_Settings= {
    ["iron-ore"] = {frequency = 1,size = 1,richness = 1},
    ["copper-ore"] = {frequency = 1,size = 1,richness = 1},
    ["stone"] = {frequency = 1,size = 1,richness = 1},
    ["uranium-ore"] = {frequency = 1,size = 1,richness = 1},
    ["coal"] = {frequency = 1,size = 1,richness = 1},
    ["water"] = {frequency = 1,size = 1},},
Nauvis_Railworld = {
    ["iron-ore"] = {frequency = 1/6,size = 6,richness = 6},
    ["copper-ore"] = {frequency = 1/6,size = 6,richness = 6},
    ["stone"] = {frequency = 1/6,size = 6,richness = 6},
    ["uranium-ore"] = {frequency = 1/6,size = 6,richness = 6},
    ["coal"] = {frequency = 1/6,size = 6,richness = 6},
    ["water"] = {frequency = 0.5,size = 1.5},},
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
Vulcanus_Default_Settings= {
    ["vulcanus_coal"] = {frequency = 1,size = 1,richness = 1,},
    ["calcite"] = {frequency = 1,size = 1,richness = 1,},
    ["sulfuric_acid_geyser"] = {frequency = 1,size = 1,richness = 1,},
    ["tungsten_ore"] = {frequency = 1/6,size = 6,richness = 6,}},
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
Fulgora_Default_Settings = {
    ["scrap"] = {frequency = 1,size = 1,richness = 1,},
    ["fulgora_islands"] = {frequency = 1,size = 1,},},
Fulgora_Railworld = {
    ["scrap"] = {frequency = 1/6,size = 6,richness = 6,},
    ["fulgora_islands"] = {frequency = 1/6,size = 6,},},
Fulgora_Default_Settings_Min_Cliffs = {
    ["fulgora_cliff"] = {frequency = 6,size = 1/6},},
Fulgora_Half_Cliffs = {
    ["fulgora_cliff"] = {frequency = 2,size = .5},},
Fulgora_Regular_Cliffs = {
    ["fulgora_cliff"] = {frequency = 1,size = 1},},
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
Default_Biters = {
    ["enemy-base"] = {frequency = 1,size = 1},},
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
Default_Pentapods = {
    ["gleba_enemy_base"] = {frequency = 1,size = 1},},
Half_Pentapods = {
    ["gleba_enemy_base"] = {frequency = .5,size = .5},},
Triple_Pentapods = {
    ["gleba_enemy_base"] = {frequency = 3,size = 3},},
Max_Pentapods = {
    ["gleba_enemy_base"] = {frequency = 6,size = 6},},
Ultimate_Pentapods = {
    ["gleba_enemy_base"] = {frequency = 36,size = 36},},
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
    ["vulcanus_volcanism"] = {frequency = 1/36,size = 36,}}
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
        apply_preset(old_planet, presets.Half_Biters)
    elseif planets[i] == "vulcanus" then
        apply_preset(old_planet, presets.Vulcanus_Railworld)
    elseif planets[i] == "gleba" then
        apply_preset(old_planet, presets.Gleba_Railworld)
        apply_preset(old_planet, presets.Half_Pentapods)
    elseif planets[i] == "fulgora" then
        apply_preset(old_planet, presets.Fulgora_Railworld)
    elseif planets[i] == "aquilo" then
        apply_preset(old_planet, presets.Aquilo_Railworld)
    end
    old_planet.distance=old_planet.distance*8
    old_planet.magnitude=old_planet.magnitude*6
    for j,direction in ipairs(Planet_Locations) do
        local new_planet = table.deepcopy(subplanet_base)
        new_planet.localised_name={"",{"subplanet-name."..direction}}
        new_planet.localised_description={"",{"space-location-name."..planet},", ",{"subplanet-description."..direction}}
        new_planet.draw_orbit = false
		new_planet.auto_save_on_first_trip = false
        new_planet.name=old_planet.name .. "-"..direction
        new_planet.magnitude=old_planet.magnitude/2
		--new_planet.hidden_in_factoriopedia = true

        if planets[i] == "nauvis" then
            local loc = Planet_Locations[j]
            if loc == "east" or loc == "west" then
                apply_preset(new_planet, presets.Nauvis_Railworld)
                apply_preset(new_planet, presets.Triple_Biters)
            elseif loc == "far-east" or loc == "far-west" then
                apply_preset(new_planet, presets.Nauvis_Railworld)
                apply_preset(new_planet, presets.Max_Biters)
            elseif loc == "north-east" or loc == "north-west"
                or loc == "south-east" or loc == "south-west" then
                apply_preset(new_planet, presets.Nauvis_Railworld)
                new_planet.map_gen_settings.autoplace_controls["enemy-base"] = nil
            elseif loc == "far-north-east" or loc == "far-north-west" then
                apply_preset(new_planet, presets.Ultimate_Biters)
            elseif Planet_Locations_temperature[j] == 1 then
                apply_preset(new_planet, presets.Half_Biters)
            elseif Planet_Locations_temperature[j] == 2 then
                new_planet.map_gen_settings.autoplace_controls["trees"] = nil
                new_planet.map_gen_settings.autoplace_controls["enemy-base"] = nil
            elseif loc == "east" then

            else
                apply_preset(new_planet, presets.Nauvis_Default_Settings)
            end
        end

        if planets[i] == "vulcanus" then 
            local loc = Planet_Locations[j]
            if loc == "east" or loc == "west" then
                apply_preset(new_planet, presets.Vulcanus_Railworld)
                apply_preset(new_planet, presets.Double_Volcanism)
            elseif loc == "far-east" or loc == "far-west" then
                apply_preset(new_planet, presets.Vulcanus_Railworld)
                apply_preset(new_planet, presets.Max_Volcanism)
            elseif loc == "north-east" or loc == "north-west"
                or loc == "south-east" or loc == "south-west" then
                apply_preset(new_planet, presets.Vulcanus_Railworld)
                apply_preset(new_planet, presets.Half_Volcanism)
            elseif Planet_Locations_temperature[j] == 2 then
                apply_preset(new_planet, presets.Vulcanus_Some_Rich_Ores)
                apply_preset(new_planet, presets.Ultimate_Volcanism)
            else
                apply_preset(new_planet, presets.Vulcanus_Default_Settings)
            end
        end

        if planets[i] == "gleba" then
            local loc = Planet_Locations[j]
            if loc == "east" or loc == "west" then
                apply_preset(new_planet, presets.Gleba_Railworld)
                apply_preset(new_planet, presets.Triple_Pentapods)
            elseif loc == "far-east" or loc == "far-west" then
                apply_preset(new_planet, presets.Gleba_Railworld)
                apply_preset(new_planet, presets.Max_Pentapods)
            elseif loc == "north-east" or loc == "north-west" 
                or loc == "south-west" or loc == "south-east" then
                apply_preset(new_planet, presets.Gleba_Railworld)
                new_planet.map_gen_settings.autoplace_controls["gleba_enemy_base"] = nil
            elseif loc == "far-north-east" or loc == "far-north-west" then
                apply_preset(new_planet, presets.Ultimate_Pentapods)
            elseif Planet_Locations_temperature[j] == 1 then
                apply_preset(new_planet, presets.Half_Pentapods)
            elseif Planet_Locations_temperature[j] == 2 then
                new_planet.map_gen_settings.autoplace_controls["gleba_enemy_base"] = nil
            else
                apply_preset(new_planet, presets.Gleba_Default_Settings)
            end
        end

        if planets[i] == "fulgora" then
            local loc = Planet_Locations[j]
            if loc == "east" or loc == "west"
            or loc == "far-east" or loc == "far-west"
            or loc == "north-east" or loc == "north-west"
            or loc == "south-east" or loc == "south-west" then
                apply_preset(new_planet, presets.Fulgora_Railworld)
            else
                apply_preset(new_planet, presets.Fulgora_Default_Settings)
            end
        end

        if planets[i] == "aquilo" then
            local loc = Planet_Locations[j]
            if loc == "east" or loc == "west"
            or loc == "far-east" or loc == "far-west"
            or loc == "north-east" or loc == "north-west"
            or loc == "south-east" or loc == "south-west" then
                apply_preset(new_planet, presets.Aquilo_Railworld)
            else
                apply_preset(new_planet, presets.Aquilo_Default_Settings)
            end
        end

        local solar_modifier
        if Planet_Locations_temperature[j] == 1 then
            solar_modifier=0.75
			if planets[i] == "fulgora" then
				new_planet.lightning_properties = {
				    lightnings_per_chunk_per_tick = 1 / (30 * 10), --cca once per chunk every 5 seconds (300 ticks)
                    search_radius = 10.0,
                    lightning_types = {"lightning"}
				}
			end
        elseif Planet_Locations_temperature[j] == 2 then
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
            new_planet.distance = old_planet.distance + old_planet.magnitude * Planet_Locations_distance_mod[j] * visual_spacing
        end
        if planets[i] ~= "gleba" then
            visual_spacing = .85
            new_planet.distance = old_planet.distance + old_planet.magnitude * Planet_Locations_distance_mod[j] * visual_spacing
        end
        new_planet.distance = old_planet.distance + old_planet.magnitude * Planet_Locations_distance_mod[j] * visual_spacing
        new_planet.map_seed_offset = Planet_Locations_seed_offset[j]
        local orientation_offset = old_planet.magnitude * Planet_Locations_orientation_mod[j] * visual_spacing / old_planet.distance
        new_planet.orientation = (old_planet.orientation - orientation_offset) % 1

        if old_planet.label_orientation then --check if label orientation is defined. Important for modded planets.
            new_planet.label_orientation = old_planet.label_orientation+Planet_Locations_label_orientation_mod[j]
        else
            new_planet.label_orientation = Planet_Locations_label_orientation_mod[j]
        end

        if old_planet.name=="fulgora" and (direction=="west" or direction=="east") then --I don't know why fulgora's west/east labels are opposite the rest. This fixes that discrepancy.
            new_planet.label_orientation = -new_planet.label_orientation
        end

        local connections
        local root2 = math.sqrt(2)
        if direction == "far-north-pole" then
            connections  = {
                {from = planet .. "-" .. Planet_Locations[5], mult = 1.0 }, --North Pole
            }
        elseif direction == "far-south-pole" then
            connections = {
                {from = planet .. "-" .. Planet_Locations[6], mult = 1.0 }, --South Pole
            }
        elseif direction == "polar-north" then
            connections  = {
                {from = planet .. "-" .. Planet_Locations[1], mult = 1.0 }, --North 
            }
        elseif direction == "polar-south" then
            connections = {
                {from = planet .. "-" .. Planet_Locations[2], mult = 1.0 }, --South
            }
        elseif direction == "far-east" then
            connections = {
                {from = planet .. "-" .. Planet_Locations[8], mult = 1.0 }, --Far West
                {from = planet .. "-" .. Planet_Locations[3], mult = 1.0 }  --East
            }
        elseif direction == "far-west" then
            connections = {
                {from = planet .. "-" .. Planet_Locations[4], mult = 1.0 }  --West
            }
        elseif direction == "east" then
            connections = {
                {from = planet .. "-" .. Planet_Locations[2], mult = root2 }, --South
                {from = planet .. "-" .. Planet_Locations[1], mult = root2 }, --North
                {from = planet, mult = 1.0 }
            }
        elseif direction == "west" then
            connections = {
                {from = planet .. "-" .. Planet_Locations[2], mult = root2 }, --South
                {from = planet .. "-" .. Planet_Locations[1], mult = root2 }, --North
                {from = planet, mult = 1.0 }
            }
        elseif direction == "north-west" then
            connections = {
                {from = planet .. "-" .. Planet_Locations[5], mult = 1.0 },   --Polar North
                {from = planet .. "-" .. Planet_Locations[8], mult = root2 }, --Far West
                {from = planet .. "-" .. Planet_Locations[1], mult = 1.0 },   --North
                {from = planet .. "-" .. Planet_Locations[4], mult = 1.0 },   --West
                {from = planet, mult = root2 }
            }
        elseif direction == "north-east" then
            connections = {
                {from = planet .. "-" .. Planet_Locations[5], mult = 1.0 },   --Polar North
                {from = planet .. "-" .. Planet_Locations[7], mult = root2 }, --Far East
                {from = planet .. "-" .. Planet_Locations[1], mult = 1.0 },   --North
                {from = planet .. "-" .. Planet_Locations[3], mult = 1.0 },   --East
                {from = planet, mult = root2 }
            }
        elseif direction == "south-west" then
            connections = {
                {from = planet .. "-" .. Planet_Locations[6], mult = 1.0 },   --Polar South
                {from = planet .. "-" .. Planet_Locations[8], mult = root2 }, --Far West
                {from = planet .. "-" .. Planet_Locations[2], mult = 1.0 },   --South
                {from = planet .. "-" .. Planet_Locations[4], mult = 1.0 },   --West
                {from = planet, mult = root2 }
            }
        elseif direction == "south-east" then
            connections = {
                {from = planet .. "-" .. Planet_Locations[6], mult = 1.0 },   --Polar South
                {from = planet .. "-" .. Planet_Locations[7], mult = root2 }, --Far East
                {from = planet .. "-" .. Planet_Locations[2], mult = 1.0 },   --South
                {from = planet .. "-" .. Planet_Locations[3], mult = 1.0 },   --East
                {from = planet, mult = root2 }
            }
        elseif direction == "far-north-west" then
            connections = {
                {from = planet .. "-" .. Planet_Locations[5], mult = 1.0 },   --Polar North
                {from = planet .. "-" .. Planet_Locations[10], mult = 1.0 },   --North West
                {from = planet .. "-" .. Planet_Locations[8], mult = 1.0 },   --Far West
                {from = planet .. "-" .. Planet_Locations[4], mult = root2 }, --West
                {from = planet .. "-" .. Planet_Locations[13], mult = 1.0 },  --Far North East
                {from = planet .. "-" .. Planet_Locations[7], mult = root2 }  --Far East
            }
        elseif direction == "far-north-east" then
            connections = {
                {from = planet .. "-" .. Planet_Locations[5], mult = 1.0 },   --Polar North
                {from = planet .. "-" .. Planet_Locations[9], mult = 1.0 },  --North East
                {from = planet .. "-" .. Planet_Locations[7], mult = 1.0 },   --Far East
                {from = planet .. "-" .. Planet_Locations[3], mult = root2 }, --East
                {from = planet .. "-" .. Planet_Locations[8], mult = root2 }, --Far West
            }
        elseif direction == "far-south-west" then
            connections = {
                {from = planet .. "-" .. Planet_Locations[6], mult = 1.0 },   --Polar South
                {from = planet .. "-" .. Planet_Locations[12], mult = 1.0 },  --South West
                {from = planet .. "-" .. Planet_Locations[8], mult = 1.0 },   --Far West
                {from = planet .. "-" .. Planet_Locations[4], mult = root2 }, --West
                {from = planet .. "-" .. Planet_Locations[14], mult = 1.0 },  --Far South East
                {from = planet .. "-" .. Planet_Locations[7], mult = root2 }, --Far East
            }
        elseif direction == "far-south-east" then
            connections = {
                {from = planet .. "-" .. Planet_Locations[6], mult = 1.0 },   --Polar South
                {from = planet .. "-" .. Planet_Locations[12], mult = 1.0 },  --South East
                {from = planet .. "-" .. Planet_Locations[7], mult = 1.0 },   --Far East
                {from = planet .. "-" .. Planet_Locations[3], mult = root2 }, --East
                {from = planet .. "-" .. Planet_Locations[8], mult = root2 }, --Far West
            }
        else
            connections = {
                {from = planet, mult = 1.0 }
            }
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
            table.insert(data.raw["technology"]["space-platform-thruster"].effects,{
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