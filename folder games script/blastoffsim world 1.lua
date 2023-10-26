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
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/airesz178/Ui-Library/main/orion%20ui%20library')))()
local Window = OrionLib:MakeWindow({Name = tostring(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name), HidePremium = false, SaveConfig = false, ConfigFolder = "OrionTest", IntroEnable = true, IntroText = tostring(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)})
--function1
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
function humanoid()
    if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") or game.Players.LocalPlayer.Character:WaitForChild("Humanoid") then
        return game.Players.LocalPlayer.Character.Humanoid
    end
end
function humanoidrootpart()
    if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") or game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") then
        return game.Players.LocalPlayer.Character.HumanoidRootPart
    end
end
--local
local path = getsenv(game:GetService("Players").LocalPlayer.Character.AntiCheat)
local path2 = getsenv(game:GetService("Players").LocalPlayer.Character.AntiCheat2)
local hum = humanoidrootpart()
local hum2 = humanoid()
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
--function2
function farming()
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.Name == "FuelScoop" then
            hum2:EquipTool(v)
        end
    end
    firesignal(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.CollectFuel.Activated)
    hum.CFrame = CFrame.new(23.9904442, 6.55753279, -35.7528076, -0.725380957, 1.71495209e-08, 0.688347638, 1.84155768e-09, 1, -2.29734063e-08, -0.688347638, -1.53968394e-08, -0.725380957)
    wait()
    hum.CFrame = CFrame.new(23.6974106, 7.05753136, -36.2668228, 0.203935489, -8.72376589e-08, 0.978984356, 9.23579719e-08, 1, 6.98709783e-08, -0.978984356, 7.61678365e-08, 0.203935489)
end
function farming2()
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.Name == "FuelScoop" then
            hum2:EquipTool(v)
        end
    end
    firesignal(game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.CollectFuel.Activated)
    hum.CFrame = CFrame.new(23.9904442, 6.55753279, -35.7528076, -0.725380957, 1.71495209e-08, 0.688347638, 1.84155768e-09, 1, -2.29734063e-08, -0.688347638, -1.53968394e-08, -0.725380957)
    wait()
    hum.CFrame = CFrame.new(23.6974106, 7.05753136, -36.2668228, 0.203935489, -8.72376589e-08, 0.978984356, 9.23579719e-08, 1, 6.98709783e-08, -0.978984356, 7.61678365e-08, 0.203935489)
    firetouchinterest(hum, owner().FuelCollector.CollectorPad, 0)
    wait()
    firetouchinterest(hum, owner().FuelCollector.CollectorPad, 1)
end
function addall()
    hum.CFrame = owner().FuelCollector.TransferToRocket.AddAll.CFrame * CFrame.new(0, 0, -5)
    wait()
    fp(owner().FuelCollector.TransferToRocket.AddAll.ProximityPrompt)
end
function launch()
    hum.CFrame = owner().LaunchStation.LaunchButton.CFrame * CFrame.new(0, 0, 5)
    wait()
    fp(owner().LaunchStation.LaunchButton.Attachment.ProximityPrompt)
end
function farmrocket()
    if owner().Values.Fuel.Value >= selectfuel and not owner().LaunchStation.LoudSpeaker.SoundBlock["Alarm_03"].Playing == true and not rocketlaunch.Value == true then
        repeat wait()
            addall()
        until owner().Values.Fuel.Value <= selectfuel or not getgenv().farmrocket
    else
        farming2()
    end
    if owner().Values.RocketFuel.Value >= tonumber(selectfuel) and not owner().LaunchStation.LoudSpeaker.SoundBlock["Alarm_03"].Playing == true and not rocketlaunch.Value == true and owner().Values.RocketSpeed.Value == 0 then
        repeat wait()
            launch()
        until rocketlaunch.Value == true or owner().LaunchStation.LoudSpeaker.SoundBlock["Alarm_03"].Playing == true or not getgenv().farmrocket
    end
