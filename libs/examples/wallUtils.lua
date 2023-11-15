local rolua = require("rolua")
local cookie = "insert your cookie here"
rolua.cookie.setCookie(cookie)
rolua.xcsrf.token()

rolua.wall.getWall("group's id")
rolua.wall.wallPost("group's id", "message content") --currently broken, not much sure why