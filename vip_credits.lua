--[[
    CREATE TABLE `vrp_vip_credits` (
        `user_id` INT(11) NOT NULL,
        `type` VARCHAR(50) NOT NULL DEFAULT 'none' COLLATE 'utf8mb4_general_ci',
        `used` TINYINT(4) NULL DEFAULT '0',
        `value` INT(11) NULL DEFAULT '0',
        `modification` DATETIME NULL DEFAULT current_timestamp(),
        PRIMARY KEY (`user_id`, `type`) USING BTREE
    )
    COLLATE='utf8mb4_general_ci'
    ENGINE=InnoDB;
]]

vRP.prepare("vRP/get_vipcredits","SELECT * FROM vrp_vip_credits WHERE user_id = @user_id AND type = @type")
vRP.prepare("vRP/use_vipcredits","UPDATE vrp_vip_credits SET used = @used, modification = NOW() WHERE user_id = @user_id AND type = @type")
vRP.prepare("vRP/add_vipcredits","REPLACE INTO vrp_vip_credits(user_id,type,used,value,modification) VALUES(@user_id,@type,0,@value,NOW())")

function vRP.getVipCredits(user_id,type)
    if user_id then
        local query = vRP.query("vRP/get_vipcredits",{ user_id = user_id, type = type })
        if #query > 0 then
            if (query[1].used == 0) then
                return parseInt(query[1].value)
            end
        end
    end
    return 0
end

function vRP.useVipCredits(user_id,type,value)
    if user_id then
        local query = vRP.query("vRP/get_vipcredits",{ user_id = user_id, type = type })
        if #query > 0 then
            if (query[1].used == 0) then
                local credits = parseInt(query[1].value)
                if credits >= value then
                    local affected = vRP.execute("vRP/use_vipcredits",{ user_id = user_id, type = type, used = 1 })
                    if affected > 0 then
                        return true
                    end
                end
            end
        end
    end
    return false
end

function vRP.addVipCredits(user_id,type,value)
    if user_id then
        local affected = vRP.execute("vRP/add_vipcredits",{ user_id = user_id, type = type, value = parseInt(value) })
        if affected > 0 then
            return true
        end
    end
    return false
end