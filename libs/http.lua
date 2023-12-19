--nice function to make it easier to interact with the roblox api and handle the incoming data whilst taking care of the tokens
local http = require("coro-http")
local json = require("json")
local HTTPRequest = {
  header = nil
}

function HTTPRequest:callRobloxAPI(type, url, header, payload)
  if not header then
    header = self.header
  end
  if not payload then
    payload = nil
  end
  local res, body = http.request(type, url, header, payload)
  if res.code < 200 or res.code >= 300 then
    return false, res, json.decode(body) 
  else
    return true, res, json.decode(body) 
  end
end

return HTTPRequest
