if game.Workspace:FindFirstChild("KIllAllPart") then
    game.Workspace.KIllAllPart:Destroy()
end
local part = Instance.new("Part")
part.Parent = game.Workspace
part.Name = "KIllAllPart"
part.Position = Vector3.new(0, 10000, 0)
part.Size = Vector3.new(1000, 10, 1000)
part.Anchored = true
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
ESP:Toggle(true)
ESP.Tracers = false
ESP.Names = false
ESP.Boxes = false
ESP.Players = false
local Window = Fluent:CreateWindow({
    Title = tostring(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name),
    SubTitle = "",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.Minus
})
---addtab
local Tabs = {
    Main = Window:AddTab({
        Title = "Main",
        Icon = "contact"
    }),
    Rock = Window:AddTab({
        Title = "Rock",
        Icon = "aperture"
    }),
    Lift = Window:AddTab({
        Title = "Dead Lift",
        Icon = "skull"
    }),
    Squat = Window:AddTab({
        Title = "Squat Rack",
        Icon = "separator-horizontal"
    }),
    Bench = Window:AddTab({
        Title = "Bench Press",
        Icon = "git-commit"
    }),
    Pull = Window:AddTab({
        Title = "Pull Ups",
        Icon = "swiss-franc"
    }),
    Throw = Window:AddTab({
        Title = "Boulder Throw",
        Icon = "life-buoy"
    }),
    Tread = Window:AddTab({
        Title = "Treadmill",
        Icon = "activity"
    }),
    Teleport = Window:AddTab({
        Title = "Teleport",
        Icon = "venetian-mask"
    }),
    Shop = Window:AddTab({
        Title = "Shop",
        Icon = "wallet"
    }),
    Esp = Window:AddTab({
        Title = "Esp",
        Icon = "rss"
    }),
    Misc = Window:AddTab({
        Title = "Misc",
        Icon = "more-horizontal"
    }),
    Settings = Window:AddTab({
        Title = "Settings",
        Icon = "settings"
    })
}
---main
Tabs.Main:AddDropdown("SelectTool Dropdown", {
    Title = "Select Tool",
    Values = {"Weight", "Situps", "Pushups", "Handstands"},
    Multi = false,
    Default = 1,
    Callback = function(v)
        selectool = v
    end
})
Tabs.Main:AddToggle("Autofarm Tool Toggle", {
    Title = "Auto Farm",
    Default = false,
    Callback = function(v)
        getgenv().farm = v
        while getgenv().farm do
            wait()
            if selectool == "Weight" then
                repeat
                    wait()
                    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v.Name == "Weight" and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                        end
                    end
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                until selectool ~= "Weight" or not getgenv().farm
                if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                    game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
                end
            elseif selectool == "Situps" then
                repeat
                    wait()
                    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v.Name == "Situps" and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                        end
                    end
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                until selectool ~= "Situps" or not getgenv().farm
                if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                    game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
                end
            elseif selectool == "Pushups" then
                repeat
                    wait()
                    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v.Name == "Pushups" and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                        end
                    end
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                until selectool ~= "Pushups" or not getgenv().farm
                if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                    game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
                end
            elseif selectool == "Handstands" then
                repeat
                    wait()
                    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        if v.Name == "Handstands" and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                        end
                    end
                    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                until selectool ~= "Handstands" or not getgenv().farm
                if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                    game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
                end
            end
        end
        if not getgenv().farm then
            if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
            end
        end
    end
})
Tabs.Main:AddToggle("Teleport Safe Place Toggle", {
    Title = "Teleport Safe Place",
    Default = false,
    Callback = function(v)
        getgenv().safeplace = v
        while getgenv().safeplace do
            wait()
            if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                    CFrame.new(39.9269371, 10008.2969, 406.421783, 0.916920781, 7.09838588e-08, 0.39906922,
                        -5.21853707e-08, 1, -5.79699098e-08, -0.39906922, 3.23282414e-08, 0.916920781)
            end
            if not getgenv().safeplace then
                if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-0.413686246,
                        3.67686582, 194.919067, 0.976406693, -1.59392535e-08, -0.21593973, 1.45404284e-08, 1,
                        -8.06651812e-09, 0.21593973, 4.73634643e-09, 0.976406693)
                end
            end
        end
    end
})
Tabs.Main:AddToggle("Auto Rebirth Toggle", {
    Title = "Auto Rebirth",
    Default = false,
    Callback = function(v)
        getgenv().rebirth = v
        while getgenv().rebirth do
            wait()
            game:GetService("ReplicatedStorage").rEvents.rebirthRemote:InvokeServer("rebirthRequest")
        end
    end
})
Tabs.Main:AddToggle("Auto Join Brawl Toggle", {
    Title = "Auto Join Brawl",
    Default = false,
    Callback = function(v)
        getgenv().joinbrawl = v
        while getgenv().joinbrawl do
            wait()
            game:GetService("ReplicatedStorage").rEvents.brawlEvent:FireServer("joinBrawl")
        end
    end
})
Tabs.Main:AddButton({
    Title = "Claim All Code",
    Callback = function()
        game.ReplicatedStorage.rEvents.codeRemote:InvokeServer('millionwarriors')
        game.ReplicatedStorage.rEvents.codeRemote:InvokeServer('frostgems10')
        game.ReplicatedStorage.rEvents.codeRemote:InvokeServer('musclestorm50')
        game.ReplicatedStorage.rEvents.codeRemote:InvokeServer('spacegems50')
        game.ReplicatedStorage.rEvents.codeRemote:InvokeServer('megalift50')
        game.ReplicatedStorage.rEvents.codeRemote:InvokeServer('speedy50')
        game.ReplicatedStorage.rEvents.codeRemote:InvokeServer('skyagility50')
        game.ReplicatedStorage.rEvents.codeRemote:InvokeServer('galaxycrystal50')
        game.ReplicatedStorage.rEvents.codeRemote:InvokeServer('supermuscle100')
        game.ReplicatedStorage.rEvents.codeRemote:InvokeServer('superpunch100')
        game.ReplicatedStorage.rEvents.codeRemote:InvokeServer('epicreward500')
        game.ReplicatedStorage.rEvents.codeRemote:InvokeServer('launch250')
    end
})
Tabs.Main:AddButton({
    Title = "Claim All Chest",
    Callback = function()
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,
            game:GetService("Workspace").mythicalChest.circleInner, 0)
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,
            game:GetService("Workspace").mythicalChest.circleInner, 1)
        wait()
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,
            game:GetService("Workspace").magmaChest.circleInner, 0)
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,
            game:GetService("Workspace").magmaChest.circleInner, 1)
        wait()
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,
            game:GetService("Workspace").groupRewardsCircle.circleInner, 0)
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,
            game:GetService("Workspace").groupRewardsCircle.circleInner, 1)
        wait()
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,
            game:GetService("Workspace").goldenChest.circleInner, 0)
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,
            game:GetService("Workspace").goldenChest.circleInner, 1)
        wait()
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,
            game:GetService("Workspace").enchantedChest.circleInner, 0)
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,
            game:GetService("Workspace").enchantedChest.circleInner, 1)
        wait()
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,
            game:GetService("Workspace").legendsChest.circleInner, 0)
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,
            game:GetService("Workspace").legendsChest.circleInner, 1)
    end
})
-- rock
Tabs.Rock:AddDropdown("Rock Dropdown", {
    Title = "Select Rock",
    Values = {"Tiny Island Rock", "Starter Island Rock", "Legend Beach Rock", "Frost Gym Rock", "Mythical Gym Rock",
        "Eternal Gym Rock", "Legend Gym Rock", "Muscle King Gym Rock"},
    Multi = false,
    Default = 1,
    Callback = function(v)
        selectrock = v
    end
})
function gettool()
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.Name == "Punch" and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
        end
    end
    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "leftHand")
    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("punch", "rightHand")
