local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/haris17890/name/main/orion.lua')))()
local Window = OrionLib:MakeWindow({Name = tostring(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name), HidePremium = false, SaveConfig = false, ConfigFolder = "OrionTest", IntroEnable = true, IntroText = tostring(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)})
local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
Tab:AddToggle({
    Name = "Auto Swing",
    Default = false,
    Callback = function(v)
        getgenv().swing = v
        while getgenv().swing do
            wait()
            for i, v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
                if v.Name == "attackKatanaScript" then
                    game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v.Parent)
                end
            end
            local A_1 = "swingKatana"
            local Event = game:GetService("Players").LocalPlayer.ninjaEvent
            Event:FireServer(A_1)
        end
        if not getgenv().swing then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
        end
    end
})
Tab:AddToggle({
    Name = "Auto Sell",
    Default = false,
    Callback = function(v)
        getgenv().sell = v
        while getgenv().sell do
            wait()
            firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), game:GetService("Workspace").sellAreaCircles.sellAreaCircle.circleInner, 0)
            firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), game:GetService("Workspace").sellAreaCircles.sellAreaCircle.circleInner, 1)
        end
    end
})
Tab:AddToggle({
    Name = "Auto Full Sell",
    Default = false,
    Callback = function(v)
        getgenv().sell = v
        while getgenv().sell do
            wait()
            if game:GetService("Players").LocalPlayer.PlayerGui.gameGui.maxNinjitsuMenu.Visible == true then
                firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), game:GetService("Workspace").sellAreaCircles.sellAreaCircle.circleInner, 0)
                firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), game:GetService("Workspace").sellAreaCircles.sellAreaCircle.circleInner, 1)
            end
        end
    end
})
Tab:AddToggle({
    Name = "Auto Collect Coins",
    Default = false,
    Callback = function(v)
        getgenv().coin = v
        while getgenv().coin do
            wait()
            for i, v in pairs(game:GetService("Workspace").spawnedCoins.Valley:GetChildren()) do
                if v.Name == "Coin" or v.Name == "Green Coin" or v.Name == "Purple Coin Crate" or v.Name == "Pink Coin" or v.Name == "Orange Coin Crate" then
                    if v.Transparency ~= 1 then
                        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(v.Position)
                    end
                end
            end
        end
    end
})
Tab:AddToggle({
    Name = "Auto Collect Chi",
    Default = false,
    Callback = function(v)
        getgenv().chi = v
        while getgenv().chi do
            wait()
            for i, v in pairs(game:GetService("Workspace").spawnedCoins.Valley:GetChildren()) do
                if v.Name == "Chi" or v.Name == "Blue Chi Crate" then
                    if v.Transparency ~= 1 then
                        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(v.Position)
                    end
                end
            end
        end
    end
})
Tab:AddToggle({
    Name = "Auto Hoop",
    Default = false,
    Callback = function(v)
        getgenv().hoop = v
        while getgenv().hoop do
            wait()
            for _, v in pairs(workspace.Hoops:GetDescendants()) do
                if v.ClassName == "MeshPart" then
                    local hoopframe = v.touchPart.CFrame
                    v.touchPart.CFrame = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame
                    wait()
                    v.touchPart.CFrame = hoopframe
                end
            end
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
            local A_1 = "buyAllSwords"
            local A_2 = "Ground"
            local Event = game:GetService("Players").LocalPlayer.ninjaEvent
            Event:FireServer(A_1, A_2)
            local A_1 = "buyAllBelts"
            local A_2 = "Ground"
            local Event = game:GetService("Players").LocalPlayer.ninjaEvent
            Event:FireServer(A_1, A_2)
            local A_1 = "buyAllRanks"
            local A_2 = "Ground"
            local Event = game:GetService("Players").LocalPlayer.ninjaEvent
            Event:FireServer(A_1, A_2)
            local A_1 = "buyAllSkills"
            local A_2 = "Ground"
            local Event = game:GetService("Players").LocalPlayer.ninjaEvent
            Event:FireServer(A_1, A_2)
            local A_1 = "buyAllShurikens"
            local A_2 = "Ground"
            local Event = game:GetService("Players").LocalPlayer.ninjaEvent
            Event:FireServer(A_1, A_2)
        end
    end
})
Tab:AddToggle({
    Name = "Auto Buy Sword",
    Default = false,
    Callback = function(v)
        getgenv().sword = v
        while getgenv().sword do
            wait()
            local A_1 = "buyAllSwords"
            local A_2 = "Ground"
            local Event = game:GetService("Players").LocalPlayer.ninjaEvent
            Event:FireServer(A_1, A_2)
        end
    end
})
Tab:AddToggle({
    Name = "Auto Buy Belt",
    Default = false,
    Callback = function(v)
        getgenv().belt = v
        while getgenv().belt do
            wait()
            local A_1 = "buyAllBelts"
            local A_2 = "Ground"
            local Event = game:GetService("Players").LocalPlayer.ninjaEvent
            Event:FireServer(A_1, A_2)
        end
    end
})
Tab:AddToggle({
    Name = "Auto Buy Rank",
    Default = false,
    Callback = function(v)
        getgenv().rank = v
        while getgenv().rank do
            wait()
            local A_1 = "buyAllRank"
            local A_2 = "Ground"
            local Event = game:GetService("Players").LocalPlayer.ninjaEvent
            Event:FireServer(A_1, A_2)
        end
    end
})
Tab:AddToggle({
    Name = "Auto Buy Jump",
    Default = false,
    Callback = function(v)
        getgenv().jump = v
        while getgenv().jump do
            wait()
            local A_1 = "buyAllSkills"
            local A_2 = "Ground"
            local Event = game:GetService("Players").LocalPlayer.ninjaEvent
            Event:FireServer(A_1, A_2)
        end
    end
})
Tab:AddToggle({
    Name = "Auto Buy Shuriken",
    Default = false,
    Callback = function(v)
        getgenv().shuriken = v
        while getgenv().shuriken do
            wait()
            local A_1 = "buyAllShurikens"
            local A_2 = "Ground"
            local Event = game:GetService("Players").LocalPlayer.ninjaEvent
            Event:FireServer(A_1, A_2)
        end
    end
})
local Tab = Window:MakeTab({
    Name = "Pet",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
local thl = {}
for i, v in pairs(game:GetService("Workspace").mapCrystalsFolder:GetChildren()) do
    thl[i] = v.Name
end
Tab:AddDropdown({
    Name = "Select Pet",
    Default = "1",
    Options = thl,
    Callback = function(v)
        selectedpet = v
    end
})
Tab:AddToggle({
    Name = "Auto Buy Selected Pet",
    Default = false,
    Callback = function(v)
        getgenv().pet = v
        while getgenv().pet do
            wait()
            local A_1 = "openCrystal"
            local A_2 = selectedpet
            local Event = game:GetService("ReplicatedStorage").rEvents.openCrystalRemote
            Event:InvokeServer(A_1, A_2)
        end
    end
})
Tab:AddToggle({
    Name = "Auto Evolve Pet",
    Default = false,
    Callback = function(v)
        local A_1 = "autoEvolvePets"
        local Event = game:GetService("ReplicatedStorage").rEvents.autoEvolveRemote
        Event:InvokeServer(A_1)
    end
})
local Tab = Window:MakeTab({
    Name = "Teleport",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
local tp = {}
for i, v in pairs(game:GetService("Workspace").islandUnlockParts:GetChildren()) do
    tp[i] = v.Name
end
Tab:AddDropdown({
    Name = "Teleport Selected Island",
    Default = "1",
    Options = tp,
    Callback = function(v)
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game:GetService("Workspace").islandUnlockParts[v].CFrame
    end
})
Tab:AddButton({
    Name = "Unlock All Island",
    Callback = function()
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game:GetService("Workspace").islandUnlockParts["Enchanted Island"].CFrame
        wait()
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game:GetService("Workspace").islandUnlockParts["Astral Island"].CFrame
        wait()
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game:GetService("Workspace").islandUnlockParts["Mystical Island"].CFrame
        wait()
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game:GetService("Workspace").islandUnlockParts["Space Island"].CFrame
        wait()
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game:GetService("Workspace").islandUnlockParts["Tundra Island"].CFrame
        wait()
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game:GetService("Workspace").islandUnlockParts["Eternal Island"].CFrame
        wait()
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game:GetService("Workspace").islandUnlockParts.Sandstorm.CFrame
        wait()
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game:GetService("Workspace").islandUnlockParts.Thunderstorm.CFrame
        wait()
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game:GetService("Workspace").islandUnlockParts["Ancient Inferno Island"].CFrame
        wait()
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game:GetService("Workspace").islandUnlockParts["Midnight Shadow Island"].CFrame
        wait()
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game:GetService("Workspace").islandUnlockParts["Mythical Souls Island"].CFrame
        wait()
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game:GetService("Workspace").islandUnlockParts["Winter Wonder Island"].CFrame
        wait()
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game:GetService("Workspace").islandUnlockParts["Golden Master Island"].CFrame
        wait()
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game:GetService("Workspace").islandUnlockParts["Dragon Legend Island"].CFrame
        wait()
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game:GetService("Workspace").islandUnlockParts["Cybernetic Legends Island"].CFrame
        wait()
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game:GetService("Workspace").islandUnlockParts["Skystorm Ultraus Island"].CFrame
        wait()
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game:GetService("Workspace").islandUnlockParts["Chaos Legends Island"].CFrame
        wait()
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game:GetService("Workspace").islandUnlockParts["Soul Fusion Island"].CFrame
        wait()
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game:GetService("Workspace").islandUnlockParts["Dark Elements Island"].CFrame
        wait()
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game:GetService("Workspace").islandUnlockParts["Inner Peace Island"].CFrame
        wait()
        game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game:GetService("Workspace").islandUnlockParts["Blazing Vortex Island"].CFrame
    end
})
local Tab = Window:MakeTab({
    Name = "Boss",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
local boss = {}
for i, v in pairs(game:GetService("Workspace").bossFolder:GetChildren()) do
    boss[i] = v.Name
end
local Dropdown = Tab:AddDropdown({
    Name = "Select Boss",
    Default = "1",
    Options = boss,
    Callback = function(v)
        selectedboss = v
    end
})
function sword()
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
        if v.Name == "attackKatanaScript" then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):EquipTool(v.Parent)
        end
    end
    wait()
    for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if v.Name == "attackKatanaScript" then
            v.Parent:Activate()
        end
    end
end
Tab:AddToggle({
    Name = "Auto Kill Selected Boss",
    Default = false,
    Callback = function(v)
        getgenv().kill = v
        while getgenv().kill do
            wait()
            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game:GetService("Workspace").bossFolder[selectedboss]:WaitForChild("HumanoidRootPart").CFrame
            wait()
            sword()
        end
        if not getgenv().kill then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
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
    Max = 400,
    Default = 16,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = "",
    Callback = function(v)
        game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = v
    end
})
Tab:AddSlider({
    Name = "Jumppower",
    Min = 50,
    Max = 1000,
    Default = 5,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = "",
    Callback = function(v)
        game.Players.LocalPlayer.Character:WaitForChild("Humanoid").JumpPower = v
    end
})
OrionLib:Init()
