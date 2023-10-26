local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/airesz178/Ui-Library/main/orion%20ui%20library')))()
local Window = OrionLib:MakeWindow({Name = tostring(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name), HidePremium = false, SaveConfig = false, ConfigFolder = "OrionTest", IntroEnable = true, IntroText = tostring(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)})
local Lighting = game:GetService("Lighting")
local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
ESP:Toggle(true)
ESP.Tracers = false
ESP.Names = false
ESP.Boxes = false
ESP.Players = false
ESP.Color = Color3.fromRGB(255, 255, 255)
ESP:AddObjectListener(workspace, {
    Color = Color3.new(1, 1, 1),
    Name = "Ghost",
    PrimaryPart = function(obj)
        local hrp = obj:FindFirstChildWhichIsA("BasePart")
        while not hrp do
            wait()
            hrp = obj:FindFirstChildWhichIsA("BasePart")
        end
        return hrp
    end,
    CustomName = function(obj)
        return obj.Name
    end,
    IsEnabled = "Ghost",
})
ESP.Ghost = false
local function get_plrs()
    local plrs = {}
    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= game.Players.LocalPlayer then
            table.insert(plrs, v.Name)
        end
    end
    return plrs
end
local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
local sanity = Tab:AddLabel("Sanity:" .. tostring(game.Players.LocalPlayer.Sanity.Value))
local curse = Tab:AddLabel("Curse Spawn:nil")
local emf = Tab:AddLabel("Emf:false")
local freeze = Tab:AddLabel("Freezing:false")
local fp = Tab:AddLabel("Fingerprint:false")
local orb = Tab:AddLabel("Orb:false")
local room = Tab:AddLabel("Ghost Room:nil")
local ghost = Tab:AddLabel("Ghost Spawn:false")
game:GetService("Players").LocalPlayer.Sanity:GetPropertyChangedSignal("Value"):Connect(function(sa)
    sanity:Set("Sanity:" .. tostring(game:GetService("Players").LocalPlayer.Sanity.Value))
end)
game:GetService("RunService").RenderStepped:Connect(function()
    for i, v in pairs(game:GetService("Workspace").Map.Zones:GetDescendants()) do
        if v.Name == "EMF" then
            if v.Value == 5 then
                emf:Set("Emf:true")
            end
        end
    end
end)
game:GetService("RunService").RenderStepped:Connect(function()
    for i, v in pairs(game:GetService("Workspace").Map.Zones:GetDescendants()) do
        if v.Name == "Temperature" then
            if v.Value <= 0 then
                freeze:Set("Freezing:true")
            end
        end
    end
end)
for i, v in pairs(game.Workspace.Map.Prints:GetChildren()) do
    if v.Name == "PrintPart" then
        fp:Set("Fingerprint:true")
    end
end
for i, v in pairs(game.Workspace.Map.Orbs:GetChildren()) do
    if v.Name == "OrbPart" then
        orb:Set("Orb:true")
    end
end
game:GetService("Workspace").Map.Prints.ChildAdded:Connect(function()
    fp:Set("Fingerprint:true")
end)
game:GetService("Workspace").Map.Orbs.ChildAdded:Connect(function()
    orb:Set("Orb:true")
end)
for i, v in pairs(game.Workspace:GetChildren()) do
    if v.Name == "Ghost" then
        ghost:Set("Ghost Spawn:true")
    end
end
game.Workspace.ChildAdded:Connect(function(name)
    if name.Name == "Ghost" then
        ghost:Set("Ghost Spawn:true")
    end
end)
game.Workspace.ChildRemoved:Connect(function(name)
    if name.Name == "Ghost" then
        ghost:Set("Ghost Spawn:false")
    end
end)
game:GetService("RunService").RenderStepped:Connect(function()
    for i, v in pairs(game:GetService("Workspace").Map.Zones:GetDescendants()) do
        if v.Name == "EMF" then
            if v.Value >= 2 then
                room:Set("Ghost Room:" .. tostring(v.Parent.Name))
            end
        end
    end
end)
if game.Workspace:FindFirstChild("Ouija Board") then
    curse:Set("Curse Spawn:Oujia Board")
