local rolua = require("rolua")
local cookie = "insert your cookie here"
rolua.cookie.setCookie(cookie)
rolua.xcsrf.token()

rolua.rank.getRankID("group id", "rank name") --useful to get the rank id idk
rolua.rank.setRank("user's id as either a string or a number","group's id as a number","new rank's name") --will return an error if you try to set the user's rank to something he already is
