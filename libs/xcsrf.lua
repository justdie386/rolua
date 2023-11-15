--this file has for sole goal of acquiring the xcsrf token
local HTTPRequest = require("http.lua")
local json = require("json")
local xcsrf = {}

function xcsrf.token()
	success, res, body = HTTPRequest:callRobloxAPI("POST", "https://auth.roblox.com/v2/logout", nil, nil)
	table.insert(HTTPRequest.header, {"X-CSRF-TOKEN",res[7][2]})
	return res[7][2]
end

return xcsrf