end
Tabs.Rock:AddToggle("Farm Rock Toggle", {
    Title = "Farm Rock",
    Default = false,
    Callback = function(v)
        getgenv().farmrock = v
        while getgenv().farmrock do
            wait()
            if selectrock == "Tiny Island Rock" and game:GetService("Players").LocalPlayer.Durability.Value >= 0 then
                for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                    if v.Name == "neededDurability" and v.Value == 0 and
                        game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and
                        game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand,
                            0)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand,
                            1)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand,
                            0)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand,
                            1)
                        gettool()
                    end
                end
            elseif selectrock == "Starter Island Rock" and game:GetService("Players").LocalPlayer.Durability.Value >=
                100 then
                for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                    if v.Name == "neededDurability" and v.Value == 100 and
                        game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and
                        game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand,
                            0)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand,
                            1)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand,
                            0)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand,
                            1)
                        gettool()
                    end
                end
            elseif selectrock == "Legend Beach Rock" and game:GetService("Players").LocalPlayer.Durability.Value >=
                5000 then
                for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                    if v.Name == "neededDurability" and v.Value == 5000 and
                        game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and
                        game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand,
                            0)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand,
                            1)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand,
                            0)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand,
                            1)
                        gettool()
                    end
                end
            elseif selectrock == "Frost Gym Rock" and game:GetService("Players").LocalPlayer.Durability.Value >=
                150000 then
                for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                    if v.Name == "neededDurability" and v.Value == 150000 and
                        game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and
                        game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand,
                            0)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand,
                            1)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand,
                            0)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand,
                            1)
                        gettool()
                    end
                end
            elseif selectrock == "Mythical Gym Rock" and game:GetService("Players").LocalPlayer.Durability.Value >=
                400000 then
                for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                    if v.Name == "neededDurability" and v.Value == 400000 and
                        game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and
                        game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand,
                            0)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand,
                            1)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand,
                            0)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand,
                            1)
                        gettool()
                    end
                end
            elseif selectrock == "Eternal Gym Rock" and game:GetService("Players").LocalPlayer.Durability.Value >=
                750000 then
                for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                    if v.Name == "neededDurability" and v.Value == 750000 and
                        game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and
                        game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand,
                            0)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand,
                            1)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand,
                            0)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand,
                            1)
                        gettool()
                    end
                end
            elseif selectrock == "Legend Gym Rock" and game:GetService("Players").LocalPlayer.Durability.Value >=
                1000000 then
                for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                    if v.Name == "neededDurability" and v.Value == 1000000 and
                        game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and
                        game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand,
                            0)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand,
                            1)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand,
                            0)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand,
                            1)
                        gettool()
                    end
                end
            elseif selectrock == "Muscle King Gym Rock" and game:GetService("Players").LocalPlayer.Durability.Value >=
                5000000 then
                for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                    if v.Name == "neededDurability" and v.Value == 5000000 and
                        game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and
                        game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand,
                            0)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand,
                            1)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand,
                            0)
                        firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand,
                            1)
                        gettool()
                    end
                end
            end
        end
        if not getgenv().farmrock then
            if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
            end
        end
    end
})
-- deadlift
Tabs.Lift:AddDropdown("Lift Dropdown", {
    Title = "Select Dead Lift",
    Values = {"Starter Island", "Legend Beach", "Frost Gym", "Legend Gym", "Muscle King Gym"},
    Multi = false,
    Default = 1,
    Callback = function(v)
        selectlift = v
    end
})
function getgui()
    for i, v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
        if v.Name == "machineGui" and v.Enabled == true then
            firesignal(v.interactButton.Activated)
        end
    end
