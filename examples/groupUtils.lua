local rolua = require("rolua")
local cookie = "insert your cookie here"

rolua.cookie.setCookie(cookie)
rolua.xcsrf.token()

local groupID = "whatever"
local groupInfo = rolua.group.getGroup(groupID) --will return info about the group
local groupTransaction, event = rolua.group.getGroupTransaction(groupID) --you must have the permission to manage the fund's group to acces this information
local robuxAmount = rolua.group.getGroupRobux(groupID) --gets the current amount of robux on the group, once again requires the funds management perms
rolua.group.OnGroupTransaction(groupID, event) --listens to when a new purchase is made within the roblox group and its owned games

event:on("PurchaseBought", function(data)
    p(data)
end)
