local lang = vRP.lang
local Luang = module("vrp", "lib/Luang")
--[[##########################--]]
local tutorial = class("tutorial", vRP.Extension)														
--[[##########################--]]
tutorial.event = {}
--[[##########################--]]
tutorial.tunnel = {}
--[[##########################--]]
function tutorial:__construct()
	vRP.Extension.__construct(self)
  
	self.cfg = module("vrp_tutorial", "cfg/cfg")																
	
	-- load lang
	self.luang = Luang()
	self.luang:loadLocale(vRP.cfg.lang, module("vrp_tutorial", "cfg/lang/"..vRP.cfg.lang))						
	self.lang = self.luang.lang[vRP.cfg.lang]
	
end
--============= client side calls ==================
RegisterServerEvent('tutorial:test')
AddEventHandler('tutorial:test', function(source)
	vRP:triggerEvent("test", source)
end)

--################################################
--              SERVER EVENTS                 
--################################################
tutorial.event = {}
--============= Player Spawn/Map =====================
function tutorial.event:playerSpawn(user, first_spawn)
	if first_spawn then
		--[[
			place code for when player spawns after server joining
			
			things that should go here:
				map icons/locations
				player gear:
					money additions,
					weapons,
					items
				Status effects:
					health/armor buff,
					skill buffs
				forced events:
					loading screen,
					info screen,
					character selection screen
					
				Other:
					can also have client call for a UI to open
					
					User:
						self.remote._functionName()
							Example:
								self.remote._init()	
		--]]
	end
end
--============= vrp Events ==================
function tutorial.event:test()
	--[[
		run any server side code 
		
		or
		
		run code and trigger another vrp Event or client side function
		
		event user:
			vRP:triggerEvent("Function name", source)
		client call:
				TriggerClientEvent('functionName', source)
					Example: TriggerClientEvent('test', source)
			or
				TriggerClientEvent('ClassName:functionName', source)
					Example: TriggerClientEvent('tutorial:test', source)
			both work the same
	--]]
end

vRP:registerExtension(tutorial)		-- Make sure the Name matches class name you chose
