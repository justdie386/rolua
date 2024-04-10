--this file is for everything related to ranks and such
local json = require("json")
local HTTPRequest = require("http.lua")
local group = require("group.lua")
local logger = require("logger.lua")
local rank = {}

function rank.getRankID(rankName, groupID)
    local success, res, body = HTTPRequest:callRobloxAPI("GET", "https://groups.roblox.com/v1/groups/"..groupID.."/roles", nil, nil)
    if not success then
        logger.error("failed to get rank's id: "..res.reason)
        return res
    else
        for k,v in ipairs(body.roles) do
            if v.name == rankName then
                return v.id
            end
        end
    end
end

function rank.getRankValue(rankName, groupID) --this isn't really useful for ranks, it's more needed for another function in another file, so don't mind
    local success, res, body = HTTPRequest:callRobloxAPI("GET", "https://groups.roblox.com/v1/groups/"..groupID.."/roles", nil, nil)
    if not success then
        logger.error("failed to get rank's id: "..res.reason)
        return res
    else
        for k,v in ipairs(body.roles) do
            if v.name == rankName then
                return v.rank
            end
        end
    end

end

function rank.getUserCurrentRank(userID, groupID)
    local success, res, body = HTTPRequest:callRobloxAPI("GET", "https://groups.roblox.com/v2/users/"..userID.."/groups/roles", nil, nil)
    if not success then
        logger.error("failed to get user's rank: "..res.reason)
        return res
    else
        for k,v in ipairs(body.data) do
            if v.group.id == groupID then
                return v.role.rank, v.role.id
            end
        end
    end
end
function rank.getRank(userID, groupID)
    local success, res, body = HTTPRequest:callRobloxAPI("GET", "https://groups.roblox.com/v2/users/"..userID.."/groups/roles", nil, nil)
    if not success then
        logger.error("failed to get user's rank: "..res.reason)
        return res
    else
        for k,v in ipairs(body.data) do
            if v.group.id == groupID then
                return v.role.rank, v.role.id
            end
        end
    end
end

function rank.setRank(userID, groupID, newRankName)
    local rankID = rank.getRankID(newRankName, groupID)
    local payload = json.encode({roleID = rankID})
    local succcess, res, body = HTTPRequest:callRobloxAPI("PATCH", "https://groups.roblox.com/v1/groups/"..groupID.."/users/"..userID, nil, payload)
    if res.reason == "OK" then
        return true
    else
        logger.error("failed to set rank, user either already has this rank or you made an error with the provided info: "..res.reason)
        return false
    end

end
return rank
