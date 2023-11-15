local logger = require("logger.lua")
local HTTPRequest = require("http.lua")
local cookie = {}
function cookie.setCookie(cookie)
	local headers = {{"accept", "application/json"},
					{"Content-type", "application/json"},
					{"Cookie", ".ROBLOSECURITY="..cookie}}
		local success, res, body = HTTPRequest:callRobloxAPI("GET", "https://users.roblox.com/v1/users/authenticated", headers, nil)
		if not success then
			print("failed to set cookie: "..res.reason)
		else
			logger.info("authentified as "..body.name)
			HTTPRequest.header = headers
	end
end

return cookie