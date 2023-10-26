kick = hookmetamethod(game, "__namecall", function(...)
    if getnamecallmethod() == "Kick" or getnamecallmethod() == "kick" then
        return
    end
    return kick(...)
end)
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/airesz178/Ui-Library/main/Elerium%20v2'))()
local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
ESP:Toggle(true)
ESP.Tracers = false
ESP.Names = false
ESP.Boxes = false
ESP.Players = false
ESP.TeamColor = false
ESP.Color = Color3.fromRGB(255, 255, 255)
local window = Library:AddWindow(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, {
    main_color = Color3.fromRGB(41, 74, 122),
    min_size = Vector2.new(250, 346),
    can_resize = true,
})
local fly = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nicuse/RobloxScripts/main/BypassedFly.lua"))()
local tab1 = window:AddTab("Main")
local tab2 = window:AddTab("Esp")
local tab3 = window:AddTab("Misc")
local folder1 = tab1:AddFolder("Client")
local folder2 = tab1:AddFolder("LocalPlr")
local folder3 = tab1:AddFolder("Tool")
function humanoid()
    if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") or game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid") then
        return game.Players.LocalPlayer.Character.Humanoid
    end
end
folder1:AddButton("Inf Coin", function()
    game:GetService("Players").LocalPlayer["Expedition Data"].Coins.Value = math.huge
end)
folder1:AddButton("Unlock Vip", function()
    game:GetService("Players").LocalPlayer.Inventory.VIP.Value = true
end)
folder1:AddButton("Unlock Storm Googles", function()
    game:GetService("Players").LocalPlayer.Inventory.StormGoggles.Value = true
end)
folder2:AddSwitch("God Mode", function(v)
    getgenv().god = v
    while getgenv().god do
        task.wait()
        local args = {
            [1] = -math.huge,
            [2] = game:GetService("Players").LocalPlayer
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Health_Loss"):FireServer(unpack(args))
    end
end)
folder2:AddSwitch("No Fall Damage", function(v)
    getgenv().fall = v
    local fall = nil
    fall = hookmetamethod(game, "__namecall", function(self, ...)
        local args = {...}
        if tostring(self) == "ServerFallDamage" and args[1] == "Fall_Beyond_Threshold" and getgenv().fall then
            return
        end
        return fall(self, unpack(args))
    end)
end)
folder2:AddSwitch("No Freeze Damage", function(v)
    getgenv().freeze = v
    local freeze = nil
    freeze = hookmetamethod(game, "__namecall", function(self, ...)
        if tostring(self) == "Freeze_damage" and getgenv().freeze then
            return
        end
        return freeze(self, ...)
    end)
end)
folder2:AddSwitch("Inf Energy", function(v)
    getgenv().energy = v
    local energy = nil
    local path = game:GetService("Players").LocalPlayer.Inventory.Energy
    energy = hookmetamethod(game, "__index", function(self, index)
        if self == path and index == "Value" and getgenv().energy then
            return math.huge
        end
        return energy(self, index)
    end)
end)
folder2:AddSwitch("Inf Hydration", function(v)
    getgenv().hydra = v
    local hydra = nil
    local path = game:GetService("Players").LocalPlayer.Inventory.Hydration
    hydra = hookmetamethod(game, "__index", function(self, index)
        if self == path and index == "Value" and getgenv().hydra then
            return math.huge
        end
        return hydra(self, index)
    end)
end)
folder2:AddSwitch("Inf Hot Chocolate", function(v)
    getgenv().hot = v
    local hot = nil
    local path = game:GetService("Players").LocalPlayer.Inventory.HotChocolate
    hot = hookmetamethod(game, "__index", function(self, index)
        if self == path and index == "Value" and getgenv().hot then
            return math.huge
        end
        return hot(self, index)
    end)
end)
folder2:AddSwitch("Inf Water", function(v)
    getgenv().water = v
    local water = nil
    local path = game:GetService("Players").LocalPlayer.Inventory.Bottle
    water = hookmetamethod(game, "__index", function(self, index)
        if self == path and index == "Value" and getgenv().water then
            return math.huge
        end
        return water(self, index)
    end)
end)
folder2:AddSwitch("Inf Flare", function(v)
    getgenv().flare = v
    game:GetService("Players").carpor178.PlayerGui["Flare_Counter"].Frame["Flare_launch"].Activated:Connect(function()
        if getgenv().flare then
            game:GetService("Players").LocalPlayer.PlayerGui["Flare_Counter"].Frame.Direction.Text = "3 / 3"
        end
    end)
end)
folder3:AddButton("Get Flares", function()
    local args = {
        [1] = "Equip",
        [2] = workspace:WaitForChild("Flare_Box"):WaitForChild("Attachment"):WaitForChild("Flare")
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Tools_Main"):FireServer(unpack(args))
end)
folder3:AddButton("Get Energy Bar", function()
    for i, v in pairs(game.Workspace:GetDescendants()) do
        if v.Name == "Energy Bar" then
            local args = {
                [1] = "Equip",
                [2] = v
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Tools_Main"):FireServer(unpack(args))
        end
    end
end)
tab2:AddSwitch("Enable Esp", function(v)
    ESP.Players = v
end)
tab2:AddSwitch("Player Names", function(v)
    ESP.Names = v
end)
tab2:AddSwitch("Player Tracer", function(v)
    ESP.Tracers = v
end)
tab2:AddSwitch("Player Boxes", function(v)
    ESP.Boxes = v
end)
tab2:AddSwitch("Player TeamColor", function(v)
    ESP.TeamColor = v
end)
tab2:AddLabel("Esp Color")
tab2:AddColorPicker(function(v)
    ESP.Color = v
end)
local slider1 = tab3:AddSlider("WalkSpeed", function(v)
    setwalkspeed = tonumber(v)
end, {
    ["min"] = 16,
    ["max"] = 300,
})
slider1:Set(0)
local slider2 = tab3:AddSlider("JumpPower", function(v)
    setjumppower = tonumber(v)
end, {
    ["min"] = 50,
    ["max"] = 1000,
})
slider2:Set(0)
spawn(function()
    while task.wait() do
        humanoid().WalkSpeed = setwalkspeed
        humanoid().JumpPower = setjumppower
    end
end)
tab3:AddSwitch("Fly", function(v)
    fly(v)
end)
tab3:AddSwitch("Noclip", function(no)
    getgenv().noclip = no
    while getgenv().noclip do
        wait()
        for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") and v.CanCollide == true then
                v.CanCollide = false
                if not getgenv().noclip then
                    v.CanCollide = true
                end
            end
        end
    end
end)
tab3:AddSwitch("Inf Jump", function(v)
    getgenv().infjump = v
    game:GetService("UserInputService").JumpRequest:connect(function()
        if getgenv().infjump then
            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end
    end)
end)
tab3:AddButton("Less Lag", function()
    local mx = game.Debris
    local mx3 = game.Debris.MaxItems
    if (mx.MaxItems > 9999999999) then
        mx.MaxItems = mx3 * .9999999999
    end
    wait()
    setfpscap(1000)
end)
tab3:AddButton("Fullbright", function()
    loadstring(game:HttpGet('https://pastebin.com/raw/06iG6YkU'))()
end)
tab1:Show()
pcall(function()
    game:GetService("Workspace")["Instant Kill"]:Destroy()
end)
