clock_hud={}
clock_hud.hud_list = {}

function clock_hud.animate_gauge(player, ids, prefix, x, y, angle, minor)
    local minor = minor or 0
    local angle_in_rad = math.rad(angle + 180)
    local dim = 5
    local pos_x = math.sin(angle_in_rad) * dim
    local pos_y = math.cos(angle_in_rad) * dim
    player:hud_change(ids[prefix .. "2"], "offset", {x = pos_x + x, y = pos_y + y})
    dim = 10
    pos_x = math.sin(angle_in_rad) * dim
    pos_y = math.cos(angle_in_rad) * dim
    player:hud_change(ids[prefix .. "3"], "offset", {x = pos_x + x, y = pos_y + y})
    dim = 15
    pos_x = math.sin(angle_in_rad) * dim
    pos_y = math.cos(angle_in_rad) * dim
    player:hud_change(ids[prefix .. "4"], "offset", {x = pos_x + x, y = pos_y + y})
    if minor == 0 then
        dim = 20
        pos_x = math.sin(angle_in_rad) * dim
        pos_y = math.cos(angle_in_rad) * dim
        player:hud_change(ids[prefix .. "5"], "offset", {x = pos_x + x, y = pos_y + y})
        dim = 25
        pos_x = math.sin(angle_in_rad) * dim
        pos_y = math.cos(angle_in_rad) * dim
        player:hud_change(ids[prefix .. "6"], "offset", {x = pos_x + x, y = pos_y + y})
        dim = 30
        pos_x = math.sin(angle_in_rad) * dim
        pos_y = math.cos(angle_in_rad) * dim
        player:hud_change(ids[prefix .. "7"], "offset", {x = pos_x + x, y = pos_y + y})
    end
end