end
function firetool()
    game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
end
Tabs.Lift:AddToggle("Deadlift Toggle", {
    Title = "Farm DeadLift",
    Default = false,
    Callback = function(v)
        getgenv().lift = v
        while getgenv().lift do
            wait()
            if selectlift == "Starter Island" and
                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and
                game:GetService("Players").LocalPlayer.leaderstats.Strength.Value > 4000 then
                repeat
                    wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        CFrame.new(172.449738, 3.3141799, 23.8498878, -0.998869061, 2.31845263e-08, -0.0475455299,
                            2.11969002e-08, 1, 4.23088693e-08, 0.0475455299, 4.12532017e-08, -0.998869061)
                    getgui()
                    firetool()
                until selectlift ~= "Starter Island" or not getgenv().lift
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
            elseif selectlift == "Legend Beach" and
                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and
                game:GetService("Players").LocalPlayer.leaderstats.Strength.Value > 8000 then
                repeat
                    wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        CFrame.new(-71.4563293, 4.26925421, -495.892944, 0.774736404, -4.68434216e-08, -0.632284343,
                            -4.54474414e-09, 1, -7.96546686e-08, 0.632284343, 6.45849454e-08, 0.774736404)
                    getgui()
                    firetool()
                until selectlift ~= "Legend Beach" or not getgenv().lift
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
            elseif selectlift == "Frost Gym" and
                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and
                game:GetService("Players").LocalPlayer.leaderstats.Strength.Value > 8000 then
                repeat
                    wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        CFrame.new(-2918.12964, 3.71060777, -206.276459, -0.742798924, 2.89509217e-09, 0.669514596,
                            -8.05315015e-09, 1, -1.32588047e-08, -0.669514596, -1.52403281e-08, -0.742798924)
                    getgui()
                    firetool()
                until selectlift ~= "Frost Gym" or not getgenv().lift
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
            elseif selectlift == "Legend Gym" and
                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                repeat
                    wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        CFrame.new(4523.78027, 988.422241, -3993.03516, 0.290417612, -3.37642554e-08, 0.956900001,
                            2.67989382e-08, 1, 2.71516054e-08, -0.956900001, 1.77585999e-08, 0.290417612)
                    getgui()
                    firetool()
                until selectlift ~= "Legend Gym" or not getgenv().lift
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
            elseif selectlift == "Muscle King Gym" and
                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                repeat
                    wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        CFrame.new(-8771.13086, 14.3912973, -5667.31152, 0.507942855, 9.99915457e-08, 0.861390769,
                            -8.0725691e-08, 1, -6.84793875e-08, -0.861390769, -3.47527482e-08, 0.507942855)
                    getgui()
                    firetool()
                until selectlift ~= "Muscle King Gym" or not getgenv().lift
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
            end
        end
    end
})
-- squat rack
Tabs.Squat:AddDropdown("Squatrack dropdown", {
    Title = "Select Squat Rack",
    Values = {"Starter Island", "Legend Beach", "Frost Gym", "Legend Gym", "Muscle King Gym"},
    Multi = false,
    Default = 1,
    Callback = function(v)
        selectsquat = v
    end
})
local squattoggle = Tabs.Squat:AddToggle("Squatrack Toggle", {
    Title = "Farm Squatrack",
    Default = false,
    Callback = function(v)
        getgenv().squat = v
        while getgenv().squat do
            wait()
            if selectsquat == "Starter Island" and
                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and
                game:GetService("Players").LocalPlayer.leaderstats.Strength.Value > 1500 then
                repeat
                    wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        CFrame.new(-231.31282, 3.3141799, 24.2387543, 0.707471967, 6.44155307e-09, -0.706741393,
                            3.77205609e-08, 1, 4.68739927e-08, 0.706741393, -5.98207208e-08, 0.707471967)
                    getgui()
                    firetool()
                until selectsquat ~= "Starter Island" or not getgenv().squat
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
            elseif selectsquat == "Legend Beach" and
                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and
                game:GetService("Players").LocalPlayer.leaderstats.Strength.Value > 10000 then
                repeat
                    wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        CFrame.new(-206.582367, 3.31417942, -421.414001, 0.813742638, -4.2608626e-08, 0.581225395,
                            -7.98657407e-09, 1, 8.44898409e-08, -0.581225395, -7.33949861e-08, 0.813742638)
                    getgui()
                    firetool()
                until selectsquat ~= "Legend Beach" or not getgenv().squat
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
            elseif selectsquat == "Frost Gym" and
                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and
                game:GetService("Players").LocalPlayer.leaderstats.Strength.Value > 10000 then
                repeat
                    wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        CFrame.new(-2718.96631, 3.31417847, -582.180115, 0.374761909, -2.04876383e-08, 0.927121103,
                            -6.98757452e-09, 1, 2.49226506e-08, -0.927121103, -1.58183884e-08, 0.374761909)
                    getgui()
                    firetool()
                until selectsquat ~= "Frost Gym" or not getgenv().squat
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
            elseif selectsquat == "Legend Gym" and
                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                repeat
                    wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        CFrame.new(4441.73779, 987.46698, -4058.80542, -0.904952645, 1.08236282e-08, 0.425512344,
                            -1.14227638e-09, 1, -2.78660188e-08, -0.425512344, -2.57034785e-08, -0.904952645)
                    getgui()
                    firetool()
                until selectsquat ~= "Legend Gym" or not getgenv().squat
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
            elseif selectsquat == "Muscle King Gym" and
                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                repeat
                    wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        CFrame.new(-8761.40137, 13.1642122, -6042.70996, -0.99982363, 2.64019473e-08, -0.0187804624,
                            2.50889212e-08, 1, 7.01500653e-08, 0.0187804624, 6.96665055e-08, -0.99982363)
                    getgui()
                    firetool()
                until selectsquat ~= "Muscle King Gym" or not getgenv().squat
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
            end
        end
    end
})
-- bench press
Tabs.Bench:AddDropdown("Benchpress dropdown", {
    Title = "Select Bench Press",
    Values = {"Starter Island", "Legend Beach", "Frost Gym", "Mythical Gym", "Eternal Gym", "Legend Gym",
        "Muscle King Gym"},
    Multi = false,
    Default = 1,
    Callback = function(v)
        selectbench = v
    end
})
local benchtoggle = Tabs.Bench:AddToggle("BenchPress Toggle", {
    Title = "Farm BenchPress",
    Default = false,
    Callback = function(v)
        getgenv().bench = v
        while getgenv().bench do
            wait()
            if selectbench == "Starter Island" and
                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and
                game:GetService("Players").LocalPlayer.leaderstats.Strength.Value > 150 then
                repeat
                    wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        CFrame.new(-17.0609932, 3.31417918, -2.48164988, 0.154207528, -7.71336772e-08, -0.98803848,
                            1.00511794e-08, 1, -7.64987504e-08, 0.98803848, 1.8657309e-09, 0.154207528)
                    getgui()
                    firetool()
                until selectbench ~= "Starter Island" or not getgenv().bench
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
            elseif selectbench == "Legend Beach" and
                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and
                game:GetService("Players").LocalPlayer.leaderstats.Strength.Value > 15000 then
                repeat
                    wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        CFrame.new(470.334656, 3.31417966, -321.053925, -0.203373536, -1.15303727e-07, 0.979101241,
                            -5.76302313e-08, 1, 1.05794236e-07, -0.979101241, -3.49100802e-08, -0.203373536)
                    getgui()
                    firetool()
                until selectbench ~= "Legend Beach" or not getgenv().bench
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
            elseif selectbench == "Frost Gym" and
                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and
                game:GetService("Players").LocalPlayer.leaderstats.Strength.Value > 15000 then
                repeat
                    wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        CFrame.new(-3013.24194, 39.2158546, -335.036926, 0.446578234, 1.0059221e-08, 0.894744575,
                            5.79401416e-08, 1, -4.01612112e-08, -0.894744575, 6.97767533e-08, 0.446578234)
                    getgui()
                    firetool()
                until selectbench ~= "Frost Gym" or not getgenv().bench
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
            elseif selectbench == "Mythical Gym" and
                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and
                game:GetService("Players").LocalPlayer.leaderstats.Strength.Value > 15000 then
                repeat
                    wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        CFrame.new(2371.7356, 39.2158546, 1246.31555, -0.171584845, -1.98437933e-09, 0.985169351,
                            6.72699119e-10, 1, 2.1314146e-09, -0.985169351, 1.028441e-09, -0.171584845)
                    getgui()
                    firetool()
                until selectbench ~= "Mythical Gym" or not getgenv().bench
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
            elseif selectbench == "Eternal Gym" and
                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and
                game:GetService("Players").LocalPlayer.leaderstats.Strength.Value > 15000 then
                repeat
                    wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        CFrame.new(-7176.19141, 45.394104, -1106.31421, 0.971191287, -2.38377185e-09, 0.238301158,
                            1.41694778e-09, 1, 4.22844915e-09, -0.238301158, -3.76897269e-09, 0.971191287)
                    getgui()
                    firetool()
                until selectbench ~= "Eternal Gym" or not getgenv().bench
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
            elseif selectbench == "Legend Gym" and
                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                repeat
                    wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        CFrame.new(4111.91748, 1020.46674, -3799.97217, 0.297831178, 2.50558116e-08, -0.954618573,
                            4.44642678e-09, 1, 2.76341758e-08, 0.954618573, -1.24749606e-08, 0.297831178)
                    getgui()
                    firetool()
                until selectbench ~= "Legend Gym" or not getgenv().bench
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
            elseif selectbench == "Muscle King Gym" and
                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                repeat
                    wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        CFrame.new(-8590.06152, 46.0167427, -6043.34717, 0.419119269, 4.32053682e-08, -0.907931209,
                            -4.85116338e-08, 1, 2.51926657e-08, 0.907931209, 3.34864936e-08, 0.419119269)
                    getgui()
                    firetool()
                until selectbench ~= "Muscle King Gym" or not getgenv().bench
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
            end
        end
    end
})
-- pullup
Tabs.Pull:AddDropdown("Pullup dropdown", {
    Title = "Select Pull Up",
    Values = {"Starter Island", "Mythical Gym", "Legend Gym"},
    Multi = false,
    Default = 1,
    Callback = function(v)
        selectpullup = v
    end
})
local pulltoggle = Tabs.Pull:AddToggle("pullupPress Toggle", {
    Title = "Farm Pull Up",
    Default = false,
    Callback = function(v)
        getgenv().pullup = v
        while getgenv().pullup do
            wait()
            if selectpullup == "Starter Island" and
                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and
                game:GetService("Players").LocalPlayer.leaderstats.Strength.Value > 2500 then
                repeat
                    wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        CFrame.new(-183.464539, 3.67686677, 68.4003601, 0.307956368, 2.18111507e-09, -0.951400459,
                            2.35345121e-09, 1, 3.05431369e-09, 0.951400459, -3.17967008e-09, 0.307956368)
                    getgui()
                    firetool()
                until selectpullup ~= "Starter Island" or not getgenv().pullup
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
            elseif selectpullup == "Mythical Gym" and
                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and
                game:GetService("Players").LocalPlayer.leaderstats.Strength.Value > 8000 then
                repeat
                    wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        CFrame.new(2489.21484, 3.67686629, 849.051025, 0.922716379, -7.13580306e-09, -0.385479599,
                            -1.10265939e-08, 1, -4.49056756e-08, 0.385479599, 4.56857272e-08, 0.922716379)
                    getgui()
                    firetool()
                until selectpullup ~= "Mythical Gym" or not getgenv().pullup
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
            elseif selectpullup == "Legend Gym" and
                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                repeat
                    wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        CFrame.new(4304.99023, 987.829956, -4124.2334, -0.941512108, -2.04624975e-08, 0.33697921,
                            -3.39760398e-08, 1, -3.42049411e-08, -0.33697921, -4.36535856e-08, -0.941512108)
                    getgui()
                    firetool()
                until selectpullup ~= "Legend Gym" or not getgenv().pullup
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
            end
        end
    end
})
Tabs.Throw:AddDropdown("Throw dropdown", {
    Title = "Select Boulder Throw",
    Values = {"Legend Beach", "Mythical Gym", "Legend Gym", "Muscle King Gym"},
    Multi = false,
    Default = 1,
    Callback = function(v)
        selectthrow = v
    end
})
local throwtoggle = Tabs.Throw:AddToggle("Throw Toggle", {
    Title = "Farm Boulder Throw",
    Default = false,
    Callback = function(v)
        getgenv().throw = v
        while getgenv().throw do
            wait()
            if selectthrow == "Legend Beach" and
                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and
                game:GetService("Players").LocalPlayer.leaderstats.Strength.Value > 25000 then
                repeat
                    wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        CFrame.new(46.4746857, 3.31417966, -410.996521, -0.422613591, 1.12234231e-08, 0.906309962,
                            2.00874908e-08, 1, -3.01682235e-09, -0.906309962, 1.69305441e-08, -0.422613591)
                    getgui()
                    firetool()
                until selectthrow ~= "Legend Beach" or not getgenv().throw
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
            elseif selectthrow == "Mythical Gym" and
                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and
                game:GetService("Players").LocalPlayer.leaderstats.Strength.Value > 25000 then
                repeat
                    wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        CFrame.new(2672.38037, 3.3141799, 1211.052, 0.349689782, 4.5821319e-10, 0.936865568,
                            -2.59000483e-08, 1, 9.17823151e-09, -0.936865568, -2.74743979e-08, 0.349689782)
                    getgui()
                    firetool()
                until selectthrow ~= "Mythical Gym" or not getgenv().throw
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
            elseif selectthrow == "Legend Gym" and
                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                repeat
                    wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        CFrame.new(4197.82324, 987.46698, -3903.07129, 0.317299217, -7.62945831e-08, 0.948325455,
                            -1.48046742e-09, 1, 8.09472454e-08, -0.948325455, -2.7088463e-08, 0.317299217)
                    getgui()
                    firetool()
                until selectthrow ~= "Legend Gym" or not getgenv().throw
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
            elseif selectthrow == "Muscle King Gym" and
                game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                repeat
                    wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                        CFrame.new(-8940.12402, 13.1642084, -5699.13477, -0.999999404, 8.15231527e-09,
                            -0.00108009076, 8.24294677e-09, 1, -8.39062579e-08, 0.00108009076, -8.39151113e-08,
                            -0.999999404)
                    getgui()
                    firetool()
                until selectthrow ~= "Muscle King Gym" or not getgenv().throw
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
            end
        end
    end
})
-- treadmill
Tabs.Tread:AddDropdown("Tread Dropdown", {
    Title = "Select Tread Mill",
    Values = {"Tiny Island", "Starter Island", "Legend Beach", "Frost Gym", "Mythical Gym", "Eternal Gym",
        "Legend Gym"},
    Multi = false,
    Default = 1,
    Callback = function(v)
        selecttreadmill = v
    end
})
Tabs.Tread:AddToggle("Tread Toggle", {
    Title = "Farm Tread Mill",
    Default = false,
    Callback = function(v)
        getgenv().tread = v
        game:GetService("RunService").RenderStepped:Connect(function()
            if getgenv().tread and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                if selecttreadmill == "Tiny Island" and game:GetService("Players").LocalPlayer.Agility.Value > 0 then
                    repeat
                        wait()
                        game.Players.LocalPlayer.Character.Humanoid:Move(Vector3.new(0, 0, 100))
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-31.8626194,
                            6.0588026, 2087.88672, -0.999396682, -9.72631931e-09, 0.034730725, -6.63278898e-09, 1,
                            8.91870684e-08, -0.034730725, 8.8902901e-08, -0.999396682)
                        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
                    until selecttreadmill ~= "Tiny Island" or not getgenv().tread
                elseif selecttreadmill == "Starter Island" and game:GetService("Players").LocalPlayer.Agility.Value >
                    600 then
                    repeat
                        wait()
                        game.Players.LocalPlayer.Character.Humanoid:Move(Vector3.new(0, 0, 100))
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(226.252472,
                            8.1526947, 219.366516, -0.00880406145, 3.58277887e-08, -0.999961257, -4.41204939e-08, 1,
                            3.62176351e-08, 0.999961257, 4.44376482e-08, -0.00880406145)
                        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
                    until selecttreadmill ~= "Starter Island" or not getgenv().tread
                elseif selecttreadmill == "Legend Beach" and game:GetService("Players").LocalPlayer.Agility.Value >
                    3000 then
                    repeat
                        wait()
                        game.Players.LocalPlayer.Character.Humanoid:Move(Vector3.new(0, 0, 100))
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-365.798309,
                            44.5082932, -501.618591, 0.00878552441, -6.19950713e-09, 0.999961436, -4.37451603e-10,
                            1, 6.20358964e-09, -0.999961436, -4.91936492e-10, 0.00878552441)
                        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
                    until selecttreadmill ~= "Legend Beach" or not getgenv().tread
                elseif selecttreadmill == "Frost Gym" and game:GetService("Players").LocalPlayer.Agility.Value >
                    3000 then
                    repeat
                        wait()
                        game.Players.LocalPlayer.Character.Humanoid:Move(Vector3.new(0, 0, 100))
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2933.47998,
                            29.6399612, -579.946045, 0.0345239155, -1.03010173e-07, 0.999403894, 1.03015294e-08, 1,
                            1.02715752e-07, -0.999403894, 6.74923806e-09, 0.0345239155)
                        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
                    until selecttreadmill ~= "Frost Gym" or not getgenv().tread
                elseif selecttreadmill == "Mythical Gym" and game:GetService("Players").LocalPlayer.Agility.Value >
                    3000 then
                    repeat
                        wait()
                        game.Players.LocalPlayer.Character.Humanoid:Move(Vector3.new(0, 0, 100))
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2659.50635,
                            21.6095238, 934.690613, 0.999999881, 4.98906161e-08, 0.000502891606, -4.98585742e-08, 1,
                            -6.37288338e-08, -0.000502891606, 6.37037516e-08, 0.999999881)
                        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
                    until selecttreadmill ~= "Mythical Gym" or not getgenv().tread
                elseif selecttreadmill == "Eternal Gym" and game:GetService("Players").LocalPlayer.Agility.Value >
                    3500 then
                    repeat
                        wait()
                        game.Players.LocalPlayer.Character.Humanoid:Move(Vector3.new(0, 0, 100))
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-7057.39355,
                            29.6399612, -1456.59265, 0.0212769434, 4.61128629e-08, 0.999773622, 9.77062982e-08, 1,
                            -4.8202665e-08, -0.999773622, 9.87097835e-08, 0.0212769434)
                        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
                    until selecttreadmill ~= "Eternal Gym" or not getgenv().tread
                elseif selecttreadmill == "Legend Gym" and game:GetService("Players").LocalPlayer.Agility.Value >
                    3000 then
                    repeat
                        wait()
                        game.Players.LocalPlayer.Character.Humanoid:Move(Vector3.new(0, 0, 100))
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4370.42285,
                            999.328613, -3640.82129, -0.994707346, 5.84267781e-08, -0.102748737, 4.9968218e-08, 1,
                            8.48966693e-08, 0.102748737, 7.93131676e-08, -0.994707346)
                        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
                    until selecttreadmill ~= "Legend Gym" or not getgenv().tread
                end
            end
        end)
    end
})
Tabs.Teleport:AddDropdown("Teleport Dropdown", {
    Title = "Select Island",
    Values = {"Tiny Island", "Starter Island", "Legend Beach", "Frost Gym", "Mythical Gym", "Eternal Gym",
        "Legend Gym", "Muscle King Gym"},
    Multi = false,
    Default = 1,
    Callback = function(v)
        selectteleport = v
    end
})
Tabs.Teleport:AddButton({
    Title = "Teleport Selected Island",
    Callback = function()
        if selectteleport == "Tiny Island" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(-34.0176353, 3.83001828, 1892.74426, -0.833524704, -4.3567784e-08, 0.552482188,
                    -2.70744476e-08, 1, 3.80112972e-08, -0.552482188, 1.67252061e-08, -0.833524704)
        elseif selectteleport == "Starter Island" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(-0.413686246, 3.67686582, 194.919067, 0.976406693, -1.59392535e-08, -0.21593973,
                    1.45404284e-08, 1, -8.06651812e-09, 0.21593973, 4.73634643e-09, 0.976406693)
        elseif selectteleport == "Legend Beach" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(5.06417751, 3.67686653, -398.123108, 0.963392079, 7.3031452e-09, 0.268096358,
                    -1.00300623e-09, 1, -2.36364901e-08, -0.268096358, 2.25023058e-08, 0.963392079)
        elseif selectteleport == "Frost Gym" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(-2600.00244, 3.67686558, -403.884369, 0.0873617008, 1.0482899e-09, 0.99617666,
                    3.07204253e-08, 1, -3.7464023e-09, -0.99617666, 3.09302628e-08, 0.0873617008)
        elseif selectteleport == "Mythical Gym" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(2229.9314, 3.67686605, 1077.60461, 0.994309962, 2.92280689e-08, 0.106525563,
                    -3.3292693e-08, 1, 3.63780011e-08, -0.106525563, -3.97175342e-08, 0.994309962)
        elseif selectteleport == "Eternal Gym" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(-6747.81738, 3.67687941, -1290.07397, 0.410090953, -8.78033433e-08, 0.912044644,
                    4.37941914e-08, 1, 7.65792976e-08, -0.912044644, 8.53778115e-09, 0.410090953)
        elseif selectteleport == "Legend Gym" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(4635.04541, 987.789795, -3900.51221, -0.373274773, -9.53036547e-08, 0.927720845,
                    2.81077686e-08, 1, 1.14038158e-07, -0.927720845, 6.86437289e-08, -0.373274773)
        elseif selectteleport == "Muscle King Gym" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                CFrame.new(-8586.0459, 13.5268955, -5675.80762, 0.991283059, -5.76512598e-08, 0.131749332,
                    5.42790843e-08, 1, 2.91866726e-08, -0.131749332, -2.17810214e-08, 0.991283059)
        end
    end
})
local thl = {}
for i, v in pairs(game:GetService("Workspace").mapCrystalsFolder:GetChildren()) do
    thl[i] = v.Name
