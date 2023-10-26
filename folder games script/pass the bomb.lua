local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
ESP:Toggle(true)
ESP.Tracers = false
ESP.Names = false
ESP.Boxes = false
ESP.Players = false
ESP.Color = Color3.fromRGB(255, 255, 255)
local Window = Fluent:CreateWindow({
    Title = tostring(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name),
    SubTitle = "",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})
local Tabs = {
    Main = Window:AddTab({Title = "Main", Icon = "contact"}),
    Esp = Window:AddTab({Title = "Esp", Icon = "rss"}),
    Teleport = Window:AddTab({Title = "Teleport", Icon = "venetian-mask"}),
    Misc = Window:AddTab({Title = "Misc", Icon = "more-horizontal"}),
    Settings = Window:AddTab({Title = "Settings", Icon = "settings"})}
function getbomb()
    if game.Players.LocalPlayer.Character:FindFirstChild("Bomb") or game.Players.LocalPlayer.Character:WaitForChild("Bomb") then
        return game.Players.LocalPlayer.Character.Bomb.Handle
    end
end
Tabs.Main:AddToggle("Auto Pass", {
    Title = "Auto Pass Bomb",
    Default = false,
    Callback = function(v)
        getgenv().pass = v
        game:GetService("RunService").RenderStepped:Connect(function()
            if getgenv().pass then
                for i, v in pairs(game.Players:GetPlayers()) do
                    if v ~= game.Players.LocalPlayer then
                        if v:FindFirstChild("InGame") then
                            if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                                if game.Players.LocalPlayer.Character:FindFirstChild("Bomb") then
                                    firetouchinterest(v.Character.HumanoidRootPart, game.Players.LocalPlayer.Character.Bomb.Handle, 0)
                                    firetouchinterest(v.Character.HumanoidRootPart, game.Players.LocalPlayer.Character.Bomb.Handle, 1)
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
})
Tabs.Main:AddToggle("Afk Farm", {
    Title = "Afk Farm",
    Default = false,
    Callback = function(v)
        getgenv().afkfarm = v
        while getgenv().afkfarm do
            wait()
            if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").Lobby.SpawnLocation.Position) * CFrame.new(0, 300, 0)
                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
                if not getgenv().afkfarm then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
                    wait()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").Lobby.SpawnLocation.Position) * CFrame.new(0, 2, 0)
                end
            end
        end
    end
})
Tabs.Esp:AddToggle("Enable Esp", {
    Title = "Enable Esp",
    Default = false,
    Callback = function(v)
        ESP.Players = v
    end
})
Tabs.Esp:AddToggle("Player Name", {
    Title = "Player Name",
    Default = false,
    Callback = function(v)
        ESP.Names = v
    end
})
Tabs.Esp:AddToggle("Player Tracer", {
    Title = "Player Tracer",
    Default = false,
    Callback = function(v)
        ESP.Tracers = v
    end
})
Tabs.Esp:AddToggle("Player Boxes", {
    Title = "Player Boxes",
    Default = false,
    Callback = function(v)
        ESP.Boxes = v
    end
})
Tabs.Esp:AddColorpicker("Esp Color", {
    Title = "Esp Color",
    Default = Color3.fromRGB(255, 255, 255),
    Callback = function(v)
        ESP.Color = v
    end
})
Tabs.Teleport:AddButton({
    Title = "Teleport Map",
    Callback = function()
        pcall(function()
            for i, v in pairs(game:GetService("Workspace").Map:GetDescendants()) do
                if v.Name == "Spawn" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position) * CFrame.new(0, 2, 0)
                end
            end
        end)
    end
})
Tabs.Teleport:AddButton({
    Title = "Teleport Lobby",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").Lobby.SpawnLocation.Position) * CFrame.new(0, 2, 0)
    end
})
Tabs.Misc:AddSlider("Ws", {
    Title = "WalkSpeed",
    Default = 16,
    Min = 16,
    Max = 300,
    Rounding = 1,
    Callback = function(v)
        setws = tonumber(v)
    end
})
Tabs.Misc:AddSlider("Jp", {
    Title = "JumpPower",
    Default = 50,
    Min = 50,
    Max = 400,
    Rounding = 1,
    Callback = function(v)
        setjp = tonumber(v)
    end
})
Tabs.Misc:AddToggle("Noclip", {
    Title = "Noclip",
    Default = false,
    Callback = function(v)
        getgenv().noclip = v
        game:GetService("RunService").RenderStepped:Connect(function()
            if getgenv().noclip then
                for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v:IsA("BasePart") and v.CanCollide == true and v.Name ~= floatName then
                        v.CanCollide = false
                        if not getgenv().noclip then
                            v.CanCollide = true
                        end
                    end
                end
            end
        end)
    end
})
Tabs.Misc:AddButton({
    Title = "Fullbright",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/06iG6YkU'))()
    end
})
spawn(function()
    while task.wait() do
        if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = setws
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = setjp
        end
    end
end)
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
InterfaceManager:SetFolder("Folder")
SaveManager:SetFolder("Folder/GameFolder")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)
Window:SelectTab(1)
SaveManager:LoadAutoloadConfig()
