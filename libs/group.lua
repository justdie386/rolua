--handles everything related to group information and purchases
local uv = require("uv")
local event = require('core').Emitter
local HTTPRequest = require("http.lua")
local logger = require("logger")
local group = {}

function group.getGroup(group)
	local success, res, body = HTTPRequest:callRobloxAPI("GET", "https://groups.roblox.com/v2/groups?groupIds="..group, nil, nil)
    if not success then
        logger.error("failed to get group: "..res.reason)
        return res
    else
        return body
    end
end

function group.getGroupRobux(id)
	local success, res, body = HTTPRequest:callRobloxAPI("GET", "https://economy.roblox.com/v1/groups/"..id.."/currency",nil, nil)
    if not success then
        logger.error("failed to get group's robux: "..res.reason)
        return res
    else
        return body
    end
end
function group.getGroupTransaction(id)
	onBought = event:new()
	local success, res, body = HTTPRequest:callRobloxAPI("GET", "https://economy.roblox.com/v2/groups/"..id.."/transactions?transactionType=Sale&limit=10", nil, nil)
    if not success then
        logger.error("failed to get group's robux: "..res.reason)
        return res
    else
        return body, event
    end
end


function group.OnGroupTransaction(id, event)
local timer = uv.new_timer()
local ms = 3000
local begin = false
local previous
	timer:start(ms, ms, function()
    coroutine.wrap(function()
        local success, res, body = HTTPRequest:callRobloxAPI("GET", "https://economy.roblox.com/v2/groups/" .. id .. "/transactions?transactionType=Sale&limit=10", nil, nil)
        if not begin then
             begin = true
            previous = body.data[1].created
        else
            if body.data[1].created == previous then
            elseif body.data[1].created ~= previous then
                event:emit("purchaseBought", body.data[1])
                previous = body.data[1].created
            end
        end
    end)()
end)
end

return group