function clock_hud.update_hud(player)
    local player_name = player:get_player_name()

    local screen_pos_y = 0
    local screen_pos_x = 0

    local hour_gauge_x = screen_pos_x - 116
    local hour_gauge_y = screen_pos_y + 116
    local minute_gauge_x = screen_pos_x - 116
    local minute_gauge_y = screen_pos_y + 116

    local ids = clock_hud.hud_list[player_name]
    if ids then
	    local time = minetest:get_timeofday() * 24
        local hour, minutes = math.modf( time )
        minutes = math.floor(minutes * 100)
        minutes = (minutes * 60) / 100
        local minute_angle = (minutes*-360)/60
        local hour_angle = (hour*-360)/12 + ((minute_angle*30)/360)
        clock_hud.animate_gauge(player, ids, "hour_pt_", hour_gauge_x, hour_gauge_y, hour_angle, 1)
        clock_hud.animate_gauge(player, ids, "minute_pt_", minute_gauge_x, minute_gauge_y, minute_angle)
    else
        ids = {}
        local pointer_texture = "hud_analog_clock_ind_box.png"
        ids["bg"] = player:hud_add({
            hud_elem_type = "image",
            position  = {x = 1, y = 0},
            offset    = {x = screen_pos_x, y = screen_pos_y},
            text      = "hud_analog_clock.png",
            scale     = { x = 0.5, y = 0.5 },
            alignment = { x = -2.25, y = 2.25 },
        })
        
        ids["hour_pt_1"] = player:hud_add({
            hud_elem_type = "image",
            position  = {x = 1, y = 0},
            offset    = {x = hour_gauge_x, y = hour_gauge_y},
            text      = pointer_texture,
            scale     = { x = 3, y = 3},
            alignment = { x = -2.25, y = 2.25 },
        })

        ids["hour_pt_2"] = player:hud_add({
            hud_elem_type = "image",
            position  = {x = 1, y = 0},
            offset    = {x = hour_gauge_x, y = hour_gauge_y},
            text      = pointer_texture,
            scale     = { x = 3, y = 3},
            alignment = { x = -2.25, y = 2.25 },
        })
        ids["hour_pt_3"] = player:hud_add({
            hud_elem_type = "image",
            position  = {x = 1, y = 0},
            offset    = {x = hour_gauge_x, y = hour_gauge_y},
            text      = pointer_texture,
            scale     = { x = 3, y = 3},
            alignment = { x = -2.25, y = 2.25 },
        })
        ids["hour_pt_4"] = player:hud_add({
            hud_elem_type = "image",
            position  = {x = 1, y = 0},
            offset    = {x = hour_gauge_x, y = hour_gauge_y},
            text      = pointer_texture,
            scale     = { x = 3, y = 3},
            alignment = { x = -2.25, y = 2.25 },
        })
        --[[ids["hour_pt_5"] = player:hud_add({
            hud_elem_type = "image",
            position  = {x = 1, y = 0},
            offset    = {x = hour_gauge_x, y = hour_gauge_y},
            text      = pointer_texture,
            scale     = { x = 3, y = 3},
            alignment = { x = -2.25, y = 2.25 },
        })
        ids["hour_pt_6"] = player:hud_add({
            hud_elem_type = "image",
            position  = {x = 1, y = 0},
            offset    = {x = hour_gauge_x, y = hour_gauge_y},
            text      = pointer_texture,
            scale     = { x = 3, y = 3},
            alignment = { x = -2.25, y = 2.25 },
        })
        ids["hour_pt_7"] = player:hud_add({
            hud_elem_type = "image",
            position  = {x = 1, y = 0},
            offset    = {x = hour_gauge_x, y = hour_gauge_y},
            text      = pointer_texture,
            scale     = { x = 3, y = 3},
            alignment = { x = -2.25, y = 2.25 },
        })]]--

        ids["minute_pt_1"] = player:hud_add({
            hud_elem_type = "image",
            position  = {x = 1, y = 0},
            offset    = {x = minute_gauge_x, y = minute_gauge_y},
            text      = pointer_texture,
            scale     = { x = 3, y = 3},
            alignment = { x = -2.25, y = 2.25 },
        })
        ids["minute_pt_2"] = player:hud_add({
            hud_elem_type = "image",
            position  = {x = 1, y = 0},
            offset    = {x = minute_gauge_x, y = minute_gauge_y},
            text      = pointer_texture,
            scale     = { x = 3, y = 3},
            alignment = { x = -2.25, y = 2.25 },
        })
        ids["minute_pt_3"] = player:hud_add({
            hud_elem_type = "image",
            position  = {x = 1, y = 0},
            offset    = {x = minute_gauge_x, y = minute_gauge_y},
            text      = pointer_texture,
            scale     = { x = 3, y = 3},
            alignment = { x = -2.25, y = 2.25 },
        })
        ids["minute_pt_4"] = player:hud_add({
            hud_elem_type = "image",
            position  = {x = 1, y = 0},
            offset    = {x = minute_gauge_x, y = minute_gauge_y},
            text      = pointer_texture,
            scale     = { x = 3, y = 3},
            alignment = { x = -2.25, y = 2.25 },
        })
        ids["minute_pt_5"] = player:hud_add({
            hud_elem_type = "image",
            position  = {x = 1, y = 0},
            offset    = {x = minute_gauge_x, y = minute_gauge_y},
            text      = pointer_texture,
            scale     = { x = 3, y = 3},
            alignment = { x = -2.25, y = 2.25 },
        })
        ids["minute_pt_6"] = player:hud_add({
            hud_elem_type = "image",
            position  = {x = 1, y = 0},
            offset    = {x = minute_gauge_x, y = minute_gauge_y},
            text      = pointer_texture,
            scale     = { x = 3, y = 3},
            alignment = { x = -2.25, y = 2.25 },
        })
        ids["minute_pt_7"] = player:hud_add({
            hud_elem_type = "image",
            position  = {x = 1, y = 0},
            offset    = {x = minute_gauge_x, y = minute_gauge_y},
            text      = pointer_texture,
            scale     = { x = 3, y = 3},
            alignment = { x = -2.25, y = 2.25 },
        })

        clock_hud.hud_list[player_name] = ids
    end
    core.after(1, function()
        clock_hud.update_hud(player)
	end)
end


function clock_hud.remove_hud(player)
    if player then
        local player_name = player:get_player_name()
        --minetest.chat_send_all(player_name)
        local ids = clock_hud.hud_list[player_name]
        if ids then
            player:hud_remove(ids["title"])
            player:hud_remove(ids["bg"])
            player:hud_remove(ids["hour_pt_7"])
            player:hud_remove(ids["hour_pt_6"])
            player:hud_remove(ids["hour_pt_5"])
            player:hud_remove(ids["hour_pt_4"])
            player:hud_remove(ids["hour_pt_3"])
            player:hud_remove(ids["hour_pt_2"])
            player:hud_remove(ids["hour_pt_1"])
            player:hud_remove(ids["minute_pt_7"])
            player:hud_remove(ids["minute_pt_6"])
            player:hud_remove(ids["minute_pt_5"])
            player:hud_remove(ids["minute_pt_4"])
            player:hud_remove(ids["minute_pt_3"])
            player:hud_remove(ids["minute_pt_2"])
            player:hud_remove(ids["minute_pt_1"])
        end
        clock_hud.hud_list[player_name] = nil
    end

end

minetest.register_on_joinplayer(clock_hud.update_hud)

minetest.register_on_leaveplayer(function(player)
    clock_hud.remove_hud(player)
end)


