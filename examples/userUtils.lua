local rolua = require("rolua")
local cookie = "insert your cookie here"
local userID = "whatever"
rolua.cookie.setCookie(cookie)
rolua.xcsrf.token()

local user = rolua.user.getUser(userID)
