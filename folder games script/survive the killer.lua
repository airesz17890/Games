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
local Tabs = {
    Main = Window:AddTab({Title = "Main", Icon = "home"}),
    Esp = Window:AddTab({Title = "Esp", Icon = "person-standing"}),
    Teleport = Window:AddTab({Title = "Teleport", Icon = "venetian-mask"}),
    Localplr = Window:AddTab({Title = "LocalPlayer", Icon = "user"}),
    Misc = Window:AddTab({Title = "Misc", Icon = "more-horizontal"}),
    Settings = Window:AddTab({Title = "Settings", Icon = "settings"})}
local PlayerList = {}
for _, v in pairs(game.Teams.Survivor:GetPlayers()) do
    if v ~= game.Players.LocalPlayer then
        table.insert(PlayerList, v.Name)
    end
end
local plr = {}
for i, v in pairs(game.Players:GetPlayers()) do
    if v ~= game.Players.LocalPlayer then
        table.insert(plr, v.Name)
    end
end
Tabs.Main:AddParagraph({
    Title = "Farming Section",
})
Tabs.Main:AddToggle("Auto Win Toggle", {
    Title = "Auto Win",
    Default = false,
    Callback = function(v)
        getgenv().win = v
        while getgenv().win do
            wait(wintime)
            if game.Players.LocalPlayer.Team == game.Teams.Survivor then
                for i, v in pairs(game.Workspace:GetDescendants()) do
                    if v:FindFirstChild("ExitIcon") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                        game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                        for i, c in pairs(game.Workspace:GetDescendants()) do
                            if c.ClassName == "Folder" and c.Name == "Exits" then
                                for i, b in pairs(c:GetDescendants()) do
                                    if b.Name == "Trigger" then
                                        game.Players.LocalPlayer.Character.Humanoid.Sit = false
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = b.CFrame
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
Tabs.Main:AddSlider("Win Time", {
    Title = "Auto Win Wait Time",
    Default = 0.8,
    Min = 0,
    Max = 1.2,
    Rounding = 1,
    Callback = function(v)
        wintime = tonumber(v)
    end
})
Tabs.Main:AddToggle("Auto Lobby Loot Toggle", {
    Title = "Auto Lobby Loot",
    Default = false,
    Callback = function(v)
        getgenv().collectlootlobby = v
        while getgenv().collectlootlobby do
            wait(lobbytime)
            if game.Players.LocalPlayer.Team == game.Teams.Lobby then
                for i, v in pairs(game.Workspace:GetDescendants()) do
                    if v.Name == "LootProxBlock" and v.Transparency == 1 and
                        game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                        fireproximityprompt(v:FindFirstChildOfClass("ProximityPrompt"))
                    end
                end
            end
        end
    end
})
Tabs.Main:AddSlider("Lobby", {
    Title = "Lobby Loot Wait Time",
    Default = 0.2,
    Min = 0,
    Max = 1.2,
    Rounding = 1,
    Callback = function(v)
        lobbytime = tonumber(v)
    end
})
Tabs.Main:AddToggle("Auto Survivor Loot Toggle", {
    Title = "Auto Survivor Loot",
    Default = false,
    Callback = function(v)
        getgenv().collectlootsurvi = v
        while getgenv().collectlootsurvi do
            wait(survivortime)
            local backpack = game:GetService("Players").LocalPlayer.PlayerGui.GameHUD.PlayerHUD.XP.RoundInfo.Backpack.Amount
            if game.Players.LocalPlayer.Team == game.Teams.Survivor then
                for i, v in pairs(game.Workspace:GetDescendants()) do
                    if v.Name == "LootProxBlock" and v.Transparency == 1 and
                        game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        if backpack.Text == "8/8" or backpack.Text == "9/9" or backpack.Text == "10/10" or backpack.Text == "11/11" or backpack.Text == "12/12" or (not getgenv().collectlootsurvi) then break end
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                        fireproximityprompt(v:FindFirstChildOfClass("ProximityPrompt"))
                    end
                end
            end
        end
    end
})
Tabs.Main:AddSlider("Survivor", {
    Title = "Survivor Loot Wait Time",
    Default = 0.2,
    Min = 0,
    Max = 1.2,
    Rounding = 1,
    Callback = function(v)
        survivortime = tonumber(v)
    end
})
Tabs.Main:AddParagraph({
    Title = "Survivor Section",
})
Tabs.Main:AddToggle("AUto Heal Toggle Toggle", {
    Title = "Auto Heal",
    Default = false,
    Callback = function(v)
        getgenv().revivelocalplayer = v
        while getgenv().revivelocalplayer do
            wait()
            if game.Players.LocalPlayer.Team == game:GetService('Teams').Survivor then
                for i, v in pairs(game.Players:GetPlayers()) do
                    if v.Team == game:GetService('Teams').Survivor and v ~= game.Players.LocalPlayer then
                        if game:GetService('Workspace')[game.Players.LocalPlayer.Name].HumanoidRootPart.BleedOutHealth.Enabled == true and not v.Character.HumanoidRootPart.BleedOutHealth.Enabled == true and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart') then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
                        end
                    end
                end
            end
        end
    end
})
Tabs.Main:AddToggle("Auto Revive Player Toggle", {
    Title = "Revive Player",
    Default = false,
    Callback = function(v)
        getgenv().reviveplayer = v
        while getgenv().reviveplayer do
            wait()
            if game.Players.LocalPlayer.Team == game.Teams.Survivor then
                for i, v in pairs(game.Teams.Survivor:GetPlayers()) do
                    if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and
                        game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                        if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                            if v.Character.HumanoidRootPart:FindFirstChild("BleedOutHealth").Enabled == true and v.Character.HumanoidRootPart:FindFirstChild("BleedOutHealth").BleedProgress.KillerTooClose.Visible == false then
                                for i, b in pairs(game.Teams.Killer:GetPlayers()) do
                                    if b ~= game.Players.LocalPlayer then
                                        if b.Character and b.Character:FindFirstChild("HumanoidRootPart") then
                                            if (v.Character.HumanoidRootPart.Position - b.Character.HumanoidRootPart.Position).Magnitude > setdistancerevive then
                                                game.Players.LocalPlayer.Character.Humanoid.Sit = false
                                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
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
Tabs.Main:AddSlider("Distance Player", {
    Title = "Distance Player From Killer",
    Default = 23,
    Min = 18,
    Max = 50,
    Rounding = 1,
    Callback = function(v)
        setdistancerevive = tonumber(v)
    end
})
Tabs.Main:AddToggle("Auto Safe Teleport Toggle", {
    Title = "Safe Teleport",
    Default = false,
    Callback = function(v)
        getgenv().safetp = v
        while getgenv().safetp do
            wait()
            if game.Players.LocalPlayer.Team == game.Teams.Survivor then
                for i, v in pairs(game.Players:GetPlayers()) do
                    if v ~= game.Players.LocalPlayer and v.Team == game.Teams.Killer and
                        game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart') then
                        if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                            if (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < setdistance then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3.82155776, 4.99802399, -15.8121977, -0.892337799, -2.12720082e-08, 0.451368183, 2.58683019e-10, 1, 4.76392508e-08, -0.451368183, 4.26270645e-08, -0.892337799)
                            end
                        end
                    end
                end
            end
        end
    end
})
Tabs.Main:AddSlider("Safe Teleport", {
    Title = "Distance From Killer",
    Default = 23,
    Min = 18,
    Max = 50,
    Rounding = 1,
    Callback = function(v)
        setdistance = tonumber(v)
    end
})
Tabs.Main:AddParagraph({
    Title = "Killer Section",
})
local Killone = Tabs.Main:AddDropdown("Killonedropdown", {
    Title = "Kill Player",
    Values = PlayerList,
    Multi = false,
    Default = nil,
    Callback = function(selectkillplr)
        for i, v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer and v.Name == selectkillplr and game.Players.LocalPlayer.Team == game.Teams.Killer and v.Team == game.Teams.Survivor and game.Players.LocalPlayer.Character:FindFirstChild("Knife") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                    firetouchinterest(v.Character.HumanoidRootPart, game.Players.LocalPlayer.Character.Knife.KnifeAttachment, 0)
                    firetouchinterest(v.Character.HumanoidRootPart, game.Players.LocalPlayer.Character.Knife.KnifeAttachment, 1)
                end
            end
        end
    end
})
Tabs.Main:AddToggle("Kill All Toggle", {
    Title = "Auto Kill All",
    Default = false,
    Callback = function(v)
        getgenv().kill = v
        while getgenv().kill do
            wait()
            for i, b in pairs(game.ServerStorage:GetDescendants()) do
                if b:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Team == game.Teams.Killer and game.Players.LocalPlayer.Character:FindFirstChild("Knife") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    for i, v in pairs(workspace:GetDescendants()) do
                        if v:IsA("Folder") and v.Name == "Lockers" then
                            for i, c in pairs(v:GetDescendants()) do
                                if c.Name == "TouchInterest" and c.Parent then
                                    if (c.Parent.Position - b.HumanoidRootPart.Position).Magnitude < 10 then
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = c.Parent.CFrame
                                    end
                                end
                            end
                        end
                    end
                end
            end
            for i, v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Team == game.Teams.Killer and v.Team == game.Teams.Survivor and game.Players.LocalPlayer.Character:FindFirstChild("Knife") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                        firetouchinterest(v.Character.HumanoidRootPart, game.Players.LocalPlayer.Character.Knife.KnifeAttachment, 0)
                        firetouchinterest(v.Character.HumanoidRootPart, game.Players.LocalPlayer.Character.Knife.KnifeAttachment, 1)
                    end
                end
            end
        end
    end
})
Tabs.Main:AddToggle("Slash Reach Toggle", {
    Title = "Slash Reach",
    Default = false,
    Callback = function(v)
        getgenv().stab = v
        while getgenv().stab do
            wait()
            for i, b in pairs(game.ServerStorage:GetDescendants()) do
                if b:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Team == game.Teams.Killer and game.Players.LocalPlayer.Character:FindFirstChild("Knife") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    for i, v in pairs(workspace:GetDescendants()) do
                        if v:IsA("Folder") and v.Name == "Lockers" then
                            for i, c in pairs(v:GetDescendants()) do
                                if c.Name == "TouchInterest" and c.Parent then
                                    if (b.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < setstab and game.Players.LocalPlayer.Character.Knife.KnifeAttachment:FindFirstChild("Slash") and game.Players.LocalPlayer.Character.Knife.KnifeAttachment.Slash.Playing == true then
                                        if (c.Parent.Position - b.HumanoidRootPart.Position).Magnitude < 10 then
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = c.Parent.CFrame
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
            for i, v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Team == game.Teams.Killer and v.Team == game.Teams.Survivor and game.Players.LocalPlayer.Character:FindFirstChild("Knife") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    if game.Players.LocalPlayer.Character.Knife.KnifeAttachment:FindFirstChild("Slash") then
                        if game.Players.LocalPlayer.Character.Knife.KnifeAttachment.Slash.Playing == true then
                            if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                                if (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < setstab then
                                    firetouchinterest(v.Character.HumanoidRootPart, game.Players.LocalPlayer.Character.Knife.KnifeAttachment, 0)
                                    firetouchinterest(v.Character.HumanoidRootPart, game.Players.LocalPlayer.Character.Knife.KnifeAttachment, 1)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
})
Tabs.Main:AddSlider("Slash Distance", {
    Title = "Slash Distance",
    Default = 20,
    Min = 8,
    Max = 90,
    Rounding = 1,
    Callback = function(v)
        setstab = tonumber(v)
    end
})
Tabs.Main:AddToggle("Kill Aura Toggle", {
    Title = "Kill Aura",
    Default = false,
    Callback = function(v)
        getgenv().killaura = v
        while getgenv().killaura do
            wait()
            for i, b in pairs(game.ServerStorage:GetDescendants()) do
                if b:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Team == game.Teams.Killer and game.Players.LocalPlayer.Character:FindFirstChild("Knife") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    for i, v in pairs(workspace:GetDescendants()) do
                        if v:IsA("Folder") and v.Name == "Lockers" then
                            for i, c in pairs(v:GetDescendants()) do
                                if c.Name == "TouchInterest" and c.Parent then
                                    if (b.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < setaura then
                                        if (c.Parent.Position - b.HumanoidRootPart.Position).Magnitude < 3 then
                                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = c.Parent.CFrame
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
            for i, v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Team == game.Teams.Killer and v.Team == game.Teams.Survivor and game.Players.LocalPlayer.Character:FindFirstChild("Knife") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                        if (v.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < setaura then
                            firetouchinterest(v.Character.HumanoidRootPart, game.Players.LocalPlayer.Character.Knife.KnifeAttachment, 0)
                            firetouchinterest(v.Character.HumanoidRootPart, game.Players.LocalPlayer.Character.Knife.KnifeAttachment, 1)
                        end
                    end
                end
            end
        end
    end
})
Tabs.Main:AddSlider("Kill Aura Range", {
    Title = "Kill Aura Range",
    Default = 20,
    Min = 8,
    Max = 90,
    Rounding = 1,
    Callback = function(v)
        setaura = tonumber(v)
    end
})
Tabs.Esp:AddToggle("Esp Players", {
    Title = "Enable Esp",
    Default = false,
    Callback = function(v)
        ESP.Players = v
    end
})
Tabs.Esp:AddToggle("Esp Name", {
    Title = "Player Name",
    Default = false,
    Callback = function(v)
        ESP.Names = v
    end
})
Tabs.Esp:AddToggle("Esp Tracer", {
    Title = "Player Tracer",
    Default = false,
    Callback = function(v)
        ESP.Tracers = v
    end
})
Tabs.Esp:AddToggle("Esp Boxes", {
    Title = "Player Box",
    Default = false,
    Callback = function(v)
        ESP.Boxes = v
    end
})
Tabs.Esp:AddToggle("Esp Teamcolor", {
    Title = "Player TeamColor",
    Default = false,
    Callback = function(v)
        ESP.TeamColor = v
    end
})
Tabs.Esp:AddColorpicker("Esp ColorPick", {
    Title = "Esp Color",
    Default = Color3.fromRGB(255, 255, 255),
    Callback = function(v)
        ESP.Color = v
    end
})
Tabs.Teleport:AddButton({
    Title = "Teleport Cabin",
    Callback = function()
        for i, v in pairs(game:GetService("Workspace")._Lobby.Cabins:GetChildren()) do
            if v.Name == game.Players.LocalPlayer.Name then
                for i, b in pairs(v:GetChildren()) do
                    if b.Name == "Spawn" then
                        game.Players.LocalPlayer.Character.PrimaryPart.CFrame = b.CFrame
                    end
                end
            end
        end
    end
})
Tabs.Teleport:AddButton({
    Title = "Teleport Lobby",
    Callback = function()
        game.Players.LocalPlayer.Character.PrimaryPart.CFrame = game:GetService("Workspace")._Lobby.Spawns.SpawnLocation.CFrame
    end
})
Tabs.Teleport:AddButton({
    Title = "Teleport Map",
    Callback = function()
        for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
            if v:IsA("Folder") and v.Name == "SurvivorSpawns" then
                for i, c in pairs(v:GetChildren()) do
                    if c.Name == "Spawn" then
                        game.Players.LocalPlayer.Character.PrimaryPart.CFrame = c.CFrame
                    end
                end
            end
        end
    end
})
Tabs.Teleport:AddButton({
    Title = "Teleport Killer",
    Callback = function()
        for i, v in pairs(game.Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer and v.Team == game.Teams.Killer then
                game.Players.LocalPlayer.Character.PrimaryPart.CFrame = v.Character.HumanoidRootPart.CFrame
            end
        end
    end
})
local Playerlist = Tabs.Teleport:AddDropdown("Player Dropdown Teleport", {
    Title = "Teleport Selected Player",
    Values = plr,
    Multi = false,
    Default = nil,
    Callback = function(v)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v].Character.HumanoidRootPart.CFrame
    end
})
Tabs.Localplr:AddToggle("inf zoom", {
    Title = "Inf Zoom",
    Default = false,
    Callback = function(v)
        if v then
            game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = math.huge
        else
            game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 15
        end
    end
})
Tabs.Localplr:AddToggle("fov", {
    Title = "Toggle Fov",
    Default = false,
    Callback = function(v)
        getgenv().fov = v
        while getgenv().fov do
            wait(0.2)
            game:GetService('Workspace').Camera.FieldOfView = amount
            if not getgenv().fov then
                game:GetService('Workspace').Camera.FieldOfView = 70
            end
        end
    end
})
Tabs.Localplr:AddSlider("fov slider", {
    Title = "Fov",
    Default = 70,
    Min = 1,
    Max = 120,
    Rounding = 1,
    Callback = function(v)
        amount = tonumber(v)
    end
})
Tabs.Localplr:AddToggle("Noclip Toggle", {
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
Tabs.Localplr:AddToggle("xray toggle", {
    Title = "Xray",
    Default = false,
    Callback = function(v)
        if v then
            for _, i in pairs(workspace:GetDescendants()) do
                if i:IsA("BasePart") and not i.Parent:FindFirstChildOfClass('Humanoid') and
                    not i.Parent.Parent:FindFirstChildOfClass('Humanoid') then
                    i.LocalTransparencyModifier = 0.5
                end
            end
        else
            for _, i in pairs(workspace:GetDescendants()) do
                if i:IsA("BasePart") and not i.Parent:FindFirstChildOfClass('Humanoid') and
                    not i.Parent.Parent:FindFirstChildOfClass('Humanoid') then
                    i.LocalTransparencyModifier = 0
                end
            end
        end
    end
})
Tabs.Localplr:AddToggle("spec killer", {
    Title = "Spectate Killer",
    Default = false,
    Callback = function(v)
        getgenv().spec = v
        while getgenv().spec do
            wait()
            for i, v in pairs(game.Players:GetPlayers()) do
                if v.Team == game.Teams.Killer then
                    repeat wait()
                        workspace.Camera.CameraSubject = v.Character
                    until v.Team == game.Teams.Lobby or not getgenv().spec
                    workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character
                end
            end
        end
    end
})
Tabs.Localplr:AddToggle("ws toggle", {
    Title = "Toggle Walkspeed",
    Default = false,
    Callback = function(v)
        getgenv().ws = v
        while getgenv().ws do
            wait()
            if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = walkspeed
                if not getgenv().ws then
                    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
                end
            end
        end
    end
})
Tabs.Localplr:AddSlider("Slider", {
    Title = "Walkspeed",
    Default = 16,
    Min = 16,
    Max = 500,
    Rounding = 1,
    Callback = function(v)
        walkspeed = tonumber(v)
    end
})
Tabs.Localplr:AddToggle("inf jump", {
    Title = "Inf Jump",
    Default = false,
    Callback = function(v)
        getgenv().infjump = v
        game:GetService("UserInputService").JumpRequest:connect(function()
            if getgenv().infjump then
                game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(
                    "Jumping")
            end
        end)
    end
})
Tabs.Misc:AddButton({
    Title = "Rejoin",
    Callback = function()
        local ts = game:GetService("TeleportService")
        local p = game:GetService("Players").LocalPlayer
        ts:Teleport(game.PlaceId, p)
    end
})
Tabs.Misc:AddToggle("autorj", {
    Title = "Auto Rejoin",
    Default = true,
    Callback = function(v)
        getgenv().aj = v
        game:GetService("GuiService").ErrorMessageChanged:Connect(function()
            if getgenv().aj then
                wait()
                game:GetService("TeleportService"):Teleport(game.PlaceId)
            end
        end)
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
    Title = "Server Hop Small Server",
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
            Server = Servers.data[6]
            Next = Servers.nextPageCursor
        until Server
        TPS:TeleportToPlaceInstance(_place, Server.id, game.Players.LocalPlayer)
    end
})
Tabs.Misc:AddToggle("Fullbright", {
    Title = "Fullbright",
    Default = false,
    Callback = function(v)
        getgenv().fb = v
        while getgenv().fb do
            wait()
            game.Lighting.Brightness = 2
            game.Lighting.ClockTime = 14
            game.Lighting.FogEnd = 10000
            game.Lighting.ColorShift_Top = Color3.new(1, 1, 1)
            if not getgenv().fb then
                game.Lighting.Brightness = 4.06
                game.Lighting.ClockTime = 0
                game.Lighting.FogEnd = 500
                game.Lighting.ColorShift_Top = Color3.fromRGB(170, 176, 255)
            end
        end
    end
})
Tabs.Misc:AddButton({
    Title = "Less Lag",
    Callback = function()
        local mx = game.Debris
        local mx3 = game.Debris.MaxItems
        if (mx.MaxItems > 9999999999) then
            mx.MaxItems = mx3 * .9999999999
        end
        wait()
        setfpscap(1000)
    end
})
--plr update
game.Players.PlayerAdded:Connect(function(PlayerAdd)
    if PlayerAdd ~= game.Players.LocalPlayer then
        table.insert(plr, PlayerAdd.Name)
        Playerlist:SetValues()
    end
end)
game.Players.PlayerRemoving:Connect(function(PlayerRem)
    for index, playerName in pairs(plr) do
        if playerName == PlayerRem.Name then
            table.remove(plr, index)
        end
    end
    Playerlist:SetValues()
end)
--survivorupdatekill
game.Teams.Survivor.PlayerAdded:Connect(function(PlayerAdded)
    if PlayerAdded ~= game.Players.LocalPlayer then
        table.insert(PlayerList, PlayerAdded.Name)
        Killone:SetValues()
    end
end)
game.Teams.Survivor.PlayerRemoved:Connect(function(PlayerRemoving)
    for index, playerName in pairs(PlayerList) do
        if playerName == PlayerRemoving.Name then
            table.remove(PlayerList, index)
        end
    end
    Killone:SetValues()
end)
-- config
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
InterfaceManager:SetFolder("Folder")
SaveManager:SetFolder("Folder/GameFolder")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)
Window:SelectTab(1)
SaveManager:LoadAutoloadConfig()