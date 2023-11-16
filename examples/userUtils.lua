local rolua = require("rolua")
local cookie = "insert your cookie here"
rolua.cookie.setCookie(cookie)
rolua.xcsrf.token()

local body = rolua.user.getUser("user id")