local rolua = require("rolua")
local cookie = "insert your cookie here"
local groupID = "whatever"
local rankName = "whatever"
local userID = "userID"
rolua.cookie.setCookie(cookie)
rolua.xcsrf.token()

rolua.rank.getRankID(groupID, rankName) --Its the only way to get the rank ID to then use it in setRank
rolua.rank.setRank(userID, groupID, rankName) --will return an error if you try to set the user's rank to something he already is
