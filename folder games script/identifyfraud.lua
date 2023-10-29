local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/airesz178/Ui-Library/main/Elerium%20v2'))()
local window = Library:AddWindow(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, {
    main_color = Color3.fromRGB(41, 74, 122),
    min_size = Vector2.new(250, 346),
    toggle_key = Enum.KeyCode.Equals,
    can_resize = true,
})
local tab1 = window:AddTab("Main")
local tab2 = window:AddTab("Esp")
tab1:Show()
local fly = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nicuse/RobloxScripts/main/BypassedFly.lua"))()
local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
ESP:Toggle(true)
ESP.Tracers = false
ESP.Names = false
ESP.Boxes = false
ESP.Players = false
ESP.Color = Color3.fromRGB(255, 255, 255)
ESP:AddObjectListener(game:GetService("Workspace").NPCs, {
    Color = Color3.new(255, 0, 0),
    Type = "Model",
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
    IsEnabled = "Npc",
})
ESP.Npc = false
ESP:AddObjectListener(Workspace, {
    Name = "Button1",
    CustomName = "Button1",
    Color = Color3.fromRGB(0, 0, 255),
    IsEnabled = "button1"
})
ESP.button1 = false
ESP:AddObjectListener(Workspace, {
    Name = "Button2",
    CustomName = "Button2",
    Color = Color3.fromRGB(0, 0, 255),
    IsEnabled = "button2"
})
ESP.button2 = false
ESP:AddObjectListener(Workspace, {
    Name = "Button3",
    CustomName = "Button3",
    Color = Color3.fromRGB(0, 0, 255),
    IsEnabled = "button3"
})
ESP.button3 = false
tab1:AddSwitch("Enable 3D Person", function(v)
    getgenv().enable = v
    while getgenv().enable do
        wait()
        game.Players.localPlayer.CameraMode = Enum.CameraMode.Classic
        game.Players.localPlayer.CameraMaxZoomDistance = 100
        if not getgenv().enable then
            game.Players.localPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
            game.Players.localPlayer.CameraMaxZoomDistance = 0.5
        end
    end
end)
tab1:AddSwitch("Noclip", function(v)
    getgenv().noclip = v
    while getgenv().noclip do
        wait()
        for i, v in pairs(game.Players.localPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") and v.CanCollide == true then
                v.CanCollide = false
                if not getgenv().noclip then
                    v.CanCollide = true
                end
            end
        end
    end
end)
tab1:AddSwitch("Fly", function(v)
    fly(v)
end)
tab1:AddSwitch("Inf Jump", function(v)
    getgenv().infjump = v
    game:GetService("UserInputService").JumpRequest:connect(function()
        if getgenv().infjump then
            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end
    end)
end)
tab1:AddButton("FullBright", function()
    loadstring(game:HttpGet('https://pastebin.com/raw/06iG6YkU'))()
end)
local slider1 = tab1:AddSlider("WalkSpeed", function(v)
    ws = tonumber(v)
end, {
    ["min"] = 16,
    ["max"] = 500,
})
slider1:Set(0)
local slider2 = tab1:AddSlider("JumpPower", function(v)
    jp = tonumber(v)
end, {
    ["min"] = 0,
    ["max"] = 300,
})
slider2:Set(0)
tab2:AddSwitch("Enable Esp", function(v)
    ESP.Players = v
end)
tab2:AddSwitch("Enable Name", function(v)
    ESP.Names = v
end)
tab2:AddSwitch("Enable Tracers", function(v)
    ESP.Tracers = v
end)
tab2:AddSwitch("Enable Boxes", function(v)
    ESP.Boxes = v
end)
tab2:AddSwitch("Monster Esp", function(v)
    ESP.Npc = v
end)
tab2:AddSwitch("Button1 Esp", function(v)
    ESP.button1 = v
end)
tab2:AddSwitch("Button2 Esp", function(v)
    ESP.button2 = v
end)
tab2:AddSwitch("Button3 Esp", function(v)
    ESP.button3 = v
end)
spawn(function()
    while task.wait() do
        if game.Players.localPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.localPlayer.Character.Humanoid.WalkSpeed = ws
            game.Players.localPlayer.Character.Humanoid.JumpPower = jp
        end
    end
end)
