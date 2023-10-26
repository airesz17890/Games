local imgui = loadstring(game:HttpGet("https://raw.githubusercontent.com/H3xad3cimalDev/imgui_library/master/imgui.lib.lua", true))();
local window = imgui:AddWindow(tostring(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name), {
    main_color = Color3.fromRGB(41, 74, 122),
    min_size = Vector2.new(250, 346),
    can_resize = true,
})
local Tab1 = window:AddTab("Main")
local Tab2 = window:AddTab("Misc")
Tab1:AddSwitch("Auto Kill Zombie", function(v)
    getgenv().kill = v
    while getgenv().kill do
        task.wait()
        for i, v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if v and v:FindFirstChild("Humanoid") and v:FindFirstChild("Head") then
                local A_1 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
                local A_2 =
                    {
                        ["p"] = Vector3.new(),
                        ["pid"] = 1,
                        ["part"] = v.Head,
                        ["d"] = 20.116552352905273,
                        ["maxDist"] = 19.721982955932617,
                        ["h"] = v.Humanoid,
                        ["sid"] = 1,
                        ["m"] = Enum.Material.Plastic,
                        ["t"] = 0.6567470740062732,
                        ["targetsHit"] = 1,
                        ["n"] = Vector3.new()
                    }
                local Event = game:GetService("ReplicatedStorage").WeaponsSystem.Network.WeaponHit
                Event:FireServer(A_1, A_2)
            end
        end
    end
end)
Tab1:AddSwitch("Infinite Ammo", function(v)
    getgenv().ammo = v
    local old; old = hookmetamethod(game, "__index", function(this, index)
        if not checkcaller() and tostring(this) == "CurrentAmmo" and index == "Value" and getgenv().ammo then
            return math.huge
        end
        return old(this, index)
    end)
end)
local EnemiesFolder = workspace.Enemies
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()
local RunService = game:GetService("RunService")
local GetClosestToCursor = function()
local closestDistance = math.huge
local closestEnemy = nil
for _, enemy in pairs(EnemiesFolder:GetChildren()) do
    if not enemy:FindFirstChild("Head") then continue end
        if not enemy:FindFirstChildOfClass("Humanoid") then continue end
            if enemy.Humanoid.Health <= 0 then continue end
            local screenPos, visible = workspace.CurrentCamera:WorldToViewportPoint(enemy.Head.Position)
            local distance = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(screenPos.X, screenPos.Y)).Magnitude
            if distance < closestDistance then
                closestEnemy = enemy
                closestDistance = distance
            end
        end
    return closestEnemy
end
local ClosestEnemy = GetClosestToCursor()
RunService.Stepped:Connect(function(time, deltaTime)
   ClosestEnemy = GetClosestToCursor()
end)
Tab1:AddSwitch("Silent Aim", function(v)
    getgenv().silentaim = v
    local old; old = hookmetamethod(game, '__namecall', function(this, ...)
        local args = {...}
        local method = getnamecallmethod()
        if not checkcaller() and method == 'FireServer' and this.Name == "WeaponHit" and getgenv().silentaim then
            if ClosestEnemy then
                args[2].part = ClosestEnemy.Head
            end
        end
        return old(this, unpack(args))
    end)
end)
Tab1:AddSwitch("Auto Equip Weapon", function(v)
    getgenv().equip = v
    while getgenv().equip do
        wait()
        for i, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v.ClassName == "Tool" and not game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                repeat wait()
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                until game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") or not getgenv().equip
            end
        end
    end
end)
Tab1:AddSwitch("Auto Pickup Ammo", function(v)
    getgenv().pickup = v
    while getgenv().pickup do
        wait()
        for i, v in pairs(game:GetService("Workspace").AmmoPickup:GetChildren()) do
            if v.Name == "SpecialAmmo" then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0)
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 1)
            end
        end
    end
end)
Tab1:Show()