end
if game.Workspace:FindFirstChild("SummoningCircle") then
    curse:Set("Curse Spawn:SummoningCircle")
end
if game:GetService("Workspace").Map.Items:FindFirstChild("Tarot Cards") then
    curse:Set("Curse Spawn:Tarot Card")
end
Tab:AddToggle({
    Name = "Auto Collect Water",
    Default = false,
    Callback = function(v)
        getgenv().water = v
        while getgenv().water do
            wait()
            for i, v in pairs(game:GetService("Workspace").Map.Water:GetDescendants()) do
                if v:FindFirstChild("WaterRunning") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.WaterRunning.Parent.Position)
                    wait()
                    fireproximityprompt(v.WaterRunning.Parent.ProximityPrompt)
                end
            end
        end
    end
})
Tab:AddToggle({
    Name = "Auto Return to van when ghost spawning",
    Default = false,
    Callback = function(v)
        getgenv().ghost = v
        game.Workspace.ChildAdded:Connect(function(name)
            if name.Name == "Ghost" and getgenv().ghost then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Van.FloorHitbox.CFrame * CFrame.new(0, 5, 0)
            end
        end)
    end
})
local Tab1 = Window:MakeTab({
    Name = "Esp",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
Tab1:AddToggle({
    Name = "Player Esp",
    Default = false,
    Callback = function(v)
        ESP.Players = v
    end
})
Tab1:AddToggle({
    Name = "Ghost Esp",
    Default = false,
    Callback = function(v)
        ESP.Ghost = v
    end
})
Tab1:AddToggle({
    Name = "Enable Name",
    Default = false,
    Callback = function(v)
        ESP.Names = v
    end
})
Tab1:AddToggle({
    Name = "Enable Tracer",
    Default = false,
    Callback = function(v)
        ESP.Tracers = v
    end
})
Tab1:AddToggle({
    Name = "Enable Boxes",
    Default = false,
    Callback = function(v)
        ESP.Boxes = v
    end
})
Tab1:AddColorpicker({
    Name = "Esp Color",
    Default = Color3.fromRGB(255, 255, 255),
    Callback = function(v)
        ESP.Color = v
    end
})
local Tab2 = Window:MakeTab({
    Name = "Teleport",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
Tab2:AddButton({
    Name = "Teleport To Curse Item",
    Callback = function()
        if game:GetService("Workspace"):FindFirstChild("Ouija Board") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace")["Ouija Board"].Board.Position) * CFrame.new(0, 3, 0)
        elseif game.Workspace:FindFirstChild("SummoningCircle") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").SummoningCircle.Circle.CFrame * CFrame.new(0, 2, 0)
        elseif game:GetService("Workspace").Map.Items:FindFirstChild("Tarot Cards") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").Map.Items["Tarot Cards"].Hitbox.Position)
        end
    end
})
Tab2:AddButton({
    Name = "Teleport To Van",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Van.FloorHitbox.CFrame * CFrame.new(0, 5, 0)
    end
})
Tab2:AddButton({
    Name = "Teleport To Ghost Room",
    Callback = function()
        for i, v in pairs(game:GetService("Workspace").Map.Zones:GetDescendants()) do
            if v.Name == "EMF" then
                if v.Value >= 2 and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Parent.Position)
                end
            end
        end
    end
})
local dropdown = Tab2:AddDropdown({
    Name = "Teleport To Player",
    Default = "",
    Options = get_plrs(),
    Callback = function(v)
        if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[v].Character.HumanoidRootPart.CFrame
        end
    end
})
local Tab = Window:MakeTab({
    Name = "Misc",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
Tab:AddButton({
    Name = "Remove Door",
    Callback = function()
        game:GetService("Workspace").Map.Doors:Destroy()
    end
})
Tab:AddButton({
    Name = "FullBright",
    Callback = function()
        Lighting.Brightness = 2
        Lighting.ClockTime = 14
        Lighting.FogEnd = 100000
        Lighting.GlobalShadows = false
        Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        Lighting.FogEnd = 100000
        for i, v in pairs(Lighting:GetDescendants()) do
            if v:IsA("Atmosphere") then
                v:Destroy()
            end
        end
    end
})
Tab:AddButton({
    Name = "Fast Proximity",
    Callback = function()
        game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt)
            prompt.HoldDuration = 0
        end)
    end
})
Tab:AddButton({
    Name = "Chat Spy",
    Callback = function()
        Config = {
            enabled = true,
            spyOnMyself = true,
            public = false,
            publicItalics = true
        }
        PrivateProperties = {
            Color = Color3.fromRGB(0, 255, 255);
            Font = Enum.Font.SourceSansBold;
            TextSize = 18;
        }
        local StarterGui = game:GetService("StarterGui")
        local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        local saymsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
        local getmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
        local instance = (_G.chatSpyInstance or 0) + 1
        _G.chatSpyInstance = instance
        local function onChatted(p, msg)
            if _G.chatSpyInstance == instance then
                if p == player and msg:lower():sub(1, 4) == "/spy" then
                    Config.enabled = not Config.enabled
                    wait(0.3)
                    PrivateProperties.Text = "{SPY " .. (Config.enabled and "EN" or "DIS") .. "ABLED}"
                    StarterGui:SetCore("ChatMakeSystemMessage", PrivateProperties)
                elseif Config.enabled and (Config.spyOnMyself == true or p ~= player) then
                    msg = msg:gsub("[\n\r]", ''):gsub("\t", ' '):gsub("[ ]+", ' ')
                    local hidden = true
                    local conn = getmsg.OnClientEvent:Connect(function(packet, channel)
                        if packet.SpeakerUserId == p.UserId and packet.Message == msg:sub(#msg - #packet.Message + 1) and (channel == "All" or (channel == "Team" and Config.public == false and Players[packet.FromSpeaker].Team == player.Team)) then
                            hidden = false
                        end
                    end)
                    wait(1)
                    conn:Disconnect()
                    if hidden and Config.enabled then
                        if Config.public then
                            saymsg:FireServer((Config.publicItalics and "/me " or '') .. "{SPY} [" .. p.Name .. "]: " .. msg, "All")
                        else
                            PrivateProperties.Text = "{SPY} [" .. p.Name .. "]: " .. msg
                            StarterGui:SetCore("ChatMakeSystemMessage", PrivateProperties)
                        end
                    end
                end
            end
        end
        for _, p in ipairs(Players:GetPlayers()) do
            p.Chatted:Connect(function(msg)onChatted(p, msg) end)
        end
        Players.PlayerAdded:Connect(function(p)
            p.Chatted:Connect(function(msg)onChatted(p, msg) end)
        end)
        PrivateProperties.Text = "{SPY " .. (Config.enabled and "EN" or "DIS") .. "ABLED}"
        StarterGui:SetCore("ChatMakeSystemMessage", PrivateProperties)
        local chatFrame = player.PlayerGui.Chat.Frame
        chatFrame.ChatChannelParentFrame.Visible = true
        chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position + UDim2.new(UDim.new(), chatFrame.ChatChannelParentFrame.Size.Y)
    end
})
Tab:AddToggle({
    Name = "Toggle WalkSpeed",
    Default = false,
    Callback = function(v)
        getgenv().ws = v
        while getgenv().ws do
            wait()
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = setws
            if not getgenv().ws then game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16 end
        end
    end
})
Tab:AddSlider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 400,
    Default = 16,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    Callback = function(v)
        setws = tonumber(v)
    end
})
Tab:AddToggle({
    Name = "Noclip",
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
pcall(function()
    game.Players.PlayerAdded:Connect(function()
        dropdown:Refresh(get_plrs(), true)
    end)
    game.Players.PlayerRemoving:Connect(function()
        dropdown:Refresh(get_plrs(), true)
    end)
end)
OrionLib:Init()
