local HTTPRequest = require("http.lua")
local logger = require("logger.lua")
local user = {}
function user.getUser(name)
local headers = {{"accept", "application/json"}} --uses its own header because it doesn't need the cookie
		local success, res, body = HTTPRequest:callRobloxAPI("GET", "https://users.roblox.com/v1/users/"..name, headers)
	if not success then
        print("failed to get group: "..res.reason)
    else
        return body
    end
end

return user