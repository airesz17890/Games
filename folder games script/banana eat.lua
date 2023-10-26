local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
ESP:Toggle(true)
ESP.Tracers = false
ESP.Names = false
ESP.Boxes = false
ESP.Players = false
ESP.TeamColor = false
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
    Puzzle = Window:AddTab({Title = "Puzzle", Icon = "puzzle"}),
    Esp = Window:AddTab({Title = "Esp", Icon = "rss"}),
    Misc = Window:AddTab({Title = "Misc", Icon = "more-horizontal"}),
    Settings = Window:AddTab({Title = "Settings", Icon = "settings"})}
--script
Tabs.Main:AddToggle("Auto Eat", {
    Title = "Auto Eat All",
    Default = false,
    Callback = function(v)
        getgenv().eat = v
        while getgenv().eat do
            wait()
            for i, v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild("Hitbox") then
                    if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                        firetouchinterest(game.Players.LocalPlayer.Character.Hitbox, v.Character.HumanoidRootPart, 0)
                        firetouchinterest(game.Players.LocalPlayer.Character.Hitbox, v.Character.HumanoidRootPart, 1)
                    end
                end
            end
        end
    end
})
Tabs.Main:AddToggle("Auto Win", {
    Title = "Auto Win",
    Default = false,
    Callback = function(v)
        getgenv().win = v
        while getgenv().win do
            wait()
            for i, v in pairs(game:GetService("Workspace").GameKeeper.Exits:GetChildren()) do
                if v.Name == "EscapeDoor" then
                    for i, j in pairs(v:GetChildren()) do
                        if j.Name == "ExitTag" and game.Players.LocalPlayer.Team == game.Teams.Runners and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, j.Parent.Root, 0)
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, j.Parent.Root, 1)
                        end
                    end
                end
            end
        end
    end
})
Tabs.Main:AddToggle("Auto Coin", {
    Title = "Auto Collect Coin",
    Default = false,
    Callback = function(v)
        getgenv().coin = v
        while getgenv().coin do
            wait()
            for i, v in pairs(game:GetService("Workspace").GameKeeper.Map:GetChildren()) do
                if v.Name == "Tokens" then
                    for i, j in pairs(v:GetChildren()) do
                        if j.Name == "Token" and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, j, 0)
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, j, 1)
                        end
                    end
                end
            end
        end
    end
})
Tabs.Main:AddToggle("Auto Power", {
    Title = "Auto Collect Power",
    Default = false,
    Callback = function(v)
        getgenv().power = v
        while getgenv().power do
            wait()
            for i, v in pairs(game:GetService("Workspace").GameKeeper.Map:GetChildren()) do
                if v.Name == "Tokens" then
                    for i, j in pairs(v:GetChildren()) do
                        if j.ClassName == "MeshPart" and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, j, 0)
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, j, 1)
                        end
                    end
                end
            end
        end
    end
})
Tabs.Puzzle:AddToggle("Cake Puzzle", {
    Title = "Auto Cake Puzzle",
    Default = false,
    Callback = function(v)
        getgenv().cake = v
        while getgenv().cake do
            wait()
            for i, v in pairs(game:GetService("Workspace").GameKeeper.Map:GetChildren()) do
                if v.Name == "Items" then
                    for i, j in pairs(v:GetChildren()) do
                        if j.Name == "CakePlate" then
                            for i, c in pairs(j:GetDescendants()) do
                                if c.ClassName == "ClickDetector" then
                                    fireclickdetector(c)
                                end
                            end
                        end
                    end
                end
            end
            for i, b in pairs(game:GetService("Workspace").GameKeeper.Puzzles:GetChildren()) do
                if b.Name == "CakePuzzle" then
                    for i, c in pairs(b:GetChildren()) do
                        if c.Name == "Root" and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, c, 0)
                            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, c, 1)
                        end
                    end
                end
            end
        end
    end
})
Tabs.Puzzle:AddToggle("Combine Puzzle", {
    Title = "Auto Combination Puzzle",
    Default = false,
    Callback = function(v)
        getgenv().combi = v
        while getgenv().combi do
            wait()
            for i, v in pairs(game:GetService("Workspace").GameKeeper.Puzzles:GetChildren()) do
                if v.Name == "CombinationPuzzle" then
                    for i, x in pairs(v:GetChildren()) do
                        if x.Name == "Buttons" then
                            for i, b in pairs(game:GetService("Workspace").GameKeeper.Puzzles:GetChildren()) do
                                if b.Name == "CombinationPuzzle" then
                                    for i, j in pairs(b:GetChildren()) do
                                        if j.Name == "CombinationKey" then
                                            if x.Button1.ButtonLabel.Label.Text ~= j.Buttons.Button1.ButtonLabel.Label.Text and x.Button1:FindFirstChild("ClickDetector") then
                                                fireclickdetector(x.Button1.ClickDetector)
                                            elseif x.Button2.ButtonLabel.Label.Text ~= j.Buttons.Button2.ButtonLabel.Label.Text and x.Button2:FindFirstChild("ClickDetector") then
                                                fireclickdetector(x.Button2.ClickDetector)
                                            elseif x.Button3.ButtonLabel.Label.Text ~= j.Buttons.Button3.ButtonLabel.Label.Text and x.Button3:FindFirstChild("ClickDetector") then
                                                fireclickdetector(x.Button3.ClickDetector)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
})
Tabs.Puzzle:AddToggle("Valve Puzzle", {
    Title = "Auto Valve Puzzle",
    Default = false,
    Callback = function(v)
        getgenv().valve = v
        while getgenv().valve do
            wait()
            for i, v in pairs(game:GetService("Workspace").GameKeeper.Puzzles:GetChildren()) do
                if v.Name == "ValvePuzzle" then
                    for i, c in pairs(v:GetDescendants()) do
                        if c.Name == "ClickDetector" then
                            fireclickdetector(c)
                        end
                    end
                end
            end
        end
    end
})
Tabs.Puzzle:AddToggle("Picture Puzzle", {
    Title = "Auto Picture Puzzle",
    Default = false,
    Callback = function(v)
        getgenv().picture = v
        while getgenv().picture do
            wait(0.3)
            for i, v in pairs(game:GetService("Workspace").GameKeeper.Puzzles:GetChildren()) do
                if v.Name == "PicturePuzzle" then
                    for i, x in pairs(v:GetChildren()) do
                        if x.Name == "Buttons" then
                            for i, c in pairs(x:GetChildren()) do
                                if c.BrickColor ~= BrickColor.new("Camo") and c:FindFirstChild("ClickDetector") then
                                    fireclickdetector(c.ClickDetector)
                                end
                            end
                        end
                    end
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
Tabs.Esp:AddToggle("Player Names", {
    Title = "Player Names",
    Default = false,
    Callback = function(v)
        ESP.Names = v
    end
})
Tabs.Esp:AddToggle("Player Boxes", {
    Title = "Player Boxes",
    Default = false,
    Callback = function(v)
        ESP.Boxes = v
    end
})
Tabs.Esp:AddToggle("Player Tracer", {
    Title = "Player Tracer",
    Default = false,
    Callback = function(v)
        ESP.Tracers = v
    end
})
Tabs.Esp:AddToggle("Player TeamColor", {
    Title = "Player TeamColor",
    Default = false,
    Callback = function(v)
        ESP.TeamColor = v
    end
})
Tabs.Esp:AddColorpicker("Esp Color", {
    Title = "Esp Color",
    Default = Color3.fromRGB(255, 255, 255),
    Callback = function(v)
        ESP.Color = v
    end
})
Tabs.Misc:AddToggle("Remove Trap", {
    Title = "Auto Remove Trap",
    Default = false,
    Callback = function(v)
        getgenv().trap = v
        while getgenv().trap do
            wait()
            for i, v in pairs(game:GetService("Workspace").GameKeeper.Map:GetChildren()) do
                if v.Name == "Peels" then
                    for i, j in pairs(v:GetChildren()) do
                        if j:IsA("Model") then
                            j:Destroy()
                        end
                    end
                end
            end
        end
    end
})
Tabs.Misc:AddToggle("WalkSpeed", {
    Title = "WalkSpeed",
    Default = false,
    Callback = function(v)
        getgenv().ws = v
        while getgenv().ws do
            wait()
            if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 40
            end
        end
        if not getgenv().ws then
            if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
            end
        end
    end
})
Tabs.Misc:AddToggle("Noclip", {
    Title = "Noclip",
    Default = false,
    Callback = function(v)
        getgenv().noclip = v
        while getgenv().noclip do
            wait()
            for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") and v.CanCollide == true and v.Name ~= floatName then
                    v.CanCollide = false
                    if not getgenv().noclip then
                        v.CanCollide = true
                    end
                end
            end
        end
    end
})
Tabs.Misc:AddButton({
    Title = "Claim Code",
    Callback = function()
        game:GetService("Players").LocalPlayer.PlayerGui.CodeGui.Frame.Buttons.Input.Text = game:GetService("Workspace").GameProperties.SecretCode.Value
        wait(0.2)
        firesignal(game:GetService("Players").LocalPlayer.PlayerGui.CodeGui.Frame.Buttons.Redeem.MouseButton1Down)
    end
})
Tabs.Misc:AddButton({
    Title = "Gamepass 2x Chance",
    Callback = function()
        game:GetService("Players").LocalPlayer.UserDataHolder.DoubledChances.Value = true
    end
})
Tabs.Misc:AddButton({
    Title = "Enable Reset",
    Callback = function()
        game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
    end
})
Tabs.Misc:AddButton({
    Title = "Fullbright",
    Callback = function()
        if not _G.FullBrightExecuted then
            _G.FullBrightEnabled = false
            _G.NormalLightingSettings = {
                Brightness = game:GetService("Lighting").Brightness,
                ClockTime = game:GetService("Lighting").ClockTime,
                FogEnd = game:GetService("Lighting").FogEnd,
                GlobalShadows = game:GetService("Lighting").GlobalShadows,
                Ambient = game:GetService("Lighting").Ambient
            }
            game:GetService("Lighting"):GetPropertyChangedSignal("Brightness"):Connect(function()
                if game:GetService("Lighting").Brightness ~= 1 and game:GetService("Lighting").Brightness ~= _G.NormalLightingSettings.Brightness then
                    _G.NormalLightingSettings.Brightness = game:GetService("Lighting").Brightness
                    if not _G.FullBrightEnabled then
                        repeat
                            wait()
                        until _G.FullBrightEnabled
                    end
                    game:GetService("Lighting").Brightness = 1
                end
            end)
            game:GetService("Lighting"):GetPropertyChangedSignal("ClockTime"):Connect(function()
                if game:GetService("Lighting").ClockTime ~= 12 and game:GetService("Lighting").ClockTime ~= _G.NormalLightingSettings.ClockTime then
                    _G.NormalLightingSettings.ClockTime = game:GetService("Lighting").ClockTime
                    if not _G.FullBrightEnabled then
                        repeat
                            wait()
                        until _G.FullBrightEnabled
                    end
                    game:GetService("Lighting").ClockTime = 12
                end
            end)
            game:GetService("Lighting"):GetPropertyChangedSignal("FogEnd"):Connect(function()
                if game:GetService("Lighting").FogEnd ~= 786543 and game:GetService("Lighting").FogEnd ~= _G.NormalLightingSettings.FogEnd then
                    _G.NormalLightingSettings.FogEnd = game:GetService("Lighting").FogEnd
                    if not _G.FullBrightEnabled then
                        repeat
                            wait()
                        until _G.FullBrightEnabled
                    end
                    game:GetService("Lighting").FogEnd = 786543
                end
            end)
            game:GetService("Lighting"):GetPropertyChangedSignal("GlobalShadows"):Connect(function()
                if game:GetService("Lighting").GlobalShadows ~= false and game:GetService("Lighting").GlobalShadows ~= _G.NormalLightingSettings.GlobalShadows then
                    _G.NormalLightingSettings.GlobalShadows = game:GetService("Lighting").GlobalShadows
                    if not _G.FullBrightEnabled then
                        repeat
                            wait()
                        until _G.FullBrightEnabled
                    end
                    game:GetService("Lighting").GlobalShadows = false
                end
            end)
            game:GetService("Lighting"):GetPropertyChangedSignal("Ambient"):Connect(function()
                if game:GetService("Lighting").Ambient ~= Color3.fromRGB(178, 178, 178) and game:GetService("Lighting").Ambient ~= _G.NormalLightingSettings.Ambient then
                    _G.NormalLightingSettings.Ambient = game:GetService("Lighting").Ambient
                    if not _G.FullBrightEnabled then
                        repeat
                            wait()
                        until _G.FullBrightEnabled
                    end
                    game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
                end
            end)
            game:GetService("Lighting").Brightness = 1
            game:GetService("Lighting").ClockTime = 12
            game:GetService("Lighting").FogEnd = 786543
            game:GetService("Lighting").GlobalShadows = false
            game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
            local LatestValue = true
            spawn(function()
                repeat
                    wait()
                until _G.FullBrightEnabled
                while wait() do
                    if _G.FullBrightEnabled ~= LatestValue then
                        if not _G.FullBrightEnabled then
                            game:GetService("Lighting").Brightness = _G.NormalLightingSettings.Brightness
                            game:GetService("Lighting").ClockTime = _G.NormalLightingSettings.ClockTime
                            game:GetService("Lighting").FogEnd = _G.NormalLightingSettings.FogEnd
                            game:GetService("Lighting").GlobalShadows = _G.NormalLightingSettings.GlobalShadows
                            game:GetService("Lighting").Ambient = _G.NormalLightingSettings.Ambient
                        else
                            game:GetService("Lighting").Brightness = 1
                            game:GetService("Lighting").ClockTime = 12
                            game:GetService("Lighting").FogEnd = 786543
                            game:GetService("Lighting").GlobalShadows = false
                            game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
                        end
                        LatestValue = not LatestValue
                    end
                end
            end)
        end
        _G.FullBrightExecuted = true
        _G.FullBrightEnabled = not _G.FullBrightEnabled
    end
})
--config
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
InterfaceManager:SetFolder("Folder")
SaveManager:SetFolder("Folder/GameFolder")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)
Window:SelectTab(1)
SaveManager:LoadAutoloadConfig()