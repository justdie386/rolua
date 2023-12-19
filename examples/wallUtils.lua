local rolua = require("rolua")
local cookie = "insert your cookie here"
local groupID = "whatever"
local message = "test"
rolua.cookie.setCookie(cookie)
rolua.xcsrf.token()

local wallContent = rolua.wall.getWall(GroupID)
rolua.wall.wallPost(groupID, test) --currently broken, not much sure why
