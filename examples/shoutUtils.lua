local rolua = require("rolua")
local cookie = "insert your cookie here"
rolua.cookie.setCookie(cookie)
rolua.xcsrf.token()

local shout = rolua.shout.getShout("group id")
--will add onShout events soon.
p(shout)
