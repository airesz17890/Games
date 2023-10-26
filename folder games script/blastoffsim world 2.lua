for i, v in pairs(game.Workspace:GetChildren()) do
    if v.Name == "Launchpad" then
        for i, v in pairs(v:GetChildren()) do
            if v.Name == "Claim" then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 1)
            end
        end
    end
end
wait(0.3)
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/airesz178/Ui-Library/main/orion%20ui%20library')))()
local Window = OrionLib:MakeWindow({Name = tostring(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name), HidePremium = false, SaveConfig = false, ConfigFolder = "OrionTest", IntroEnable = true, IntroText = tostring(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)})
function owner()
    for i, v in pairs(game.Workspace:GetChildren()) do
        if v.Name == "Launchpad" then
            for i, v in pairs(v:GetDescendants()) do
                if v.Name == "Owner" then
                    if v.Value == game.Players.LocalPlayer then
                        return v.Parent.Parent
                    end
                end
            end
        end
    end
end
local LocalPlayer, mt, index, newindex = game.Players.LocalPlayer, getrawmetatable(game)
index = mt.__index
newindex = mt.__newindex
local Values = {
    WalkSpeed = 16,
    JumpPower = 50,
    Velocity = Vector3.new(0, 0, 0)
}
setreadonly(mt, false)
mt.__index = newcclosure(function(t, k)
    return (not checkcaller() and Values[k] or index(t, k))
end)
mt.__newindex = newcclosure(function(t, k, v)
    if not checkcaller() and Values[k] then return end
    newindex(t, k, v)
end)
setreadonly(mt, true)
local hum = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
local fp = fireproximityprompt
local fc = fireclickdetector
local ft = firetouchinterest
local fuel = owner().Values.Fuel
local rocketfuel = owner().Values.RocketFuel
local rocketlaunch = owner().Values.RocketLaunched
local ranknum = game:GetService("Players").LocalPlayer.Values.Rank
local pro = game:GetService("ReplicatedStorage").Promote
local buyscoop = game:GetService("ReplicatedStorage").BuyFuelScoop
local buybag = game:GetService("ReplicatedStorage").BuyItem
local buyrocket = game:GetService("ReplicatedStorage").BuyRocket
function farming()
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.Name == "FuelScoop" then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
        end
    end
    firesignal(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.CollectFuel.Activated)
    hum.CFrame = CFrame.new(10.8181486, 13.1966839, 46.5681725, 0.83673948, 3.82593335e-08, 0.547601223, -4.73543196e-08, 1, 2.49067389e-09, -0.547601223, -2.80153287e-08, 0.83673948)
    wait()
    hum.CFrame = CFrame.new(11.020174, 13.1968451, 46.0689621, 0.896509588, 1.09093541e-07, -0.443024307, -1.00254681e-07, 1, 4.33706582e-08, 0.443024307, 5.53305002e-09, 0.896509588)
end
function farming2()
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.Name == "FuelScoop" then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v)
        end
    end
    firesignal(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.CollectFuel.Activated)
    hum.CFrame = CFrame.new(10.8181486, 13.1966839, 46.5681725, 0.83673948, 3.82593335e-08, 0.547601223, -4.73543196e-08, 1, 2.49067389e-09, -0.547601223, -2.80153287e-08, 0.83673948)
    wait()
    hum.CFrame = CFrame.new(11.020174, 13.1968451, 46.0689621, 0.896509588, 1.09093541e-07, -0.443024307, -1.00254681e-07, 1, 4.33706582e-08, 0.443024307, 5.53305002e-09, 0.896509588)
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, owner().FuelCollector.CollectorPad, 0)
    wait()
    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, owner().FuelCollector.CollectorPad, 1)
end
function addall()
    hum.CFrame = owner().FuelCollector.TransferToRocket.AddAll.CFrame * CFrame.new(0, 0, -5)
    wait()
    fp(owner().FuelCollector.TransferToRocket.AddAll.Attachment.ProximityPrompt)
end
function launch()
    hum.CFrame = owner().LaunchStation.LaunchButton.CFrame * CFrame.new(0, 0, 5)
    wait()
    fp(owner().LaunchStation.LaunchButton.Attachment.ProximityPrompt)