end
Tabs.Shop:AddDropdown("Shop Dropdown", {
    Title = "Select Crystal",
    Values = thl,
    Multi = false,
    Default = 1,
    Callback = function(v)
        selectcrystal = v
    end
})
Tabs.Shop:AddToggle("Crystal Togle", {
    Title = "Buy Crystal",
    Default = false,
    Callback = function(v)
        getgenv().crystal = v
        while getgenv().crystal do
            wait()
            game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer("openCrystal", selectcrystal)
        end
    end
})
Tabs.Esp:AddToggle("Enable Esp", {
    Title = "Toggle",
    Default = false,
    Callback = function(v)
        ESP.Players = v
    end
})
Tabs.Esp:AddToggle("Player Name", {
    Title = "Toggle",
    Default = false,
    Callback = function(v)
        ESP.Names = v
    end
})
Tabs.Esp:AddToggle("Player Boxes", {
    Title = "Toggle",
    Default = false,
    Callback = function(v)
        ESP.Boxes = v
    end
})
Tabs.Esp:AddToggle("Player Tracer", {
    Title = "Toggle",
    Default = false,
    Callback = function(v)
        ESP.Tracers = v
    end
})
function getool()
    for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.Name == "Punch" and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
        end
    end
    for i, b in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if b.Name == "Punch" then
            b:Activate()
        end
    end
