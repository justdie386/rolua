local json = require("json")
local logger = require("logger.lua")
local xcsrf = require("xcsrf.lua")
local HTTPRequest = require("http.lua")

local wall = {}


function wall.getWall(id)
        local success, res, body = HTTPRequest:callRobloxAPI("GET", "https://groups.roblox.com/v2/groups/"..id.."/wall/posts?limit=10&sortOrder=Asc", nil, nil)
        if not success then
            logger.error("failed to get wall posts: "..res.reason)
            return res
        else
            return body
        end
end


--[[function wall.wallPost(id, content)
    local payload = json.encode({"body", content})
    local success, res, body = HTTPRequest:callRobloxAPI("POST", "https://groups.roblox.com/v2/groups/32915369/wall/posts", nil, payload)
    if not success then
        p(res)
        return res
    else
        return body
    end
end]] --currently seems to be broken, because noblox.js doesn't seem to support it either... (both the api v1/v2)

--will probably never be implemented because its just useless as hell
function wall.onWallPost()



end

return wall
