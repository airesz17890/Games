game:GetService("ReplicatedStorage"):WaitForChild("TeamEvent"):FireServer(BrickColor.new(194))
wait(0.5)
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
            if game:GetService("Players").LocalPlayer.jobTitles.Value == "" then
                game:GetService("ReplicatedStorage"):WaitForChild("JobEvent"):FireServer(true)
                keypress(32)
                wait(4)
                game:GetService("ReplicatedStorage"):WaitForChild("JobEvent"):FireServer(false)
            end
        end
    end
})
