local json = require("json")
local logger = require("logger.lua")
local HTTPRequest = require("http.lua")
local xcsrf = require("xcsrf.lua")
shout = {}

function shout.getShout(id)
	local success, res, body = HTTPRequest:callRobloxAPI("GET", "https://groups.roblox.com/v2/groups/"..id.."/wall/posts?limit=10&sortOrder=Asc", nil, nil)
	if not success then
		logger.error("failed to get shouts: "..res.reason)
		return res
	else
		return body
	end
end

function shout.postShout(id, content)
	local payload = json.encode({message = content})
	local success, res, body = HTTPRequest:callRobloxAPI("PATCH", "https://groups.roblox.com/v1/groups/"..id.."/status", nil, payload)
	if not success then
		logger.error(res.reason)
		return res
	else
		return body
	end
end
return shout