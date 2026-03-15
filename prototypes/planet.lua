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
    { id="North",        zone="north",         orientation=0.25,  distance=0,   label=0,    temp=1 },
    { id="South",        zone="south",         orientation=-0.25, distance=0,   label=0,    temp=1 },
    { id="East",         zone="east",          orientation=0,     distance=1.5, label=0.25, temp=0 },
    { id="West",         zone="west",          orientation=0,     distance=-1.5,label=0,    temp=0 },
    { id="NorthPole",    zone="north-pole",    orientation=0.5,   distance=0,   label=0,    temp=2 },
    { id="SouthPole",    zone="south-pole",    orientation=-0.5,  distance=0,   label=0,    temp=2 },
    { id="FarEast",      zone="far-east",      orientation=0,     distance=3,   label=0.25, temp=0 },
    { id="FarWest",      zone="far-west",      orientation=0,     distance=-3,  label=0,    temp=0 },
    { id="NorthEast",    zone="north-east",    orientation=0.25,  distance=1.5, label=0.25, temp=1 },
    { id="NorthWest",    zone="north-west",    orientation=0.25,  distance=-1.5,label=0,    temp=1 },
    { id="SouthEast",    zone="south-east",    orientation=-0.25, distance=1.5, label=0.25, temp=1 },
    { id="SouthWest",    zone="south-west",    orientation=-0.25, distance=-1.5,label=0,    temp=1 },
    { id="FarNorthEast", zone="far-north-east",orientation=0.25,  distance=3,   label=0.25, temp=1 },
    { id="FarSouthEast", zone="far-south-east",orientation=-0.25, distance=3,   label=0.25, temp=1 },
    { id="FarNorthWest", zone="far-north-west",orientation=0.25,  distance=-3,  label=0,    temp=1 },
    { id="FarSouthWest", zone="far-south-west",orientation=-0.25, distance=-3,  label=0,    temp=1 },
}

local Loc = {}

for _, loc in ipairs(Planet_Locations) do
    Loc[loc.id] = loc
end

Planet_label_mod={0.125,0.125,0.125,-0.125,-0.25}
Planet_Locations_seed_offset={}

local function hash_string(str)
    local h = 0
    for i = 1, #str do
        h = (h * 31 + string.byte(str, i)) % 2^26
    end
    return h
end

