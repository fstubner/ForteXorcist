﻿--ForteXorcist v1.976.1 by Xus 21-06-2012 for 4.3.0

--[[
"frFR": French
"deDE": German
"esES": Spanish
"enUS": American english
"enGB": British english
"zhCN": Simplified Chinese
"zhTW": Traditional Chinese
"ruRU": Russian
"koKR": Korean

!! Make sure to keep this saved as UTF-8 format !!
]]

--[[>> still needs translating]]
--[[
if FW.CLASS == "WARRIOR" then
	local FWL = FW.L;
	-- RU missing
	if GetLocale() == "ruRU" then
	-- FR missing
	elseif GetLocale() == "frFR" then
	-- DE 
	elseif GetLocale() == "deDE" then
	-- SPANISH
	elseif GetLocale() == "esES" then
	-- simple chinese
	elseif GetLocale() == "zhCN" then
	-- tradition chinese
	elseif GetLocale() == "zhTW" then
	-- ENGLISH
	else	-- standard english version

	end
end
]]