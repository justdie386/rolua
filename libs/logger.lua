--the logger file to show the errors when there is one
local logger = {}

function logger.info(message)
    local timestamp = os.date("%Y-%m-%d %H:%M:%S")
    local green = "\27[1;32m"  -- ANSI escape code for green text
    local reset = "\27[0m"   -- ANSI escape code to reset text color
    print(timestamp .. " | " .. green .. "[INFO]" .. reset .. "    | " .. message)
end
function logger.error(message)
	local RED_BOLD = "\27[1;31m"   
	local RESET = "\27[0m"
    	local timestamp = os.date("%Y-%m-%d %H:%M:%S")
    	print(timestamp .. " | " .. RED_BOLD .. "[INFO]" .. RESET .. "    | " .. message)
end

return logger