end
--anticheat
hookfunction(path.checkState, function()
    return
end)
hookfunction(path2.check, function()
    return
end)
--mission
function mission()
    hum.CFrame = game:GetService("Workspace").Islands.CloudIsland.Obby.PrizeChest.Chest.CFrame * CFrame.new(0, 2, 0)
    wait(0.5)
    fp(game:GetService("Workspace").Islands.CloudIsland.Obby.Click.Attachment.ProximityPrompt)
    wait(8)
    hum.CFrame = game:GetService("Workspace").Islands.FloatingIsland.Obby.Prize.PrizeChest.Chest.CFrame * CFrame.new(0, 2, 0)
    wait(0.5)
    fp(game:GetService("Workspace").Islands.FloatingIsland.Obby.Prize.Click.Attachment.ProximityPrompt)
    wait(8)
    hum.CFrame = game:GetService("Workspace").Islands.SatelliteIsland.Prize.PrizeChest.Chest.CFrame * CFrame.new(0, 2, 0)
    wait(0.5)
    fp(game:GetService("Workspace").Islands.SatelliteIsland.Prize.Click.Attachment.ProximityPrompt)
    wait(8)
    hum.CFrame = game:GetService("Workspace").Islands.BeeIsland.Prize.PrizeChest.Chest.CFrame * CFrame.new(0, 2, 0)
    wait(0.5)
    fp(game:GetService("Workspace").Islands.BeeIsland.Prize.Click.Attachment.ProximityPrompt)
    wait(6)
    if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.MoonlingsRescued.Number.Text <= "40" then
        repeat wait()
            for i, v in pairs(game:GetService("Workspace").Islands.MoonIsland:GetDescendants()) do
                if v.Name == "Detector" then
                    firetouchinterest(hum, v, 0)
                    firetouchinterest(hum, v, 1)
                end
            end
        until game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.MoonlingsRescued.Number.Text >= "40"
    end
    wait(9)
    hum.CFrame = game:GetService("Workspace").Islands.MoonIsland.Prize.PrizeChest.Chest.CFrame * CFrame.new(0, 2, 0)
    wait(0.5)
    fp(game:GetService("Workspace").Islands.MoonIsland.Prize.Click.Attachment.ProximityPrompt)
    wait(6)
    fc(game:GetService("Workspace").Islands.DarkMatterIsland.crystal1.OffGem.ClickDetector)
    wait(0.5)
    fc(game:GetService("Workspace").Islands.DarkMatterIsland.crystal2.OffGem.ClickDetector)
    wait(0.5)
    fc(game:GetService("Workspace").Islands.DarkMatterIsland.crystal3.OffGem.ClickDetector)
    wait(7)
    hum.CFrame = game:GetService("Workspace").Islands.DarkMatterIsland.Prize.PrizeChest.Chest.CFrame * CFrame.new(0, 1, 3)
    wait(0.7)
    fp(game:GetService("Workspace").Islands.DarkMatterIsland.Prize.Click.Attachment.ProximityPrompt)
    wait(8)
    hum.CFrame = game:GetService("Workspace").Islands.SpaceRocksIsland.Prize.PrizeChest.Chest.CFrame * CFrame.new(0, 2, 0)
    wait(0.6)
    fp(game:GetService("Workspace").Islands.SpaceRocksIsland.Prize.Click.Attachment.ProximityPrompt)
    wait(6)
    for i, v in pairs(game:GetService("Workspace").Islands.MarsStationZero.Station.ControlStation.Buttons:GetDescendants()) do
        if v.Name == "DB" and v.Value == false then
            fc(v.Parent.ClickDetector)
        end
    end
    wait()
    fc(game:GetService("Workspace").Islands.MarsStationZero.Station.ControlStation.Shutdown.ClickDetector)
    wait(2)
    hum.CFrame = game:GetService("Workspace").Islands.MarsStationZero.Station.Prize.PrizeChest.Chest.CFrame * CFrame.new(0, 2, 0)
    wait(0.7)
    fp(game:GetService("Workspace").Islands.MarsStationZero.Station.Prize.Click.Attachment.ProximityPrompt)
    wait(1)
    if game:GetService("Players").LocalPlayer.Misc.GreenCrystalPower.Value <= 30 then
        repeat wait()
            for i, v in pairs(game:GetService("Workspace").Islands.AsteroidIsland.Crystals.GreenCrystals:GetChildren()) do
                ft(hum, v, 0)
                ft(hum, v, 1)
            end
        until game:GetService("Players").LocalPlayer.Misc.GreenCrystalPower.Value >= 30
    end
    wait(7)
    if game:GetService("Players").LocalPlayer.Misc.BlueCrystalPower.Value <= 30 then
        repeat wait()
            for i, v in pairs(game:GetService("Workspace").Islands.AsteroidIsland.Crystals.BlueCrystals:GetChildren()) do
                ft(hum, v, 0)
                ft(hum, v, 1)
            end
        until game:GetService("Players").LocalPlayer.Misc.BlueCrystalPower.Value >= 30
    end
    wait(7)
    if game:GetService("Players").LocalPlayer.Misc.RedCrystalPower.Value <= 30 then
        repeat wait()
            for i, v in pairs(game:GetService("Workspace").Islands.AsteroidIsland.Crystals.RedCrystals:GetChildren()) do
                ft(hum, v, 0)
                ft(hum, v, 1)
            end
        until game:GetService("Players").LocalPlayer.Misc.RedCrystalPower.Value >= 30
    end
    wait(7)
    hum.CFrame = game:GetService("Workspace").Islands.AsteroidIsland.Station.Button.CFrame * CFrame.new(0, 2, 0)
    wait(0.5)
    fp(game:GetService("Workspace").Islands.AsteroidIsland.Station.Button.Attachment.ProximityPrompt)
    wait(6)
    if game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.MoonBerrysCollected.Number.Text <= "20" then
        repeat wait()
            for i, v in pairs(game:GetService("Workspace").Islands.MoonBerryIsland.Berrys:GetDescendants()) do
                if v.Name == "Detector" then
                    firetouchinterest(hum, v, 0)
                    firetouchinterest(hum, v, 1)
                end
            end
        until game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.MoonBerrysCollected.Number.Text >= "20"
    end
    wait(7)
    hum.CFrame = game:GetService("Workspace").Islands.MoonBerryIsland.Hut.Click.CFrame * CFrame.new(0, 0, -3)
    wait(0.7)
    fp(game:GetService("Workspace").Islands.MoonBerryIsland.Hut.Click.Attachment.ProximityPrompt)
    wait(7)
    hum.CFrame = game:GetService("Workspace").Islands.Vanish.Prize.PrizeChest.Chest.CFrame * CFrame.new(0, 2, 0)
    wait(0.6)
    fp(game:GetService("Workspace").Islands.Vanish.Prize.Click.Attachment.ProximityPrompt)
    wait(8)
    hum.CFrame = game:GetService("Workspace").Islands.FallingStar.Begin.Btn.CFrame * CFrame.new(0, 2, 0)
    wait(0.7)
    fp(game:GetService("Workspace").Islands.FallingStar.Begin.Btn.Attachment.ProximityPrompt)
    wait(3)
    hum.CFrame = game:GetService("Workspace").Islands.FallingStar.Begin.Btn.CFrame * CFrame.new(0, 2, 0)
    wait(0.7)
    fp(game:GetService("Workspace").Islands.FallingStar.Begin.Btn.Attachment.ProximityPrompt)
    wait(3)
    if game:GetService("Players").LocalPlayer.Misc.Stars.Value <= 10 then
        repeat wait()
            for i, v in pairs(game:GetService("Workspace").Islands.FallingStar:GetChildren()) do
                if v.Name == "Star" then
                    for i, v in pairs(v:GetChildren()) do
                        if v.Name == "Main" then
                            firetouchinterest(hum, v, 0)
                            firetouchinterest(hum, v, 1)
                        end
                    end
                end
            end
        until game:GetService("Players").LocalPlayer.Misc.Stars.Value >= 10
    end
    wait(7)
    hum.CFrame = game:GetService("Workspace").Islands.FallingStar.Prize.PrizeChest.Chest.CFrame * CFrame.new(0, 2, 0)
    wait(0.7)
    fp(game:GetService("Workspace").Islands.FallingStar.Prize.Click.Attachment.ProximityPrompt)
