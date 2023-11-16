local rolua = require("rolua")
local cookie = "insert your cookie here"
rolua.cookie.setCookie(cookie)
rolua.xcsrf.token()

local groupInfo = rolua.group.getGroup("group id") --you must have the permission to manage the fund's group to acces this information
local groupTransaction, event = rolua.group.getGroupTransaction("group id") --you must have the permission to manage the fund's group to acces this information
local robuxAmount = rolua.group.getGroupRobux("group id") --gets the current amount of robux on the group, once again requires the funds management perms
rolua.group.OnGroupTransaction("group id", event) --listens to when a new purchase is made within the roblox group and its owned games
event:on("PurchaseBought", function(data)
    p("a purchase was bougth! "..data)
end)
p(groupInfo)
p(groupTransaction)
