local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/airesz178/Ui-Library/main/orion%20ui%20library')))()
local Window = OrionLib:MakeWindow({Name = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, HidePremium = false, SaveConfig = false, ConfigFolder = "OrionTest", IntroEnabled = true, IntroText = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name})
local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddToggle({
	Name = "Farm",
	Default = false,
	Callback = function(v)
		getgenv().farm = v
        while getgenv().farm do task.wait()
            if game.Players.LocalPlayer.Team ~= game:GetService("Teams")["Dealership Employee"] then
                local args = {
                    [1] = BrickColor.new(194)
                }
                game:GetService("ReplicatedStorage").TeamEvent:FireServer(unpack(args))                
            else
                if game:GetService("Players").LocalPlayer.jobN.Value ~= "Dealership Employee" then
                    local args = {
                        [1] = true
                    }
                    game:GetService("ReplicatedStorage").JobEvent:FireServer(unpack(args))
                    wait(collectmoney)
                    local args = {
                        [1] = false
                    }
                    game:GetService("ReplicatedStorage").JobEvent:FireServer(unpack(args))
                end
            end
        end
	end    
})
Tab:AddSlider({
	Name = "Collect Money Wait Time",
	Min = 0,
	Max = 15,
	Default = 5,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	Callback = function(v)
		collectmoney = tonumber(v)
	end    
})