end
--script
local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
local fuellabel = Tab:AddLabel("FuelStorage: " .. tostring(fuel.Value))
local rocketlabel = Tab:AddLabel("Rocket Fuel: " .. tostring(rocketfuel.Value))
Tab:AddToggle({
    Name = "Auto Farm",
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
    Name = "Farm Fuel Rocket",
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
            firetouchinterest(hum, owner().FuelCollector.CollectorPad, 0)
            wait()
            firetouchinterest(hum, owner().FuelCollector.CollectorPad, 1)
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
                firetouchinterest(hum, owner().FuelCollector.CollectorPad, 0)
                wait()
                firetouchinterest(hum, owner().FuelCollector.CollectorPad, 1)
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
    Name = "Auto Buy All",
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
                buyscoop:InvokeServer("FuelScoop", 8)
            elseif game:GetService("Players").LocalPlayer.FuelScoops.HasFuelScoop9.Value == false then
                buyscoop:InvokeServer("FuelScoop", 9)
            elseif game:GetService("Players").LocalPlayer.FuelScoops.HasFuelScoop10.Value == false then
                buyscoop:InvokeServer("FuelScoop", 10)
            elseif game:GetService("Players").LocalPlayer.FuelScoops.HasFuelScoop11.Value == false then
                buyscoop:InvokeServer("FuelScoop", 11)
            elseif game:GetService("Players").LocalPlayer.FuelScoops.HasFuelScoop12.Value == false then
                buyscoop:InvokeServer("FuelScoop", 12)
            elseif game:GetService("Players").LocalPlayer.FuelScoops.HasDarkMatterFuelScoop.Value == false then
                game:GetService("ReplicatedStorage").BuyAccelerant:InvokeServer("Dark Matter FuelScoop")
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
                buybag:InvokeServer("Backpack", 8)
            elseif game:GetService("Players").LocalPlayer.Backpacks.HasBackpack9.Value == false then
                buybag:InvokeServer("Backpack", 9)
            elseif game:GetService("Players").LocalPlayer.Backpacks.HasBackpack10.Value == false then
                buybag:InvokeServer("Backpack", 10)
            elseif game:GetService("Players").LocalPlayer.Backpacks.HasBackpack11.Value == false then
                buybag:InvokeServer("Backpack", 11)
            elseif game:GetService("Players").LocalPlayer.Backpacks.HasBackpack12.Value == false then
                buybag:InvokeServer("Backpack", 12)
            elseif game:GetService("Players").LocalPlayer.Backpacks.HasBackpack13.Value == false then
                buybag:InvokeServer("Backpack", 13)
            elseif game:GetService("Players").LocalPlayer.Backpacks.HasBackpackInf.Value == false then
                game:GetService("ReplicatedStorage").BuyAccelerant:InvokeServer("Infinite Backpack")
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
                buyrocket:InvokeServer("Rocket", 8)
            elseif game:GetService("Players").LocalPlayer.Rockets.HasRocket9.Value == false then
                buyrocket:InvokeServer("Rocket", 9)
            elseif game:GetService("Players").LocalPlayer.Rockets.HasRocket10.Value == false then
                buyrocket:InvokeServer("Rocket", 10)
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
                buyscoop:InvokeServer("FuelScoop", 8)
            elseif game:GetService("Players").LocalPlayer.FuelScoops.HasFuelScoop9.Value == false then
                buyscoop:InvokeServer("FuelScoop", 9)
            elseif game:GetService("Players").LocalPlayer.FuelScoops.HasFuelScoop10.Value == false then
                buyscoop:InvokeServer("FuelScoop", 10)
            elseif game:GetService("Players").LocalPlayer.FuelScoops.HasFuelScoop11.Value == false then
                buyscoop:InvokeServer("FuelScoop", 11)
            elseif game:GetService("Players").LocalPlayer.FuelScoops.HasFuelScoop12.Value == false then
                buyscoop:InvokeServer("FuelScoop", 12)
            elseif game:GetService("Players").LocalPlayer.FuelScoops.HasDarkMatterFuelScoop.Value == false then
                game:GetService("ReplicatedStorage").BuyAccelerant:InvokeServer("Dark Matter FuelScoop")
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
                buybag:InvokeServer("Backpack", 8)
            elseif game:GetService("Players").LocalPlayer.Backpacks.HasBackpack9.Value == false then
                buybag:InvokeServer("Backpack", 9)
            elseif game:GetService("Players").LocalPlayer.Backpacks.HasBackpack10.Value == false then
                buybag:InvokeServer("Backpack", 10)
            elseif game:GetService("Players").LocalPlayer.Backpacks.HasBackpack11.Value == false then
                buybag:InvokeServer("Backpack", 11)
            elseif game:GetService("Players").LocalPlayer.Backpacks.HasBackpack12.Value == false then
                buybag:InvokeServer("Backpack", 12)
            elseif game:GetService("Players").LocalPlayer.Backpacks.HasBackpack13.Value == false then
                buybag:InvokeServer("Backpack", 13)
            elseif game:GetService("Players").LocalPlayer.Backpacks.HasBackpackInf.Value == false then
                game:GetService("ReplicatedStorage").BuyAccelerant:InvokeServer("Infinite Backpack")
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
                buyrocket:InvokeServer("Rocket", 8)
            elseif game:GetService("Players").LocalPlayer.Rockets.HasRocket9.Value == false then
                buyrocket:InvokeServer("Rocket", 9)
            elseif game:GetService("Players").LocalPlayer.Rockets.HasRocket10.Value == false then
                buyrocket:InvokeServer("Rocket", 10)
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
    Default = "FuelBot 1.0",
    Options = {"FuelBot 1.0", "FuelBot 2.0", "DarkMatter FuelBot", "HandyBot"},
    Callback = function(v)
        selectbot = v
    end
})
Tab:AddButton({
    Name = "Buy Selected Bot",
    Callback = function()
        if selectbot == "FuelBot 1.0" then
            hum.CFrame = CFrame.new(6.75658274, 3.09764528, -108.635513, -0.242999703, 3.60356849e-11, 0.970026374, -7.87299399e-08, 1, -1.9759657e-08, -0.970026374, -8.11717129e-08, -0.242999703)
            wait(0.7)
            fp(game:GetService("Workspace").MainIsland.BotSellers.FuelBot1Seller.Buy.Attachment.ProximityPrompt)
        elseif selectbot == "FuelBot 2.0" then
            hum.CFrame = CFrame.new(21.226078, 3.09764528, -102.83947, -0.672683179, 1.35521434e-08, -0.73993063, 3.07054826e-08, 1, -9.59943769e-09, 0.73993063, -2.91773077e-08, -0.672683179)
            wait(0.7)
            fp(game:GetService("Workspace").MainIsland.BotSellers.FuelBot2Seller.Buy.Attachment.ProximityPrompt)
        elseif selectbot == "DarkMatter FuelBot" then
            hum.CFrame = CFrame.new(40.7236786, 3.09764552, -97.1493225, -0.0773795471, -2.42081004e-08, -0.997001708, 5.03437256e-08, 1, -2.81881913e-08, 0.997001708, -5.237397e-08, -0.0773795471)
            wait(0.7)
            fp(game:GetService("Workspace").MainIsland.BotSellers.FuelBot3Seller.Buy.Attachment.ProximityPrompt)
        elseif selectbot == "HandyBot" then
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
            if selectbot == "FuelBot 1.0" then
                hum.CFrame = CFrame.new(6.75658274, 3.09764528, -108.635513, -0.242999703, 3.60356849e-11, 0.970026374, -7.87299399e-08, 1, -1.9759657e-08, -0.970026374, -8.11717129e-08, -0.242999703)
                wait(0.7)
                fp(game:GetService("Workspace").MainIsland.BotSellers.FuelBot1Seller.Buy.Attachment.ProximityPrompt)
            elseif selectbot == "FuelBot 2.0" then
                hum.CFrame = CFrame.new(21.226078, 3.09764528, -102.83947, -0.672683179, 1.35521434e-08, -0.73993063, 3.07054826e-08, 1, -9.59943769e-09, 0.73993063, -2.91773077e-08, -0.672683179)
                wait(0.7)
                fp(game:GetService("Workspace").MainIsland.BotSellers.FuelBot2Seller.Buy.Attachment.ProximityPrompt)
            elseif selectbot == "DarkMatter FuelBot" then
                hum.CFrame = CFrame.new(40.7236786, 3.09764552, -97.1493225, -0.0773795471, -2.42081004e-08, -0.997001708, 5.03437256e-08, 1, -2.81881913e-08, 0.997001708, -5.237397e-08, -0.0773795471)
                wait(0.7)
                fp(game:GetService("Workspace").MainIsland.BotSellers.FuelBot3Seller.Buy.Attachment.ProximityPrompt)
            elseif selectbot == "HandyBot" then
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
            hum.CFrame = owner().Lockdown.Stand.LockdownButton.CFrame * CFrame.new(0, 0, 5)
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
        setws = tonumber(v)
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
        setjp = tonumber(v)
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
    Name = "Claim Free Gem",
    Callback = function()
        game.ReplicatedStorage.FreeGems1:FireServer()
    end
})
pcall(function()
    owner().Values.Fuel:GetPropertyChangedSignal("Value"):Connect(function()
        fuellabel:Set("FuelStorage: " .. tostring(fuel.Value))
    end)
    owner().Values.RocketFuel:GetPropertyChangedSignal("Value"):Connect(function()
        rocketlabel:Set("Rocket Fuel: " .. tostring(rocketfuel.Value))
    end)
end)
spawn(function()
    while wait() do
        hum2.WalkSpeed = setws
        hum2.JumpPower = setjp
    end
end)
OrionLib:Init()