end
Tabs.Misc:AddToggle("Kill Player", {
    Title = "Kill Player v1",
    Default = false,
    Callback = function(v)
        getgenv().killall = v
        while getgenv().killall do
            wait()
            for i, v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer and
                    game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                    game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                    if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2.46107221,
                            10007.9971, 7.28877258, 0.999048412, 4.23489048e-08, -0.0436145961, -4.66741774e-08, 1,
                            -9.81520145e-08, 0.0436145961, 1.00094297e-07, 0.999048412)
                        v.Character.HumanoidRootPart.Anchored = true
                        v.Character.HumanoidRootPart.CFrame =
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -4)
                        getool()
                        if not getgenv().killall then
                            v.Character.HumanoidRootPart.Anchored = false
                            game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
                        end
                    end
                end
            end
        end
    end
})
Tabs.Misc:AddToggle("Kill v2 Player", {
    Title = "Kill Player v2",
    Default = false,
    Callback = function(v)
        getgenv().killallv2 = v
        while getgenv().killallv2 do
            wait()
            for i, v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer.Character and
                    game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and
                    game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                    game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                    if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(213.064178,
                            10008.6572, 1.95750093, 0.954263031, -3.68202784e-08, -0.298968315, 7.85231524e-09, 1,
                            -9.80943611e-08, 0.298968315, 9.1260226e-08, 0.954263031)
                        firetouchinterest(v.Character.HumanoidRootPart, game.Players.LocalPlayer.Character.LeftHand,
                            0)
                        firetouchinterest(v.Character.HumanoidRootPart, game.Players.LocalPlayer.Character.LeftHand,
                            1)
                        gettool()
                        if not getgenv().killallv2 then
                            game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
                        end
                    end
                end
            end
        end
    end
})
Tabs.Misc:AddButton({
    Title = "Max Size Player",
    Callback = function()
        firesignal(game:GetService("Players").LocalPlayer.PlayerGui.gameGui.settingsMenu.maxSizeButton.Activated)
    end
})
Tabs.Misc:AddSlider("Ws Slider", {
    Title = "Walkspeed",
    Default = 16,
    Min = 16,
    Max = 2000,
    Rounding = 1,
    Callback = function(v)
        setws = v
    end
})
Tabs.Misc:AddToggle("ws toggle", {
    Title = "Toggle Walkspeed",
    Default = false,
    Callback = function(v)
        getgenv().ws = v
        while getgenv().ws do
            wait()
            if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = setws
            end
        end
    end
})
Tabs.Misc:AddSlider("jp Slider", {
    Title = "Jumppower",
    Default = 50,
    Min = 50,
    Max = 500,
    Rounding = 1,
    Callback = function(v)
        setjp = v
    end
})
Tabs.Misc:AddToggle("jp toggle", {
    Title = "Toggle Jumppower",
    Default = false,
    Callback = function(v)
        getgenv().jp = v
        while getgenv().jp do
            wait()
            if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                game.Players.LocalPlayer.Character.Humanoid.JumpPower = setjp
            end
        end
    end
})
Tabs.Misc:AddToggle("Small Toggle", {
    Title = "Always Small",
    Default = false,
    Callback = function(v)
        getgenv().smalls = v
        while getgenv().smalls do
            wait()
            game:GetService("ReplicatedStorage").rEvents.changeSpeedSizeRemote:InvokeServer("changeSize", 0)
        end
    end
})
Tabs.Misc:AddToggle("AutoRj Toggle", {
    Title = "Auto Rejoin",
    Default = true,
    Callback = function(v)
        getgenv().aj = v
        game:GetService("GuiService").ErrorMessageChanged:Connect(function()
            if getgenv().aj then
                wait(0.1)
                game:GetService("TeleportService"):Teleport(game.PlaceId)
            end
        end);
    end
})
Tabs.Misc:AddButton({
    Title = "Less Lag",
    Callback = function()
        mx = game.Debris
        mx3 = game.Debris.MaxItems
        if (mx.MaxItems > 9999999999) then
            mx.MaxItems = mx2 * .9999999999
        end
        wait()
        setfpscap(1000)
    end
})
Tabs.Misc:AddButton({
    Title = "Anti Rebirth",
    Callback = function()
        local OldNameCall = nil
        OldNameCall = hookmetamethod(game, "__namecall", function(self, ...)
            local Args = {...}
            if self.Name == "rebirthRemote" and Args[1] == "rebirthRequest" then
                return
            end
            return OldNameCall(self, unpack(Args))
        end)
    end
})
Tabs.Misc:AddButton({
    Title = "Anti Accept Trade",
    Callback = function()
        local OldNameCall = nil
        OldNameCall = hookmetamethod(game, "__namecall", function(self, ...)
            local Args = {...}
            if self.Name == "tradingEvent" and Args[1] == "acceptTrade" then
                return
            end
            return OldNameCall(self, unpack(Args))
        end)
    end
})
Tabs.Misc:AddButton({
    Title = "Rejoin",
    Callback = function()
        local tpservice = game:GetService("TeleportService")
        local plr = game.Players.LocalPlayer
        tpservice:Teleport(game.PlaceId, plr)
    end
})
Tabs.Misc:AddButton({
    Title = "ServerHop",
    Callback = function()
        HttpService = game:GetService("HttpService")
        TeleportService = game:GetService("TeleportService")
        httprequest = (syn and syn.request) or (http and http.request) or http_request or
            (fluxus and fluxus.request) or request
        PlaceId, JobId = game.PlaceId, game.JobId
        if httprequest then
            local servers = {}
            local body = HttpService:JSONDecode(httprequest({
                Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100",
                    game.PlaceId)
            }).Body)
            if body and body.data then
                for i, v in next, body.data do
                    if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing <
                        v.maxPlayers and v.id ~= JobId then
                        table.insert(servers, 1, v.id)
                    end
                end
            end
            if #servers > 0 then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)],
                    game.Players.LocalPlayer)
            end
        end
    end
})
Tabs.Misc:AddButton({
    Title = "Join Small Server",
    Callback = function()
        local Http = game:GetService("HttpService")
        local TPS = game:GetService("TeleportService")
        local Api = "https://games.roblox.com/v1/games/"
        local _place = game.PlaceId
        local _servers = Api .. _place .. "/servers/Public?sortOrder=Asc&limit=100"
        function ListServers(cursor)
            local Raw = game:HttpGet(_servers .. ((cursor and "&cursor=" .. cursor) or ""))
            return Http:JSONDecode(Raw)
        end
        local Server, Next;
        repeat
            local Servers = ListServers(Next)
            Server = Servers.data[16]
            Next = Servers.nextPageCursor
        until Server
        TPS:TeleportToPlaceInstance(_place, Server.id, game.Players.LocalPlayer)
    end
})
-- config
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
InterfaceManager:SetFolder("Folder")
SaveManager:SetFolder("Folder/GameFolder")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)
Window:SelectTab(1)
SaveManager:LoadAutoloadConfig()