for i, loc in ipairs(Planet_Locations) do
    Planet_Locations_seed_offset[i] = hash_string(loc.zone)
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
    for j,loc in ipairs(Planet_Locations) do
        local new_planet = table.deepcopy(subplanet_base)
        new_planet.localised_name={"",{"subplanet-name."..loc.zone}}
        new_planet.localised_description={"",{"space-location-name."..planet},", ",{"subplanet-description."..loc.zone}}
        new_planet.draw_orbit = false
		new_planet.auto_save_on_first_trip = false
        new_planet.name=old_planet.name .. "-"..loc.zone
        new_planet.magnitude=old_planet.magnitude/2
		--new_planet.hidden_in_factoriopedia = true

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
            elseif loc == "east" then

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
        local North = Planet_Locations[1]
        local South = Planet_Locations[2]
        local East = Planet_Locations[3]
        local West = Planet_Locations[4]
        local North_Pole = Planet_Locations[5]
        local South_Pole = Planet_Locations[6]
        local Far_East = Planet_Locations[7]
        local Far_West = Planet_Locations[8]
        local North_East = Planet_Locations[9]
        local North_West = Planet_Locations[10]
        local South_East = Planet_Locations[11]
        local South_West = Planet_Locations[12]
        local Far_North_East = Planet_Locations[13]
        local Far_South_East = Planet_Locations[14]
        local Far_North_West = Planet_Locations[15]
        local Far_South_West = Planet_Locations[16]

        if loc.zone == "north-pole" then
            connections  = {
                {from = planet .. "-" .. North.zone, mult = 1.0 },
            }
        elseif loc.zone == "south-pole" then
            connections = {
                {from = planet .. "-" .. South.zone, mult = 1.0 },
            }
        elseif loc.zone == "far-east" then
            connections = {
                {from = planet .. "-" .. Far_West.zone, mult = 1.0 },
                {from = planet .. "-" .. East.zone, mult = 1.0 }
            }
        elseif loc.zone == "far-west" then
            connections = {
                {from = planet .. "-" .. West.zone, mult = 1.0 }
            }
        elseif loc.zone == "east" then
            connections = {
                {from = planet .. "-" .. South.zone, mult = root2 },
                {from = planet .. "-" .. North.zone, mult = root2 },
                {from = planet, mult = 1.0 }
            }
        elseif loc.zone == "west" then
            connections = {
                {from = planet .. "-" .. South.zone, mult = root2 },
                {from = planet .. "-" .. North.zone, mult = root2 },
                {from = planet, mult = 1.0 }
            }
        elseif loc.zone == "north-west" then
            connections = {
                {from = planet .. "-" .. North_Pole.zone, mult = 1.0 },
                {from = planet .. "-" .. Far_West.zone, mult = root2 },
                {from = planet .. "-" .. North.zone, mult = 1.0 },
                {from = planet .. "-" .. West.zone, mult = 1.0 },
                {from = planet, mult = root2 }
            }
        elseif loc.zone == "north-east" then
            connections = {
                {from = planet .. "-" .. North_Pole.zone, mult = 1.0 },
                {from = planet .. "-" .. Far_East.zone, mult = root2 },
                {from = planet .. "-" .. North.zone, mult = 1.0 },
                {from = planet .. "-" .. East.zone, mult = 1.0 },
                {from = planet, mult = root2 }
            }
        elseif loc.zone == "south-west" then
            connections = {
                {from = planet .. "-" .. South_Pole.zone, mult = 1.0 },
                {from = planet .. "-" .. Far_West.zone, mult = root2 },
                {from = planet .. "-" .. South.zone, mult = 1.0 },
                {from = planet .. "-" .. West.zone, mult = 1.0 },
                {from = planet, mult = root2 }
            }
        elseif loc.zone == "south-east" then
            connections = {
                {from = planet .. "-" .. South_Pole.zone, mult = 1.0 },
                {from = planet .. "-" .. Far_East.zone, mult = root2 },
                {from = planet .. "-" .. South.zone, mult = 1.0 },
                {from = planet .. "-" .. East.zone, mult = 1.0 },
                {from = planet, mult = root2 }
            }
        elseif loc.zone == "far-north-west" then
            connections = {
                {from = planet .. "-" .. North_Pole.zone, mult = 1.0 },
                {from = planet .. "-" .. North_West.zone, mult = 1.0 },
                {from = planet .. "-" .. Far_West.zone, mult = 1.0 },
                {from = planet .. "-" .. West.zone, mult = root2 },
                {from = planet .. "-" .. Far_North_East.zone, mult = 1.0 },
                {from = planet .. "-" .. Far_East.zone, mult = root2 }
            }
        elseif loc.zone == "far-north-east" then
            connections = {
                {from = planet .. "-" .. North_Pole.zone, mult = 1.0 },
                {from = planet .. "-" .. North_East.zone, mult = 1.0 },
                {from = planet .. "-" .. Far_East.zone, mult = 1.0 },
                {from = planet .. "-" .. East.zone, mult = root2 },
                {from = planet .. "-" .. Far_West.zone, mult = root2 },
            }
        elseif loc.zone == "far-south-west" then
            connections = {
                {from = planet .. "-" .. South_Pole.zone, mult = 1.0 },
                {from = planet .. "-" .. South_West.zone, mult = 1.0 },
                {from = planet .. "-" .. Far_West.zone, mult = 1.0 },
                {from = planet .. "-" .. West.zone, mult = root2 },
                {from = planet .. "-" .. Far_South_East.zone, mult = 1.0 },
                {from = planet .. "-" .. Far_East.zone, mult = root2 },
            }
        elseif loc.zone == "far-south-east" then
            connections = {
                {from = planet .. "-" .. South_Pole.zone, mult = 1.0 },
                {from = planet .. "-" .. South_East.zone, mult = 1.0 },
                {from = planet .. "-" .. Far_East.zone, mult = 1.0 },
                {from = planet .. "-" .. East.zone, mult = root2 },
                {from = planet .. "-" .. Far_West.zone, mult = root2 },
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