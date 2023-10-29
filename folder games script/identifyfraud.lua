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
lplayer = game:GetService("Players").LocalPlayer
lplayer.CharacterAdded:Connect(function(character)
    flying = false
end)
local Mouse = lplayer:GetMouse()
flying = false
flying = false
speedfly = 2
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
    getgenv().flying = v
    if getgenv().flying then
        repeat wait() until lplayer and lplayer.Character and lplayer.Character:FindFirstChild('HumanoidRootPart') and lplayer.Character:FindFirstChild('Humanoid')
        repeat wait() until Mouse
        local T = lplayer.Character.HumanoidRootPart
        local CONTROL = {F = 0, B = 0, L = 0, R = 0}
        local lCONTROL = {F = 0, B = 0, L = 0, R = 0}
        local SPEED = speedget
        local function fly()
            flying = true
            local BG = Instance.new('BodyGyro', T)
            local BV = Instance.new('BodyVelocity', T)
            BG.P = 9e4
            BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            BG.cframe = T.CFrame
            BV.velocity = Vector3.new(0, 0.1, 0)
            BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
            spawn(function()
                repeat wait()
                    lplayer.Character.Humanoid.PlatformStand = true
                    if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 then
                        SPEED = 50
                    elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0) and SPEED ~= 0 then
                        SPEED = 0
                    end
                    if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 then
                        BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
                        lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
                    elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and SPEED ~= 0 then
                        BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
                    else
                        BV.velocity = Vector3.new(0, 0.1, 0)
                    end
                    BG.cframe = workspace.CurrentCamera.CoordinateFrame
                until not flying
                CONTROL = {F = 0, B = 0, L = 0, R = 0}
                lCONTROL = {F = 0, B = 0, L = 0, R = 0}
                SPEED = 0
                BG:destroy()
                BV:destroy()
                lplayer.Character.Humanoid.PlatformStand = false
            end)
        end
        Mouse.KeyDown:connect(function(KEY)
            if KEY:lower() == 'w' then
                CONTROL.F = speedfly
            elseif KEY:lower() == 's' then
                CONTROL.B = -speedfly
            elseif KEY:lower() == 'a' then
                CONTROL.L = -speedfly
            elseif KEY:lower() == 'd' then
                CONTROL.R = speedfly
            end
        end)
        Mouse.KeyUp:connect(function(KEY)
            if KEY:lower() == 'w' then
                CONTROL.F = 0
            elseif KEY:lower() == 's' then
                CONTROL.B = 0
            elseif KEY:lower() == 'a' then
                CONTROL.L = 0
            elseif KEY:lower() == 'd' then
                CONTROL.R = 0
            end
        end)
        fly()
    end
    if not getgenv().flying then
        flying = false
        lplayer.Character.Humanoid.PlatformStand = false
    end
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