end
function farmrocket()
    if fuel.Value >= selectfuel and not owner().LaunchStation.LoudSpeaker.SoundBlock["Alarm_03"].Playing == true and not rocketlaunch.Value == true then
        repeat wait()
            addall()
        until fuel.Value <= selectfuel or not getgenv().farmrocket
    else
        farming2()
    end
    if rocketfuel.Value >= tonumber(selectfuel) and not owner().LaunchStation.LoudSpeaker.SoundBlock["Alarm_03"].Playing == true and not rocketlaunch.Value == true and owner().Values.RocketSpeed.Value == 0 then
        repeat wait()
            launch()
        until rocketlaunch.Value == true or owner().LaunchStation.LoudSpeaker.SoundBlock["Alarm_03"].Playing == true or not getgenv().farmrocket
    end
end
--------------------------------------------------------------------------------------------
function mission()
    for i, v in pairs(game:GetService("Workspace").Islands.TheZenith.LifeOrbs:GetChildren()) do
        if v:IsA("Part") then
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0)
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 1)
        end
    end
    wait(2)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Islands.TheZenith.Hexagon.RegularHexagon.CFrame * CFrame.new(0, 2, 0)
    wait(0.5)
    fireproximityprompt(game:GetService("Workspace").Islands.TheZenith.Hexagon.RegularHexagon.Attachment.ProximityPrompt)
    wait(30)
    game:GetService("Workspace").Islands.FireFly:FindFirstChild("Shield").CanCollide = false
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Islands.FireFly.PrizeChest.Click.CFrame
    wait(0.3)
    fireproximityprompt(game:GetService("Workspace").Islands.FireFly.PrizeChest.Click.Attachment.ProximityPrompt)
    wait(11)
    for i, v in pairs(game:GetService("Workspace").Islands.CaveOfEye.Gems:GetChildren()) do
        if v.ClassName == "MeshPart" then
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0)
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 1)
        end
    end
    wait(1)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Islands.CaveOfEye.Prize.Main.CFrame
    wait(0.3)
    fireproximityprompt(game:GetService("Workspace").Islands.CaveOfEye.Prize.Main.Attachment.ProximityPrompt)
    wait(11)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Islands.MazeOfReflection.PrizeChest.Click.CFrame
    wait(0.3)
    fireproximityprompt(game:GetService("Workspace").Islands.MazeOfReflection.PrizeChest.Click.Attachment.ProximityPrompt)
    wait(11)
    game:GetService("Workspace").Islands.SpaceGun.PrizeChest.Barrier.CanCollide = false
    wait(0.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Islands.SpaceGun.PrizeChest.Click.CFrame
    wait(0.3)
    fireproximityprompt(game:GetService("Workspace").Islands.SpaceGun.PrizeChest.Click.Attachment.ProximityPrompt)
    wait(11)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Islands.UFORepair.PrizeChest.Chest.CFrame
    wait(0.3)
    fireproximityprompt(game:GetService("Workspace").Islands.UFORepair.PrizeChest.Click.Attachment.ProximityPrompt)
    wait(11)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Islands.MoonlingObby.PrizeChest.Chest.CFrame
    wait(0.3)
    fireproximityprompt(game:GetService("Workspace").Islands.MoonlingObby.PrizeChest.Click.Attachment.ProximityPrompt)
    wait(3)
    local Event = game:GetService("ReplicatedStorage").Teleport
    Event:FireServer()
end
local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
local fuellabel = Tab:AddLabel("")
local rocketlabel = Tab:AddLabel("")
Tab:AddToggle({
    Name = "Auto Farm Basic",
    Default = false,
    Callback = function(v)
        getgenv().farm = v
        while getgenv().farm do
            wait()
            farming()
        end
    end
})
Tab:AddDropdown({
    Name = "Select Farm Fuel Rocket Only",
    Default = 10,
    Options = {10, 50, 100, 500, 1000, 3000, 5000, 8000, 10000, 15000, 20000, 30000, 50000, 100000, 500000, 1000000, 3000000, 5000000, 10000000},
    Callback = function(v)
        selectfuel = tonumber(v)
    end
})
Tab:AddToggle({
    Name = "Auto Farm Rocket",
    Default = false,
    Callback = function(v)
        getgenv().farmrocket = v
        while getgenv().farmrocket do
            wait()
            farmrocket()
        end
    end
})
Tab:AddToggle({
    Name = "Auto Store",
    Default = false,
    Callback = function(v)
        getgenv().store = v
        while getgenv().store do
            wait()
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, owner().FuelCollector.CollectorPad, 0)
            wait()
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, owner().FuelCollector.CollectorPad, 1)
        end
    end
})
Tab:AddToggle({
    Name = "Auto Full Store",
    Default = false,
    Callback = function(v)
        getgenv().fs = v
        while getgenv().fs do
            wait()
            if game.Players.LocalPlayer.PlayerGui.ScreenGui:WaitForChild("PMClone").Text == "Backpack Full!" then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, owner().FuelCollector.CollectorPad, 0)
                wait()
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, owner().FuelCollector.CollectorPad, 1)
            end
        end
    end
})
Tab:AddButton({
    Name = "Auto Complete Mission",
    Callback = function()
        mission()
    end
})
Tab:AddToggle({
    Name = "Auto Rank Up",
    Default = false,
    Callback = function(v)
        getgenv().rank = v
        while getgenv().rank do
            wait()
            if ranknum.Value == 0 then
                pro:FireServer(1)
            elseif ranknum.Value == 1 then
                pro:FireServer(2)
            elseif ranknum.Value == 2 then
                pro:FireServer(3)
            elseif ranknum.Value == 3 then
                pro:FireServer(4)
            elseif ranknum.Value == 4 then
                pro:FireServer(5)
            elseif ranknum.Value == 5 then
                pro:FireServer(6)
            elseif ranknum.Value == 6 then
                pro:FireServer(7)
            elseif ranknum.Value == 7 then
                pro:FireServer(8)
            elseif ranknum.Value == 8 then
                pro:FireServer(9)
            elseif ranknum.Value == 9 then
                pro:FireServer(10)
            elseif ranknum.Value == 10 then
                pro:FireServer(11)
            elseif ranknum.Value == 11 then
                pro:FireServer(12)
            elseif ranknum.Value == 12 then
                pro:FireServer(13)
            end
        end
    end
})
local Tab = Window:MakeTab({
    Name = "Stats",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
Tab:AddToggle({
    Name = "Auto Upgrade Cash Earned",
    Default = false,
    Callback = function(v)
        getgenv().cashearn = v
        while getgenv().cashearn do
            wait()
            local A_1 = "Cash"
            local Event = game:GetService("ReplicatedStorage").AddRankPoint
            Event:FireServer(A_1)
        end
    end
})
Tab:AddToggle({
    Name = "Auto Upgrade Rocket Speed",
    Default = false,
    Callback = function(v)
        getgenv().uprocket = v
        while getgenv().uprocket do
            wait()
            local A_1 = "RocketSpeed"
            local Event = game:GetService("ReplicatedStorage").AddRankPoint
            Event:FireServer(A_1)
        end
    end
})
Tab:AddToggle({
    Name = "Auto Upgrade Fuelscoop Collection",
    Default = false,
    Callback = function(v)
        getgenv().fuelco = v
        while getgenv().fuelco do
            wait()
            local A_1 = "FuelScoop"
            local Event = game:GetService("ReplicatedStorage").AddRankPoint
            Event:FireServer(A_1)
        end
    end
})
Tab:AddToggle({
    Name = "Auto Upgrade FuelBot Collection",
    Default = false,
    Callback = function(v)
        getgenv().fuelbo = v
        while getgenv().fuelbo do
            wait()
            local A_1 = "FuelBotCollection"
            local Event = game:GetService("ReplicatedStorage").AddRankPoint
            Event:FireServer(A_1)
        end
    end
})
local Tab = Window:MakeTab({
    Name = "Shop",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
Tab:AddToggle({
    Name = "Auto Buy All Except Gem Shop",
    Default = false,
    Callback = function(v)
        getgenv().buyall = v
        while getgenv().buyall do
            wait()
            if game:GetService("Players").LocalPlayer.FuelScoops.HasFuelScoop1.Value == false then
                buyscoop:InvokeServer("FuelScoop", 1)
            elseif game:GetService("Players").LocalPlayer.FuelScoops.HasFuelScoop2.Value == false then
                buyscoop:InvokeServer("FuelScoop", 2)
            elseif game:GetService("Players").LocalPlayer.FuelScoops.HasFuelScoop3.Value == false then
                buyscoop:InvokeServer("FuelScoop", 3)
            elseif game:GetService("Players").LocalPlayer.FuelScoops.HasFuelScoop4.Value == false then
                buyscoop:InvokeServer("FuelScoop", 4)
            elseif game:GetService("Players").LocalPlayer.FuelScoops.HasFuelScoop5.Value == false then
                buyscoop:InvokeServer("FuelScoop", 5)
            elseif game:GetService("Players").LocalPlayer.FuelScoops.HasFuelScoop6.Value == false then
                buyscoop:InvokeServer("FuelScoop", 6)
            elseif game:GetService("Players").LocalPlayer.FuelScoops.HasFuelScoop7.Value == false then
                buyscoop:InvokeServer("FuelScoop", 7)
            elseif game:GetService("Players").LocalPlayer.FuelScoops.HasFuelScoop8.Value == false then
                game:GetService("ReplicatedStorage").BuyAccelerant:InvokeServer("Zenith FuelScoop")
            end
            if game:GetService("Players").LocalPlayer.Backpacks.HasBackpack1.Value == false then
                buybag:InvokeServer("Backpack", 1)
            elseif game:GetService("Players").LocalPlayer.Backpacks.HasBackpack2.Value == false then
                buybag:InvokeServer("Backpack", 2)
            elseif game:GetService("Players").LocalPlayer.Backpacks.HasBackpack3.Value == false then
                buybag:InvokeServer("Backpack", 3)
            elseif game:GetService("Players").LocalPlayer.Backpacks.HasBackpack4.Value == false then
                buybag:InvokeServer("Backpack", 4)
            elseif game:GetService("Players").LocalPlayer.Backpacks.HasBackpack5.Value == false then
                buybag:InvokeServer("Backpack", 5)
            elseif game:GetService("Players").LocalPlayer.Backpacks.HasBackpack6.Value == false then
                buybag:InvokeServer("Backpack", 6)
            elseif game:GetService("Players").LocalPlayer.Backpacks.HasBackpack7.Value == false then
                buybag:InvokeServer("Backpack", 7)
            elseif game:GetService("Players").LocalPlayer.Backpacks.HasBackpack8.Value == false then
                game:GetService("ReplicatedStorage").BuyAccelerant:InvokeServer("Solar Backpack")
            end
            if game:GetService("Players").LocalPlayer.Rockets.HasRocket1.Value == false then
                buyrocket:InvokeServer("Rocket", 1)
            elseif game:GetService("Players").LocalPlayer.Rockets.HasRocket2.Value == false then
                buyrocket:InvokeServer("Rocket", 2)
            elseif game:GetService("Players").LocalPlayer.Rockets.HasRocket3.Value == false then
                buyrocket:InvokeServer("Rocket", 3)
            elseif game:GetService("Players").LocalPlayer.Rockets.HasRocket4.Value == false then
                buyrocket:InvokeServer("Rocket", 4)
            elseif game:GetService("Players").LocalPlayer.Rockets.HasRocket5.Value == false then
                buyrocket:InvokeServer("Rocket", 5)
            elseif game:GetService("Players").LocalPlayer.Rockets.HasRocket6.Value == false then
                buyrocket:InvokeServer("Rocket", 6)
            elseif game:GetService("Players").LocalPlayer.Rockets.HasRocket7.Value == false then
                buyrocket:InvokeServer("Rocket", 7)
            elseif game:GetService("Players").LocalPlayer.Rockets.HasRocket8.Value == false then
                game:GetService("ReplicatedStorage").BuyAccelerant:InvokeServer("Prototype X-A1")
            elseif game:GetService("Players").LocalPlayer.Rockets.HasRocket9.Value == false then
                game:GetService("ReplicatedStorage").BuyAccelerant:InvokeServer("UFO")
            end
        end
    end
})
Tab:AddToggle({
    Name = "Auto Buy Scoop",
    Default = false,
    Callback = function(v)
        getgenv().buyscoop = v
        while getgenv().buyscoop do
            wait()
            if game:GetService("Players").LocalPlayer.FuelScoops.HasFuelScoop1.Value == false then
                buyscoop:InvokeServer("FuelScoop", 1)
            elseif game:GetService("Players").LocalPlayer.FuelScoops.HasFuelScoop2.Value == false then
                buyscoop:InvokeServer("FuelScoop", 2)
            elseif game:GetService("Players").LocalPlayer.FuelScoops.HasFuelScoop3.Value == false then
                buyscoop:InvokeServer("FuelScoop", 3)
            elseif game:GetService("Players").LocalPlayer.FuelScoops.HasFuelScoop4.Value == false then
                buyscoop:InvokeServer("FuelScoop", 4)
            elseif game:GetService("Players").LocalPlayer.FuelScoops.HasFuelScoop5.Value == false then
                buyscoop:InvokeServer("FuelScoop", 5)
            elseif game:GetService("Players").LocalPlayer.FuelScoops.HasFuelScoop6.Value == false then
                buyscoop:InvokeServer("FuelScoop", 6)
            elseif game:GetService("Players").LocalPlayer.FuelScoops.HasFuelScoop7.Value == false then
                buyscoop:InvokeServer("FuelScoop", 7)
            elseif game:GetService("Players").LocalPlayer.FuelScoops.HasFuelScoop8.Value == false then
                game:GetService("ReplicatedStorage").BuyAccelerant:InvokeServer("Zenith FuelScoop")
            end
        end
    end
})
Tab:AddToggle({
    Name = "Auto Buy Backpack",
    Default = false,
    Callback = function(v)
        getgenv().buybag = v
        while getgenv().buybag do
            wait()
            if game:GetService("Players").LocalPlayer.Backpacks.HasBackpack1.Value == false then
                buybag:InvokeServer("Backpack", 1)
            elseif game:GetService("Players").LocalPlayer.Backpacks.HasBackpack2.Value == false then
                buybag:InvokeServer("Backpack", 2)
            elseif game:GetService("Players").LocalPlayer.Backpacks.HasBackpack3.Value == false then
                buybag:InvokeServer("Backpack", 3)
            elseif game:GetService("Players").LocalPlayer.Backpacks.HasBackpack4.Value == false then
                buybag:InvokeServer("Backpack", 4)
            elseif game:GetService("Players").LocalPlayer.Backpacks.HasBackpack5.Value == false then
                buybag:InvokeServer("Backpack", 5)
            elseif game:GetService("Players").LocalPlayer.Backpacks.HasBackpack6.Value == false then
                buybag:InvokeServer("Backpack", 6)
            elseif game:GetService("Players").LocalPlayer.Backpacks.HasBackpack7.Value == false then
                buybag:InvokeServer("Backpack", 7)
            elseif game:GetService("Players").LocalPlayer.Backpacks.HasBackpack8.Value == false then
                game:GetService("ReplicatedStorage").BuyAccelerant:InvokeServer("Solar Backpack")
            end
        end
    end
})
Tab:AddToggle({
    Name = "Auto Buy Rocket",
    Default = false,
    Callback = function(v)
        getgenv().buyrocket = v
        while getgenv().buyrocket do
            wait()
            if game:GetService("Players").LocalPlayer.Rockets.HasRocket1.Value == false then
                buyrocket:InvokeServer("Rocket", 1)
            elseif game:GetService("Players").LocalPlayer.Rockets.HasRocket2.Value == false then
                buyrocket:InvokeServer("Rocket", 2)
            elseif game:GetService("Players").LocalPlayer.Rockets.HasRocket3.Value == false then
                buyrocket:InvokeServer("Rocket", 3)
            elseif game:GetService("Players").LocalPlayer.Rockets.HasRocket4.Value == false then
                buyrocket:InvokeServer("Rocket", 4)
            elseif game:GetService("Players").LocalPlayer.Rockets.HasRocket5.Value == false then
                buyrocket:InvokeServer("Rocket", 5)
            elseif game:GetService("Players").LocalPlayer.Rockets.HasRocket6.Value == false then
                buyrocket:InvokeServer("Rocket", 6)
            elseif game:GetService("Players").LocalPlayer.Rockets.HasRocket7.Value == false then
                buyrocket:InvokeServer("Rocket", 7)
            elseif game:GetService("Players").LocalPlayer.Rockets.HasRocket8.Value == false then
                game:GetService("ReplicatedStorage").BuyAccelerant:InvokeServer("Prototype X-A1")
            elseif game:GetService("Players").LocalPlayer.Rockets.HasRocket9.Value == false then
                game:GetService("ReplicatedStorage").BuyAccelerant:InvokeServer("UFO")
            end
        end
    end
})
Tab:AddDropdown({
    Name = "Select Gem Shop Item",
    Default = "Cash Booster",
    Options = {"Cash Booster", "Speed Booster", "Fuel Booster", "Dark Matter Core"},
    Callback = function(v)
        selectgemitem = v
    end
})
Tab:AddButton({
    Name = "Buy Gem Shop Selected Item",
    Callback = function()
        game:GetService("ReplicatedStorage").BuyAccelerant:InvokeServer(selectgemitem)
    end
})
Tab:AddToggle({
    Name = "Auto Buy Gem Shop Selected Item",
    Default = false,
    Callback = function(v)
        getgenv().buygemitem = v
        while getgenv().buygemitem do
            wait()
            game:GetService("ReplicatedStorage").BuyAccelerant:InvokeServer(selectgemitem)
        end
    end
})
Tab:AddDropdown({
    Name = "Select FuelBot",
    Default = "Used FB-D2",
    Options = {"Used FB-D2", "New FB-D2", "Mining Laser Bot", "Zenith Fuel Collection Cube"},
    Callback = function(v)
        selectbot = v
    end
})
Tab:AddButton({
    Name = "Buy Selected Bot",
    Callback = function()
        if selectbot == "Used FB-D2" then
            hum.CFrame = CFrame.new(6.75658274, 3.09764528, -108.635513, -0.242999703, 3.60356849e-11, 0.970026374, -7.87299399e-08, 1, -1.9759657e-08, -0.970026374, -8.11717129e-08, -0.242999703)
            wait(0.7)
            fp(game:GetService("Workspace").MainIsland.BotSellers.FuelBot1Seller.Buy.Attachment.ProximityPrompt)
        elseif selectbot == "New FB-D2" then
            hum.CFrame = CFrame.new(21.226078, 3.09764528, -102.83947, -0.672683179, 1.35521434e-08, -0.73993063, 3.07054826e-08, 1, -9.59943769e-09, 0.73993063, -2.91773077e-08, -0.672683179)
            wait(0.7)
            fp(game:GetService("Workspace").MainIsland.BotSellers.FuelBot2Seller.Buy.Attachment.ProximityPrompt)
        elseif selectbot == "Mining Laser Bot" then
            hum.CFrame = CFrame.new(40.7236786, 3.09764552, -97.1493225, -0.0773795471, -2.42081004e-08, -0.997001708, 5.03437256e-08, 1, -2.81881913e-08, 0.997001708, -5.237397e-08, -0.0773795471)
            wait(0.7)
            fp(game:GetService("Workspace").MainIsland.BotSellers.FuelBot3Seller.Buy.Attachment.ProximityPrompt)
        elseif selectbot == "Zenith Fuel Collection Cube" then
            hum.CFrame = CFrame.new(55.219017, 3.09764624, -92.2693024, -0.51104641, -5.64905172e-08, -0.859553099, 4.38952874e-08, 1, -9.18186984e-08, 0.859553099, -8.46539479e-08, -0.51104641)
            wait(0.7)
            fp(game:GetService("Workspace").MainIsland.BotSellers.FuelBot4Seller.Buy.Attachment.ProximityPrompt)
        end
    end
})
Tab:AddToggle({
    Name = "Auto Buy Selected Bot",
    Default = false,
    Callback = function(v)
        getgenv().buyfuelbot = v
        while getgenv().buyfuelbot do
            wait()
            if selectbot == "Used FB-D2" then
                hum.CFrame = CFrame.new(6.75658274, 3.09764528, -108.635513, -0.242999703, 3.60356849e-11, 0.970026374, -7.87299399e-08, 1, -1.9759657e-08, -0.970026374, -8.11717129e-08, -0.242999703)
                wait(0.7)
                fp(game:GetService("Workspace").MainIsland.BotSellers.FuelBot1Seller.Buy.Attachment.ProximityPrompt)
            elseif selectbot == "New FB-D2" then
                hum.CFrame = CFrame.new(21.226078, 3.09764528, -102.83947, -0.672683179, 1.35521434e-08, -0.73993063, 3.07054826e-08, 1, -9.59943769e-09, 0.73993063, -2.91773077e-08, -0.672683179)
                wait(0.7)
                fp(game:GetService("Workspace").MainIsland.BotSellers.FuelBot2Seller.Buy.Attachment.ProximityPrompt)
            elseif selectbot == "Mining Laser Bot" then
                hum.CFrame = CFrame.new(40.7236786, 3.09764552, -97.1493225, -0.0773795471, -2.42081004e-08, -0.997001708, 5.03437256e-08, 1, -2.81881913e-08, 0.997001708, -5.237397e-08, -0.0773795471)
                wait(0.7)
                fp(game:GetService("Workspace").MainIsland.BotSellers.FuelBot3Seller.Buy.Attachment.ProximityPrompt)
            elseif selectbot == "Zenith Fuel Collection Cube" then
                hum.CFrame = CFrame.new(55.219017, 3.09764624, -92.2693024, -0.51104641, -5.64905172e-08, -0.859553099, 4.38952874e-08, 1, -9.18186984e-08, 0.859553099, -8.46539479e-08, -0.51104641)
                wait(0.7)
                fp(game:GetService("Workspace").MainIsland.BotSellers.FuelBot4Seller.Buy.Attachment.ProximityPrompt)
            end
        end
    end
})
local Tab = Window:MakeTab({
    Name = "Pad",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
Tab:AddButton({
    Name = "Tp Pad",
    Callback = function()
        game:GetService("ReplicatedStorage").Teleport:FireServer()
    end
})
Tab:AddButton({
    Name = "Tp Rocket",
    Callback = function()
        game:GetService("ReplicatedStorage").BoardRocket:FireServer()
    end
})
Tab:AddButton({
    Name = "Remove Player From Rocket",
    Callback = function()
        game:GetService("ReplicatedStorage").RemovePlayer:FireServer()
    end
})
Tab:AddButton({
    Name = "Use Fuel Booster",
    Callback = function()
        for i, v in pairs(owner():GetDescendants()) do
            if v:IsA("Folder") and v.Name == "Sign1" then
                for i, v in pairs(v:GetChildren()) do
                    if v:IsA("Part") and v.Name == "PlusBtn" then
                        fireclickdetector(v.ClickDetector)
                    end
                end
            end
        end
    end
})
Tab:AddButton({
    Name = "Use Speed Booster",
    Callback = function()
        for i, v in pairs(owner():GetDescendants()) do
            if v:IsA("Folder") and v.Name == "Sign2" then
                for i, v in pairs(v:GetChildren()) do
                    if v:IsA("Part") and v.Name == "PlusBtn" then
                        fireclickdetector(v.ClickDetector)
                    end
                end
            end
        end
    end
})
Tab:AddButton({
    Name = "Use Cash Booster",
    Callback = function()
        for i, v in pairs(owner():GetDescendants()) do
            if v:IsA("Folder") and v.Name == "Sign3" then
                for i, v in pairs(v:GetChildren()) do
                    if v:IsA("Part") and v.Name == "PlusBtn" then
                        fireclickdetector(v.ClickDetector)
                    end
                end
            end
        end
    end
})
Tab:AddButton({
    Name = "Lockdown Pad",
    Callback = function()
        if owner().Lockdown.Active.Value == false then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = owner().Lockdown.Stand.LockdownButton.CFrame * CFrame.new(0, 0, 5)
            wait(0.7)
            fp(owner().Lockdown.Stand.LockdownButton.Attachment.ProximityPrompt)
        end
    end
})
local Tab = Window:MakeTab({
    Name = "Misc",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
Tab:AddSlider({
    Name = "Walkspeed",
    Min = 16,
    Max = 500,
    Default = 16,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = "",
    Callback = function(v)
        setws = v
    end
})
Tab:AddToggle({
    Name = "Toggle Walkspeed",
    Default = false,
    Callback = function(v)
        getgenv().ws = v
        while getgenv().ws do
            wait()
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = setws
        end
        if not getgenv().ws then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 16
        end
    end
})
Tab:AddSlider({
    Name = "Jumppower",
    Min = 50,
    Max = 1000,
    Default = 50,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = "",
    Callback = function(v)
        setjp = v
    end
})
Tab:AddToggle({
    Name = "Toggle Jumppower",
    Default = false,
    Callback = function(v)
        getgenv().jp = v
        while getgenv().jp do
            wait()
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").JumpPower = setjp
        end
        if not getgenv().jp then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").JumpPower = 50
        end
    end
})
Tab:AddButton({
    Name = "Rank Gui",
    Callback = function()
        game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.RankUpFrame.Inner.Visible = true
        wait()
        game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.RankUpFrame.Visible = true
    end
})
Tab:AddButton({
    Name = "Teleport To Old World",
    Callback = function()
        game:GetService("TeleportService"):Teleport(5256165620, LocalPlayer)
    end
})
getgenv().label = true
repeat wait()
    fuellabel:Set("FuelStorage: " .. tostring(fuel.Value))
    rocketlabel:Set("Rocket Fuel: " .. tostring(rocketfuel.Value))
until not getgenv().label
OrionLib:Init()