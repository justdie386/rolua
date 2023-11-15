local rolua = require("rolua")
local cookie = "insert your cookie here"
rolua.cookie.setCookie(cookie)
rolua.xcsrf.token()
rolua.rank.getRankID("group id", "rank name") --useful to get the rank id idk
rolua.rank.setRank("user's id as either a string or a number","group's id as a number","rank name") --useful to change a user's rank
