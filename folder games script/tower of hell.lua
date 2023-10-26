local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/haris17890/name/main/orion.lua')))()
local Window = OrionLib:MakeWindow({Name = tostring(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name), HidePremium = false, SaveConfig = false, ConfigFolder = "OrionTest", IntroEnable = true, IntroText = tostring(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)})
local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
function bypass()
    local reg = getreg()
    for i, Function in next, reg do
        if type(Function) == 'function' then
            local info = getinfo(Function)
            if info.name == 'kick' then
                if (hookfunction(info.func, function(...) end)) then
                    end
            end
        end
    end
    local playerscripts = game:GetService 'Players'.LocalPlayer.PlayerScripts
    local script1 = playerscripts.LocalScript
    local script2 = playerscripts.LocalScript2
    local script1signal = script1.Changed
    local script2signal = script2.Changed
    for i, connection in next, getconnections(script1signal) do
        connection:Disable()
    end
    for i, connection in next, getconnections(script2signal) do
        connection:Disable()
    end
end
Tab:AddToggle({
    Name = "Auto Win",
    Default = false,
    Callback = function(v)
        getgenv().win = v
        while getgenv().win do
            wait()
            if game:GetService("Players").LocalPlayer.PlayerGui.timer.timeLeft.TextColor3 == Color3.fromRGB(255, 255, 255) or game:GetService("Players").LocalPlayer.PlayerGui.timer.timeLeft.TextColor3 == Color3.fromRGB(255, 0, 0) then
                local endzone = game.Workspace.tower.sections.finish.FinishGlow.CFrame
                local player = game.Players.LocalPlayer.Character
                player:WaitForChild("HumanoidRootPart").CFrame = endzone
            end
        end
    end
})
Tab:AddButton({
    Name = "Auto Win 1X",
    Callback = function()
        local endzone = game.Workspace.tower.sections.finish.FinishGlow.CFrame
        local player = game.Players.LocalPlayer.Character
        player:WaitForChild("HumanoidRootPart").CFrame = endzone
    end
})
Tab:AddButton({
    Name = "Remove Kill Part",
    Callback = function()
        for i, v in pairs(game.Workspace:GetDescendants()) do
            if v.Name == "kills" then
                v.Parent:Destroy()
            end
        end
    end
})
Tab:AddButton({
    Name = "Get Tool",
    Callback = function()
        for i, v in pairs(game:GetService("ReplicatedStorage").Gear:GetChildren()) do
            local j = v:Clone()
            j.Parent = game.Players.LocalPlayer.Backpack
        end
    end
})
Tab:AddButton({
    Name = "Remove Fog",
    Callback = function()
        if game:GetService("Players").LocalPlayer.PlayerGui.timer.mutators:FindFirstChild("fog") then
            game:GetService("Lighting").FogEnd = 1200
        end
    end
})
Tab:AddButton({
    Name = "God Mode",
    Callback = function()
        game:GetService("Players").LocalPlayer.Character:FindFirstChild("KillScript"):Destroy()
    end
})
local Tab = Window:MakeTab({
    Name = "Player",
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
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end
})
Tab:AddSlider({
    Name = "Jump",
    Min = 50,
    Max = 1000,
    Default = 50,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = "",
    Callback = function(v)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end
})
Tab:AddToggle({
    Name = "Inf Jump",
    Default = false,
    Callback = function(v)
        getgenv().jump = v
        game:GetService("UserInputService").JumpRequest:connect(function()
            if getgenv().jump then
                game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
            end
        end)
    end
})
bypass()
